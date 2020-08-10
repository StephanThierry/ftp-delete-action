# ftp-delete-action
Automate deleting files on your ftp server using this GitHub action.

This action is inspired by https://github.com/sebastianpopp/ftp-action which is used to automate the ftp copy process.  

## Example usage

```
name: Deploy via ftp
on: push
jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repo 
      uses: actions/checkout@v2
      
    - name: Clean ReactJS precache-manifest and logs
      uses: StephanThierry/ftp-action@releases/v1
      with:
        host: ${{ secrets.FTP_SERVER }}
        user: ${{ secrets.FTP_USERNAME }}
        password: ${{ secrets.FTP_PASSWORD }}
        remoteFiles: "precache-manifest.*.js;logs/*.log"
        workingDir: "/public_html"

    ... THE REST OF YOUR DEPLOYMENT ...  

```

## Input parameters

Input parameter | Description | Required | Example
--- | --- | --- | ---
host | FTP server name | Yes | ftp.domain.com
user | FTP username | Yes | ftpUser
password | FTP password | Yes | secureFtpPassword
remoteFiles | Files to delete seperated by ";" | Yes | precache-manifest.*.js;logs/*.log
workingDir | Working directory for   | No, default = / | /public_html
