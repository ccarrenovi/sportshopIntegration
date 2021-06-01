#!/bin/sh
$JBOSS_HOME/bin/jboss-cli.sh --connect <<EOF
batch
/subsystem=messaging-activemq/server=default/address-setting=jms.queue.DeadLetter:add
jms-queue add --queue-address=DeadLetter --entries=java:/jms/queue/DeadLetter
run-batch
EOF
