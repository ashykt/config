export PATH=$PATH:/Applications/MAMP/Library/bin
export MAMP_PHP=/Applications/MAMP/bin/php/php5.6.10/bin/php
export PATH="$MAMP_PHP:$PATH"
#vim
export EDITOR=/Applications/MacVim.app/Contents/MacOS/mvim
#alias
alias ll="ls -la"
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'


##
# Your previous /Users/ats/.bash_profile file was backed up as /Users/ats/.bash_profile.macports-saved_2015-04-21_at_17:11:53
##

# MacPorts Installer addition on 2015-04-21_at_17:11:53: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# composer
export PATH="~/.composer/vendor/bin:$PATH"
# my script bin
export PATH="~/myscript/sh:$PATH"
# /usr/local/bin
export PATH="/usr/local/bin:$PATH"


