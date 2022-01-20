<# Import CSV to create Active Directory Organizational Units
   Main thing to note is to have higher level OUs listed above any 
   nested OUs in the CSV or you will receive errors that the target 
   doesn't exist
   
   CSV Format as follows: path,name

#>


Import-Module ActiveDirectory

    $Server = "DOMAINCONTROLLER.FQDN"

Import-Csv “c:\path-to-csv.csv” | ForEach-Object {

    New-ADOrganizationalUnit -Server $Server -Path $_.Path -Name $_.Name

}

