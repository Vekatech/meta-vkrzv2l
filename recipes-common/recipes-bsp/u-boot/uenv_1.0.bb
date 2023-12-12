SUMMARY = "U-Boot Env"
SECTION = "app"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

S = "${WORKDIR}"

SRC_URI = " \
    file://uEnv-rz.txt \
    file://readme.txt \
"

FILES_${PN} = "/boot"

do_install () {
    install -d ${D}/boot
    install -m 0644 ${S}/uEnv-*.txt ${D}/boot/uEnv.txt
    install -m 0644 ${S}/readme.txt ${D}/boot/readme.txt
}

inherit deploy
addtask deploy after do_install

do_deploy () {
    install -m 0644 ${D}/boot/uEnv.txt ${DEPLOYDIR}
    install -m 0644 ${D}/boot/readme.txt ${DEPLOYDIR}
}

COMPATIBLE_MACHINE_vkrzv2l = "vkrzv2l"
COMPATIBLE_MACHINE_vkrzg2l = "vkrzg2l"
COMPATIBLE_MACHINE_vkrzg2lc = "vkrzg2lc"
PACKAGE_ARCH = "${MACHINE_ARCH}"
