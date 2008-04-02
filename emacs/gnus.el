(setq imap-debug "*imap-debug*")
(setq imap-log "*imap-log*")


;;
;; 1.1 Set news & mail-backends
;;
(setq gnus-select-method '(nntp "news.vxindia.veritas.com"))
(add-to-list 'gnus-secondary-select-methods '(nnfolder ""))

(add-to-list 'gnus-secondary-select-methods
	     '(nnimap "symantec" 
		      (nnimap-list-pattern ("*"))
		      (nnimap-user "bayapuneni_chaitanya")
		      (nnimap-address "punaxchevspin03.enterprise.veritas.com")
		      (nnimap-server-port 143)))

(add-to-list 'gnus-secondary-select-methods
	     '(nnfolder "sent"
			(nnfolder-directory "~/Mail/sent")
			(nnfolder-active-file "~/Mail/sent/active")
			(nnfolder-inhibit-expiry t)
			(nnfolder-get-new-mail nil)))

;;
;; 6.3.4.4 Set mail-sources
;;
(setq mail-sources '((file)
;; 		     (imap :server "imap-itp.veritas.com"
;; 			   :port 143
;; 			   :user "bayapuneni_chaitanya")
;; 		     (pop :server "pop.gmail.com"
;; 			  :port 10995
;; 			  :connection ssl
;; 			  :leave t
;; 			  :user "bvkchaitanya")
;; 		     (pop :server "localhost"
;; 			  :port 10995
;; 			  :connection ssl
;; 			  :leave t
;; 			  :user "bvk.groups")
;; 		     (pop :server "localhost"
;; 			  :port 2000
;; 			  :leave t
;; 			  :user "i_chaitu@yahoo.com")
		     ))
;;
;; 6.3.3 Splitting Mail
;;
(setq
 nnmail-crosspost     nil
 nnmail-split-methods '(("list.\\1"       "^List-Post:.*mailto:\\(.*\\)@.*")
			("list.gnus"      "List-ID:.*ding\\.gnus\\.org")

			("mail.gmail"     "To:.*bvk\\.?chaitanya@gmail\\.com")
			("mail.groups"    "To:.*bvk\\.groups@gmail\\.com")
			("mail.yahoo"     "To:.*i_chaitu@yahoo\\.com")
			("mail.yahoo"     "To:.*bvk\\.chaitanya@yahoo\\.com")

			("mail.veritas"   "@.*symantec\\.com")
			("mail.veritas"   "@.*veritas\\.com")

			("mail.misc"      "*")))

;;
;; Line formatting variables
;;

;; support functions in line formats
(defun gnus-user-format-function-g (dummy)
  "Returns current group name in really short format."
  (car (last (split-string (gnus-short-group-name gnus-tmp-group) ":"))))

