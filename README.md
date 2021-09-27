# hide and unhide command for Linux/Termux
Simple bash scripts (hide.sh and unhide.sh) to hide or make visible files or directories via terminal.

# How it works
It's simple, 'hide.sh' just adds a dot at the beginning of a file/directory to hide it.

And 'unhide.sh' removes the dot at the beginning of a file/directory to make it visible.

So instead of typing something like this (to hide): `mv MY_FILE .MY_FILE`

You just need to type this: `hide MY_FILE`

And instead of typing this (to make visible): `mv .MY_FILE MY_FILE`

You just need to type this: `unhide MY_FILE`

# Installation
* `git clone https://github.com/1RaY-1/hide-unhide.git`
* `cd hide-unhide/`
* `bash install.sh`

# Usage
### Hide file
`hide [FILE_OR_DIRECTORY_TO_HIDE]`
### Make visible
`unhide [FILE_OR_DIRECTORY_TO_MAKE_VISIBLE]`
# Example
![example](https://user-images.githubusercontent.com/78962948/134934364-f33e40cc-c6e8-463e-9a66-e147153706a3.gif)

