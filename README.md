# Emacs Python Demo

## Setup

### One-off

* Install `use-package` in emacs.
* Restarting emacs should then automatically install all other required
  packages.
* Opening a Python file for the first time should trigger elpy to create a
  virtual environment at `~/.emacs.d/elpy/rpc-venv`. You may be prompted to
  automatically install a number of tools into this environment. I prefer to
  decline and install my preferred tools manually with:

  ```
  source ~/.emacs.d/elpy/rpc-venv/bin/activate
  pip install black jedi rope flake8 flake8-isort pylint mypy
  deactivate
  ```

* Install `direnv` - see [instructions][direnv] for your system. Be sure to
  [install the hook][hook] for your shell.

[direnv]: https://direnv.net/docs/installation.html
[hook]: https://direnv.net/docs/hook.html

### Per project

* Create project virtual environment - `python -m venv .venv`
* Create and activate a `.envrc`:

  ```
  cat <<EOF > .envrc
  source .venv/bin/activate
  unset PS1
  EOF
  direnv allow
  ```

  The virtual environment should now be active.
* Install project dependencies:

  ```
  pip install -r requirements.txt
  ```

* Create a `.dir-locals.el` (if relevant), e.g.:

  ```
  cat <<EOF > .dir-locals.el
  ((nil . (
  	 (project-uses-black . t)
  	 (elpy-test-runner . elpy-test-pytest-runner)
           )
        )
   )
  EOF
  ```

## Functionality

* [Standard IDE-like](https://elpy.readthedocs.io/en/latest/ide.html)
  * Auto-completion
  * Auto-formatting
  * Documentation lookup
  * Goto definition/find references
  * Execute code snippets
  * Linting support (with multiple tools)
  * Test execution
  * Debugging
  * Refactoring
* Virtual environment support
  * Automatic activation
  * Switch between multiple active projects
* Project level configuration
  * Environment variables via `.envrc`
  * Emacs configuration via `.dir-locals.el`