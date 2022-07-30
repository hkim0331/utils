#!/bin/sh
#
# origin: ${utils}/kill-emacs
#

brew services stop emacs

#emacsclient -e '(progn (defun yes-or-no-p (p) t) (kill-emacs))'
