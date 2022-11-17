#!/bin/bash

#
# Remove and reinstall all the Python stuff.
#
# After installation completes, ensure that the binary
# locations are on your $PATH in .zshrc:
#     PATH=~/.pyenv/shims/:/usr/local/bin:$PATH
#

############################## Let's go! ##############################

#
# remove all traces of Python
#

if [ -f /usr/local/bin/pyenv ]; then
  for v in `pyenv versions --bare`; do
    pyenv uninstall -f $v
  done
fi

brew uninstall --force pipx
brew uninstall --force pipenv
brew uninstall --force pyenv
brew uninstall --force --ignore-dependencies python@3.9
brew uninstall --force --ignore-dependencies python@3.8
brew uninstall --force --ignore-dependencies python@3.7
brew uninstall --force --ignore-dependencies python
brew uninstall --force --ignore-dependencies python2
brew uninstall --force --ignore-dependencies python3

bins=('easy_install' 'pew' 'pip' 'pip2' 'pip3' 'pipenv' 'pipx'
      'python' 'python-build' 'python-config' 'python2*' 'python3*'
      'virtualenv' 'virtualenv-clone' 'virtualenvwrapper.sh'
      'register-python-argcomplete')
for b in "${bins[@]}"; do
  rm -f /usr/local/bin/$b
  rm -f /usr/local/opt/python/libexec/bin
done

rm -rf /usr/local/lib/python2*
rm -rf /usr/local/lib/python3*
rm -rf /usr/local/opt/python*

test -d $HOME/.virtualenvs && rm -rf $HOME/.virtualenvs
test -d $HOME/.local && rm -rf $HOME/.local && mkdir $HOME/.local


#
# put Python 3 back on
#

brew install python@3.10

test ! -f /usr/local/bin/python && ln -s /usr/local/bin/python3 /usr/local/bin/python
test ! -f /usr/local/bin/pip && ln -s /usr/local/bin/pip3 /usr/local/bin/pip

# install pip-related tools
brew install pipenv
brew install pipx

# install pyenv Python
PYVERSION=`/usr/local/bin/python -c "import platform; print(platform.python_version())"`
brew install pyenv
pyenv install $PYVERSION
pyenv global $PYVERSION

# virtualenv
pip3 install virtualenv
