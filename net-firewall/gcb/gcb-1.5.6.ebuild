# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils autotools

DESCRIPTION="Generic Connection Brokering for communications over firewall/NAT"
HOMEPAGE="http://www.cs.wisc.edu/condor/gcb"
SRC_URI="${HOMEPAGE}/download/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-shared.patch
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS ChangeLog NOTICE.txt doc/protocol.txt
	if use doc; then
		insinto /usr/share/doc/${PF}
		doins doc/*.pdf || die
	fi
}
