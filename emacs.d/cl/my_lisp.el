;; Clojure
(defun run-clojure ()
  (interactive)
  (setq inferior-lisp-program "lein repl")
  (inferior-lisp "lein repl"))

;; Scheme
;(setq scheme-program-name "heist")
;(setq scheme-program-name "racket")
