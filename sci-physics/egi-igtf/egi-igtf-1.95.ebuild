# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Trust anchors endorsed by EGI.eu"
HOMEPAGE="https://wiki.egi.eu/wiki/EGI_IGTF_Release"

# curl -s http://repository.egi.eu/sw/production/cas/1/current/tgz/ | grep tar.gz | sed 's#^<a href="\([^"]*\)".*#\thttp://repository.egi.eu/sw/production/cas/1/current/tgz/\1#' | sed 's/1.95/${PV}/'
SRC_URI="http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_AC-GRID-FR-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_AC-GRID-FR-Personnels-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_AC-GRID-FR-Robots-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_AC-GRID-FR-Services-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_AEGIS-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_ANSPGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_ASGCCA-2007-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_AddTrust-External-CA-Root-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_ArmeSFo-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_AustrianGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_BG-ACAD-CA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_BYGCA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CERN-GridCA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CERN-LCG-IOTA-CA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CERN-Root-2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CESNET-CA-3-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CESNET-CA-Root-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CNIC-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CNRS2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CNRS2-Grid-FR-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CNRS2-Projets-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_COMODO-RSA-CA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_CyGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DCAROOT-G1-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DFN-GridGermany-Root-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DZeScience-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DarkMatterAssuredCA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DarkMatterIGTFCA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DarkMatterPrivateRootCAG4-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DarkMatterSecureCA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DigiCertAssuredIDRootCA-Root-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DigiCertGridCA-1-Classic-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DigiCertGridCA-1G2-Classic-2015-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DigiCertGridRootCA-Root-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DigiCertGridTrustCA-Classic-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_DigiCertGridTrustCAG2-Classic-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_EG-GRID-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_GermanGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_GridCanada-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_HKU-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_HKU-CA-2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_HPCI-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_HellasGrid-CA-2016-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_IGCA2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_IHEP-2013-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_INFN-CA-2015-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_IRAN-GRID-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_IRAN-GRID-GCG-G2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_InCommon-IGTF-Server-CA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_KEK-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_KENETCA-ICA-2015-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_KENETROOTCA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_KISTIv3-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_LIPCA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_MARGI-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_MD-Grid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_MREN-CA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_MYIFAM-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_MaGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_NCSA-slcs-2013-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_NCSA-tfca-2013-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_NERSC-SLCS-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_NIIF-Root-CA-2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_NIKHEF-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_NorduGrid-2015-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_PK-Grid-2007-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_PKIUNAMgrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_PSC-Myproxy-CA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_PolishGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_QuoVadis-Grid-ICA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_QuoVadis-Grid-ICA-G2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_QuoVadis-Root-CA1-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_QuoVadis-Root-CA2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_QuoVadis-Root-CA2G3-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_QuoVadis-Root-CA3G3-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_RCauth-Pilot-ICA-G1-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_RDIG-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_REUNA-ca-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_RomanianGRID-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_SDG-G2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_SRCE-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_SiGNET-CA-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_SlovakGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_TERENA-eScience-SSL-CA-3-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_TERENAeSciencePersonalCA3-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_TRGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_TSU-GE-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_UGRID-G2-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_UKeScienceCA-2B-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_UKeScienceRoot-2007-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_UNAMgrid-ca-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_UNLPGrid-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_cilogon-basic-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_cilogon-osg-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_cilogon-silver-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_policy_egi-cam-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_policy_egi-core-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_policy_igtf-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_policy_lcg-${PV}.tar.gz
	http://repository.egi.eu/sw/production/cas/1/current/tgz/ca_seegrid-ca-2013-${PV}.tar.gz"

LICENSE="CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/"

src_install() {
	insinto "/etc/grid-security/certificates"
	doins ca_*/*
}
