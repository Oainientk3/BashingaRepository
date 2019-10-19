# BashingaRepository
# BashingaRepository
basic logging functionality should not properly be implemented but the code should work with proper variables, though logoutstatus might need to be reworked to an array?

Standard Functionality
The minimal functionality that your solution should be able to demonstrate is:
•a menu or command+argument based front end – 1 - case , read -p (read -p gives user prompt for input) commands
•access a file repository – 2 
•view a list of the files within the repository -2.5 – use pipes with ls to display files in menu; remember that repositories count as files and therefore can have their contents printed (though not with cat?)
•logging a file out of the repository, and back in again – 3 touch file to update
•creation of a log file with updates – 3.5 cat file on log out/log in? Use >> to append a file with extra details i.e. echo logdetails >> log; get user details using $USER; read file to check if a file is still logged out by using [variable]=$(grep log logged_out)
Complete this section by the 9th

Simple Extensions
There are many possible extensions that you could pursue, such as:
•multi-level menus / complex arguments – 1 use select for top menu choices – change repo and file logging
•allowing access to multiple repositories (accessed by name) – 2 – use an array to store the path to the working repository
•being able to edit a text file from within your script – multi-stage menu when selecting a file, that leads into a nano script to open the file?
•some form of validation on what the user inputs e.g. “invalid entry” or “that file was not found” - case statements for ranges of invalid user inputs?
•automatically listing the contents of the file repository currently in use – recursive for/while loop or case setup until a choice that leads to break
•optionally adding user comments into log entries – ask users if they want to make a comment on logging out or logging in a file, and if the variable used to store comments for submission is not empty, adding that message to the log and clearing the variable
•automatically making backup copies of each file which is edited – when logging out copy the file, delete it if there are no differences between it and the original file when the original file is logged back in, copy the backup to a backup folder from the start (either by piping cp | mv or if cp has a directory parameter)

Further Extensions
More advanced extensions could include:
•providing secure access to sets of files, exploiting the user ID and group ID stored by UNIX (you may need to arrange to have several accounts created for you to test this extension) – see lecture 5? - use chmod u+/-/= , g+/-/= , o+/-/= , a+/-/= rwx
•roll back i.e. return to an earlier version of the file(s), either by undoing the edits or by restoring an earlier version of the file(s) – added functionality with copying from backups, would require backups to have timestamps in their names, which should be relatively easy – perhaps use grep to find matching log in comments for user convenience
•a facility to archive a whole project into a TAR or ZIP file (and possibly to access existing archive file) – copy repo into itself and then zip the copy
•integrating other tools into your scripts, for example, to allow you to compile a project from its source code
