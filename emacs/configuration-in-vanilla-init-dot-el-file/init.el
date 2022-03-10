;; Do not show startup screen
(setq inhibit-startup-message t)

;; Disable tool bar
(tool-bar-mode -1)

;;Disable menu bar
(menu-bar-mode -1)

;; Disable scroll bar
(scroll-bar-mode -1)

;; Highlight current line.
(global-hl-line-mode t)

;; Display line numbers
(global-display-line-numbers-mode t)


;; Add a custom package installation repository
(require 'package)
(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)


;; use a custom file to store additional lines which Emacs generates
;; Do not use `init.el` for `custom-*` code - use `custom-file.el`.
(setq custom-file "~/.emacs.d/custom-file.el")

;; Assuming that the code in custom-file is execute before the code
;; ahead of this line is not a safe assumption. So load this file
;; proactively.
(load-file custom-file)


;; Install use-package if its not there
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))


;; Autocompletion with the package company
(use-package company
  :ensure t
  ;; This is a use-package declaration for the package company.
  ;; In company-active-map, bind C-n to company-select-next and C-p to
  ;; company-select-
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  :config
  ;; After company is loaded, set company-idle-delay to 0.3 and enable company mode everywhere
  (setq company-idle-delay 0.3)
  (global-company-mode t))


;; The awesome magit package
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))



;; Theme selection
(use-package monokai-alt-theme
  :ensure t
  :config
  ;; Load theme at startup
  (load-theme 'monokai-pro-octagon))


;; Recent buffers in a new Emacs session
(use-package recentf
  :ensure t
  :config
  (setq recentf-auto-cleanup 'never
        recentf-max-saved-items 1000
        recentd-save-file (concat user-emacs-directory ".recentf"))
  (recentf-mode t)
  :diminish nil)

;; Display possible completions at all places
(use-package ido-completing-read+
  :ensure t
  :config
  ;; This enables ido in all contexts where it could be useful, not just
  ;; for selecting buffer and file names
  (ido-mode t)
  (ido-everywhere t)
  ;; This allows partial matches, e.g. "uzh" will match "Ustad Zakir Hussain")
  (setq ido-enable-flex-matching t)
  (setq ido-use-filename-at-point nil)
  ;; Includes buffer names of recently opened files, even if they're not open now.
  (setq ido-use-virtual-buffers t)
  :diminish nil)

;; Enhance M-x to allow easier execution of commands
(use-package smex
  :ensure t
  ;; Using counsel-M-x for now. Remove this permanently if counsel-M-x works better.
  :disabled t
  :config
  (setq smex-save-file (concat user-emacs-directory ".smex-items"))
  (smex-initialize)
  :bind ("M-x" . smex))

;; Better handling of paranthesis when writing Lisps.
(use-package paredit
  :ensure t
  :init
  (add-hook 'clojure-mode-hook #'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'scheme-mode-hook #'enable-paredit-mode)
  :config
  (show-paren-mode t)
  :bind (("M-[" . paredit-wrap-square)
         ("M-{" . paredit-wrap-curly))
  :diminish nil)
