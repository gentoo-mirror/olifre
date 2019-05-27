# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit autotools

MY_PV=$(ver_rs 3 '-')

DESCRIPTION="The VOMS native service and APIs"
HOMEPAGE="https://italiangrid.github.io/${PN}"
SRC_URI="https://github.com/italiangrid/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +clients server"

DEPEND=">=dev-libs/openssl-1.0.1:0"
RDEPEND="${DEPEND}
	>=net-libs/gsoap-2.8.50
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
