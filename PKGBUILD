# Maintainer: 0x0049 <dev@0x0049.me>

pkgname=rocketchat-server
pkgver=0.58.1
pkgrel=1
pkgdesc="An open source web chat platform"
arch=("any")
url="https://rocket.chat"
license=("MIT")
depends=("mongodb" "graphicsmagick")
backup=("etc/${pkgname}/${pkgname}.conf")
install="${pkgname}.install"
source=("https://rocket.chat/releases/${pkgver}/download"
        "rocketchat-server.conf"
        "rocketchat-server.service"
        "rocketchat-server.install"
        "rocketchat-server.sh"
       )
sha512sums=('15debfcf82555e4a682fc4a8dbcd1cdbc5ef044b968642db5f9138b094f3d11329b10f87464392cbf6350dd32514afca71ed20e67e076e0844e94df4a600823b'
            '87daf10e55224ceefcbc2227dd2c531a4af1b68a3089f6a6893f980e7232bb15bf96895ee4df7400ed7195c273d5e07c8dab34af0f38b977504ffb5831400fde'
            'ea6135742b2da023e9bcc3819868bd041d1ed662fd5eec343fd4783e30343d146c6aa55e0af2ea4b25c293ca8b000f61380798f4b55cf2144c88f4ca2c6af3f0'
            'd35caf6b2c1094f4a6ad52f11339ea8020f79e602082751bfb1a68a19e25c7eb20108f26547d2fdab3bd6b23fe30a6c959b1bae6408956b375377356a48b691c'
            '918dbe2f432cdd19d4f5ffe20cfe29a9cc6569506d731766f607af03a601e4b3f9b7af433abd5373eec100aaed6c24dea0e213ff63100d468049fe02c4bb4325')

package() {
	msg2 "Install rocket.chat"
	install -d -m 755 "${pkgdir}/usr/share/${pkgname}"
	cp -dr --no-preserve=ownership "${srcdir}/bundle/"* "${pkgdir}/usr/share/${pkgname}"
	cp -d --no-preserve=ownership "${srcdir}/bundle/.node_version.txt" "${pkgdir}/usr/share/${pkgname}"

	msg2 "Install dependencies"
	npm install --silent --depth 0 --prefix "${pkgdir}/usr/share/${pkgname}/programs/server"

	msg2 "Install executable"
	install -D -m 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}.sh"

	msg2 "Install systemd service"
	install -D -m 644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

	msg2 "Install configuration file"
	install -D -m 640 ${pkgname}.conf "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}
