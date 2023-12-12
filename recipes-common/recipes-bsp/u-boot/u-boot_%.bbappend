COMPATIBLE_MACHINE_vkrzv2l = "vkrzv2l"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRCREV = "ebb194954cad2170f72fb996816e9ca8451fbc28"


SRC_URI += " \
	file://0001-uboot-add-vkrzv2l-board-support.patch \
"
