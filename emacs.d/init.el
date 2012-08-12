(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(ack-and-a-half starter-kit starter-kit-ruby starter-kit-eshell ecb_snap redo+ mac-key-mode rinari rspec-mode feature-mode flymake flymake-jshint haml-mode coffee-mode yaml-mode buffer-move clojure-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(unless (getenv "TERM")
  (mac-key-mode)
  (global-set-key (kbd "A-§") 'ns-toggle-fullscreen)
  (global-set-key (kbd "A-=") 'text-scale-increase)
  (global-set-key (kbd "A--") 'text-scale-decrease)
  (global-set-key (kbd "A-0") 'text-scale-adjust))

(require 'buffer-move)
(global-set-key (kbd "C-c <left>")   'buf-move-left)
(global-set-key (kbd "C-c <right>")  'buf-move-right)
(global-set-key (kbd "C-c <up>")     'buf-move-up)
(global-set-key (kbd "C-c <down>")   'buf-move-down)
;; (global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-S-down>")   'buf-move-down)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ack-and-a-half-arguments (quote ("--ignore-dir=vendor" "--ignore-dir=log" "--ignore-dir=node_modules" "--ignore-dir=public/js/libs" "--type-set=haml=.haml" "--type-set=coffee=.coffee")))
 '(ecb-layout-name "left15")
 '(ecb-layout-window-sizes (quote (("left15" (ecb-directories-buffer-name 0.20603015075376885 . 0.660377358490566) (ecb-methods-buffer-name 0.20603015075376885 . 0.32075471698113206)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote ("~/src" "~/.emacs.d" "~")))
 '(ecb-tip-of-the-day nil)
 '(ecb-toggle-layout-sequence (quote ("left9")))
 '(electric-pair-mode t)
 '(global-linum-mode t)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote small) t)
 '(org-support-shift-select t)
 '(recentf-exclude (quote ("framegeometry")))
 '(repository-root-matchers (quote (repository-root-matcher/git)))
 '(shift-select-mode t)
 '(visible-bell nil)
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 110 :width normal :family "Monaco")))))
