COMPATIBLE_MACHINE_vkrzv2l = "vkrzv2l"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
	file://0001-uboot-add-vkrzv2l-board-support.patch \
	file://0002-workaround-EE00700-artifacts.patch \
"
