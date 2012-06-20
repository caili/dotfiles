;(mac-key-mode)

(delete-selection-mode t)

(setq-default save-place t)

(setq-default cursor-type 'bar)

(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)


(add-hook 'html-mode-hook '(lambda () (auto-fill-mode 0)))

(setq js-indent-level 2)
(add-hook 'js-mode-hook 'flymake-mode)
(add-hook 'js-mode-hook '(lambda ()
                           (local-set-key (kbd "RET") 'newline-and-indent)))

;(add-hook 'ruby-mode-hook '(lambda ()
;                             (local-set-key (kbd "RET") 'newline-and-indent)))


(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))


(add-hook 'before-save-hook 'delete-trailing-whitespace)

;(global-linum-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)


                                        ;
;http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)



;;(require 'color-theme)
;;(setq color-theme-is-global t)
;;;(color-theme-hober)



;(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/ecb"))
(setq stack-trace-on-error t)
;(require 'ecb)



;; Scheme
(setq scheme-program-name "heist")
;(setq scheme-program-name "racket")


(set-variable 'ffip-limit 2048)
(set-variable 'ffip-patterns '("*.html" "*.css" "*.rb" "*.yml" "*.feature" "*.js" "*.erb" "*.haml" ))
(set-variable 'ffip-find-options "-not -regex \".*vendor.*\" -not -regex \".*node_modules.*\"")
