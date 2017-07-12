# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit font

DESCRIPTION="A sanserif type­face fam­ily designed by Łukasz Dziedzic"
HOMEPAGE="https://www.latofonts.com/lato-free-fonts/"
SRC_URI="https://www.latofonts.com/download/Lato2OFL.zip -> ${P}.zip"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86 ~amd64-linux ~x86-linux ~x64-macos"

DEPEND="app-arch/unzip"

S=${WORKDIR}/Lato2OFL
FONT_S=${S}
FONT_SUFFIX="ttf"
RESTRIC="binchecks strip"
