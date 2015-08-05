Basic Navigation
================

cd   - Change directory. This lets you navigate to different directories (folders).
    Examples:

    cd Documents
        go into a subdirectory (of the current directory) named "Documents"
    cd Documents/temp
        go into "Documents", then from there into a subdirectory named "temp"
    cd ..
        go up to the parent of the current directory
    cd ../..
        go up two levels, to the parent's parent
    cd ~
        go to your home directory (note: that's a tilde, not a dash)
    cd -
        go back to the previous directory 

pwd   - Print working directory. This prints the path of the current working directory (i.e. it tells you where you are).

ls   - List the files in the current directory, and (optionally) their characteristics.

    Examples:

    ls -l
        (long) list the files with their characteristics (size, privs, owner, etc)
    ls -a
        list all files in the current directory (including those that would normally be invisible)
    ls *att*
        list the names of all files with names containing "att" 
        
Manipulating Files and Folders:
===============================

cp   - Copy a file (or directory).

    Examples:

    cp foo ~/Documents/bar
        copy a file named "a" (in the current directory) into your Documents directory and name the copy "bar"
    cp *.jpg ~/Documents
        copy all files with names ending in ".jpg" into your Documents directory
    cp -R Documents "Documents backup"
        copy an entire directory named "Documents"; name the copy "Documents backup". The quotes are needed because of the space in the directory name.

rm   - Remove (delete) a file or directory.

    Examples:

    rm foo
        delete the file named "foo"
    rm a*
        delete all files with names beginning with "a"
    rm -R temp
        delete the directory named "temp", and all of its contents 

mkdir   - Make directory - equivalent to the Finder's New Folder command.

    Example:

    mkdir foo
        Create a new directory named "foo" 

Working with Text Files:
========================

more and less   - display the contents of a text file, one screenful at a time (hit the spacebar to get the next screen). Note that this only works well with plain text files, not Word files, RTF's, PDF's, or anything else that contains formatting information. less also allows you to go backwards (type "b") in the file. In either one, type "h" for more detailed help.

    Examples:

    more /etc/inetd.config
        print the inetd.conf file to the terminal, one screen at a time.
    ps -ax | more
        use the ps command to generate a list of processes running on the system, and pipe them to more to display them one screen at a time. 

grep   - search the contents of a text file, and print lines containing a given word or pattern.

    Examples:

    grep telnet /etc/inetd.config
        search the inetd.conf file, and print all lines that contain "telnet".
    ps -ax | grep netinfod
        use the ps command to generate a list of processes running on the system, then pipe the list through grep, which will print only those lines containing "netinfod". Note: this will list all runing netinfod processes, and also list the process running grep itself. 

vi and emacs   - other text editors provided with the standard *nix installation. They're both more powerful than pico, but also a lot harder to figure out if you aren't already familiar with them.

tail   - print the last few lines of a text file. This is mainly useful for examining the last (i.e. most recent) entries in things like log files.

    Examples:

    tail /var/log/system.log
        print the last screenful of entries from the main system log.
    tail -1000 /var/log/system.log | more
        print the last 1000 entries from the main system log, using more to display them one screenful at a time.

Pipes and Redirection
====================

`` > ``   - Redirect output from a command to a file on disk. Note: if the file already exist, it will be erased and overwritten without warning, so be careful.

    Example:

    ps -ax > processes.txt
        Use the ps command to get a list of processes running on the system, and store the output in a file named processes.txt 

`` >> ``  - Append output from a command to an existing file on disk.

    Example:

    ps -ax >> processes.txt
        Tack the current process list onto the end of the file processes.txt 
 
`` < ``   - Read a command's input from a disk file, rather than the user. Be careful not to type ">" by mistake, or you'll erase the contents of the file you're trying to read from.


`` | ``   - Pass the output of one command to another for further processing.

    Examples:

    ps -ax | grep Finder
        Use the ps command to get a list of processes running on the system, and pass the list to grep to search for lines containing "Finder". (Usually, it'll find two: the Finder, and the processes executing grep Finder.)

tee   - Used in the middle of a pipeline, this command allows you to both redirect output to a file, and pass it to further commands in the pipeline.

    Examples:

    ps -ax | tee processes.txt | more
        Use the ps command to get a list of processes running on the system, store it in the file processes.txt, and also pass it to more to display it one screen at a time.

Miscellaneous:
==============

man   - display online documentation ("manual pages") for a command.

    Example:

    man ls
        displays detailed documentation on the ls command 

apropos   - list the manual pages relating to a particular keyword.

    Example:

    apropos file
        list manual pages that mention "file" in their summary line. 

find   - Scan a directory structure for files matching certain criteria, and either print their names or do nearly anything else with them. 

    Examples:

    find / -name foo
        Search the entire file structure (including all mounted volumes) for files named exactly "foo", and print their paths.
    find . -mtime -2
        Search the current directory and all subdirectories for files modified within the last 2 days. 

Administration Commands
=======================

kill   - Kill (or send other signals to) a process

    Examples:

    kill 220
        Terminate process #220
    kill -9 220
        Terminate process #220 with extreme prejudice

su   - Set user. Allows you to temporarily become another user (root is the default). It'll ask for that user's password. Use the "exit" command to go back to normal.

    Note:

        You must be a member of the "wheel" group to su to root. Use sudo instead. 

sudo   - Set user and do. Execute a single command as another user (root is the default). It will ask for your password. Access is controlled by a configuration file and can be made quite complex (see the man page). By default, any administrator use sudo to perform any command as any user.

    Examples:

    sudo rm /private/var/db/.AppleSetupDone
        Become root just long enough to delete one file.
