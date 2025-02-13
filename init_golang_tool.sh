#!/bin/sh


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

echo "begin init alison golang tool..."

echo "install golang.org/x/tools/..."
go install -v github.com/mdempsky/gocode@latest
go install -v github.com/ramya-rao-a/go-outline@latest
go install -v github.com/cweill/gotests/gotests@latest
go install -v github.com/fatih/gomodifytags@latest
go install -v github.com/josharian/impl@latest
go install -v github.com/haya14busa/goplay/cmd/goplay@latest
go install -v github.com/go-delve/delve/cmd/dlv@latest
go install -v honnef.co/go/tools/cmd/staticcheck@latest
go install -v github.com/golang/lint/golint
go install -v github.com/kisielk/errcheck
go install -v github.com/ofabry/go-callvis@latest
go install -v golang.org/x/tools/gopls@latest

for name in "benchcmp" "bisect" "bundle" "callgraph" "compilebench" \
	"deadcode" "digraph" "eg" "file2fuzz" "fiximports" "go-contrib-init" \
	"godex" "godoc" "goimports" "gomvpkg" "gonew" "gotype" "goyacc" \
	"html2article" "present" "present2md" "splitdwarf" "ssadump" "stress" "stringer" \
	"toolstash" "cover" "getgo" "auth/authtest" "auth/cookieauth" "auth/netrcauth" \
	"signature-fuzzer/fuzz-driver" "signature-fuzzer/fuzz-runner" "guru" "gorename"; do
    go install -v golang.org/x/tools/cmd/${name}@latest
done

echo "----------------------------------------------------------------------------------------------------"

echo "init alison golang tool done."



