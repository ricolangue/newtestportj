#!/bin/bash 

if [ ! -d .git ]; then
    echo "git Directory not exist"
	
else
	echo "git Directory already exist"
	#rm -rf .git
	
	if [ ! -d .git ]; then
    echo "git Directory was deleted successfully"
	
	else
		echo "git Directory delete failed"
					
	fi;
		
fi;

#git_file_path
read -p "Enter Git file path:" git_file_path 
while [[ "${git_file_path}" == "" ]] ; do
   read -p "Enter Git file path:" git_file_path 
done

git init
git remote add origin $git_file_path
echo "$git_file_path" > git_file_path.txt

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

if [ -e "./git_file_path.txt" ]
then
	echo "git path config not found"
	git_path="$(<./git_file_path.txt)"
	echo $git_path
	
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

if [ ! -d ./up ]; then
    echo "up Directory not exist"
	
else
	echo "up Directory already exist"
	git add up
	git commit -m " $git_file_path - UP "
	git push -u origin master
	
fi;






