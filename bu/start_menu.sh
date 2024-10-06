#!/bin/bash
# Bash Menu Script Example

PS3='Select TASK: '
options=("RUN TOOLS" "RUN EMAIL VERIFIER" "RUN TASK" "SEARCH USERS" "QUIT")
select opt in "${options[@]}"
do
    case $opt in
        "RUN TOOLS")
            echo "you chose choice $REPLY $opt"
			./mytools.sh 	
			#break
            ;;
        "EMAIL VERIFIER")
            echo "you chose choice $REPLY $opt"
			./verify_email.sh
			#break
			
            ;;
        "RUN TASK")
            echo "you chose choice $REPLY $opt"
			./my_folderv6.sh 
			
			#break
			
            ;;
		"SEARCH USERS")
            echo "you chose choice $REPLY $opt"
			start https://office.orchestra.tools/users/usersdirectory/user/2987
			
			#break
			
            ;;
					
        "QUIT")
            break
            ;;
        *) echo "invalid option $REPLY press ENTER KEY to view menu"
				
		;;
    esac
done

#sed -i -e "s/$var1/$var2/g" /google.com.txt


