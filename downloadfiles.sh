downloadfiles() {
    dots "Downloading kernel, init and fog-client binaries"
    [[ ! -d ../tmp/ ]] && mkdir -p ../tmp/ >/dev/null 2>&1
    cwd=$(pwd)
    cd ../tmp/

    urls=( "https://github.com/brahimmachkouri/fog/blob/master/binaries/bzImage" "https://github.com/brahimmachkouri/fog/blob/master/binaries/bzImage32" "https://github.com/brahimmachkouri/fog/blob/master/binaries/init.xz" "https://github.com/brahimmachkouri/fog/blob/master/binaries/init_32.xz" "https://github.com/brahimmachkouri/fog/blob/master/binaries/SmartInstaller.exe" "https://github.com/brahimmachkouri/fog/blob/master/binaries/FOGService.msi")
    for url in "${urls[@]}"
    do
        filename=$(basename -- "$url")
        baseurl=$(dirname -- "$url")
        curl --silent -kOL $url
    done
    echo "Done"
    dots "Copying binaries to destination paths"
    cp -vf bzImage ${webdirdest}/service/ipxe/ 
    cp -vf bzImage32 ${webdirdest}/service/ipxe/ 
    cp -vf init.xz ${webdirdest}/service/ipxe/ 
    cp -vf init_32.xz ${webdirdest}/service/ipxe/ 
    cp -vf FOGService.msi ${copypath}SmartInstaller.exe ${webdirdest}/client/ 
    cd $cwd
}
