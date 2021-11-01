#download function
function download($server,$repositoryName,$source,$fileName,$username,$password)
{
    $url=  New-Object System.Uri("http://$server/repository/$repositoryName/$fileName")
    $credential = New-Object System.Management.Automation.PSCredential ($username,( ConvertTo-SecureString $password -AsPlainText -Force))
    Invoke-WebRequest -Uri $url -OutFile $destination -Headers $DefaultHttpHeaders -Credential $credential
}

#variables
$path= "C:\Users\Administrator\Desktop\nexus_upload_download\download.properties"
$output= Get-Content -Path $path |ConvertFrom-StringData

$server=$output.serverIP
$repositoryName=$output.repositoryName
$destination=$output.destination
$fileName=$output.fileName
$username=$output.username
$password=$output.password

$VerbosePreference="continue"

#Calling download function 

download $server $repositoryName $destination $fileName $username $password
