# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

GTK_MAJ_VER="2"

#nocabaldep is for the fancy cabal-detection feature at build-time
CABAL_FEATURES="lib profile haddock hscolour hoogle nocabaldep"
inherit haskell-cabal

DESCRIPTION="Binding to the Pango text rendering engine."
HOMEPAGE="http://projects.haskell.org/gtk2hs/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="${GTK_MAJ_VER}"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="=dev-haskell/cairo-0.12*:${GTK_MAJ_VER}[profile?]
		=dev-haskell/glib-0.12*:${GTK_MAJ_VER}[profile?]
		dev-haskell/mtl[profile?]
		>=dev-lang/ghc-6.10.1
		x11-libs/cairo
		x11-libs/pango"
DEPEND="${RDEPEND}
		>=dev-haskell/gtk2hs-buildtools-0.12.3-r3:${GTK_MAJ_VER}"

src_prepare() {
	sed -e "s@gtk2hsTypeGen@gtk2hsTypeGen${GTK_MAJ_VER}@" \
		-e "s@gtk2hsHookGenerator@gtk2hsHookGenerator${GTK_MAJ_VER}@" \
		-e "s@gtk2hsC2hs@gtk2hsC2hs${GTK_MAJ_VER}@" \
		-i "${S}/Gtk2HsSetup.hs" \
		|| die "Could not change Gtk2HsSetup.hs for GTK+ slot ${GTK_MAJ_VER}"
	sed -e "s@gtk2hsC2hs@gtk2hsC2hs${GTK_MAJ_VER}@" \
		-e "s@gtk2hsTypeGen@gtk2hsTypeGen${GTK_MAJ_VER}@" \
		-e "s@gtk2hsHookGenerator@gtk2hsHookGenerator${GTK_MAJ_VER}@" \
		-i "${S}/${PN}.cabal" \
		|| die "Could not change ${PN}.cabal for GTK+ slot ${GTK_MAJ_VER}"
}
