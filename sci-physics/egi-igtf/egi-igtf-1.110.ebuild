# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="Trust anchors endorsed by EGI.eu"
HOMEPAGE="https://wiki.egi.eu/wiki/EGI_IGTF_Release"

# curl -s http://repository.egi.eu/sw/production/cas/1/current/tgz/ | grep tar.gz | sed 's#^<a href="\([^"]*\)".*#\thttp://repository.egi.eu/sw/production/cas/1/current/tgz/\1#' | sed 's/1.110/${PV}/'
SRC_URI="http://repository.egi.eu/sw/production/cas/1/current/tgz/igtf-preinstalled-bundle-classic.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/igtf-preinstalled-bundle-iota.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/igtf-preinstalled-bundle-mics.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/igtf-preinstalled-bundle-slcs.tar.gz"

LICENSE="CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/"

src_install() {
	insinto "/etc/grid-security/certificates"
	doins *
}