(defun gnus-user-format-function-a (dummy)
  "Gives to-address group property." 
  (let ((a (gnus-group-find-parameter gnus-tmp-group 'to-address t)))
    (if a (concat "<" a ">") "")))

(setq
 ;; ???
 gnus-face-0                    'default

 ;; 2.1.1 Group buffer line format
 gnus-group-line-format         "%*%p%-25,25ug%{%6N %ua%} %-65=Level %L\n"

 ;; 3.1.1 Summary line format
 gnus-summary-line-format       "%*%R%1U %1B %s %-50= |%-20,20f |%&user-date;\n"

 ;; 3.9.1.1 Create dummy root for loose threads
 gnus-summary-dummy-line-format "   ? %S %-50= | ? %-73=| ? \n"
)

;;
;; Other variables
;;
(setq
 ;; 1.6.2 Make new newsgroups as zombies
 gnus-subscribe-newsgroup-method        'gnus-subscribe-zombies

 ;; 1.8 Ignore .newsrc file completely
 gnus-read-newsrc-file                  nil

 ;; 1.8 Custom newsgroup startup file
 gnus-startup-file                      (expand-file-name "~/Mail/newsrc")

 ;; 1.8 Always backup startup file
 gnus-backup-startup-file               t

 ;; 1.9 Always read dribble file after crash
 gnus-always-read-dribble-file          t

 ;; 2.2 Don't jump to unread group, step one-by-one
 gnus-group-goto-unread                 nil

 ;; 2.3 Don't ask about large groups
 gnus-large-newsgroup                   nil

 ;; 2.3 Don't autoselect first unread message
 gnus-auto-select-first                 nil

 ;; 2.10 Add automatic to-list group parameter
 gnus-add-to-list                       t

 ;; 2.10 Set some group parameters manually
 gnus-parameters                        '(("^nnimap:.*$" (to-group . "\\1"))
					  ("list\\..*"   (broken-reply-to . t)))

 ;; 3.1 Extract From address quickly
 gnus-extract-address-components        'mail-extract-address-components

 ;; 3.1.1 Thread line-drawing characters
 gnus-sum-thread-tree-root              "*"
 gnus-sum-thread-tree-false-root        "*"
 gnus-sum-thread-tree-indent            " "
 gnus-sum-thread-tree-single-indent     ""
 gnus-sum-thread-tree-vertical          "|"
 gnus-sum-thread-tree-leaf-with-other   "|->"
 gnus-sum-thread-tree-single-leaf       "'->"

 ;; 3.1.4 Highlight summary lines
 ;; gnus-summary-highlight                 '(((eq mark gnus-ticked-mark) . bold))

 ;; 3.2 Don't autoselect next group summary
 ;; gnus-auto-select-next                  nil

 ;; 3.3.2 Don't mark articles automatically
 gnus-mark-article-hook                 nil

 ;; 3.7.4 Don't jump, go one-by-one
 ;; gnus-summary-goto-unread               'never

 ;; 3.9.1.1 Create dummy root for loose threads
 gnus-summary-make-false-root           'dummy

 ;; 3.9.1.1 Gather threads by references
 gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references

 ;; 3.9.1.2 Fetch old thread articles
 gnus-fetch-old-headers                 'some

 ;; 3.10 Sorting the summary buffer
 gnus-thread-sort-functions             '(gnus-thread-sort-by-number
					  gnus-thread-sort-by-date)

 ;; 3.11 Don't do asynchronous article fetching
 gnus-asynchronous                      nil

 ;; 3.13 Use selective (persistent) caching only
 gnus-use-cache                         t
 gnus-cache-enter-articles              '(read unread ticked dormant)
 gnus-cache-remove-articles             nil
 gnus-cacheable-groups                  "^\\(nnimap\\)"
 gnus-uncacheable-groups                "^\\(nnml\\|nnfolder\\)"

 ;; 3.15 Ask once for each save
 gnus-prompt-before-saving              t

 ;; 3.15 Save only important headers
 gnus-save-all-headers                  nil

 ;; 3.15 Article saving method
 gnus-default-article-saver             'gnus-summary-save-in-file

 ;; 3.15 Article save directory
 gnus-article-save-directory            (expand-file-name "~/Mail/articles")

 ;; 3.15 Use long file names when saving articles
 gnus-use-long-file-name                t

 ;; 4.1 Hide useless headers
 gnus-visible-headers                   '("^From" "^Subject" "^Date" "^To" "^CC")

 ;; 4.3 Article washing
 gnus-treat-strip-leading-blank-lines   t
 gnus-treat-strip-trailing-blank-lines  t
 gnus-treat-emphasize                   t
 gnus-treat-strip-banner                t
 gnus-treat-strip-signature             t
 ;; gnus-sum-thread-tree-root            "\u25cf"             ; ●
 ;; gnus-sum-thread-tree-false-root      "\u25ef"             ; ◯
 ;; gnus-sum-thread-tree-vertical        "\u2502"             ; │
 ;; gnus-sum-thread-tree-leaf-with-other "\u251c\u2500\u25ba" ; ├─►
 ;; gnus-sum-thread-tree-single-leaf     "\u2514\u2500\u25ba" ; └─►
 ;; gnus-sum-thread-tree-single-indent   " "

 ;; 5.1 confirm mail and news reply methods
 gnus-confirm-mail-reply-to-news        t
 gnus-confirm-treat-mail-like-news      t

 ;; 5.3 Mailing-lists regular expressions
 gnus-mailing-list-groups               "list\\..*"

 ;; 5.3 User-agent tag
 gnus-user-agent                        '(gnus)

 ;; 5.4 Archive messages i send
 gnus-message-archive-method            '(nnfolder 
					  "sent"
					  (nnfolder-directory "~/Mail/sent")
					  (nnfolder-active-file "~/Mail/sent/active")
					  (nnfolder-inhibit-expiry t)
					  (nnfolder-get-new-mail nil))

 ;; 5.4 Message archive group, one-per-month (TODO)
 gnus-message-archive-group             nil

 ;; 5.4 Mark outgoing mails as read; keep attachments
 gnus-gcc-mark-as-read                  t
 gnus-gcc-externalize-attachments       nil

 ;; 5.5 Custom posting style TODO
 gnus-posting-style                     '((".*"
					   name "BVK Chaitanya"))

 ;; 5.6 Save drafts in mail-directories
 nndraft-directory                      "~/Mail/drafts"

 ;; 6.3.4.3 Mail source handling
 mail-source-crash-box                  "~/Mail/crash-box"
 mail-source-delete-incoming            t

 ;; 6.3.9 
 nnmail-expiry-target                   "nnfolder:expired"

















 ;; 8.2 
 gnus-interactive-exit                  nil

 ;; 8.4.8
 gnus-use-correct-string-widths         t






)

