;;
;; Author: Johannes
;; Date: 2011/11/30
;;

;; disable startup screen
(setq inhibit-startup-message t)

;;to set foreground color to white
(set-foreground-color "white")

;;to set background color to black
(set-background-color "black")

;;; Anpassungen für AUCTeX

;;For Auctex < 11.82 exchange ";;" in the following 2 lines
;;(require ’tex-site)
(setq-default TeX-master nil)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t) ;; .pdf statt .dvi per default:

;;Zeilenumbruch
(add-hook ’LaTeX-mode-hook ’turn-on-auto-fill)
;;Syntax Higlight
(add-hook ’LaTeX-mode-hook ’turn-on-font-lock)
;; Mathe Modus
(add-hook ’LaTeX-mode-hook ’LaTeX-math-mode)
;; Reftex einflechten und laden
(setq reftex-plug-into-AUCTeX t)
(add-hook ’LaTeX-mode-hook ’turn-on-reftex) ;;Satzende"."statt". "."fu ̈rM-k:lo ̈schenbisSatzendeusw. (setq sentence-end "[.?!][]\"’)}]*\\($\\| \\| \\)[
;;]*") ;; Da ist ein "Newline in der Zeile!"
(setq sentence-end-double-space nil)
;;direkte Rechtschreib Korrektur:
;;(add-hook ’LaTeX-mode-hook ’flyspell-mode)
;; Nur benutzen falls Auctex > 11.81 mit preview-latex:
(load "preview-latex.el" nil t t)
;; aspell ist besser als ispell.
;; Zeile kommentieren, falls nicht installiert:
(setq-default ispell-program-name "aspell")
;; Deutsche Rechtschreibung falls \usepackage{ngerman}
;; oder german benutzt wird
(add-hook ’TeX-language-de-hook
  (function (lambda () (ispell-change-dictionary "german8"))))