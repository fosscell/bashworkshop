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

    ls
        list just the names of the files in the current directory
    ls -l
        (long) list the files with their characteristics (size, privs, owner, etc)
    ls -a
        list all files in the current directory (including those that would normally be invisible)
    ls *.jpg
        list the names of all files with names ending in ".jpg"
    ls a*
        list the names of all files with names beginning with "a"
    ls *att*
        list the names of all files with names containing "att" 
        
Manipulating Files and Folders:
===============================

cp   - Copy a file (or directory).

    Examples:

    cp foo bar
        copy a file named "foo" (in the current directory); name the copy "bar"
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

chmod   - Change protection mode on files and folders. It's rather complex, so read the man page before using. You must own the files (or be root) to change their protections.

    Examples:

    chmod u+w foo
        Allow the user (file owner) write access to the file or folder named "foo"
    chmod u-r foo
        Disallow the user (file owner) read access to "foo"
    chmod ug+x foo
        Allow the user (file owner) and group members execute access to "foo"
    chmod o+rX *
        Allow "other"s read and maybe execute access to all files in the current directory. The capital "X" tells chmod to use a complicated set of rules for setting execute access only where it's appropriate; it generally works fairly well.
    chmod o-rwx ~/Public
        Disallow "other"s (mainly guests) from accessing your Public directory 

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
    grep diskarbitrationd /var/log/system.log
        search the main system log for entries that mention the disk arbitration daemon.
    ps -ax | grep netinfod
        use the ps command to generate a list of processes running on the system, then pipe the list through grep, which will print only those lines containing "netinfod". Note: this will list all runing netinfod processes, and also list the process running grep itself. 

vi and emacs   - other text editors provided with the standard OS X installation. They're both more powerful than pico, but also a lot harder to figure out if you aren't already familiar with them.

tail   - print the last few lines of a text file. This is mainly useful for examining the last (i.e. most recent) entries in things like log files.

    Examples:

    tail /var/log/system.log
        print the last screenful of entries from the main system log.
    tail -1000 /var/log/system.log | more
        print the last 1000 entries from the main system log, using more to display them one screenful at a time.
