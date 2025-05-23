# Algebraic-Signature-based

Crypto++ Installation:

sudo apt-cache pkgnames | grep -i crypto++
sudo apt-get install libcrypto++8 libcrypto++8-dbg libcrypto++-dev

Note: it may 6 or 7 also according to system configuration.

Socat Installation:

sudo apt-get install socat

For Demostration Purpose

    1. Initial Content of Admin-Cloud:-
        a. DataAudit (main s/w)
        b. Configuration.txt   (configuration file)
        c. SetupTagGen.sh (Script to generate key materials and metadata)
        d. PortFree.sh (Script to free already bind port)
    2. Initial Content of Auditor (Alice):-
        a. DataAudit (main s/w)
        b. Configuration.txt   (configuration file)
        c. Success_Msg.ogg (Success message audio file)
        d. Failure_Msg.ogg (Failure message audio file)
        e. Alice.sh (The main Auditor Script)
        f. PortFree.sh (Script to free already bind port)
    3. Initial Content of Auditee / Storage (Bob):-
        a. Data_File
        b. Backup of the Data_file
        c. DataAudit (main s/w)
        d. Configuration.txt   (configuration file)
        e. Attack (attack s/w - specify attack proportion & blocksize)
        f. Bob.sh (The main Storage Script)

Note: You may required crypto++ library and socat installation, instructions are given below. Then Do permit all executable file through “chmod +x [filename] in all the systems”.
i.e. for Admin-Cloud : chmod +x DataAudit SetupTagGen.sh

    4. Step-1: Make sure that the path and filename of the Data file is properly mentioned in the  ‘SetupTagGen.sh’ script
    5. Step-2: Run the ‘SetupTagGen.sh’ script in Admin-Cloud
    6. Step-3: copy the params file (‘Params.bin’) from Admin-Cloud to both Alice and Bob
    7. Step-4: copy only the metadata file (‘metaData.bin’) from Admin-Cloud to Alice only
    8. Step-5: correct the Auditor’s IP address and Port number inside ‘Bob.sh’
    9. Step-6: correct the Auditee’s IP addressa and Port number inside ‘Alice.sh’
    10. Step-7: Upload Bob Folder in server(Bob) machine “[scp -r Storage\ username@Bob-IP:]”
    11. Step-8: Open three terminals:-
        a. One inside the Auditor (Alice)
        b. Two inside the Auditee (Bob) - may also login remotely using ssh
    12. Step-9: Run ./Bob.sh inside one of the terminals in Bob
    13. Step-10: Run ./Alice.sh inside Alice
    14. Step-11: Observe for some time - verification must be successful in all instances
    15. Step-12: Now Run the Attack program inside the other terminal in Bob 
        a. (./Attack <filename> <attack_proportion> <blocksize>) 
        b. blocksize = 2000; 
        c. attack_proportion = 0.01 (may reduce also)
    16. Step-13: Attack should be immediately detected by Alice
    17. Restore Data_File as cp <Backup of the Data_file> <Data_file>
