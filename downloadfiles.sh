downloadfiles() {
    dots "Downloading kernel, init and fog-client binaries"
    [[ ! -d ../tmp/ ]] && mkdir -p ../tmp/ >/dev/null 2>&1
    cwd=$(pwd)
    cd ../tmp/

    urls=( "https://github.com/brahimmachkouri/fog/blob/master/binaries/bzImage" "https://github.com/brahimmachkouri/fog/blob/master/binaries/bzImage32" "https://github.com/brahimmachkouri/fog/blob/master/binaries/init.xz" "https://github.com/brahimmachkouri/fog/blob/master/binaries/init_32.xz" "https://github.com/brahimmachkouri/fog/blob/master/binaries/SmartInstaller" "https://github.com/brahimmachkouri/fog/blob/master/binaries/FOGService.msi")
    for url in "${urls[@]}"
    do
        filename=$(basename -- "$url")
        baseurl=$(dirname -- "$url")
        curl --silent -kOL $url >>$workingdir/error_logs/fog_error_${version}.log 2>&1
    done
    echo "Done"
    errorStat $?
    copypath="./"
    dots "Copying binaries to destination paths"
    cp -vf ${copypath}bzImage ${webdirdest}/service/ipxe/ >>$workingdir/error_logs/fog_error_${version}.log 2>&1 || errorStat $?
    cp -vf ${copypath}bzImage32 ${webdirdest}/service/ipxe/ >>$workingdir/error_logs/fog_error_${version}.log 2>&1 || errorStat $?
    cp -vf ${copypath}init.xz ${webdirdest}/service/ipxe/ >>$workingdir/error_logs/fog_error_${version}.log 2>&1 || errorStat $?
    cp -vf ${copypath}init_32.xz ${webdirdest}/service/ipxe/ >>$workingdir/error_logs/fog_error_${version}.log 2>&1 || errorStat $?
    cp -vf ${copypath}FOGService.msi ${copypath}SmartInstaller.exe ${webdirdest}/client/ >>$workingdir/error_logs/fog_error_${version}.log 2>&1
    errorStat $?
    cd $cwd
}
