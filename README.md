# errata_report
Full Errata Report for Satellite6

Using this script you will be able to generate a complete ERRATA report.
```
# ./errata_report.sh 
Type,Id,Title,Issued,Affected Hosts
bugfix,RHBA-2017:0103,firewalld bug fix update,2017-01-17,dhcp181-13.gsslab.rdu2.redhat.com
bugfix,RHBA-2017:0103,firewalld bug fix update,2017-01-17,dhcp-8-29-76.lab.eng.rdu2.redhat.com
bugfix,RHBA-2017:0103,firewalld bug fix update,2017-01-17,dhcp-8-30-30.lab.eng.rdu2.redhat.com
bugfix,RHBA-2017:0104,libnl3 bug fix update,2017-01-17,dhcp-8-29-76.lab.eng.rdu2.redhat.com
bugfix,RHBA-2017:0104,libnl3 bug fix update,2017-01-17,dhcp-8-30-30.lab.eng.rdu2.redhat.com
bugfix,RHBA-2017:0371,systemd bug fix update,2017-03-02,dhcp-8-29-76.lab.eng.rdu2.redhat.com
...
```

In order to use
```
# ./errata_report.sh | tee -a /tmp/errata.log
```

Then after concluding the report, you can filter by Content Host
```
# grep dhcp-8-30-30.lab.eng.rdu2.redhat.com /tmp/errata.log 
bugfix,RHBA-2016:2096,tzdata bug fix update,2016-10-21,dhcp-8-30-30.lab.eng.rdu2.redhat.com
bugfix,RHBA-2016:2611,selinux-policy bug fix update,2016-11-03,dhcp-8-30-30.lab.eng.rdu2.redhat.com
bugfix,RHBA-2016:2613,lvm2 bug fix update,2016-11-03,dhcp-8-30-30.lab.eng.rdu2.redhat.com
bugfix,RHBA-2016:2660,tzdata bug fix and enhancement update,2016-11-07,dhcp-8-30-30.lab.eng.rdu2.redhat.com
bugfix,RHBA-2016:2698,systemd bug fix update,2016-11-09,dhcp-8-30-30.lab.eng.rdu2.redhat.com
bugfix,RHBA-2016:2858,bash bug fix update,2016-12-06,dhcp-8-30-30.lab.eng.rdu2.redhat.com
...
```

or you can filter by Errata ID
```
# grep RHBA-2016:2698 /tmp/errata.log 
bugfix,RHBA-2016:2698,systemd bug fix update,2016-11-09,dhcp-8-29-76.lab.eng.rdu2.redhat.com
bugfix,RHBA-2016:2698,systemd bug fix update,2016-11-09,dhcp-8-30-30.lab.eng.rdu2.redhat.com
```

Some requirements
 - Hammer without authentication
 - Be executed on Satellite Server
