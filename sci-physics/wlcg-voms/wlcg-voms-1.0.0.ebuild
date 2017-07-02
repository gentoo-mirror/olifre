# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit rpm

RPM_VER=${PV}-1

DESCRIPTION="VOMS LSC files"
HOMEPAGE="https://twiki.cern.ch/twiki/bin/view/LCG/VOMSLSCfileConfiguration"

SRC_URI="alice? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-alice-${RPM_VER}.el7.noarch.rpm )
	atlas? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-atlas-${RPM_VER}.el7.noarch.rpm )
	cms? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-cms-${RPM_VER}.el7.noarch.rpm )
	lhcb? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-lhcb-${RPM_VER}.el7.noarch.rpm )
	ops? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-ops-${RPM_VER}.el7.noarch.rpm )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+alice +atlas +cms +lhcb +ops"

S="${WORKDIR}/"

src_install() {
	insinto "/etc/vomses"
	doins etc/vomses/*

	insinto "/etc/grid-security/vomsdir"
	doins -r etc/grid-security/vomsdir/*
}
