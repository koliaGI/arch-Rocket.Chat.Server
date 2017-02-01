# Maintainer: 0x0049 <dev@0x0049.me>

pkgname=rocketchat-server
pkgver=0.50.1
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
sha512sums=('621e4fd3e15133e3ff0da655d89fa8b80e58bd1ddd0ce367186a53cb61ec9b4eef00f5c961f59cc2519c78dd5c83d2dbed811e891af04a948fb9f19455562225'
            '87daf10e55224ceefcbc2227dd2c531a4af1b68a3089f6a6893f980e7232bb15bf96895ee4df7400ed7195c273d5e07c8dab34af0f38b977504ffb5831400fde'
            '75d1aee01a1190d68a41ba4362f18117fba70289666be8c1dfd117d2b96aeb8c80d949be924b0e79ed711f85a98eff608bdc7b78ea0d4fb6d2e9a935cac13ac1'
            'd35caf6b2c1094f4a6ad52f11339ea8020f79e602082751bfb1a68a19e25c7eb20108f26547d2fdab3bd6b23fe30a6c959b1bae6408956b375377356a48b691c'
            '16188426cc3f2564bae967ac315c1b8d5243edf38f2477599c4376ddaa7356434546b6bd59fb4e13eca2bd31551f1e69ff87e2c5885bdebfc2b7991d53fde384')

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
