# THIS IS BOB

#!/bin/bash
MY_PORT=22232
ALICE_IP="172.21.11.14"
ALICE_PORT=22231

trap "exit" SIGINT


while true; do
	# Wait for ChalStr.txt from Alice
	socat - TCP-LISTEN:$MY_PORT,reuseaddr > ChalStr.txt

	# Run ProofGen: takes ChalStr.txt and other necessary files as input and generates POP.bin as output
	./DataAudit ProofGen Params.bin 15MBData.csv ChalStr.txt

	# Send POP.bin to Alice
	cat POP.bin | socat - TCP:$ALICE_IP:$ALICE_PORT

done
