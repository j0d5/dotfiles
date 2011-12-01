;;
;; Author: Johannes
;; Date: 2011/12/01
;;

;; read in PATH from .bashrc
(if (not (getenv "TERM_PROGRAM"))
  (setenv "PATH"
    (shell-command-to-string "source $HOME/.bashrc && printf $PATH")))


;; disable startup screen
(setq inhibit-startup-message t)

;;to set foreground color to white
(set-foreground-color "white")

;;to set background color to black
(set-background-color "black")

;; highlight current line
(global-hl-line-mode 1)
;; set indent to 2
(setq standard-indent 2)
;; set default no tabs
(setq-default indent-tabs-mode nil)

;; Show line-number in the mode line
(line-number-mode 1)
;; Show column-number in the mode line
(column-number-mode 1)

;; set line wrapping
(setq-default auto-fill-mode 1)
(setq-default fill-column 80)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/")

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;; Anpassungen für AUCTeX
(setq-default TeX-master nil)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; .pdf statt .dvi per default:
(setq TeX-PDF-mode t)

;; activate reftex
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-auctex t)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
