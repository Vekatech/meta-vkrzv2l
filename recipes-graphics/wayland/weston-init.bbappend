
do_install_append() {
    # The configuration of HDMI resolution
    cat <<EOF >>  ${D}/${sysconfdir}/xdg/weston/weston.ini

[output]
name=HDMI-A-1
mode=1920x1080@60.00
EOF

}
