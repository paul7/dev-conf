(add-to-list 'load-path "/home/paul7/elisp")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq default-input-method "russian-computer")

(require 'git)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(menu-bar-mode -1)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(setq column-number-mode t)
(setq line-number-mode t)

(setq display-time-24hr-format t)
(display-time)
(setq calendar-time-display-form (quote (24-hours ":" minutes (if time-zone " (") time-zone (if time-zone ")"))))
(setq calendar-week-start-day 1)
(setq european-calendar-style t)

(setq initial-scratch-message nil)
;; Text and the such
;; Use colors to highlight commands, etc.
(global-font-lock-mode t)
;; Disable the welcome message
(setq inhibit-startup-message t)
;; Format the title-bar to always include the buffer name
(setq frame-title-format "emacs - %b")
;; Make the mouse wheel scroll Emacs
(mouse-wheel-mode t)
;; Always end a file with a newline
(setq require-final-newline t)
;; Stop emacs from arbitrarily adding lines to the end of a file when the
;; cursor is moved past the end of it:
(setq next-line-add-newlines nil)
;; Flash instead of that annoying bell
(setq visible-bell t)
;; Use y or n instead of yes or not
(fset 'yes-or-no-p 'y-or-n-p)
;; no visible bell
(setq visible-bell nil)

(setq show-paren-delay 0)
(show-paren-mode 1)

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

;(setq cperl-hairy t)
(setq cperl-electric-parens nil)
(setq cperl-electric-keywords t)
(setq cperl-font-lock t)
(setq cperl-lazy-help-time 1)

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

;;; W3M
(require 'w3m-load)

(setq w3m-use-tab t)

(setq browse-url-browser-function 'w3m-browse-url)

;;
(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode] is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))
(global-set-key (kbd "C-`") 'push-mark-no-activate)

(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix argument."
  (interactive)
  (set-mark-command 1))
(global-set-key (kbd "M-`") 'jump-to-mark)

(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
(define-key global-map [remap exchange-point-and-mark] 'exchange-point-and-mark-no-activate)

 (defun ido-goto-symbol (&optional symbol-list)
      "Refresh imenu and jump to a place in the buffer using Ido."
      (interactive)
      (unless (featurep 'imenu)
        (require 'imenu nil t))
      (cond
       ((not symbol-list)
        (let ((ido-mode ido-mode)
              (ido-enable-flex-matching
               (if (boundp 'ido-enable-flex-matching)
                   ido-enable-flex-matching t))
              name-and-pos symbol-names position)
          (unless ido-mode
            (ido-mode 1)
            (setq ido-enable-flex-matching t))
          (while (progn
                   (imenu--cleanup)
                   (setq imenu--index-alist nil)
                   (ido-goto-symbol (imenu--make-index-alist))
                   (setq selected-symbol
                         (ido-completing-read "Symbol? " symbol-names))
                   (string= (car imenu--rescan-item) selected-symbol)))
          (unless (and (boundp 'mark-active) mark-active)
            (push-mark nil t nil))
          (setq position (cdr (assoc selected-symbol name-and-pos)))
          (cond
           ((overlayp position)
            (goto-char (overlay-start position)))
           (t
            (goto-char position)))))
       ((listp symbol-list)
        (dolist (symbol symbol-list)
          (let (name position)
            (cond
             ((and (listp symbol) (imenu--subalist-p symbol))
              (ido-goto-symbol symbol))
             ((listp symbol)
              (setq name (car symbol))
              (setq position (cdr symbol)))
             ((stringp symbol)
              (setq name symbol)
              (setq position
                    (get-text-property 1 'org-imenu-marker symbol))))
            (unless (or (null position) (null name)
                        (string= (car imenu--rescan-item) name))
              (add-to-list 'symbol-names name)
              (add-to-list 'name-and-pos (cons name position))))))))

(global-set-key (kbd "M-i") 'ido-goto-symbol)

(setq eshell-started nil)
(setq w3m-started nil)
(setq slime-started nil)
(setq haskell-started nil)

(defun default-layout ()
  (interactive)
  (unless eshell-started
    (eshell)
    (setq eshell-started t))
  (delete-other-windows)
  (switch-to-buffer "*eshell*")
  (end-of-buffer))

(default-layout)

;;; TRAMP
(require 'tramp)
(setq tramp-default-method "scpc")
(setq tramp-default-user "paul7")

;;; workaround for grep-mode lossage
(autoload 'grep-apply-setting "grep")
(grep-apply-setting 'grep-command "echo; grep -n -e ") 

;; whitespace-mode
(require 'whitespace)
(setq whitespace-style '(face tabs spaces space-mark tab-mark))
(global-set-key "\C-cw" 'whitespace-mode)
(add-hook 'cperl-mode-hook
          (function (lambda ()
                      (whitespace-mode))))
(add-hook 'python-mode-hook
          (function (lambda ()
                      (whitespace-mode))))

;;; LaTeX
(setq latex-run-command "pdflatex")
(defun string-search-and-replace (search replace string)
  "Replace all instances of SEARCH with REPLACE in STRING."
  (replace-regexp-in-string (regexp-quote search) replace string))

(defun tex-pdf-view ()
  "open the pdf after running pdflatex"
  (interactive)
  ;; remove the .tex and add .pdf
  (setq s  (buffer-file-name))
  (setq st (concat s ".pdf"))
  (setq stu (string-search-and-replace ".tex" "" st))
  (tex-send-command (concat "evince " stu)))

(add-hook 'latex-mode-hook
   (lambda ()
     (local-set-key (kbd "C-c C-v") 'tex-pdf-view)))

;;; octave
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;;; temporary shell
(defun tmp-shell ()
  (interactive)
  (let ((shell-buffer-name 
         (concat (buffer-name (current-buffer)) 
                 ":*tmp-shell*")))
    (shell shell-buffer-name)))

;;; server
(server-start)
