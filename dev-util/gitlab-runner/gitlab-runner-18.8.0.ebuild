# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

#
# Original file: https://github.com/gentoo/gentoo/blob/9591a552634986613aff8317e74e7b83fd15e144/dev-util/gitlab-runner/gitlab-runner-18.8.0.ebuild
#

EAPI=8
inherit eapi9-ver go-module systemd tmpfiles

# make sure this gets updated for every bump
GIT_COMMIT=9ffb4aa0

DESCRIPTION="The official GitLab Runner, written in Go"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-runner"
SRC_URI="https://gitlab.com/gitlab-org/gitlab-runner/-/archive/v${PV}/${PN}-v${PV}.tar.bz2 -> ${P}.tar.bz2"
SRC_URI+=" https://dev.gentoo.org/~williamh/dist/${P}-deps.tar.xz"

S="${WORKDIR}/${PN}-v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~ppc64 ~riscv x86"

COMMON_DEPEND="acct-group/gitlab-runner
	acct-user/gitlab-runner"
DEPEND="${COMMON_DEPEND}"
RDEPEND="${COMMON_DEPEND}"
BDEPEND="dev-go/gox"

src_compile() {
	# Go's internal linker does not support -buildmode=pie on 32-bit ARM.
	# Since GOFLAGS includes -buildmode=pie, we must enable CGO to allow 
	# external linking, otherwise the build fails.
	if [[ "$(tc-arch)" == "arm" ]]; then
		# avoid error: -buildmode=pie requires external (cgo) linking, but cgo is not enabled
		export CGO_ENABLED=1
	fi

	emake \
		BUILT="$(date -u '+%Y-%m-%dT%H:%M:%S%:z')" \
		GOX="${EPREFIX}/usr/bin/gox" \
		REVISION=${GIT_COMMIT} \
		VERSION=${PV} \
		runner-and-helper-bin-host
}

src_test() {
	CI=0 ego test
}

src_install() {
	newbin out/binaries/gitlab-runner-linux-* gitlab-runner
	newbin out/binaries/gitlab-runner-helper/gitlab-runner-helper.linux-* gitlab-runner-helper
	DOCS=( docs CHANGELOG.md README.md )
	einstalldocs
	insinto /usr/share/${PN}
	doins config.toml.example

	newconfd "${FILESDIR}/${PN}-18.confd" "${PN}"
	newinitd "${FILESDIR}/${PN}-18.initd" "${PN}"
	systemd_dounit "${FILESDIR}/${PN}.service"
	newtmpfiles "${FILESDIR}"/${PN}.tmpfile ${PN}.conf
	keepdir /etc/${PN}
	fperms 0700 /etc/${PN}
	fowners gitlab-runner:gitlab-runner /etc/${PN}
}

pkg_postinst() {
	tmpfiles_process gitlab-runner.conf
	if ver_replacing -lt 18.0.0; then
		ewarn "The logs are now redirected to syslog instead of being stored in /var/log/gitlab-runner"
		ewarn
	fi
	[[ -f ${EROOT}/etc/gitlab-runner/config.toml ]] && return
	elog
	elog "To use the runner, you need to register it with this command:"
	elog "# gitlab-runner register"
	elog "This will also create the configuration file in /etc/gitlab-runner/config.toml"
}