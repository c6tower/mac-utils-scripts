# PS1: prompt string
# %DT%*: date and time
# %1~: current directory (shortened)
# %#: prompt symbol
export PS1="%DT%* %1~ %# "

# prevent overwriting files
set -o noclobber

# (optional) exec shell script when terminal is opened
# script path is just an example
sh ~/daily-dict-updater/wakeup.shell
