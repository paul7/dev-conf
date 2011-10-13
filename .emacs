(add-to-list 'load-path "/home/paul7/elisp")

(setq-default tab-width 4)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Text and the such
;; Use colors to highlight commands, etc.
(global-font-lock-mode t)
;; Disable the welcome message
(setq inhibit-startup-message t)
;; Format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")
;; Display time
(display-time)
;; Make the mouse wheel scroll Emacs
(mouse-wheel-mode t)
;; Always end a file with a newline
(setq require-final-newline t)
;; Stop emacs from arbitrarily adding lines to the end of a file when the
;; cursor is moved past the end of it:
(setq next-line-add-newlines nil)
;; Flash instead of that annoying bell
(setq visible-bell t)
;; Remove icons toolbar
(if (> emacs-major-version 20)
(tool-bar-mode -1))
;; Use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)
;; no visible bell
(setq visible-bell nil)

(setq show-paren-delay 0)
(show-paren-mode 1)

(scroll-bar-mode nil)
(menu-bar-mode nil)

;(autoload 'imaxima "imaxima" "Frontend of Maxima CAS" t)
;(autoload 'imath "imath" "Interactive Math mode" t)
;(autoload 'imath-mode "imath" "Interactive Math mode" t)
;(setq imaxima-fnt-size "Large") 

; (if window-system (progn
; (create-fontset-from-fontset-spec
;  "-lispm-fixed-medium-r-normal-*-13-*-*-*-*-*-fontset-lispm,
;  ascii:-lispm-fixed-medium-r-normal-*-13-*-*-*-*-*-*-*,
;  latin-iso8859-1:-lispm-fixed-medium-r-normal-*-13-*-*-*-*-*-*-*,
;  latin-iso8859-15:-lispm-fixed-medium-r-normal-*-13-*-*-*-*-*-*-*")
;  ;; Now that the fontset has been defined, it can be invoked :
;  (set-default-font "fontset-lispm")
;  ))

(setq th-frame-config-register '0)

(defun th-save-frame-configuration (arg)
  (interactive "P")
  (let ((register (if arg
                      (read-char "Which register? ")
                    th-frame-config-register)))
    (frame-configuration-to-register register)
    (message "Frame configuration saved in register '%c'."
             register)))

(defun th-jump-to-register (arg)
  (interactive "P")
  (let ((register (if arg
                      (read-char "Which register? ")
                    th-frame-config-register)))
    (jump-to-register register)
    (message "Jumped to register '%c'."
             register)))

(global-set-key (kbd "<f11>")
                'th-save-frame-configuration)
(global-set-key (kbd "<f12>")
                'th-jump-to-register)
		
(require 'highlight-symbol)

(global-set-key [(control f5)] 'highlight-symbol-at-point)
(global-set-key [f5] 'highlight-symbol-next)
(global-set-key [(shift f5)] 'highlight-symbol-prev)
(global-set-key [(meta f5)] 'highlight-symbol-prev)

(load-library "hideshow")
(add-hook 'lisp-mode-hook 'hs-minor-mode)

(global-set-key [M-left] 'windmove-left)          ; move to left windnow
(global-set-key [M-right] 'windmove-right)        ; move to right window
(global-set-key [M-up] 'windmove-up)              ; move to upper window
(global-set-key [M-down] 'windmove-down)          ; move to downer window

;; this is somehow broken with -nw
(global-set-key [A-left] 'windmove-left)          ; move to left windnow
(global-set-key [A-right] 'windmove-right)        ; move to right window
(global-set-key [A-up] 'windmove-up)              ; move to upper window
(global-set-key [A-down] 'windmove-down)          ; move to downer window

(defun load-slime ()
  (interactive)
  (load-file "~/.emacs-slime"))

(defun load-tuareg ()
  (interactive)
  (load-file "~/.emacs-tuareg"))

(defun load-haskell ()
  (interactive)
  (load-file "~/.emacs-haskell"))

(defalias 'perl-mode 'cperl-mode)

(setq cperl-hairy t)

(add-hook 'cperl-mode-hook
          (function (lambda ()
		      (setq indent-tabs-mode t))))
(add-hook 'perl-mode-hook
          (function (lambda ()
		      (setq indent-tabs-mode t))))

(setq cperl-indent-level 4)
(setq cperl-continued-statement-offset 0
      cperl-close-paren-offset -4
      cperl-indent-parens-as-block t)

;;; TCL

(setq tcl-application "/usr/bin/tclsh8.5")
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((Syntax . COMMON-LISP) (Package . CL-PPCRE) (Base . 10) (Syntax . ANSI-Common-Lisp)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
