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
(setq-default TeX-master nil)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; .pdf statt .dvi per default:
(setq TeX-PDF-mode t)
