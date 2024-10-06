#!/bin/bash
PS3='Select TASK: '
options=("GIT REPO" "GIT CLONE" "GIT ADD ALL FILES" "GIT BU" "GIT UP" "GIT LOG" "CHANGE REPO" "DEL GIT" "QUIT")
select opt in "${options[@]}"
do
    case $opt in
        "GIT REPO")
            echo "you chose choice $REPLY $opt"
			#git_file_path
						
			if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web

			fi
			
			if [ -e "./git_file_path.txt" ]
			then
				git_file_path="$(<./git_file_path.txt)"
				#cd $client_file_path
			else
				echo "path not found"
				
				read -p "Enter Git file path:" git_file_path 
				while [[ "${git_file_path}" == "" ]] ; do
				   read -p "Enter Git file path:" git_file_path 
				done
				echo "$git_file_path" > git_file_path.txt 

			fi
			
						
			git init
			git remote add origin $git_file_path
			
			#echo "$git_file_path" > git_file_path.txt
				
			#break
            ;;
        "GIT CLONE")
            echo "You chose choice $REPLY $opt"
			if [ -e "./git_file_path.txt" ]
			then
				echo "git path config existing"
				git_file_path_clone="$(<./git_file_path.txt)"
				echo $git_file_path_clone
				git clone $git_file_path_clone 
				
			else
				echo "Git remote repository path not existing."
				echo "Please add repository first."
			fi 
			#break
			
            ;;
		"GIT ADD ALL FILES")
            echo "you chose choice $REPLY $opt"
			if [ -e "./git_file_path.txt" ]
				then
				git_file_path="$(<./git_file_path.txt)"
				echo $git_file_path
				
				git add .
				git commit -m " $git_file_path - * BACKUP "
				git push -u origin master	
			else 
			
				echo "Git remote repository path not existing."
				echo "Please add repository first."
			
			fi 
			#break
			
            ;;
        "GIT BU")
            echo "you chose choice $REPLY $opt"
			if [ -e "./git_file_path.txt" ]
			then
				echo "git path config not found"
				git_file_path="$(<./git_file_path.txt)"
				echo $git_file_path
				
				if [ ! -d ./bu ]; then
				echo "bu Directory not exist"
				
			else
				echo "bu Directory already exist"
				git add bu
				git commit -m " $git_file_path - BU "
				git push -u origin master
				
			fi;

			else
				echo "Git remote repository path not existing."
				echo "Please add repository first."

			fi
			
			
			
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
					echo "git path existing"
					git_file_path="$(<./git_file_path.txt)"
					echo $git_file_path
					git add up
					git commit -m " $git_file_path - UP "
					git push -u origin master
					
				else
					echo "Git remote repository path not existing."
					echo "Please add repository first."
					
				fi
				
				
			fi;			
			#break
			
            ;;
		
		"GIT LOG")
            echo "you chose choice $REPLY $opt"
			
			git log
			
            ;;
			
		"CHANGE REPO")
            echo "you chose choice $REPLY $opt"
			#git_file_path
			
			read -p "Enter New Git file path:" git_file_pathb 
				
			while [[ "${git_file_pathb}" == "" ]] ; do
			   read -p "Enter New Git file path:" git_file_pathb 
			done
			
			echo "$git_file_pathb" > git_file_pathb.txt 
			
			if [ ! -d .git ]; then
				echo "Git Directory not exist"
				
			else
				echo "Git Directory already exist"
				cd ./.git 
				if [ -e "config" ]
				then
					#config="$(<./.git/config)"
					git_file_path="$(<./../git_file_path.txt)"
					git_file_pathb="$(<./../git_file_pathb.txt)"
					#url_text="url = $git_file_path #"
					
					start ./../../../../Find_And_Replace.vbs "config" "$git_file_path" "$git_file_pathb"
					echo "$git_file_pathb" > ./../git_file_path.txt 
					
					git init
					git remote add origin $git_file_pathb
				
				else
					echo "git config not found"
					echo "Pleasa add new repository."
				fi
				
				cd .. 

			fi;
						
			
			
			#break
			
            ;;
		"DEL GIT")
            echo "you chose choice $REPLY $opt"
			if [ ! -d .git ]; then
				echo "git Directory not exist"
				
			else
				echo "git Directory already exist"
				echo "attrib -h .git" >> attrib.bat 
				echo "exit" >> attrib.bat 
				start ./attrib.bat 		
				
				if [ ! -d ./git_bu ]; then
					mkdir -p "./git_bu"
				else
					echo "folder git_bu already existing. "
								
				fi 
				
				cp -rf .git ./git_bu
				#rm ./git_bu/config delete config file or rename by using mv 
				mv ./git_bu/.git/config ./git_bu/.git/config.old 
				echo "folder git_bu backup created successfully. "
				rm -rf .git
				
				if [ -e "./git_file_path.txt" ]
				then
					
					rm ./git_file_path.txt
					echo "git path git_file_path.txt was deleted successfully"
				else 
					echo "git path delete failed"
				fi 	
				
				if [ ! -d .git ]; then
				echo "git Directory was deleted successfully"
			
				else
					echo "git Directory delete failed"
								
				fi;
					
			fi;
			
			#break
			
            ;;
					
					
        "QUIT") 
			if [ -e "./client_file_path.txt" ]
			then
				client_file_path="$(<./client_file_path.txt)"
				#cd $client_file_path
			else
				echo "path not found"
				#cd ./$folderB/$myfolderA/$client_web
				cd ./../../../

			fi
			
            break
            ;;
        *) echo "invalid option $REPLY press ENTER KEY to view menu"
				
		;;
    esac
done












