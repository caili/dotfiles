;; http://blog.gaz-jones.com/2012/02/01/setting_up_emacs_for_clojure_development.html
;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))



;; ;; Homebrew
;; (push "/usr/local/bin" exec-path)

;; ;; rbenv
;; (setq exec-path (cons "/usr/local/Cellar/rbenv/0.3.0/bin" exec-path))
;; (setenv "PATH" (concat "/usr/local/Cellar/rbenv/0.3.0/bin:" (getenv "PATH")))
;; (setq exec-path (cons "~/.rbenv/shims" exec-path))
;; (setenv "PATH" (concat "~/.rbenv/shims:" (getenv "PATH")))

;; ;; node.js
;; (setq exec-path (cons "/usr/local/Cellar/node/0.6.18/bin" exec-path))
;; (setenv "PATH" (concat "/usr/local/Cellar/node/0.6.18/bin:" (getenv "PATH")))
;; ;(setenv "NODE_PATH" "/usr/local/lib/node_modules")
