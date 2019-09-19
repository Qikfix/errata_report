# errata_report
Full Errata Report for Satellite6

Using this script you will be able to generate a complete ERRATA report.
```
# ./errata_report.sh 
Type,Id,Title,Issued,Affected Hosts
bugfix,RHBA-2017:2329,kmod bug fix and enhancement update,2017-08-01,2
bugfix,RHBA-2017:2333,nss bug fix update,2017-08-01,2
bugfix,RHBA-2017:2571,nss-softokn bug fix update,2017-09-05,2
bugfix,RHBA-2017:2572,bash bug fix update,2017-09-05,2
bugfix,RHBA-2017:2576,openssh bug fix update,2017-09-05,2
bugfix,RHBA-2017:2577,binutils bug fix update,2017-09-05,2
bugfix,RHBA-2017:2579,selinux-policy bug fix update,2017-09-05,3
...
```

Some requirements
 - Hammer without authentication
 - Be executed on Satellite Server
