# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

DESCRIPTION="Trust anchors endorsed by EGI.eu"
HOMEPAGE="https://docs.egi.eu/providers/operations-manuals/howto01_using_igtf_ca_distribution/"

MY_PV="${PV}-1"

# curl -s https://repository.egi.eu/sw/production/cas/1/current/tgz/ | grep tar.gz | \
#      sed 's#^<a href="\([^"]*\)".*#\thttps://repository.egi.eu/sw/production/cas/1/current/tgz/\1#' | \
#      sed 's/1.136/${PV}/'
SRC_URI="https://repository.egi.eu/sw/production/cas/1/ca-policy-egi-cam-${MY_PV}/tgz/igtf-preinstalled-bundle-classic.tar.gz -> igtf-preinstalled-bundle-classic-${MY_PV}.tar.gz
	https://repository.egi.eu/sw/production/cas/1/ca-policy-egi-cam-${MY_PV}/tgz/igtf-preinstalled-bundle-iota.tar.gz -> igtf-preinstalled-bundle-iota-${MY_PV}.tar.gz
	https://repository.egi.eu/sw/production/cas/1/ca-policy-egi-cam-${MY_PV}/tgz/igtf-preinstalled-bundle-mics.tar.gz -> igtf-preinstalled-bundle-mics-${MY_PV}.tar.gz
	https://repository.egi.eu/sw/production/cas/1/ca-policy-egi-cam-${MY_PV}/tgz/igtf-preinstalled-bundle-slcs.tar.gz -> igtf-preinstalled-bundle-slcs-${MY_PV}.tar.gz"
S="${WORKDIR}/"

LICENSE="CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	insinto "/etc/grid-security/certificates"
	doins *
}
