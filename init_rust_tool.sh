#!/bin/sh

LANG="rust"
USER=$(whoami)

while true;do
    stty -icanon min 0 time 100
    echo "是否需要设置http代理 (yes[y] or no[n])?"
    read Arg
    case $Arg in
        Y|y|YES|yes)
            proxy=sock5://127.0.0.1:7891
            export http_proxy=$proxy
            export https_proxy=$proxy
            echo "http_proxy=$http_proxy"
            echo "https_proxy=$https_proxy"
            break;;
        N|n|NO|no)
            # 不需要设置代理 继续安装插件
            echo 不需要设置代理 继续安装插件
            break;;
        "")  #Autocontinue
                        echo "无输入，继续安装插件"
            break;;
                *) # 处理无效输入
            echo "无效输入，请输入 yes[y] 或 no[n]"
            ;;
    esac
done

# set proxy

echo "begin init ${USER} ${LANG} tool..."

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "init ${USER} ${LANG} tool done."
