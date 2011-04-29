(add-to-list 'load-path "/home/paul7/elisp")

;; Set up the Common Lisp environment
(add-to-list 'load-path "/home/paul7/lisp/cl-closure-template/")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
(require 'slime)
(slime-setup '(slime-fancy slime-asdf))
(require 'closure-template-html-mode)
(setq slime-complete-symbol*-fancy t)
(setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
(setq slime-net-coding-system 'utf-8-unix)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-hook 'repl-mode-hook 
  (lambda ()
    (local-set-key (kbd "<C-tab>") 'slime-indent-and-complete-symbol)))

(add-hook 'lisp-mode-hook 
  (lambda ()
    (local-set-key (kbd "<C-tab>") 'slime-indent-and-complete-symbol)))

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

(require 'w3m-load)
(require 'hyperspec)

(defun hyperspec-lookup (&optional symbol-name)
 (interactive)
 (let ((browse-url-browser-function 'w3m-browse-url))
    (if symbol-name
        (common-lisp-hyperspec symbol-name)
      (call-interactively 'common-lisp-hyperspec))))

(autoload 'imaxima "imaxima" "Frontend of Maxima CAS" t)
(autoload 'imath "imath" "Interactive Math mode" t)
(autoload 'imath-mode "imath" "Interactive Math mode" t)
(setq imaxima-fnt-size "Large") 

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

; Tuareg
(setq inferior-ocaml-program "ocaml+g")
(add-to-list 'load-path "/home/paul7/elisp/tuareg")
(require 'tuareg)
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(autoload 'tuareg-imenu-set-imenu "tuareg-imenu" 
          "Configuration of imenu for tuareg" t) 
(add-hook 'tuareg-interactive-mode-hook
  (lambda ()
    (local-set-key (kbd "C-c h") 'caml-help)
    (local-set-key (kbd "<tab>") 'tuareg-complete)))
(add-hook 'tuareg-mode-hook
  (lambda ()
    (local-set-key (kbd "C-c Tab") 'tuareg-complete)))
