$dominioLDAP="DC=aragon,DC=local"

New-ADOrganizationalUnit -DisplayName "USUARIOS" -Name "USUARIOS" -path $dominioLDAP

New-ADOrganizationalUnit -DisplayName "Gestores" -Name "Gestores" -path "OU=USUARIOS,"+$dominioLDAP
New-ADOrganizationalUnit -DisplayName "Tutores" -Name "Tutores" -path "OU=USUARIOS,"+$dominioLDAP
New-ADOrganizationalUnit -DisplayName "Competidores" -Name "Competidores" -path "OU=USUARIOS,"+$dominioLDAP