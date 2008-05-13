
;;
;; Fixes for backspace not working in ssh modes
;;
(global-set-key "\e[3~" 'delete-backward-char)
