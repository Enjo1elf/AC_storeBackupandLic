# AC_storeBackupandLic
A PS script to retrieve Backup + License from multiple AudioCodes SBCs - defined by a CSV list file

Description:
This PowerShell script automates the process of connecting to multiple AudioCodes devices, backing up their configurations, and retrieving their license information. 
It reads device details from a CSV file, establishes a connection with each device using Basic Authentication, and stores the retrieved data locally for easy access and management.


Prerequisites:

- PowerShell: Ensure you are running this script in a PowerShell environment with adequate permissions.
- CSV File: Prepare a CSV file named SBC.csv in the same directory as the script. The CSV file should include the following columns:

Device-IP: The IP address of the device.
Admin-User: The username for device access.
Admin-Password: The password for the username.
Important Note: This script disables SSL/TLS certificate validation. Use with caution and ensure that your environment is secure.

Prepare the CSV File:

Create and save a CSV file named SBC.csv in the same directory as the script.
Populate the CSV with the necessary device details (IP address, username, and password).

Run the Script:

- Open a PowerShell window with the required permissions.
- Navigate to the directory containing the script and the CSV file.
- Execute the script by typing: .\AC_storeBackupandLic.ps1

Check the Output:

- After the script completes, the backup and license files will be saved in the directory specified in the script.
- The filenames will typically include the device IP and the current date for easy identification.


Security Considerations:

-SSL/TLS Validation: The script disables SSL/TLS certificate validation for ease of use with self-signed certificates. Ensure this is acceptable in your environment.
-Credential Management: The script uses Basic Authentication with encoded credentials. Make sure the script and CSV file are stored securely to prevent unauthorized access.


Troubleshooting:

-CSV File Issues: Ensure that the CSV file is formatted correctly and includes all required columns.
-Network Issues: Verify that the devices are accessible over the network and that the IP addresses and credentials are correct.
-Permissions: Make sure you have the necessary permissions to run scripts and access the devices.

