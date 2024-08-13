# Load private functions
$privateFunctions = Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Functions/Private') -Filter *.ps1 -Recurse
foreach ($privateFunction in $privateFunctions) {
    . $privateFunction.FullName
}

# Load public functions
$publicFunctions = Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Functions/Public') -Filter *.ps1 -Recurse
foreach ($publicFunction in $publicFunctions) {
    . $publicFunction.FullName
}

# Export public functions
Export-ModuleMember -Function $publicFunctions.Basename
