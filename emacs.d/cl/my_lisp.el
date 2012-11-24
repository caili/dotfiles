;; Clojure
(defun run-clojure ()
  (interactive)
  (setq inferior-lisp-program "lein repl")
  (inferior-lisp "lein repl"))

;; Scheme
;(setq scheme-program-name "heist")
;(setq scheme-program-name "racket")


;; auto complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-delay 0.5) ;; eclipse uses 500ms

;; configure auto complete to work in slime
(add-to-list 'load-path "~/.emacs.d/ac-slime")
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
