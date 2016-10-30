# Maintainer: 0x0049 <dev@0x0049.me>

pkgname=rocketchat-server
pkgver=0.44.0
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
sha512sums=("3ee7cf664ecaae69f85c0286d558ebb15e5e5a79c17d0f91377a0a28eb749183ea065d8fd912929385b6a54ada57725a6fed71c6aecd5bc87667447d85ff2b11"
            "87daf10e55224ceefcbc2227dd2c531a4af1b68a3089f6a6893f980e7232bb15bf96895ee4df7400ed7195c273d5e07c8dab34af0f38b977504ffb5831400fde"
            "75d1aee01a1190d68a41ba4362f18117fba70289666be8c1dfd117d2b96aeb8c80d949be924b0e79ed711f85a98eff608bdc7b78ea0d4fb6d2e9a935cac13ac1"
            "05de246127049d5f6eaff52f2b047a93e7e366a905edbe2a29a96bb962f5215cb0cb0cac31bf1d41873d88a71df67456f06fee1e944d7095e372265364ba33f6"
            "70262c7cf95616438f16e08e7ae1cac3fdae236f690abc9b20a7e714f9f0948308ba3b3241b683d325b2b68ad7ef8b46df6fc1cccb6adeaafab60d4cff710cb4"
           )

package() {
	msg2 "Install rocket.chat"
	install -d -m 755 "${pkgdir}/usr/share/${pkgname}"
	cp -dr --no-preserve=ownership "${srcdir}/bundle/"* "${pkgdir}/usr/share/${pkgname}"

	msg2 "Install dependencies"
  npm install --silent --depth 0 --prefix "${pkgdir}/usr/share/${pkgname}/programs/server"

	msg2 "Install executable"
	install -D -m 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}.sh"

	msg2 "Install systemd service"
	install -D -m 644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

	msg2 "Install configuration file"
	install -D -m 640 ${pkgname}.conf "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
}
