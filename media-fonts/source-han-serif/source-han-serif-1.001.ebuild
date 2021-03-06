# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit font

# Note to maintainers:
# The upstream tarball is huge (over 780 MB), so we use the
# regional subset OTF fonts per region, for the user's convenience.

DESCRIPTION="Pan-CJK OpenType/CFF sans-serif font family"
HOMEPAGE="https://github.com/adobe-fonts/source-han-serif/"
SRC_URI="
	l10n_ja? ( https://github.com/adobe-fonts/${PN}/raw/${PV}R/SubsetOTF/SourceHanSerifJP.zip -> ${PN}-ja-${PV}.zip )
	l10n_ko? ( https://github.com/adobe-fonts/${PN}/raw/${PV}R/SubsetOTF/SourceHanSerifKR.zip -> ${PN}-ko-${PV}.zip )
	l10n_zh-CN? ( https://github.com/adobe-fonts/${PN}/raw/${PV}R/SubsetOTF/SourceHanSerifCN.zip -> ${PN}-zh_CN-${PV}.zip )
	l10n_zh-TW? ( https://github.com/adobe-fonts/${PN}/raw/${PV}R/SubsetOTF/SourceHanSerifTW.zip -> ${PN}-zh_TW-${PV}.zip )"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x64-macos"
IUSE="l10n_ja l10n_ko +l10n_zh-CN l10n_zh-TW"
REQUIRED_USE="|| ( l10n_ja l10n_ko l10n_zh-CN l10n_zh-TW )"

S=${WORKDIR}
FONT_SUFFIX="otf"
RESTRICT="binchecks strip"

src_install() {
	use l10n_ja && FONT_S="${S}/SourceHanSerifJP" font_src_install
	use l10n_ko && FONT_S="${S}/SourceHanSerifKR" font_src_install
	use l10n_zh-CN && FONT_S="${S}/SourceHanSerifCN" font_src_install
	use l10n_zh-TW && FONT_S="${S}/SourceHanSerifTW" font_src_install
}
