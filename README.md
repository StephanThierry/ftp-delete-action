# ftp-delete-action
Automate deleting files on your ftp site using this GitHub action.

This repo is based on https://github.com/sebastianpopp/ftp-action which is used to automate the ftp copy process.  

## Example usage

```
name: Deploy via ftp
on: push
jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Clean ReactJS precache-manifest 
      uses: StephanThierry/ftp-action@releases/v1
      with:
        host: ${{ secrets.FTP_SERVER }}
        user: ${{ secrets.FTP_USERNAME }}
        password: ${{ secrets.FTP_PASSWORD }}
        remoteFile: "public_html/precache-manifest.*.js"
```

## Input parameters

Input parameter | Description | Required 
--- | --- | --- | ---
host | FTP server name | Yes 
user | FTP username | Yes 
password | FTP password | Yes 
remoteFile | The files | Yes
forceSsl | Force SSL encryption | No, default = false
