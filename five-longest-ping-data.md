## Find the five longest ping response time from google.com 

Lets do it in some steps 

Creating a new file
	
	touch tmp	
		creates a file named tmp in your present working directory

Using ping command 
	
	ping google.com
		ping command is used to ping a server using ICMP ECHO_REQUESTS to network hosts

Redirecting the ping data and running it in background
	
	ping google.com > tmp &
		 >  is used to redirect the ping data into the text file tmp 
		 &  makes the entire process to run in background 

Extracting the required data


	using awk and cut,
	
	awk '{print $8}' tmp
        http://www.grymoire.com/Unix/Awk.html	
		awk is rather a programing language specilized in manupilating text files
		here awk is used to printout only the coloumn no 8 of the text file named 'tmp'
		
	awk '{print $8}' tmp | cut -d “=” -f2 
		cut - remove sections from each line of files
		here we trying to extarct only the numbers 
		delimiter option -d
		field option -f 

	using grep and cut,
		
	cat tmp | grep -Po 'time.*.ms' 
		grep is a command used to search for a given pattern inside a text file
		text content of the temp file is piped to grep command 
		-P enabling regex (perl regex)
		-o print only matching 
		
	cat tmp | grep -Po 'time.*.ms' | cut -d "=" -f 2 
		
	
	cat tmp | grep -Po 'time.*.ms' | cut -d "=" -f 2 | cut -d " " -f 1

	
Finding the longest
	
	awk '{print $8}' tmp | cut -d “=” -f2 | sort 
		
		sort - sort lines of text 
	
	awk '{print $8}' tmp | cut -d “=” -f2 | sort | uniq 
	
		uniq - removes adjacent duplictes after sort 
	
	awk '{print $8}' tmp | cut -d “=” -f2 | sort | uniq | tail -n 5 
	
		tail - used to output the last part of file 
		last n lines using -n option 

	Or using grep 
	
	cat tmp | grep -Po 'time.*.ms' | cut -d "=" -f 2 | cut -d " " -f 1 | sort | uniq | tail -n 5


		
		
		
		
		

	
	
 

