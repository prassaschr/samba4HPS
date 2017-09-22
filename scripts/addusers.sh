#!/bin/bash
#========================================
#Name:  Mark Earleywine
#Date:  10/2/2012
#
#This assumes the input file is a data file of users
#and must be in the following format (and also
#assumes this is the first line of the file):
#Name:Employee ID:Department:SecondaryGroups
#https://www.youtube.com/watch?v=8ecfwLLvALA
#https://sites.google.com/site/markearleywine/repository
#=========================================
filein="users_data.csv"
IFS=$'\n'

if [ ! -f "$filein" ]
then
  echo "Cannot find file $filein"
else

  #create arrays of groups, full names, and usernames
  # If there is a space in the group, the space goes away, example "Human Resource" will be "HumanResource"
  groups=(`cut -d: -f 3 "$filein" | sed 's/ //'`)
  fullnames=(`cut -d: -f 1 "$filein"`)
  userid=(`cut -d: -f 2 "$filein"`)
  usernames=(`cut -d: -f 1 "$filein"`)
  #usernames=(`cut -d: -f 1 "$filein" | tr [A-Z] [a-z] | awk '{print substr($1,1,1) $2}'`)
  #secondary groups must be comma delimeter, example group2,group3
  secgroups=(`cut -d: -f 4 "$filein"`)

  #checks if the primary group exists, if not then creates it
  for group in ${groups[*]}
  do
    grep -q "^$group" /etc/group ; let x=$?
    if [ $x -eq 1 ]
    then
      groupadd "$group"
    fi
  done

  #creates the user accounts, adds them to groups, and sets passwords
  #then once account is created, mails the account
  x=0
  created=0
  for user in ${usernames[*]}
  do
	##multiple secondary groups with -G
	#primary group with -g
	#usermod -G groupPublic,groupSecret username
    # useradd -M -s -c /sbin/nologin ${fullnames[$x]} -g "${groups[$x]}" $user 2> /dev/null
	useradd -M -s /sbin/nologin $user 2> /dev/null
	usermod -g "${groups[$x]}" $user 2> /dev/null
	usermod -G "${secgroups[$x]}" $user 2> /dev/null
	#useradd -n -c ${fullnames[$x]} -g "${groups[$x]}" $user 2> /dev/null
    if [ $? -eq 0 ]
    then
      let created=$created+1
    fi
	#echo "Name: ${fullnames[$x]}, un: $user, pw: ${userid[$x]}"
    #This creates the password for the user suppresses output of passwd
    #The -p in the useradd function doesn't set it properly
    echo -ne "${userid[$x]}\n${userid[$x]}\n" | passwd -q "$user" > /dev/null
	echo -ne "${userid[$x]}\n${userid[$x]}\n" | smbpasswd -a -s "$user" > /dev/null
	#echo -ne "$PASS\n$PASS\n" | smbpasswd -a -s $LOGIN
	smbpasswd -e $user > /dev/null
    #sends mail to user
    echo "Welcome! Your account has been created.  Your username is $user and temporary password is \"$password\" without the quotes." | mail -s "New Account for $user" -b root $user
    x=$x+1
    echo -n "..."
    sleep .25
  done
  sleep .25
  echo " "
  echo "Complete. $created accounts have been created."
fi
