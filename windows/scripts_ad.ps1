$dominioLDAP="DC=aragon,DC=local"

New-ADOrganizationalUnit -DisplayName "USUARIOS" -Name "USUARIOS" -ProtectedFromAccidentalDeletion $False -path $dominioLDAP

New-ADOrganizationalUnit -DisplayName "Gestores" -Name "Gestores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"
New-ADOrganizationalUnit -DisplayName "Tutores" -Name "Tutores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"
New-ADOrganizationalUnit -DisplayName "Competidores" -Name "Competidores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"