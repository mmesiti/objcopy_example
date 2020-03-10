# Objcopy example

This is an example where we have some source files (e.g., `lib.c`) that we want
to compile multiple times with, e.g., differently defined quantities (e.g. the
`ASTRING` macro), to get multiple versions of the functions contained in the 
file (i.e. the `void print_something(void)` function). 
We want of course to use all the versions of the function in our main program 
(e.g., `main.c`), but for this we need to *redefine* the symbols in the object 
files, lest we have a name clash. This is what `objcopy` helps us to do.

## Disclaimer

The code contained in this repo may not represent best practices and is work
(and learning) in progress.
