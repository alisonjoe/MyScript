#!/bin/sh


while true;do
    stty -icanon min 0 time 100
    echo "是否需要设置http代理 (yes[y] or no[n])?"
    read Arg
    case $Arg in
        Y|y|YES|yes)
            proxy=sock5://127.0.0.1:7891
            set http_proxy=$proxy
            set https_proxy=$proxy
            @echo "http_proxy=$http_proxy"
            @echo "https_proxy=$https_proxy"
            break;;
        N|n|NO|no)
            # 不需要设置代理 继续安装插件
            echo 不需要设置代理 继续安装插件
            break;;
        "")  #Autocontinue
            break;;
    esac
done

# set proxy





echo "begin init alison golang tool..."

echo "install golang.org/x/tools/..."
go get -u -v golang.org/x/tools/...


go get -u -v






echo "----------------------------------------------------------------------------------------------------"

echo "init alison golang tool done."



