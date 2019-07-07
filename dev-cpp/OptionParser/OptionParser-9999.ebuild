# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-multilib

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/BGO-OD/OptionParser.git"
	KEYWORDS=""
#else
	# No release just yet...
	# SRC_URI=""
	# KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="templated C++ command line option parser with executable for shell scripts"
HOMEPAGE="https://github.com/BGO-OD/OptionParser"

LICENSE="GPL-3"
SLOT="0"
IUSE="doc examples static-libs"

DEPEND="${RDEPEND}
	doc? ( app-doc/doxygen[dot] )"

multilib_src_configure() {
	local mycmakeargs=(
			-DOptionParser_INSTALL_EXAMPLES="$(usex examples)"
			-DINSTALL_STATIC_LIBS="$(usex static-libs)"
			)
	cmake-utils_src_configure
}

multilib_src_compile() {
	cmake-utils_src_compile
	use doc && cmake-utils_src_compile doc
}

multilib_src_install() {
	cmake-utils_src_install
	use doc && dodoc -r "${BUILD_DIR}/html"
}
