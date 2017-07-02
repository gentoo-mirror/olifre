# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit cmake-utils git-r3 multilib

DESCRIPTION="Core library for accessing the Microsoft Kinect."
HOMEPAGE="https://github.com/olifre/${PN}"
EGIT_REPO_URI="git://github.com/olifre/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

COMMON_DEP="virtual/libusb:1"

RDEPEND="${COMMON_DEP}"
DEPEND="${COMMON_DEP}
	dev-util/cmake"

src_install() {
	cmake-utils_src_install

	# udev rules
	#insinto /lib/udev/rules.d/
	#doins "${S}"/platform/linux/udev/51-kinect.rules

	# documentation
	#dodoc README.md
	#if use doc; then
	#    cd doc
	#    doxygen || ewarn "doxygen failed"
	#    dodoc -r html || ewarn "dodoc failed"
	#    cd -
	#fi
}

pkg_postinst() {
	elog "Beware: This package is WIP!"
}
