# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

# ebuild generated by hackport 0.2.18

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Existential datatypes holding evidence of constraints"
HOMEPAGE="http://github.com/glehel/exists"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/contravariant-0.1[profile?]
		<dev-haskell/contravariant-0.5[profile?]
		>=dev-lang/ghc-6.12.3"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.10"

src_prepare() {
	cabal_chdeps \
		'contravariant >= 0.1 && < 0.3' 'contravariant >= 0.1 && < 0.5'
}
