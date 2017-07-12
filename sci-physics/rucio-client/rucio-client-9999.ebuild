# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python2_7 )

inherit python-r1 distutils-r1 versionator

DESCRIPTION="Rucio is the new version of ATLAS DDM system services."
HOMEPAGE="http://rucio.cern.ch/"

MY_PV=$(replace_all_version_separators ".")
MY_PV="${MY_PV/p/post}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.cern.ch/rucio01/rucio.git"
	#EGIT_COMMIT="${MY_PV}"
	KEYWORDS=""
else
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.cern.ch/rucio01/rucio.git"
	EGIT_COMMIT="${MY_PV}"
	#inherit vcs-snapshot
	#SRC_URI="https://gitlab.cern.ch/rucio01/rucio/repository/archive.tar.bz2?ref=${MY_PV} -> ${P}.tar.bz2"
	KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
fi

LICENSE="Apache-2.0"
SLOT="0"
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
