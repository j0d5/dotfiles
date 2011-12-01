;;
;; Author: Johannes
;; Date: 2011/11/30
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

(add-to-list 'load-path "/usr/share/emacs/site-lisp/")

;; add tex-path
(setq exec-path (append exec-path '("/usr/texbin/")))
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
