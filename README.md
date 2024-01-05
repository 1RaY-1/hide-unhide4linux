# About
A human readable way to hide or make visible files or directories using terminal.

# Demo
![example](https://user-images.githubusercontent.com/78962948/137342389-5b5ec17e-46b3-4b9c-92ae-8bd9caa97800.gif)

# Installation (via terminal)
* `git clone https://github.com/1RaY-1/hide-unhide4linux.git`
* `cd hide-unhide4linux/`
* `bash install.sh`

# Uninstallation
To uninstall (delete binaries from system), type this command inside hide-unhide4linux directory:
```sudo bash uninstall.sh```

# Usage
### Hide file
`hide ANY_FILE_OR_DIRECTORY`
### Make visible
`unhide ANY_FILE_OR_DIRECTORY`

# How it works
It's simple, 'hide.sh' just adds a dot at the beginning of a file or directory to hide it.

And 'unhide.sh' removes the dot at the beginning of a file or directory to make it visible.

So instead of typing something like: `mv MY_FILE .MY_FILE`

You just need to type: `hide MY_FILE`

And instead of typing: `mv .MY_FILE MY_FILE`

You just need to type: `unhide .MY_FILE`
