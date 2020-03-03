# UNIX Cheatsheet

### Directory
  - A *folder* on your computer which contains files. UNIX filesystems are organized as hierarchical directories. 
  - Forward slashes divide levels in the nested hierarchy of directories, e.g. `/top_level_directory/second_level_directory`
  - The directory at the top of this hierarchy is called the **root** directory and is denoted simply as `/`. 

### Path
  - The *address* to a directory or file on your computer. There are, generally, two types of paths:
    - **Absolute/full path** represents the path of a given directory/file beginning at the root directory.
    - **Relative path** represents the path of a given directory/file relative to the working/current directory.

  - For example, say you have a file "my\_favorite\_file.txt" located in the directory `/Users/myname/Desktop/my_directory`.
    - The **full path** to this file  is `/Users/myname/Desktop/my_directory/my_favorite_file.txt`.  
    - The **relative path** to this file depends on where you are on the computer. 
     - If you are calling this file from Desktop, the relative path would be `my_directory/my_favorite_file.txt`
     - If you are in `/Users/myname/`, the relative path becomes `Desktop/my_directory/my_favorite_file.txt`.
    
   Remember - Whenever you call the full path, you can reach the file from anywhere on your computer. Relative paths will change based on your current location.


## Basic command line

Command | Description 
-------|--------------
`cd` | **C**hange **d**irectory
`ls` | **L**i**s**t files and directories in current directory.
`pwd` | Display the path of the current directory (aka **p**rint **w**orking **d**irectory)
`rm` | **R**e**m**ove a file or directory (use `rm -r`). **Warning: This is permanent.**
`cp` | **C**o**p**y a file or directory (original file remains)
`mv` | **M**o**v**e or rename a file or directory (original file is changed)
`touch` | Create an empty file.
`mkdir` | Create a new directory (aka **m**a**k**e **dir**ectory)
`echo` | Print text to STDOUT.
`cat` | Display contents of a file (aka con**cat**enate)
`more` | Display contents of a file, starting at the top and letting the user scroll down.
`less` | Display contents of a file in an even more interactive way, because *less is more*
`head` | Display the first part of a file.
`tail` | Display the last part of a file.
`man` | Display documentation about a command (aka **man**ual)
`clear` | **Clear** screen (simply scroll up for past commands). Can also use Ctrl + L 

## Slightly more advanced command line

Command | Description 
-------|--------------
`history`| View history of recent past commands
`sudo` | **S**uper **U**ser **do** (pronouced "soo-doe"). [Explanatory XKCD](https://xkcd.com/149/).
`wc`   | Count the number of characters, words, and/or lines in a file (aka **w**ord **c**ount)
`grep` | **g**lobal **r**egular <br> **e**xpression **p**arser
`sort` | Sort contents of file
`uniq` | Save only unique lines in file; *must be sorted first*
`cut` | Select column(s) (i.e. csv or tab-delimited) from a file. <br>Use argument `-f` to specify which field(s) to retain and `-d` to specify the specific delimiter

## Shortcuts and symbols

Shortcut/symbol | Description
----------|-----
`Ctrl + C` | Kills current process/command
`*` | wildcard character
`tab` (tab key) | autocomplete word
`↑` (up arrow)| scroll back through previous commands
`.` | Current directory
`..` | One directory level up 
`~` | Home directory
`>` | Redirect stdout to a file, *overwriting* file if it already exists
`>>` | Redirect stdout to a file, *appending* to the end of file if it already exists
`|` | Pipe: redirects stdout to become stdin for next command
