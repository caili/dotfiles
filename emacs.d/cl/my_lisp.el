;; http://stackoverflow.com/questions/4551283/what-is-wrong-with-my-emacs-slime-setup-compile-and-load-eval-not-working

;; Common Lisp
(defun slime-common-lisp ()
  (interactive)
  (setq inferior-lisp-program "sbcl")
  (add-to-list 'load-path "~/.emacs.d/vendor/cvs-slime")
  (require 'slime)
  (slime-setup '(slime-repl))
  (slime))

;; Clojure
(defun run-clojure ()
  (interactive)
  (setq inferior-lisp-program "lein repl")
  (inferior-lisp "lein repl"))
(defun slime-clojure ()
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/vendor/elpa-slime")
  (require 'slime)
  (slime-setup '(slime-repl))
  (slime-connect "localhost" 4005))

;; Scheme
(setq scheme-program-name "heist")
;(setq scheme-program-name "racket")
