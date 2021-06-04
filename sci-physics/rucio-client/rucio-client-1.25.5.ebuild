# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )

inherit distutils-r1

DESCRIPTION="Rucio is the new version of ATLAS DDM system services."
HOMEPAGE="http://rucio.cern.ch/"

MY_PV=$(ver_rs 1- ".")
MY_PV="${MY_PV/p/post}"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/rucio/rucio.git"
	#EGIT_COMMIT="${MY_PV}"
	KEYWORDS=""
else
	SRC_URI="https://github.com/rucio/rucio/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/rucio-${MY_PV}"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

# dev-python/bz2file[${PYTHON_USEDEP}]
# dev-python/python-swiftclient[${PYTHON_USEDEP}]
RDEPEND="dev-python/argcomplete[${PYTHON_USEDEP}]
	dev-python/dogpile-cache[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/pykerberos[${PYTHON_USEDEP}]
	dev-python/progressbar2[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/paramiko[${PYTHON_USEDEP}]
	dev-python/retrying[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/boto[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
	dev-python/nose[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-kerberos[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	|| ( dev-python/python-magic[${PYTHON_USEDEP}] sys-apps/file[python,${PYTHON_USEDEP}] )
	"
DEPEND="${RDEPEND}"

python_prepare_all() {
	mv setup_rucio_client.py setup.py
	distutils-r1_python_prepare_all
}
