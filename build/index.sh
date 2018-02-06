#!/bin/sh
cd $(dirname $0)

#LATEST_VERSION=$(curl -s https://nodejs.org/download/release/latest/ | grep node | grep .zip | head -1 | cut -d"-" -f 2)
LATEST_VERSION="v6.12.3"

tar_exec=$(command -v gtar)
if [ $? -ne 0 ]; then
	tar_exec=$(command -v tar)
fi

download () {
	curl -L -# -A "https://github.com/a-sync/nodejs.org" -o $2 $1
}

echo "Downloading ${LATEST_VERSION} from nodejs.org..."
echo 

echo "  windows x64"
download "https://nodejs.org/download/release/${LATEST_VERSION}/node-${LATEST_VERSION}-win-x64.zip" win32-x64.zip
echo "  extracting"
unzip -o -d ../bin/win32/x64 -j win32-x64.zip "**/node.exe"

echo "  windows ia32"
download "https://nodejs.org/download/release/${LATEST_VERSION}/node-${LATEST_VERSION}-win-x86.zip" win32-ia32.zip
echo "  extracting"
unzip -o -d ../bin/win32/ia32 -j win32-ia32.zip "**/node.exe"

echo "  linux x64"
download "https://nodejs.org/download/release/${LATEST_VERSION}/node-${LATEST_VERSION}-linux-x64.tar.xz" linux-x64.tar.xz
echo "  extracting"
$tar_exec -x -C ../bin/linux/x64 --strip-components 2 -f linux-x64.tar.xz --wildcards "*/bin/node"

echo "  linux ia32"
download "https://nodejs.org/download/release/${LATEST_VERSION}/node-${LATEST_VERSION}-linux-x86.tar.xz" linux-ia32.tar.xz
echo "  extracting"
$tar_exec -x -C ../bin/linux/ia32 --strip-components 2 -f linux-ia32.tar.xz --wildcards "*/bin/node"

echo "  darwin x64"
download "https://nodejs.org/download/release/${LATEST_VERSION}/node-${LATEST_VERSION}-darwin-x64.tar.xz" darwin-x64.tar.xz
echo "  extracting"
$tar_exec -x -C ../bin/darwin/x64 --strip-components 2 -f darwin-x64.tar.xz --wildcards "*/bin/node"
