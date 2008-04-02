(require 'tramp)

(setq tramp-default-method "ssh")

;; cache passwords for one day
(setq password-cache-expiry (* 24 60 60))