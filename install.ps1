function installnexus($url,$destination,$unzip_destination) {
   
    # downloading Sonatype Nexus    
    Write-host "downloading started"
    Invoke-WebRequest -uri $url -OutFile $destination
    Write-Host "ready to extract"
    Write-Host "extracting files...."

    #Unzip zip files
    Expand-Archive -LiteralPath $destination -DestinationPath $unzip_destination  

    Write-Verbose "Nexus Installed Successfully"
    
    #Starting Sonatype Nexus OSS 3.36.0-01.......
    #Set-Location -Path "C:\Users\Administrator\Downloads\nexus-3.36.0-01-win64\nexus-3.36.0-01\bin"
    #nexus.exe /run
}

$path = "C:\Users\Administrator\Documents\nexus\nexus.properties"
$output = Get-Content $path | ConvertFrom-StringData

#variables
$url = $output.url
$destination = $output.destination
$unzip_destination = $output.unzip_destination
$nexus_install_logs = $output.nexus_install_logs

#starting Transcripts for logs..
Start-Transcript -Path $nexus_install_logs

#Function call
installtomcat $url $destination $unzip_destination

Stop-Transcript