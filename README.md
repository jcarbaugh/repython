# repython

![repython build](https://github.com/jcarbaugh/repython/workflows/repython%20build/badge.svg)

Rebuild a [Homebrew](https://brew.sh)-based [Python](https://www.python.org) dev environment from scratch. Includes:

* Python 3.7
* Python 3.8
* [pipenv](https://pipenv.pypa.io/en/latest/)
* [pipx](https://pipxproject.github.io/pipx/)
* [virtualenv](https://virtualenv.pypa.io/en/latest/)

Download and run locally or run directly from the web:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/jcarbaugh/repython/master/repython.sh)"
```

Once rebuilt, ensure that the pipx, pyenv, and Homebrew binary locations are on your path:

```
PATH=~/.local/bin:~/.pyenv/shims:/usr/local/bin:$PATH
```
