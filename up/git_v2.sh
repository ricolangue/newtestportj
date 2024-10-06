#!/bin/bash
PS3='Select TASK: '
options=("GIT REPO" "GIT CLONE" "GIT ADD ALL FILES" "GIT BU" "GIT UP" "GIT LOG" "DEL GIT" "QUIT")
select opt in "${options[@]}"
do
    case $opt in
        "GIT REPO")
            echo "you chose choice $REPLY $opt"
			#git_file_path
			read -p "Enter Git file path:" git_file_path 
			while [[ "${git_file_path}" == "" ]] ; do
			   read -p "Enter Git file path:" git_file_path 
			done

			cd ./$folderB/$myfolderA/$client_web/
			git init
			git remote add origin $git_file_path
			
			echo "$git_file_path" > git_file_path.txt

				
			#break
            ;;
        "GIT CLONE")
            echo "you chose choice $REPLY $opt"
			if [ -e "./git_file_path.txt" ]
			then
			echo "git path config not found"
			git_file_path_clone="$(<./git_file_path.txt)"
			echo $git_file_path_clone
			git clone $git_file_path_clone 
			fi 
			#break
			
            ;;
		"GIT ADD ALL FILES")
            echo "you chose choice $REPLY $opt"
			git_file_path="$(<./git_file_path.txt)"
			echo $git_file_path
			
			git add .
			git commit -m " $git_file_path - * UPDATES "
			git push -u origin master			 
			
			#break
			
            ;;
        "GIT BU")
            echo "you chose choice $REPLY $opt"
			if [ -e "./git_file_path.txt" ]
			then
			echo "git path config not found"
			git_file_path="$(<./$folderB/$myfolderA/$client_web/git_file_path.txt)"
			echo $git_file_path

			else
			echo "git path config not found"

			fi
			if [ ! -d ./bu ]; then
				echo "bu Directory not exist"
				
			else
				echo "bu Directory already exist"
				git add bu
				git commit -m " $git_file_path - BU "
				git push -u origin master
				
			fi;
			
			#break
			
            ;;
		
		"GIT UP")
            echo "you chose choice $REPLY $opt"
			if [ ! -d ./up ]; then
				echo "up Directory not exist"
				
			else
				echo "up Directory already exist"
				if [ -e "./git_file_path.txt" ]
				then
					echo "git path config not found"
					git_file_path="$(<./git_file_path.txt)"
					echo $git_file_path
					
				else
					echo "git path config not found"
					
				fi
				git add up
				git commit -m " $git_file_path - UP "
				git push -u origin master
				
			fi;			
			#break
			
            ;;
		
		"GIT LOG")
            echo "you chose choice $REPLY $opt"
			
			git log
			
            ;;
			
		"DEL GIT")
            echo "you chose choice $REPLY $opt"
			if [ ! -d .git ]; then
				echo "git Directory not exist"
				
			else
				echo "git Directory already exist"
				rm -rf .git
				
				if [ ! -d .git ]; then
				echo "git Directory was deleted successfully"
				
				else
					echo "git Directory delete failed"
								
				fi;
					
			fi;
			
			#break
			
            ;;
					
        "QUIT") 
		
			cd ./../../../
            break
            ;;
        *) echo "invalid option $REPLY press ENTER KEY to view menu"
				
		;;
    esac
done



if [ ! -d .git ]; then
    echo "Git Directory not exist"
	
else
	echo "Git Directory already exist"
	cd ./.git 
	if [ -e "config" ]
	then
		#config="$(<./.git/config)"
		url_text="url = $git_file_path #"
		#start ./../Find_And_Replace.vbs "config" "url =" "$url_text"
	
	else
		echo "git config not found"
	fi
	
	cd .. 

fi;












