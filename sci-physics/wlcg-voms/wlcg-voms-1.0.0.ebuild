# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit rpm

RPM_VER=${PV}-1

DESCRIPTION="VOMS LSC files"
HOMEPAGE="https://twiki.cern.ch/twiki/bin/view/LCG/VOMSLSCfileConfiguration"

SRC_URI="alice? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-alice-${RPM_VER}.el7.noarch.rpm )
	atlas? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-atlas-${RPM_VER}.el7.noarch.rpm )
	cms? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-cms-${RPM_VER}.el7.noarch.rpm )
	dteam? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-dteam-${RPM_VER}.el7.noarch.rpm )
	lhcb? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-lhcb-${RPM_VER}.el7.noarch.rpm )
	ops? ( http://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-ops-${RPM_VER}.el7.noarch.rpm )"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+alice +atlas +belle +cms +dteam +lhcb +ops +wlcg"

S="${WORKDIR}/"

src_install() {
	insinto "/etc/vomses"
	if use belle; then
		mkdir -p etc/vomses || die
		echo '"belle" "voms.cc.kek.jp" "15020" "/C=JP/O=KEK/OU=CRC/CN=host/voms.cc.kek.jp" "belle"' > etc/vomses/belle-voms.cc.kek.jp || die
	fi
	if use wlcg; then
		mkdir -p etc/vomses || die
		echo '"wlcg" "wlcg-voms.cloud.cnaf.infn.it" "15001" "/DC=org/DC=terena/DC=tcs/C=IT/L=Frascati/O=Istituto Nazionale di Fisica Nucleare/CN=voms-wlcg.cloud.cnaf.infn.it" "wlcg"' > etc/vomses/wlcg-voms.cloud.cnaf.infn.it || die
	fi
	doins etc/vomses/*

	insinto "/etc/grid-security/vomsdir"
	if use belle; then
		mkdir -p etc/grid-security/vomsdir/belle || die
		echo -e '/C=JP/O=KEK/OU=CRC/CN=host/voms.cc.kek.jp\n/C=JP/O=KEK/OU=CRC/CN=KEK GRID Certificate Authority\n' > etc/grid-security/vomsdir/belle/voms.cc.kek.jp.lsc || die
	fi
	if use wlcg; then
		mkdir -p etc/grid-security/vomsdir/wlcg || die
		echo -e '/DC=org/DC=terena/DC=tcs/C=IT/L=Frascati/O=Istituto Nazionale di Fisica Nucleare/CN=wlcg-voms.cloud.cnaf.infn.it\n' > etc/grid-security/vomsdir/wlcg/wlcg-voms.cloud.cnaf.infn.it.lsc || die
		echo -e '/C=NL/ST=Noord-Holland/L=Amsterdam/O=TERENA/CN=TERENA eScience SSL CA 3\n' >> etc/grid-security/vomsdir/wlcg/wlcg-voms.cloud.cnaf.infn.it.lsc || die
	fi
	doins -r etc/grid-security/vomsdir/*

}
