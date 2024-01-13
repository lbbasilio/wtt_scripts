#!/bin/sh
ip=$(wget -qO- ifconfig.me/ip)
aws route53 change-resource-record-sets \
	--hosted-zone-id Z0521354D7BH19GUM6RW \
	--change-batch '
	{
		"Comment": "Updating DNS record...",
		"Changes": [{
			"Action": "UPSERT",
			"ResourceRecordSet": {
				"Name": "minezada.semroque.com",
				"Type": "A",
				"TTL": 60,
			"ResourceRecords": [{
				"Value": "'" $ip "'"
			}]
		}
	}]
}
'
