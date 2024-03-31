COMPATIBLE_MACHINE_vkrzv2l = "vkrzv2l"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_vkrzv2l = " \
	file://0001-kernel-add-vkrzv2l-board-support.patch \
	file://0002-fix-communication-issues-with-lt8912b.patch \
	file://0003-Add-drpai-and-udmabuf-overlay.patch \
"

KBUILD_DEFCONFIG = "defconfig"
KCONFIG_MODE = "alldefconfig"

KBUILD_DEFCONFIG = "defconfig"

FILESEXTRAPATHS_prepend := "${THISDIR}/Kconfigs:"

SRC_URI += " \
	file://ADV7511.cfg \
	file://CANBUS.cfg \
	file://DRP_AI.cfg \
	file://EEPROM_I2C.cfg \
	file://GT911.cfg \
	file://MXTTOUCH.cfg \
	file://LONTIUM_LT8912B.cfg \
	file://NETWORK.cfg \
	file://PANEL_ILITEK_ILI9881C.cfg \
	file://PANEL_PANEL_FITIPOWER_EK79007AD.cfg \
	file://RTL8211F.cfg \
	file://SND_SOC_DA7213.cfg \
	file://TRACEPOINTS.cfg \
	file://UDMABUF.cfg \
	file://USB_GADGET.cfg \
	file://USB_ACM.cfg \
	file://USB_SERIAL.cfg \
"

# support to build dtbo
KERNEL_DTC_FLAGS = "-@"
KERNEL_DEVICETREE_OVERLAY ?= ""

do_compile_prepend() {
    if [ -n "${KERNEL_DTC_FLAGS}" ]; then
       export DTC_FLAGS="${KERNEL_DTC_FLAGS}"
    fi
}

do_compile_append() {
    for dtbf in ${KERNEL_DEVICETREE_OVERLAY}; do
        dtb=`normalize_dtb "$dtbf"`
        oe_runmake $dtb CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
    done
}

do_deploy_append(){
   install -d ${DEPLOYDIR}/overlays
   cp ${B}/arch/arm64/boot/dts/renesas/overlays/* ${DEPLOYDIR}/overlays
}
