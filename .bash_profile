if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Source any local files
if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

if [ "$OSTYPE" == "darwin"* ]; then
  . ~/.bash_darwin
fi
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
