## Find the five longest ping data from google.com 

Lets do it in some steps 

Creating a new file
	
	touch tmp	
	
	#creates a file named tmp in your present working directory

Using ping command 
	
	ping google.com
	
	#ping command is used to ping a server using ICMP ECHO_REQUESTS to network hosts

Redirecting the ping data and running it in background
	
	ping google.com > tmp &
	
		`` > `` is used to redirect the ping data into the text file tmp 
		`` & `` makes the entire process to run in background 

Extracting the required data

	cat tmp | grep -Po 'time.*.ms'
	
		grep is a command used to search for a given pattern inside a text file
		text content of the temp file is piped to grep command 
	
	Or using awk command,
	
	awk '{print $8}' tmp
	
		awk is rather a programing language specilized in manupilating text files
		Here awk is used to printout only the coloumn no 8 of the text file tmp 
	
	
	
 

