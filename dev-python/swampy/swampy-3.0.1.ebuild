# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{9..13} )
PYTHON_REQ_USE="tk"

MY_PN=swampy
MY_P=${MY_PN}-${PV}
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Swampy is a suite of Python programs that support the textbooks"
HOMEPAGE="https://allendowney.com/swampy/"

S=${WORKDIR}/${MY_P}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_prepare() {
	eapply_user
	sed -i -e "s#data_files=\[('swampy'#data_files=\[('share/swampy'#" setup.py || die
}
