;;  रवि मार्च 29 14:17:57 IST 2020




(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)


;; STEP 2
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Stuff from below here has been moved to a separate configuration file in org mode.

;; This line will load the configuration from the configuration.org file
;; and then it will generate configuration.el
(org-babel-load-file (expand-file-name "~/.emacs.d/configuration.org"))



;; DONE by emacs on its own, not hand edited, not touching this for now

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("361f5a2bc2a7d7387b442b2570b0ef35198442b38c2812bf3c70e1e091771d1a" "1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "55c2c0d811cdecd311ebe27f82b24a5410d38c1ff6117c91e5ba88031829ee06" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" default)))
 '(package-selected-packages
   (quote
    (html-check-frag bongo multiple-cursors org-attach-screenshot org-roam org-download markdown-mode buffer-move magit uml-mode gnuplot org-scrum org-srcum bbdb w3m wanderlust dired-subtree all-the-icons-ivy tide prettier-js company centaur-tabs org-bullets expand-region treemacs-projectile treemacs dashboard projectile helm dracula-theme all-the-icons-dired doom-themes which-key use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
