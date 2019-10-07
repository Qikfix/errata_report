#!/bin/bash

# Waldirio M Pinheiro <waldirio@gmail.com> / <waldirio@redhat.com>


# Some variables
FULL_LIST="/tmp/full_list.log"
FULL_PARSED_LIST="/tmp/full_list_parsed.log"
ERRATA_CH="/tmp/errata_ch.log"

# Zeroing all the files
>$FULL_LIST
>$FULL_PARSED_LIST
>$ERRATA_CH

# Script to generate a complete Errata Report

for b in $(hammer --csv host list --search 'name !~ virt-who*' --thin 1 | grep -v ^Id | cut -d, -f2); do err_list=$(hammer --csv erratum list --host $b | grep -v ^ID); echo "$err_list" | sed -e "s/^/$b,/g"; done >$FULL_LIST

cat $FULL_LIST | awk 'FS="," {print $4","$3","$2","$5","$1}' >$FULL_PARSED_LIST

cat $FULL_PARSED_LIST | sort -k 2 -t , | cut -d, -f2,3,5 | grep ^R >$ERRATA_CH

echo "Type,Id,Title,Issued,Affected Hosts"
while read line
do
  errata_id=$(echo $line | cut -d, -f1)
  internal_id=$(echo $line | cut -d, -f2)
  fqdn=$(echo $line | cut -d, -f3)

  issue_date=$(hammer erratum info --id $internal_id | grep ^Issued | awk '{print $2}')
  type=$(grep -E -o "$errata_id.*" /tmp/full_list.log | cut -d, -f2 | sort -u)
  title=$(grep -E -o "$errata_id.*" /tmp/full_list.log | cut -d, -f3- | sort -u)
  echo "$type,$errata_id,$title,$issue_date,$fqdn"
done < $ERRATA_CH
