# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit git-r3 python-r1 distutils-r1

DESCRIPTION="Rucio is the new version of ATLAS DDM system services."
HOMEPAGE="http://rucio.cern.ch/"
EGIT_REPO_URI="https://gitlab.cern.ch/rucio01/rucio.git"
EGIT_COMMIT="${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/dogpile-cache[${PYTHON_USEDEP}]
	dev-python/pykerberos[${PYTHON_USEDEP}]
	dev-python/progressbar[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/python-swiftclient[${PYTHON_USEDEP}]
	dev-python/retrying[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-kerberos[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	|| ( dev-python/python-magic[${PYTHON_USEDEP}] sys-apps/file[python,${PYTHON_USEDEP}] )
	"

src_prepare() {
	mv setup_rucio_client.py setup.py
	default
}
