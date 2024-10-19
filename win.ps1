# List of package names to uninstall
$packages = @(
  # lis pf all package
)

# Uninstall packages and verify
foreach ($package in $packages) {
    & ./adb.exe shell pm uninstall -k --user 0 $package
    $result = & ./adb.exe shell pm list packages | Select-String -Pattern $package
    if ($result) {
        Write-Output "Failed to uninstall package: $package"
    } else {
        Write-Output "Successfully uninstalled package: $package"
    }
}
