# Alternativates

## To Elpy


* See <https://www.emacswiki.org/emacs/PythonProgrammingInEmacs#toc3>
* [Language Server Protocol Mode][lsp] - see also [cc-a/lsp-mode-demo][demo]. A
  good generalist mode for multiple languages but not as fully featured.
* [Anaconda mode][]. Less fully featured but with explicit support for running
  in containers, via Tramp etc.

[lsp]: https://github.com/emacs-lsp/lsp-mode
[demo]: https://github.com/cc-a/lsp-mode-demo
[anaconda mode]: https://github.com/pythonic-emacs/anaconda-mode

## To direnv

* [auto-virtualenv](https://github.com/marcwebbie/auto-virtualenv) and [various
  others](https://www.emacswiki.org/emacs/PythonProgrammingInEmacs#toc5)

* poetry/pipenv - These tools let you outsource the management of virtual
  environments. Some extra configuration will be needed. For e.g. Poetry:

  ```
  (setq python-shell-interpreter "poetry")
  (setq python-shell-interpreter-args "run python")
  (elpy-test-pytest-runner-command . ("poetry" "run" "pytest"))
  ```
