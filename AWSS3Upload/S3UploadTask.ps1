[CmdletBinding()]
param()

Trace-VstsEnteringInvocation $MyInvocation

Try {

    # Get values defined in task.json
    $BucketName = Get-VstsInput -Name BucketName -Require
    $File = Get-VstsInput -Name File -Require
    $Key = Get-VstsInput -Name Key -Require
    
    # Load AWS Tools for PowerShell to upload to S3
    If (-not (Get-Module -Name "AWSPowerShell")) 
    {
        write-host "Loading AWSPowerShell module"
        Import-Module AWSPowerShell
    }   
	
    # Begin Upload
    Write-Output "Upload File:$File to bucket:$BucketName Key:$Key"
    Write-Output "Running command: Write-S3Object -BucketName $BucketName -File $File -Key $Key"  
    Write-S3Object -BucketName $BucketName -File $File -Key $Key
    Write-Output "Upload complete!"
}

Catch{
    Write-Error $_.Exception.ToString()
	exit 1
}    

Finally {
    Trace-VstsLeavingInvocation $MyInvocation
}
