COMPATIBLE_MACHINE_vkrzv2l = "vkrzv2l"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
	file://0001-tf_a-add-vkrzv2l-board-support.patch \
"

PLATFORM_vkrzv2l = "v2l"
EXTRA_FLAGS_vkrzv2l = "BOARD=vkrzv2l SPI_FLASH=MX25U25645G"
FLASH_ADDRESS_BL2_BP_vkrzv2l = "00000"
FLASH_ADDRESS_FIP_vkrzv2l = "1D200"
