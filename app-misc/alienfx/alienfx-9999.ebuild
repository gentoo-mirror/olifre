# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit cmake-multilib git-r3

DESCRIPTION="AlienFX lights control on Alienware hardware."
HOMEPAGE="https://github.com/olifre/alienfx"
EGIT_REPO_URI="https://github.com/olifre/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}
	dev-util/cmake"

#multilib_src_install() {
#	cmake_src_install
#}

pkg_postinst() {
	elog "Beware: This package is WIP!"
}
