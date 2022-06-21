# About
Maybe sometimes you wanna hide (or make visible) a file or folder, so I made an easy way to to hide or make visible files or directories via terminal (on Linux and Termux).

# Demo
![example](https://user-images.githubusercontent.com/78962948/137342389-5b5ec17e-46b3-4b9c-92ae-8bd9caa97800.gif)

# Supported Operating Systems
- **Android** (Using the Termux App)
- **Linux** (Any Linux distribution e.g., Ubuntu, Fedora, Kali Linux, etc...)

# Installation (via terminal)
* `git clone https://github.com/1RaY-1/hide-unhide4linux.git`
* `cd hide-unhide4linux/`
* `bash install.sh`

# Usage
### Hide file
`hide ANY_FILE_OR_DIRECTORY`
### Make visible
`unhide ANY_FILE_OR_DIRECTORY`

# How it works
It's simple, 'hide.sh' just adds a dot at the beginning of a file or directory to hide it.

And 'unhide.sh' removes the dot at the beginning of a file or directory to make it visible.

So instead of typing something like (to hide): `mv MY_FILE .MY_FILE`

You just need to type: `hide MY_FILE`

And instead of typing (to make visible): `mv .MY_FILE MY_FILE`

You just need to type: `unhide MY_FILE`
