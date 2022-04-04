# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit rpm

RPM_VER=${PV}-1
WLCG_RPM_VER=${PV}-1

DESCRIPTION="VOMS LSC files"
HOMEPAGE="https://twiki.cern.ch/twiki/bin/view/LCG/VOMSLSCfileConfiguration"

SRC_URI="alice? ( https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-alice-${RPM_VER}.el7.noarch.rpm )
	atlas? ( https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-atlas-${RPM_VER}.el7.noarch.rpm )
	cms? ( https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-cms-${RPM_VER}.el7.noarch.rpm )
	dteam? ( https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-dteam-${RPM_VER}.el7.noarch.rpm )
	lhcb? ( https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-lhcb-${RPM_VER}.el7.noarch.rpm )
	ops? ( https://linuxsoft.cern.ch/wlcg/centos7/x86_64/wlcg-voms-ops-${RPM_VER}.el7.noarch.rpm )
	wlcg? ( https://repo.cloud.cnaf.infn.it/repository/infn-vos/centos7/infn-vo-wlcg-1.0.0-0.el7.noarch.rpm )"

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
		# Backup VOMS server at DESY would be:
		# '"belle" "grid-voms.desy.de" "15020" "/C=DE/O=GermanGrid/OU=DESY/CN=host/grid-voms.desy.de" "belle" "24"'
	fi
	doins etc/vomses/*

	insinto "/etc/grid-security/vomsdir"
	if use belle; then
		mkdir -p etc/grid-security/vomsdir/belle || die
		echo -e '/C=JP/O=KEK/OU=CRC/CN=host/voms.cc.kek.jp\n/C=JP/O=KEK/OU=CRC/CN=KEK GRID Certificate Authority' > etc/grid-security/vomsdir/belle/voms.cc.kek.jp.lsc || die
		# Backup VOMS server at DESY.
		echo -e '/C=DE/O=GermanGrid/OU=DESY/CN=host/grid-voms.desy.de\n/C=DE/O=GermanGrid/CN=GridKa-CA' > etc/grid-security/vomsdir/belle/grid-voms.desy.de.lsc || die
	fi
	doins -r etc/grid-security/vomsdir/*

}
