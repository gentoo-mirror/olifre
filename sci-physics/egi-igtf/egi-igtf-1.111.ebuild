# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Trust anchors endorsed by EGI.eu"
HOMEPAGE="https://wiki.egi.eu/wiki/EGI_IGTF_Release"

MY_PV="${PV}-1"

# curl -s http://repository.egi.eu/sw/production/cas/1/current/tgz/ | grep tar.gz | sed 's#^<a href="\([^"]*\)".*#\thttp://repository.egi.eu/sw/production/cas/1/current/tgz/\1#' | sed 's/1.111/${PV}/'
SRC_URI="http://repository.egi.eu/sw/production/cas/1/ca-policy-egi-cam-${MY_PV}/tgz/igtf-preinstalled-bundle-classic.tar.gz -> igtf-preinstalled-bundle-classic-${MY_PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/ca-policy-egi-cam-${MY_PV}/tgz/igtf-preinstalled-bundle-iota.tar.gz -> igtf-preinstalled-bundle-iota-${MY_PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/ca-policy-egi-cam-${MY_PV}/tgz/igtf-preinstalled-bundle-mics.tar.gz -> igtf-preinstalled-bundle-mics-${MY_PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/ca-policy-egi-cam-${MY_PV}/tgz/igtf-preinstalled-bundle-slcs.tar.gz -> igtf-preinstalled-bundle-slcs-${MY_PV}.tar.gz"

LICENSE="CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/"

src_install() {
	insinto "/etc/grid-security/certificates"
	doins *
}
