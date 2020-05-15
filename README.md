# repython

Rebuild a [Homebrew]()-based Python dev environment from scratch. Includes:

* Python 3.7
* Python 3.8
* pipenv
* pipx
* virtualenv

Download and run locally or run directly from the web:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jcarbaugh/repython/master/repython.sh)"
```

Once rebuilt, ensure that the pyenv and Homebrew binary locations are on your path:

```
PATH=~/.pyenv/shims/:/usr/local/bin:$PATH
```
