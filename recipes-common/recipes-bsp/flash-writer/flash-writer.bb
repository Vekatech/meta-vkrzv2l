LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1fb5dca04b27614d6d04abca6f103d8d"
LICENSE="BSD-3-Clause"
PV = "1.06+git${SRCPV}"

PACKAGE_ARCH = "${MACHINE_ARCH}"

FLASH_WRITER_URL = "git://github.com/renesas-rz/rzg2_flash_writer"
BRANCH = "rz_g2l"
SRCREV = "ff167b676547f3997906c82c9be504eb5cff8ef0"

SRC_URI = " \
	${FLASH_WRITER_URL};protocol=https;branch=${BRANCH} \
	file://0001-rzg2_fw-add-vkrzv2l-board-support.patch \
"

inherit deploy
#require include/provisioning.inc

S = "${WORKDIR}/git"

do_compile() {
        if [ "${MACHINE}" = "vkrzv2l" ]; then
                BOARD="VKRZV2L";
        fi
        cd ${S}

	oe_runmake BOARD=${BOARD}
}

do_install[noexec] = "1"

do_deploy() {
        install -d ${DEPLOYDIR}
        install -m 644 ${S}/AArch64_output/*.mot ${DEPLOYDIR}
}
PARALLEL_MAKE = "-j 1"
addtask deploy after do_compile
