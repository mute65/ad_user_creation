<# Import CSV of users to be created in Active Directory
CSV Headers as follows: givenName,surname,name,displayName,samAccountName,userPrincipleName,emailAddress,accountPassword,company,targetOU
Any additional properties can be added as a header and inserted into the New-ADUser cmdlet. #>


Import-Module ActiveDirectory

    $Server = "DOMAINCONTROLLER.FQDN"
    
    Import-Csv "c:\path-to-csv.csv" | foreach-object {
        
        $setpass = ConvertTo-SecureString -AsPlainText $_.accountPassword -force
        
        New-ADUser -Server $Server -GivenName $_.givenName -Surname $_.surname -Name $_.name -DisplayName $_.displayName -SamAccountName `
        $_.samAccountName -UserPrincipalName $_.userPrincipleName -EmailAddress $_.emailAddress -Enabled $true -AccountPassword $setpass `
        -Company $_.company -Path $_.targetOU
        
        }


