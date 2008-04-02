(require 'redo)
(require 'mac-key-mode)
(mac-key-mode 0)

(setq mac-pass-command-to-system nil)
;; (setq mac-command-modifier       'meta)
(setq mac-option-modifier        'meta)

;;
;; Font handling in mac (from emacswiki)
;;
(defun my-set-mac-font (name size)
  (interactive
   (list (completing-read "font-name: "
			  (mapcar (lambda (n) (list n n))
				  (mapcar (lambda (p) (car p))
					  (x-font-family-list))) nil t)
	 (read-number "size: " 12)))
  (set-face-attribute 'default nil
		      :family name
		      :slant  'normal
		      :weight 'normal
		      :width  'normal
		      :height (* 10 size)))

(setq mac-allow-anti-aliasing nil)
(my-set-mac-font "monaco" 10)

