(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(better-defaults paredit idle-highlight-mode ido-ubiquitous find-file-in-project magit smex buffer-move ecb ruby-mode rspec-mode feature-mode coffee-mode yaml-mode markdown-mode flymake-jslint flymake-ruby auto-complete undo-tree scss-mode slim-mode cider find-file-in-repository)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;;; undo-redo
(global-undo-tree-mode 1)
(global-set-key (kbd "s-Z") 'undo-tree-redo)


(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
   nil 'fullscreen
   (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(unless (getenv "TERM")
  (global-set-key (kbd "s-<left>") 'move-beginning-of-line)
  (global-set-key (kbd "s-<right>") 'move-end-of-line)
  (global-set-key (kbd "s-§") 'toggle-fullscreen)
  (global-set-key (kbd "s-=") 'text-scale-increase)
  (global-set-key (kbd "s--") 'text-scale-decrease)
  (global-set-key (kbd "s-0") 'text-scale-adjust))

(require 'buffer-move)
(global-set-key (kbd "C-c <left>")   'buf-move-left)
(global-set-key (kbd "C-c <right>")  'buf-move-right)
(global-set-key (kbd "C-c <up>")     'buf-move-up)
(global-set-key (kbd "C-c <down>")   'buf-move-down)
;; (global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-S-down>")   'buf-move-down)

(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode 1))

(setq frame-title-format
      '(buffer-file-name
        "%f"
        (dired-directory dired-directory "%b")))

(global-set-key "\C-xf" 'recentf-open-files)
(global-set-key (kbd "C-c f") 'find-file-in-repository)


(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(delete-selection-mode t)
(setq x-select-enable-primary nil)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default save-place t)
(setq-default cursor-type 'bar)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

(require 'recentf)
(recentf-mode t)

(set-variable 'ffip-limit 2048)
(set-variable 'ffip-patterns '("*.html" "*.css" "*.scss" "*.sass" "*.rb" "*.yml" "*.feature" "*.js" "*.coffee" "*.erb" "*.haml" "*.slim" "*.java"))
(set-variable 'ffip-find-options "-not -regex \".*vendor.*\" -not -regex \".*node_modules.*\"")

; SCSS
(setq scss-compile-at-save nil)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

; disable auto-fill-mode
(add-hook 'html-mode-hook '(lambda () (auto-fill-mode 0)))
(add-hook 'markdown-mode-hook '(lambda () (auto-fill-mode 0)))
(add-hook 'ruby-mode-hook '(lambda () (auto-fill-mode 0)))
(add-hook 'js-mode-hook '(lambda () (auto-fill-mode 0)))
(add-hook 'coffee-mode-hook '(lambda () (auto-fill-mode 0)))
(add-hook 'java-mode-hook '(lambda () (auto-fill-mode 0)))

; cucmber / rspec
;(setq feature-cucumber-command "zeus rake cucumber CUCUMBER_OPTS=\"{options}\" FEATURE=\"{feature}\"")
(setq feature-cucumber-command "spring cucumber \"{feature}\" {options}")
(setq rspec-use-rake-when-possible nil)

(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (if window-system (hl-line-mode t))
  (idle-highlight-mode t))

(add-hook 'java-mode-hook 'my-coding-hook)
(add-hook 'ruby-mode-hook 'my-coding-hook)
(add-hook 'js2-mode-hook 'my-coding-hook)
(add-hook 'coffee-mode-hook 'my-coding-hook)

(eval-after-load 'js
  '(progn
     ;(define-key js-mode-map "{" 'paredit-open-curly)
     ;(define-key js-mode-map "}" 'paredit-close-curly)
     ;(define-key js-mode-map "'" 'paredit-singlequote)
     ;(add-hook 'js-mode-hook 'esk-paredit-nonlisp)
     (add-hook 'js-mode-hook 'flymake-jslint-load)
     (define-key js-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (setq js-indent-level 2)))


;; flymake

;(setq temporary-file-directory "~/.emacs.d/tmp/")
(setq flymake-easy--location "~/.emacs.d/tmp/")


(require 'ruby-mode)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(load "~/.emacs.d/cl/comment-dwim-line.el")
(load "~/.emacs.d/cl/exec_path_fix.el")
(load "~/.emacs.d/cl/framegeometry.el")

;; https://www.ogre.com/node/447
(defun git-grep-prompt ()
  (let* ((default (current-word))
         (prompt (if default
                     (concat "Search for: (default " default ") ")
                   "Search for: "))
         (search (read-from-minibuffer prompt nil nil nil nil default)))
    (if (> (length search) 0)
        search
      (or default ""))))

(when (require 'vc-git nil t)
  (defun git-grep (search)
    "git-grep the entire current repo"
    (interactive (list (git-grep-prompt)))
    (setq default-directory (vc-git-root default-directory))
    (grep-find (concat "git --no-pager grep -n "
                       (shell-quote-argument search)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(ecb-layout-name "left13")
 '(ecb-layout-window-sizes
   (quote
    (("left13"
      (ecb-directories-buffer-name 0.1111111111111111 . 0.9891304347826086))
     ("left15"
      (ecb-directories-buffer-name 0.18 . 0.7169811320754716)
      (ecb-methods-buffer-name 0.18 . 0.2641509433962264)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote ("~/src" "~/.emacs.d" "~")))
 '(ecb-tip-of-the-day nil)
 '(global-linum-mode t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote small) t)
 '(org-support-shift-select t)
 '(recentf-exclude (quote ("framegeometry")))
 '(repository-root-matchers (quote (repository-root-matcher/git)))
 '(ring-bell-function (quote ignore))
 '(shift-select-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(visible-bell nil)
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :width normal :family "Monaco")))))
