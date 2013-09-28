PART I
======

What is a Shell ?
=================

    - its an interpretter to pass commands given by user to the kernel
    - commands can be excuted line by line
    - there are different types of shells

Types of Shells
===============
        
    find it out   -> cat /etc/shells
    current shell -> echo $SHELL


Handout
=======

    Bashworkshop.md
        
        line by explaining of all commands
        simple commands
        usage of tabs
        simple regular expression while explaining grep

single line command
===================

    five-longest-ping-data.md

        making complex commands from simple ones

PART II
=======

where / when / what scripting ?
===============================

    - many single line commands can be grouped togather and put into a single file called script
    - when the script is an input to a shell its called shell script and here specifically its called bash scripting as the shell is bash
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

Try it out !!!
==============

    QUESTION:
        
        Write a script to take the first name, last name and the age of a person as input. 
        Output should give the full name and the age of the person in a proper sentence.

    SOLUTION:

        #!/bin/bash

        echo "First name: "
        read fname

        echo "Last name: "
        read lname

        echo "Age: "
        read age

        fullName=$fname" "$lname

        echo "Your name is $fullName and your age is $age"

        exit

IMPORTANT
=========

Note:
		Using the #!/bin/bash shebang line.

		Reason - It's a convention so the *nix shell knows what kind of interpreter to run.

		Even today (where most systems run "bash", the "Bourne Again Shell"), scripts can be in bash, python, perl, ruby, PHP, etc, etc. For example, 	  you might see "!/bin/perl" or "/bin/perl5".

		PPS: Remember - under *nix, associating a suffix with a file type is merely a convention, not a "rule". An "executable" can be a binary 			  program, any one of a million script types and other things as well. Hence the need for "#!/bin/bash".

PART III
========

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
                
                let "m = 3 + 34 - $t" // spaces within the double quotes are not an issue
	 
	 	Test 
	 			
	 			[[ ]] 
	 			
	 			use this to do all the testing conditions 
	 			
	 			like to check if a variable "ab" is greater than 10
	 			
	 			[[ $ab -gt 10 ]] 
	 			
	 			operations -gt -lt -eq -ne -ge -le 
	 	

Commandline Arguements
======================
																										
    input is given as <script name> arg1 arg2 arg3....

    inside the script arg1, arg2, arg3 all can be accessed using the variables
    $1, $2, $3, etc respectively

    by default $0 is represented by the script name

    all the arguements can be collectively accessed using the variable $@

PART IV
=======

    Ageneda:

        * to learn about different constructs in bash
        * these include: if condition, for and while loops, switch cases
        * learn to read a bash script
        * built large programs from prototypes(small programs which do not
          consider all test cases)
        * learn how different commands work

    Programs to be discussed:

        * timer.sh
        * uniq
        * zipo.sh
        * licenser.sh
        * dictionary.sh
        * pron.sh
        * debug
        
