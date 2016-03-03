if [[ -a /usr/local/bin/virtualenvwrapper.sh ]]; then
  VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
  export WORKON_HOME=~/.virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
fi

