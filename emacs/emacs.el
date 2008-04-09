;; .emacs


(add-to-list 'load-path                 "~/config/emacs/lisp")
(add-to-list 'load-path                 "~/config/emacs/my-elisp")


;;
;; Customizations
;;
(setq debug-on-error                    t

      backup-by-copying                 t
      make-backup-files                 nil

      temp-buffer-resize-mode           t
      even-window-heights               nil
      mouse-avoidance-mode              t
      scroll-step                       1
      x-stretch-cursor                  t
      frame-title-format                (concat "%b - "
						(user-login-name)
						"@"
						(system-name))

      icomplete-mode                    t
      require-final-newline             nil

      password-cache-expiry             nil

      show-trailing-whitespace          t
)

(show-paren-mode 1)
(global-font-lock-mode 1)
(column-number-mode 1)
(transient-mark-mode 1)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(menu-bar-mode 0)

(load "~/config/emacs/my-uniquify.el")
(load "~/config/emacs/my-iswitchb.el")
(load "~/config/emacs/bvk.el")
(load "~/config/emacs/tramp.el")
(load "~/config/emacs/my-elisp/mail-config.el")

;;
;; use lucidatypewriter font
;;
;; (setq default-frame-alist
;;       '((font . "-*-lucidatypewriter-medium-*-*-*-12-*-*-*-*-*-*-*")))
;; (setq default-frame-alist               '((font . "fixed")))

(if (eq window-system 'mac)
    (load "~/config/emacs/mac.el")
  (load "~/config/emacs/x11.el"))

;;
;; cscope for emacs
;;
(require 'xcscope)

(defun my-cscope-select-entry-same-window ()
  (interactive)
  (cscope-select-entry-specified-window (selected-window)))
(define-key cscope-list-entry-keymap "o" 'my-cscope-select-entry-same-window)

;;
;; Adaptive fill mode
;;
(setq adaptive-fill-regexp "[ 	]*\\([-!|#%;>*·•‣⁃◦0123456789]+.?[ 	]*\\)*")

;;
;; Load column-marker package
;;
(require 'column-marker)

(defun my-c-mode-hook ()
  (c-set-style     "bsd")
  (column-marker-1 72)
  (column-marker-2 80)
  (local-set-key [return] 'newline-and-indent))


;;
;; Hooks
;;
(add-hook 'c-mode-hook     'my-c-mode-hook)
(add-hook 'c++-mode-hook   'my-c-mode-hook)
(add-hook 'mail-setup-hook 'mail-abbrevs-setup)

;;
;; Load Collection of Emacs Developement Environment Tools (CEDET)
;;
;; (load-file "~/etc/emacs/cedet-1.0pre3/common/cedet.el")

;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;; Select one of the following
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; Enable this if you develop in semantic, or develop grammars
;; (semantic-load-enable-semantic-debugging-helpers)

;;
;; Load Emacs Code Browser (ECB)
;;
;; (add-to-list 'load-path "~/etc/emacs/ecb-2.32")
;; (require 'ecb)

;;
;; Rectangle Region Marking
;;
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

;;
;; Disable C-d in shell buffers
;;
(add-hook 'comint-mode-hook (lambda ()
			      (define-key comint-mode-map "\C-d" nil)))


;;
;; Org-mode
;;
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(global-font-lock-mode 1)