;;
;; 3.7.5 Use custom summary-buffer keymap 
;;
(add-hook 'gnus-summary-mode-hook 'my-alter-summary-map)
(defun my-alter-summary-map ()
  (local-set-key "!" 'gnus-summary-put-mark-as-ticked-next))

;;
;; 3.26
;; 
;; (add-hook 'gnus-summary-prepared-hook 'my-summary-hook)
;; (defun my-summary-hook ()
;;   (let ((to-address (gnus-group-find-parameter gnus-newsgroup-name 'to-address t)))
;;     (if to-address nil
;;       (gnus-summary-first-article))
;;     (message "no to-address specified")))



;;
;; Window settings
;;
(setq 
 gnus-use-full-window            nil    ; Dont chanage window layout
 gnus-always-force-window-configuration t  ; Use custom window layout always
)

;;
;; Three pane layout, group-buffer on left, summary buffer on top
;; and article buffer on bottom-right
;;
;; (gnus-add-configuration
;;  '(group (horizontal 1.0
;; 		     (vertical 30 (group 1.0 point))
;; 		     (vertical 1.0
;; 			       (summary 0.25)
;; 			       (article 1.0)))))
;; (gnus-add-configuration
;;  '(summary (horizontal 1.0
;; 		       (vertical 30 (group 1.0))
;; 		       (vertical 1.0
;; 				 (summary 0.25 point)
;; 				 (article 1.0)))))
;; (gnus-add-configuration
;;  '(article (horizontal 1.0
;; 		       (vertical 30 (group 1.0))
;; 		       (vertical 1.0
;; 				 (summary 0.25 point)
;; 				 (article 1.0)))))
;; (gnus-add-configuration
;;  '(message (horizontal 1.0
;; 		       (vertical 30 (group 1.0))
;; 		       (vertical 1.0
;; 				 (summary 0.25)
;; 				 (message 1.0 point)))))
;; (gnus-add-configuration
;;  '(reply (horizontal 1.0
;; 		       (vertical 30 (group 1.0))
;; 		       (vertical 1.0
;; 				 (summary 0.25)
;; 				 (message 1.0 point)))))
;; (gnus-add-configuration
;;  '(reply-yank (horizontal 1.0
;; 		       (vertical 30 (group 1.0))
;; 		       (vertical 1.0
;; 				 (summary 0.25)
;; 				 (message 1.0 point)))))
;; (gnus-add-configuration
;;  '(post (horizontal 1.0
;; 		       (vertical 30 (group 1.0))
;; 		       (vertical 1.0
;; 				 (summary 0.25)
;; 				 (post 1.0 point)))))
;; (gnus-add-configuration
;;  '(forward (horizontal 1.0
;; 		       (vertical 30 (group 1.0))
;; 		       (vertical 1.0
;; 				 (summary 0.25)
;; 				 (message 1.0 point)))))

;;
;; Single window layout
;;
;; (gnus-add-configuration
;;  '(group (horizontal 1.0 (vertical 1.0 (group 1.0 point)))))
;; (gnus-add-configuration
;;  '(summary (horizontal 1.0 (vertical 1.0 (summary 1.0 point)))))
;; (gnus-add-configuration
;;  '(article (horizontal 1.0 (vertical 1.0 (article 1.0 point)))))
;; (gnus-add-configuration
;;  '(message (horizontal 1.0 (vertical 1.0 (message 1.0 point)))))
;;(gnus-add-configuration
;; '(reply-yank (horizontal 1.0 (vertical 1.0 (reply-yank 1.0 point)))))
;; (gnus-add-configuration
;;  '(post (horizontal 1.0 (vertical 1.0 (post 1.0 point)))))
;; (gnus-add-configuration
;;  '(forward (horizontal 1.0 (vertical 1.0 (forward 1.0 (forward 1.0 point))))))


;;
;; Some GNUS specific keybindings
;;
;; (require 'gnus-art)
;; Let 'q' in article show summary-buffer
;; (define-key gnus-article-mode-map (kbd "q")
;;   (lambda ()
;;     (interactive)
;;     (switch-to-buffer gnus-summary-buffer)))
;; Let 'd' stand for delete article
;; (define-key gnus-summary-mode-map  (kbd "d")
;;   'gnus-summary-mark-as-expirable)



;;
;; Scan for mails for every 30 mins if idle
;;
(gnus-demon-add-handler 'gnus-demon-scan-mail 5 1)



;;
;;
;; Below section numbers refer to MESSAGE mannual
;;
;;

(setq

 ;; 1.4 Confirm wide replies
 message-wide-reply-confirm-recipients  t

 ;; 1.8 Use Fwd: prefix for forwards
 message-make-forward-subject-function  'message-forward-subject-fwd
 message-wash-forwarded-subjects        t

 ;; 1.11.1 MFT stuff
 message-subscribed-address-functions   '(gnus-find-subscribed-addresses)



)


