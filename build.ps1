param(
    [Parameter()]
    [ValidateSet("Visual Studio 14 2015", "Visual Studio 15 2017", "Visual Studio 16 2019")]
    [string]$generator = "Visual Studio 14 2015"
)

$ErrorActionPreference = "Stop"

cmake `
    -G "$generator" `
    -DBUILD_TESTING=OFF `
    -B build -S vcpkg-tool
cmake --build build --config Release --parallel
Copy-Item "build/Release/vcpkg.exe" -Destination "vcpkg"

vcpkg/vcpkg.exe install zlib --triplet x86-windows-v120
