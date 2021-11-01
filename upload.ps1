#Upload function
function upload($server,$repositoryName,$source,$fileName,$username,$password)
{
    $url=  New-Object System.Uri("http://$server/repository/$repositoryName/$fileName")
    $credential = New-Object System.Management.Automation.PSCredential ($username,( ConvertTo-SecureString $password -AsPlainText -Force))
    Invoke-WebRequest -Uri $url -InFile $source -Headers $DefaultHttpHeaders -Method Put -Credential $credential
}

#variables
$path= "C:\Users\Administrator\Desktop\nexus_upload_download\upload.properties"
$output= Get-Content -Path $path |ConvertFrom-StringData

$server=$output.serverIP
$repositoryName=$output.repositoryName
$source=$output.source
$fileName=$output.fileName
$username=$output.username
$password=$output.password

$VerbosePreference="continue"

#Calling upload function 
upload $server $repositoryName $source $fileName $username $password




$URI = $output.URI
$SOURCE = $output.SOURCE
$USER = $output.USER
$pwd = $output.pwd


upload $URI $SOURCE $CREDS

