env=$(hostname | cut -d. -f 4)
if [[ ${EUID} == 0 ]] ; then
  export PROMPT_COMMAND="export PS1='\[\033[01;31m\]${env}-\[\033[01;31m\]\h\[\033[01;34m\] \W #\[\033[00m\] '"
else
  export PROMPT_COMMAND="export PS1='\[\033[01;32m\]\u@\[\033[01;32m\]${env}-\h\[\033[01;34m\] \w \$\[\033[00m\] '"
fi
