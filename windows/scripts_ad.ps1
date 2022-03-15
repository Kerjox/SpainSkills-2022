$dominioLDAP="DC=dom,DC=as21"
$domain_name="dom.as21"
$userPass=(convertto-securestring "IVSZ2e12" -AsPlainText -Force)


# Creacion de las unidades organizativas
New-ADOrganizationalUnit -DisplayName "USUARIOS" -Name "USUARIOS" -ProtectedFromAccidentalDeletion $False -path $dominioLDAP

New-ADOrganizationalUnit -DisplayName "Gestores" -Name "Gestores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"
New-ADOrganizationalUnit -DisplayName "Tutores" -Name "Tutores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"
New-ADOrganizationalUnit -DisplayName "Competidores" -Name "Competidores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"

# Creacion de los grupos de usuarios

New-ADGroup -DisplayName "Gestores" -Name "Gestores" -GroupScope Global -GroupCategory Security -Path "OU=Gestores,OU=USUARIOS,$dominioLDAP"
New-ADGroup -DisplayName "Tutores" -Name "Tutores" -GroupScope Global -GroupCategory Security -Path "OU=Tutores,OU=USUARIOS,$dominioLDAP"
New-ADGroup -DisplayName "Competidores" -Name "Competidores" -GroupScope Global -GroupCategory Security -Path "OU=Competidores,OU=USUARIOS,$dominioLDAP"



for (($i = 1); $i -lt 11 ; $i++)
{
    $name="Gestor$i"
    New-ADUser -Name $name -UserPrincipalName "$name@$domain_name" -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -AccountPassword $userPass -Path "OU=Gestores,OU=USUARIOS,$dominioLDAP"
    Add-ADGroupMember "Gestores" $name
}

for (($i = 1); $i -lt 11 ; $i++)
{
    $name="Tutor$i"
    New-ADUser -Name $name -UserPrincipalName "$name@$domain_name" -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -AccountPassword $userPass -Path "OU=Tutores,OU=USUARIOS,$dominioLDAP"
    Add-ADGroupMember "Tutores" $name
}

for (($i = 1); $i -lt 11 ; $i++)
{
    $name="Competidor$i"
    New-ADUser -Name $name -UserPrincipalName "$name@$domain_name" -PasswordNeverExpires $True -CannotChangePassword $True -Enabled $True -AccountPassword $userPass -Path "OU=Competidores,OU=USUARIOS,$dominioLDAP"
    Add-ADGroupMember "Competidores" $name
}
