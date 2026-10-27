$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# These values are replaced by the CI workflow (publish-packages.yml) before packing.
$version = '2.1.15'
$url = "https://github.com/rockyCheung/Pyrelle/releases/download/v$version/Pyrelle.Setup.$version.exe"
$checksum = 'REPLACE_WITH_SHA256'

$packageArgs = @{
    packageName    = 'pyrelle'
    fileType       = 'EXE'
    url            = $url
    checksum       = $checksum
    checksumType   = 'sha256'
    silentArgs     = '/S'
    validExitCodes = @(0, 1602, 1638, 1618, 1632, 1642, 1612, 1625)
}

Install-ChocolateyPackage @packageArgs
