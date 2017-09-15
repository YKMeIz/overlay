# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils pax-utils

DESCRIPTION="A lightweight but powerful source code editor from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
BASE_URI="https://vscode-update.azurewebsites.net/${PV}"
SRC_URI="x86? ( ${BASE_URI}/linux-ia32/stable ->  ${P}-x86.tar.gz )
	amd64? ( ${BASE_URI}/linux-x64/stable -> ${P}-amd64.tar.gz )"

RESTRICT="mirror strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=media-libs/libpng-1.6.27:0
	>=x11-libs/gtk+-2.24.8-r1:2
	x11-libs/cairo
	gnome-base/gconf
	x11-libs/libXtst"

RDEPEND="${DEPEND}
	>=net-print/cups-2.0.0
	x11-libs/libnotify
	x11-libs/libXScrnSaver
	app-crypt/libsecret"

ARCH=$(getconf LONG_BIT)

[[ ${ARCH} == "64" ]] && S="${WORKDIR}/VSCode-linux-x64" || S="${WORKDIR}/VSCode-linux-ia32"

QA_PRESTRIPPED="opt/${PN}/${PN}"

src_unpack() {
	unpack ${A}
}

src_install(){
	declare CODE_FILE_HOME=/opt/${PN}

	dodir ${CODE_FILE_HOME%/*}
	mv "${S}" "${ED}${CODE_FILE_HOME}" || die

	dosym "${ED}${CODE_FILE_HOME}/${PN}" "/usr/bin/${PN}" || die
	insinto "/usr/share/applications/"
	doins "${FILESDIR}/${PN}.desktop" || die

	pax-mark m "${ED}${CODE_FILE_HOME}/${PN}"
}

pkg_postinst(){
	elog "You may install some additional components and tools, so check them in:"
	elog "https://code.visualstudio.com/docs/setup/additional-components"
}
