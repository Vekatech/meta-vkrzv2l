# meta-vkrzv2l
1. create source dir
    ``` bash
    mkdir -p $HOME/work/rzv_vlp_304
    cd $HOME/work/rzv_vlp_304
    ```

2. download source archives 
# Make sure that the following packages have been downloaded from the official website https://www.renesas.com
# RZ/G Verified Linux Package [5.10-CIP]  V3.0.4
    RTK0EF0045Z0024AZJ-v3.0.4.zip, 
    RTK0EF0045Z13001ZJ-v1.1.0_EN.zip, 
    RTK0EF0045Z15001ZJ-v1.1.0_EN.zip, 
    r01an6238ej0111-rzv2l-cm33-multi-os-pkg.zip,
    r11an0549ej0740-rzv2l-drpai-sp.zip,
    r11an0561ej0130-rzv2l-isp-sp.zip,
    oss_pkg_rzv_v3.0.4.7z

3. create working dir
    ``` bash
    mkdir -p $HOME/work/vkrzv2l/vlp_304/yocto 
    cd $HOME/work/vkrzv2l/vlp_304/yocto
    ```

4. get helper utils
    ``` https
    wget https://raw.githubusercontent.com/Vekatech/vkrz-build-utils/main/yocto_304/create_yocto_304_vkrzv2l_src.sh
    wget https://raw.githubusercontent.com/Vekatech/vkrz-build-utils/main/yocto_304/run_docker
    ```
    ``` bash
    chmod a+x create_yocto_304_vkrzv2l_src.sh
    chmod a+x run_docker
    ```

6. adjust paths in "create_yocto_304_vkrzv2l_src.sh" as follows 
    ```
    PKGKDIR=$HOME/work/rzv_vlp_v3.0.4   - directory with source archives
    WORKSPACE=$(pwd)                    - working path
    YOCTO_HOME="${WORKSPACE}/yocto_304" - yocto dir
    BUILD_DIR="build"                   - build dir 
    ```

7. create yocto sources
    ``` sh
    ./create_yocto_304_vkrzv2l_src.sh
    ```

8. start docker (optional)
    ``` sh
    run_docker
    ```

9. go to YOCTO_HOME
    ``` 
    cd yocto_304
    ```

10. `TEMPLATECONF=$PWD/meta-vkrzv2l/docs/template/conf`

11. `source poky/oe-init-build-env build` - "build" has to be the same as BUILD_DIR in sh script

12. adjust layers
    ```
    bitbake-layers add-layer ../meta-xxx 
    ```

13. start a build 
    ``` bash
    bitbake core-image-<target>
    ```
