### Upload a file to S3 bucket in AWS
**Pricing:** Free

Simply enter the following in the build task:  
**Bucket Name** - Name of S3 bucket. 
Example: MyS3Bucket/folder  

**File to upload ** - Directory of file to upload. 
Example: $(Build.ArtifactStagingDirectory)/examplefile.txt  

**Name of S3 Object** - Name that the corresponding file will have in Amazon S3. 
Example: examplefile-uploaded.txt

**Requirements:**

-AWS Tools for Windows PowerShell installed on build
machine 
[https://aws.amazon.com/powershell/](https://aws.amazon.com/powershell/)

-Profile containing keys on build machine (if role is not configured): Run aws configure and set Access Key and Secret Key:
[http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-using-examples](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-using-examples)