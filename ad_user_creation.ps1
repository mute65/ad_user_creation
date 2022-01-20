


Import-Module ActiveDirectory

    $Server = DOMAINCONTROLLER.FQDN
    
    Import-Csv c:\path-to-csv.csv | foreach-object {
        
        $setpass = ConvertTo-SecureString -AsPlainText $_.accountPassword -force
        
        New-ADUser -Server $Server -GivenName $_.givenName -Surname $_.surname -Name $_.name -DisplayName $_.displayName -SamAccountName `
        $_.samAccountName -UserPrincipalName $_.userPrincipleName -EmailAddress $_.emailAddress -Enabled $true -AccountPassword $setpass `
        -Company $_.company -Path targetOU
        
        }


