[CmdletBinding()]
param()

Function FileUpload($Files, $Key) {    
        # Begin Upload
        Write-Output "Uploading $Files"
        Write-S3Object -BucketName $BucketName -File $Files -Key $Key 
        Write-Output "Upload complete!"
}

Function FolderUpload($FileList) {
               
    Write-Output "Uploading all files in $Files"
    Get-ChildItem -recurse $Files |
    ForEach {
        # Begin Upload
        Write-S3Object -BucketName $BucketName -File $_.FullName -Key $_.Name
        Write-Output "$_ Upload complete!"
    }        
}

Trace-VstsEnteringInvocation $MyInvocation
Try {
    
    # Load AWS Tools for PowerShell to upload to S3
    If (-not (Get-Module -Name "AWSPowerShell")) {
        Write-Output "Loading AWSPowerShell module"
        Import-Module AWSPowerShell
    }            
	
    # Get values defined in task.json
    $BucketName = Get-VstsInput -Name BucketName -Require
    $Files = Get-VstsInput -Name File -Require
    $Key = Get-VstsInput -Name Key    

    # If $Files is NOT a folder, run FileUpload
    If((Get-Item $Files) -isnot [System.IO.DirectoryInfo]){
        write-output "Running file Upload"
        FileUpload $Files $Key       
    }
    # If $Files is a folder, run FolderUpload
    ElseIf((Get-Item $Files) -is [System.IO.DirectoryInfo]){
        write-output "Running folder Upload"
        FolderUpload $Files     
    }
    Else{        
        Throw "Specified file or folder does not exist."
    }
}

Catch{
    Write-Error $_.Exception.ToString()
	exit 1
}    

Finally {
    Trace-VstsLeavingInvocation $MyInvocation
}
