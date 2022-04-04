# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{8,9,10} )
PYTHON_REQ_USE="tk"

MY_PN=swampy
MY_P=${MY_PN}-${PV}

inherit distutils-r1

DESCRIPTION="Swampy is a suite of Python programs that support the textbooks"
HOMEPAGE="https://allendowney.com/swampy/"
SRC_URI="mirror://pypi/${MY_PN:0:1}/${MY_PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S=${WORKDIR}/${MY_P}

#DISTUTILS_USE_SETUPTOOLS=no

src_prepare() {
	eapply_user
	sed -i -e "s#data_files=\[('swampy'#data_files=\[('share/swampy'#" setup.py || die
}
