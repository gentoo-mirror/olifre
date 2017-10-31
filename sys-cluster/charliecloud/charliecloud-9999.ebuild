# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/hpc/${PN}.git"
	S="${WORKDIR}/${P}"
else
	SRC_URI="https://github.com/hpc/${PN}/releases/download/${PV}/${P}.tar.gz"
	KEYWORDS="amd64 x86 ~amd64-linux ~x86-linux"
	S="${WORKDIR}/${PN}"
fi

DESCRIPTION="Lightweight user-defined software stacks for high-performance computing."
HOMEPAGE="https://hpc.github.io/charliecloud/"

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="doc examples suid test"

RDEPEND=""
DEPEND="${RDEPEND}
	doc? ( dev-python/sphinx
	       dev-python/sphinx_rtd_theme )
	test? ( app-arch/pigz )"

src_compile() {
	if use suid; then
		export SETUID=1
	fi
	emake
	if use doc && ! use suid; then
		emake -C doc-src
	fi
}

src_install() {
	if use suid; then
		export SETUID=1
	fi
	emake install PREFIX="${EPREFIX}/usr" DESTDIR="${ED}/usr"
	dodoc README.rst COPYRIGHT
	if use doc && ! use suid; then
		if ! use suid; then
			mv doc html || die
			dodoc -r html
		else
			elog "Building documentation with SUID not supported yet."
		fi
	fi
	if use examples; then
		docompress -x "${EPREFIX}/usr/share/doc/${PF}/examples"
		dodoc -r examples
	fi
	rm -rf "${ED}/usr/share/doc/charliecloud" || die
}
