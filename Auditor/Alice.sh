# THIS IS ALICE

#!/bin/bash
MY_PORT=22221
BOB_IP="172.17.15.7"
BOB_PORT=22222
counter=1

trap "exit" SIGINT


while true; do
	echo "Auditing instance $counter"
	
	# Run ChallengeGen: generates ChalStr.txt as output
	./DataAudit ChallengeGen

	# Send ChalStr.txt to Bob
	cat ChalStr.txt | socat - TCP:$BOB_IP:$BOB_PORT

	# Wait for POP.bin from Bob
	socat - TCP-LISTEN:$MY_PORT,reuseaddr > POP.bin

	# Run VerifyProof: takes POP.bin and other necessary files as input and prints the result
	res=$(./DataAudit VerifyProof Params.bin POP.bin metaData.bin ChalStr.txt)
	if [ $res -eq 1 ]; then
		echo "VERIFICATION SUUCCESSFUL !"
		paplay Success_Msg.ogg
	else
		echo "VERIFICATION FAILED !  DATA IS CORRUPUTED !"
		paplay Failure_msg.ogg
	fi
	
	sleep 1
	counter=$((counter + 1))

done
