# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit autotools versionator

MY_PV=$(replace_version_separator 3 '-')

DESCRIPTION="The VOMS native service and APIs"
HOMEPAGE="https://italiangrid.github.io/${PN}"
SRC_URI="https://github.com/italiangrid/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc +clients server"

DEPEND=">=dev-libs/openssl-1.0.1"
RDEPEND="${DEPEND}
	net-libs/gsoap
	sci-physics/egi-igtf
	sci-physics/wlcg-voms"

S="${WORKDIR}/${PN}-${MY_PV}"

src_prepare() {
	default
	mkdir -p aux src/autogen || die

	einfo "Regenerating autotools files..."
	eautoreconf
	eautomake
}

src_configure() {
	econf \
		$(use_with clients) \
		$(use_with server)
}

src_compile() {
	emake
}
