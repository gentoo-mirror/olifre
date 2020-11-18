# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8} )

inherit distutils-r1

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/eduvpn/python-${PN}.git"
	S="${WORKDIR}/${P}"
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN/-/_}/${P/-/_}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PN/-/_}-${PV}"
fi

DESCRIPTION="Linux client and Python client API for eduVPN"
HOMEPAGE="https://eduvpn.org/"

SLOT="0"
LICENSE="GPL-3+"
#IUSE="doc test"

DEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pynacl[${PYTHON_USEDEP}]
	dev-python/requests-oauthlib[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/qrcode[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
"

python_prepare_all() {
	distutils-r1_python_prepare_all
	sed	-e "s:\\(setup_requires=\[\\)'pytest-runner'\\(\],\\):\\1\\2:" \
		-e "s/find_packages()/find_packages(exclude=['tests*'])/" \
		-i setup.py || die
}
