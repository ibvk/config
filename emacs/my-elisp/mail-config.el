;;
;;
;; Emacs manual
;;
;;
(setq user-full-name          "BVK Chaitanya"
      user-mail-address       "bayapuneni_chaitanya@symantec.com"

      mail-self-blind         t
      mail-from-style         'angles
      mail-user-agent         'gnus-user-agent

      gnus-init-file          "~/config/emacs/gnus.el"
      gnus-startup-file       "~/Mail/newsrc")


;;
;;
;; Big brother database manual
;;
;;

;; (require 'bbdb)
;; (bbdb-initialize 'gnus 'message)

;; (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;; ;;(bbdb-insinuate-message)

;; (setq bbdb-file               "~/config/emacs/bbdb"
;;       bbdb-use-pop-up         nil)


;;
;;
;; Message manual
;;
;;

(add-hook 'message-send-hook 'my-message-add-content)
(defun my-message-add-content ()
  (message-add-header (concat "Bcc: " user-mail-address)))



;;
;; Sending mail using SMTP server
;;
;; Please read 'Emacs SMTP Library' manual for below stuff; its very small
;;


;; 2. Send mail method for emacs
(setq send-mail-function 'smtpmail-send-it)
(setq message-send-mail-function 'smtpmail-send-it) ;; for gnus use


;; 2. SMTP server details
(setq smtpmail-smtp-server "smtp-pun.corp.symantec.com")
(setq smtpmail-default-smtp-server "localhost")
(setq smtpmail-smtp-service 25)

;; (setq smtpmail-smtp-server "smtp.gmail.com")
;; (setq smtpmail-smtp-service 587)


;; 3. SMTP server requires authentication
(setq smtpmail-auth-credentials '(("localhost" 25 "bvk" nil)
				  ("smtp.gmail.com" 587
				   "bvk.groups@gmail.com" nil)
				  ("smtp-pun.corp.symantec.com" 25
				   "bayapuneni_chaitanya" nil)))


;; 3. TODO - Setup with STARTTLS
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))


;; 4. Queued delivery
(setq smtpmail-queue-mail nil)
(setq smtpmail-queue-dir "~/Mail/queued-mail/")


;; 5. Server workarounds
;;(setq smtpmail-local-domain "symantec.com")
;;(setq smtpmail-sendto-domain "symantec.com")


;; 6. Debugging
(setq smtpmail-debug-info t)
(setq smtpmail-debug-verb t)
