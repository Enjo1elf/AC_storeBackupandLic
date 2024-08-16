# Written by Enrico Jost, August 2024
# Version 1.0
# GNU General Public License v3.0

# Ignore SSL/TLS certificate validation - Use with caution!
Add-Type @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class TrustAllCertsPolicy : ICertificatePolicy {
    public bool CheckValidationResult(
        ServicePoint srvPoint, X509Certificate certificate, WebRequest request, int certificateProblem) {
        return true;
    }
}
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

# Import the CSV file
$csvPath = ".\SBC.csv"
$devices = Import-Csv -Path $csvPath

foreach ($device in $devices) {
    $deviceIP = $device."Device-IP"
    $adminUser = $device."Admin-User"
    $adminPassword = $device."Admin-Password"

    # Encode the credentials for Basic Authentication
    $credentials = "$($adminUser):$($adminPassword)"
    $encodedCredentials = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes($credentials))

    # Define headers
    $headers = @{
        Authorization = "Basic $encodedCredentials"
    }

    # API endpoint for config backup
    $configBackupUrl = "https://$deviceIP/api/v1/files/ini"
    $configBackupPath = ".\$deviceIP.ini"

    # Download the config backup
    Invoke-RestMethod -Uri $configBackupUrl -Headers $headers -OutFile $configBackupPath

    # API endpoint for license file
    $licenseUrl = "https://$deviceIP/api/v1/license"
    $licensePath = ".\license_$deviceIP.txt"

    # Download the license file
    Invoke-RestMethod -Uri $licenseUrl -Headers $headers -OutFile $licensePath
}
