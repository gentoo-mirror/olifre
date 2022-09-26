# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="tk?"

inherit python-single-r1

DESCRIPTION="Re-editable LaTeX graphics for Inkscape"
HOMEPAGE="https://textext.github.io/textext/"
SRC_URI="https://github.com/textext/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +gtk tk"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="
	doc? (
		$(python_gen_cond_dep '
			dev-python/sphinx[${PYTHON_USEDEP}]
			dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
		')
	)
"
RDEPEND="
	media-gfx/inkscape
	virtual/latex-base
	gtk? (
		x11-libs/gtk+:3[introspection]
		x11-libs/gtksourceview:3.0
		$(python_gen_cond_dep '
			dev-python/pygobject[cairo,${PYTHON_USEDEP}]
		')
	)
	$(python_gen_cond_dep '
		dev-python/lxml[${PYTHON_USEDEP}]
	')
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"

src_compile() {
	if use doc; then
		build_sphinx "${S}"/docs/source
		find "${S}"/docs/source -iname '.nojekyll' -delete || die
	fi
}

src_install() {
	python ./setup.py --inkscape-extensions-path "${D}"/usr/share/inkscape/extensions
	default
}
