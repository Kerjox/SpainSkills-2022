$dominioLDAP="DC=aragon,DC=local"


# Creacion de las unidades organizativas
New-ADOrganizationalUnit -DisplayName "USUARIOS" -Name "USUARIOS" -ProtectedFromAccidentalDeletion $False -path $dominioLDAP

New-ADOrganizationalUnit -DisplayName "Gestores" -Name "Gestores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"
New-ADOrganizationalUnit -DisplayName "Tutores" -Name "Tutores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"
New-ADOrganizationalUnit -DisplayName "Competidores" -Name "Competidores" -ProtectedFromAccidentalDeletion $False -path "OU=USUARIOS,$dominioLDAP"

# Creacion de los grupos de usuarios

New-ADGroup -DisplayName "Gestores" -Name "Gestores" -Path "OU=Gestores,OU=USUARIOS,$dominioLDAP"
New-ADGroup -DisplayName "Tutores" -Name "Tutores" -Path "OU=Tutores,OU=USUARIOS,$dominioLDAP"
New-ADGroup -DisplayName "Competidores" -Name "Competidores" -GroupCategory Security -Path "OU=Competidores,OU=USUARIOS,$dominioLDAP"
