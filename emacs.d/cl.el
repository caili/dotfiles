;(mac-key-mode)

(when (getenv "TERM")
  (remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode))

(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))

(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(delete-selection-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default save-place t)
(setq-default cursor-type 'bar)

;http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(setq stack-trace-on-error t)
;(require 'ecb)

(set-variable 'ffip-limit 2048)
(set-variable 'ffip-patterns '("*.html" "*.css" "*.rb" "*.yml" "*.feature" "*.js" "*.erb" "*.haml" ))
(set-variable 'ffip-find-options "-not -regex \".*vendor.*\" -not -regex \".*node_modules.*\"")


(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))


(add-hook 'html-mode-hook '(lambda () (auto-fill-mode 0)))
(add-hook 'markdown-mode-hook '(lambda () (auto-fill-mode 0)))


(eval-after-load 'js
  '(progn
     ;(define-key js-mode-map "{" 'paredit-open-curly)
     ;(define-key js-mode-map "}" 'paredit-close-curly)
     ;(define-key js-mode-map "'" 'paredit-singlequote)
     ;(add-hook 'js-mode-hook 'esk-paredit-nonlisp)
     (define-key js-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (add-hook 'js-mode-hook 'flymake-mode)
     (setq js-indent-level 2)))
