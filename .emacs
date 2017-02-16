;; PERSO
(add-to-list 'load-path "~/.emacs.d/perso")
(load "functions.el")
(load "bind.el")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(add-hook 'latex-mode-hook 'latex-addon)
(add-hook 'python-mode-hook 'python-add-on)
(add-hook 'lua-mode-hook 'lua-add-on)


;; Markdown
(add-to-list 'load-path "~/.emacs.d/markdown")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(setq-default ispell-program-name "aspell")

;;THEME
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'jbeans t)
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(column-number-mode 1)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq-default fill-column 80)
;;(setq-default show-trailing-whitespace 1)
;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
;; (setq-default zone-timer '(nil 0 5 0 t zone nil idle 0))
(setq indent-line-function 'insert-tab)




;; Automatic split horizontally
(setq split-height-threshold nil)
(setq split-width-threshold 160)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(setq visible-cursor nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

