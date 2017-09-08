# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit pax-utils

MY_P="${PN/-bin}-${PV}"
DESCRIPTION="Ultimate Packer for eXecutables, binary version with proprietary NRV compression"
HOMEPAGE="https://github.com/upx/upx/"
SRC_URI="x86? ( https://github.com/upx/upx/releases/download/v${PV}/upx-${PV}-i386_linux.tar.xz )
	amd64? ( https://github.com/upx/upx/releases/download/v${PV}/upx-${PV}-amd64_linux.tar.xz )
	ppc? ( https://github.com/upx/upx/releases/download/v${PV}/upx-${PV}-powerpc_linux.tar.xz )
	arm? ( https://github.com/upx/upx/releases/download/v${PV}/upx-${PV}-armeb_linux.tar.xz )
	mips? ( https://github.com/upx/upx/releases/download/v${PV}/upx-${PV}-mipsel_linux.tar.xz )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
RESTRICT="strip"

RDEPEND="!app-arch/upx-ucl"

S="${WORKDIR}"

QA_PREBUILT="/opt/bin/upx"

src_install() {
	cd ${MY_P}*
	into /opt
	dobin upx
	pax-mark -m "${ED}"/opt/bin/upx
	doman upx.1
	dodoc upx.doc BUGS NEWS README* THANKS
	dohtml upx.html
}
