# Atom intelligent Erlang Autocompletion for Autocomplete+

## Features
- Intelligent autocompletion of
  - Global modules and functions
  - Local project modules and functions (those which compile successfully)
- Type hints for
  - Arguments
  - Return types
- Type aliases replaced with primitive structures they represent
- Snippets for common structures

## Installation
Installation is done using Atom package manager or command

    apm install autocomplete-erlang

CAUTION: MAKE SURE TO HAVE `autocomplete-plus` PACKAGE INSTALLED


### Common Errors

#### Package spits out a lot of errors on my OSX
  It seems that OSX has a lot of different safe measures which don't cooperate nicely with atom environment.  
  For optimal behaviour always start atom from commandline instead of Finder.
  
#### `Failed to spawn command elixir. Make sure elixir is installed and in your PATH`  
  Let me guess. You're using OSX. This happens when starting atom from Finder.
  Finder-started applications have no access to PATH variable. To go around that make
  sure to set "Elixir Path" in package configuration to Your absolute elixir executable
  path or start atom from command line instead.


### Required modules
- [autocomplete+](https://atom.io/packages/autocomplete-plus)
- [autocomplete-snippets](https://atom.io/packages/autocomplete-snippets)

