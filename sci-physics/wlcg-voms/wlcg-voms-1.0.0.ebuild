# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

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
KEYWORDS="~amd64 ~x86"
IUSE="+alice +atlas +cms +dteam +lhcb +ops"

S="${WORKDIR}/"

src_install() {
	if use dteam; then
		echo '"dteam" "voms2.hellasgrid.gr" "15004" "/C=GR/O=HellasGrid/OU=hellasgrid.gr/CN=voms2.hellasgrid.gr" "dteam" "24"' > etc/vomses/dteam-voms2.hellasgrid.gr || die
	fi

	insinto "/etc/vomses"
	doins etc/vomses/*

	if use dteam; then
		mkdir -p etc/grid-security/vomsdir/dteam
		for VO_HOST in {voms.hellasgrid.gr,voms2.hellasgrid.gr}; do
			echo -e "/C=GR/O=HellasGrid/OU=hellasgrid.gr/CN=${VO_HOST}\n/C=GR/O=HellasGrid/OU=Certification Authorities/CN=HellasGrid CA 2016\n" > etc/grid-security/vomsdir/dteam/${VO_HOST}.lsc || die
		done
	fi

	insinto "/etc/grid-security/vomsdir"
	doins -r etc/grid-security/vomsdir/*
}
