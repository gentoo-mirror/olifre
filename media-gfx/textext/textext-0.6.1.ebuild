# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="Inkscape extension to embed re-editable LaTeX objects in SVG drawings"
HOMEPAGE="https://bitbucket.org/pitgarbe/textext/overview"
SRC_URI="https://bitbucket.org/pitgarbe/textext/downloads/TexText-Linux-${PV}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="media-gfx/inkscape
	virtual/latex-base
	|| ( media-gfx/pdf2svg media-gfx/pstoedit[plotutils] )"

S=${WORKDIR}/${PN}-${PV}-linux

src_install() {
	exeinto /usr/share/inkscape/extensions
	doexe extension/*.py || die "doexe failed. Can't copy script to extensions folder"

	insinto /usr/share/inkscape/extensions
	doins extension/*.inx || die "doins faild. Can't copy script to extensions folder"

	dodoc README-TexText.pdf
}
