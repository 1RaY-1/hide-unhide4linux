# hide & unhide command for Linux and Termux
![example](https://user-images.githubusercontent.com/78962948/134934364-f33e40cc-c6e8-463e-9a66-e147153706a3.gif)

Simple bash scripts ([hide.sh](https://github.com/1RaY-1/hide-unhide/blob/main/hide.sh) and [unhide.sh](https://github.com/1RaY-1/hide-unhide/blob/main/unhide.sh)) to hide or make visible files or directories via terminal.

# How it works
It's simple, 'hide.sh' just adds a dot at the beginning of a file or directory to hide it.

And 'unhide.sh' removes the dot at the beginning of a file or directory to make it visible.

So instead of typing something like this (to hide): `mv MY_FILE .MY_FILE`

You just need to type this: `hide MY_FILE`

And instead of typing this (to make visible): `mv .MY_FILE MY_FILE`

You just need to type this: `unhide MY_FILE`

# Installation (via terminal)
* `git clone https://github.com/1RaY-1/hide-unhide4linux.git`
* `cd hide-unhide4linux/`
* `bash install.sh`

# Usage
### Hide file
`hide [FILE_OR_DIRECTORY_TO_HIDE]`
### Make visible
`unhide [FILE_OR_DIRECTORY_TO_MAKE_VISIBLE]`
