### Upload a file to S3 bucket in AWS
**Pricing:** Free

![Alt text](https://github.com/MarcusFelling/vsts-tasks/blob/master/screenshot.png)

Enter the following in the build task:

**Bucket Name** - Name of S3 bucket. 
Example: MyS3Bucket 

**File(s) to upload** - Path to file or folder.
File Example: $(Build.SourcesDirectory)/examplefile1.txt
Folder Example: $(Build.ArtifactsStagingDirectory)/ExampleFolder/

**Name of S3 Object** - Name and directory that the corresponding file will have in Amazon S3. 
Example: S3FolderName/examplefile1.$(Build.BuildID)-uploaded.txt
Note: This field is not available for folder uploads, file and folder names will be the same as local.

**Requirements**

1. AWS Tools for Windows PowerShell installed on build machine and script execution enabled. 
All Windows Amazon Machine Images (AMIs) have the AWS Tools for Windows PowerShell pre-installed.
[https://aws.amazon.com/powershell/](https://aws.amazon.com/powershell/)

2. Profile containing keys on build machine (if role is not configured):
Run `aws configure`  and set Access Key and Secret Key
[http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-using-examples](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-using-examples)


**Tip**

Use $(Build.BuildID) in the name of the S3 object for versioning.
