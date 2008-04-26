(require 'iswitchb)
(iswitchb-mode)

(defun iswitchb-local-keys ()
  (mapc (lambda (K)
	  (let* ((key (car K)) (fun (cdr K)))
	    (define-key iswitchb-mode-map key fun)))
	'(("<right>" . iswitchb-next-match)
	  ("<left>"  . iswitchb-prev-match)
	  ("<up>"    . ignore             )
	  ("<down>"  . ignore             )
	  ("\C-n"    . iswitchb-next-match)
	  ("\C-p"    . iswitchb-prev-match))))
(add-hook 'iswitchb-define-mode-map-hook 'iswitchb-local-keys)





