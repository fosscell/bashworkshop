where / when scripting ?
========================
    -	mostly in interpreted language
    -	small scale programs/automation
    -	super-set of this language is the programming language(ex: Python)
    -	ex: Bash, Python

Why to Write Shell Script ?
===========================

    Shell script can take input from user, file and output them on screen.
    Useful to create our own commands.
    Save lots of time.
    To automate some task of day today life.
    System Administration part can be also automated.

Types of Shells
===============
        
        find it out   -> cat /etc/shells
        current shell -> echo $SHELL

Variables:
==========
     
     System Variables and Enviornment 
        Very commonly used variables maintained by shell, represented with capital letters 
        env command to get a list of all system variables.
        Example:
                $HOME
                $RANDOM

    Loosly typed
        - need not specify data type during variable declaration
        Example :
            i=5         // i will hold an integer value now 
            i=hello     // i will now be overwritten to string hello 
        - could change the type during the run-time
          assignment
        - leave no space before and after the equal to sign
            Example:
            a="Hello World"   //Correct  
            a ="Hello world"  //Wrong !!
            a= "hello world"  //Wrong !!
        - you will have to use a $ symbol in front of the variable to make bash understand that its a variable
        
    String
        - represented by anything inside double quotes
        - Example:
        a="Hi there..."     //works
        a="0123456789"      //works
        a=hello             //works
        a=hello world       //WONT work, you will have to escape the space using backslash
        a=hello\ world      //will work
    
    NULL Variables 
        Example:
        a=
        a=""
 
Quotes
======
		
		"Double Quotes" - Anything enclose in double quotes removed meaning of that Double Quotes characters (except \ and $).
		'Single quotes' - Enclosed in single quotes remains unchanged.
		`Back quote` - echo "todays date is `date` "To execute command 			//usually the key above tab

I/P and O/P
===========
    
    echo command
        //printf in bash 
        Example:
            echo "sudev"
            echo $HOME
            echo $a			

    read command
        //scanf in bash 
        Example:    
            read a // you dont have to declare variable "a" to do this 

    
Lets write hello world 
======================
		The Script 
				
				//write 
		
		Method 2 //write the same thing in terminal 		

	Note:
		Using the #!/bin/bash shebang line.
		Reason - It's a convention so the *nix shell knows what kind of interpreter to run.
		Even today (where most systems run "bash", the "Bourne Again Shell"), scripts can be in bash, python, perl, ruby, PHP, etc, etc. For example, 	  you might see "!/bin/perl" or "/bin/perl5".
		PPS: Remember - under *nix, associating a suffix with a file type is merely a convention, not a "rule". An "executable" can be a binary 			  program, any one of a million script types and other things as well. Hence the need for "#!/bin/bash".

Regular Expression 
==================

    Wild cards
        - "*" - denotes everything
        		Example:
        		ls * 					//Displays all the files 
        		ls a*b				//all the files starting with a and ending with b 
        - "?" - denotes the presence the charactor just preceding it
        		Example:
        		ls a?					//all files with starts with a and with only two characters 
       
       Regular Expression - http://www.tldp.org/LDP/GNU-Linux-Tools-Summary/html/x11655.htm
        		
        		
    
Shell Arithmetic 
================
		
		expr
				
				expr is used to evaluate an expression in bash.
				Example 
					
					expr 8 / 2 										//works 
					epxr 8/ 2											//wont work, space problems 
					expr 8 / $(expr 4 \* 2) 			//you has to be carefull with this like 
																				// escaping some wildchars and again $() to evaluate individual expr's
		
    Let

        Let is used in a similar fashion as expr, small change in the syntax
        Example                                        
                
                let "m = 3 + 34 - $t" // spaces within 
                the double quotes are not an issue
																								
Conditional loop
================    
    if
        - syntax:
          if <condition>
          then
                <statements>
          elif <condition>
          then
                <statements>
          .
          .
          .
          else
                <statements>
          fi
        - <some link to the condition cases>

    while
        - syntax
          while <condition>
          do
                <statements>
          done [< FILE]

    switch case:
        - do not use switch key word
        - syntax
          case expression in
          pattern1 )
                <statements> ;;
          pattern2 )
                <statements> ;;
          .
          .
          .
          esac
        - for default part:
                patter can be given as "-" ==> which returns true for all
                arguements other than the ones given in the above cases
