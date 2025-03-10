;; (setq package-enable-at-startup nil)
;; (setq elpaca-ignored-dependencies '(dash))
;; (defvar elpaca-installer-version 0.10)
;; (defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
;; (defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
;; (defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
;; (defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
;; 			      :ref nil
;; 			      :files (:defaults (:exclude "extensions"))
;; 			      :build (:not elpaca--activate-package)))
;; (let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
;;        (build (expand-file-name "elpaca/" elpaca-builds-directory))
;;        (order (cdr elpaca-order))
;;        (default-directory repo))
;;   (add-to-list 'load-path (if (file-exists-p build) build repo))
;;   (unless (file-exists-p repo)
;;     (make-directory repo t)
;;     (when (< emacs-major-version 28) (require 'subr-x))
;;     (condition-case-unless-debug err
;;         (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
;; 	         ((zerop (call-process "git" nil buffer t "clone"
;;                                        (plist-get order :repo) repo)))
;; 	         ((zerop (call-process "git" nil buffer t "checkout"
;; 				       (or (plist-get order :ref) "--"))))
;; 	         (emacs (concat invocation-directory invocation-name))
;; 	         ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
;; 				       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
;; 	         ((require 'elpaca))
;; 	         ((elpaca-generate-autoloads "elpaca" repo)))
;;             (kill-buffer buffer)
;;           (error "%s" (with-current-buffer buffer (buffer-string))))
;;       ((error) (warn "%s" err) (delete-directory repo 'recursive))))
;;   (unless (require 'elpaca-autoloads nil t)
;;     (require 'elpaca)
;;     (elpaca-generate-autoloads "elpaca" repo)
;;     (load "./elpaca-autoloads")))
;; (add-hook 'after-init-hook #'elpaca-process-queues)
;; (elpaca `(,@elpaca-order))

;; ;; Install use-package support
;; (elpaca elpaca-use-package
;;   ;; Enable :elpaca use-package keyword.
;;   (elpaca-use-package-mode)
;;   ;; Assume :elpaca t unless otherwise specified.
;;   (setq elpaca-use-package-by-default t))

;; ;; Block until current queue processed.
;; (elpaca-wait)

;; ;;When installing a package which modifies a form used at the top-level
;; ;;(e.g. a package which adds a use-package key word),
;; ;;use `elpaca-wait' to block until that package has been installed/configured.
;; ;;For example:
;; ;;(use-package general :demand t)
;; ;;(elpaca-wait)
;; ;; Load this before other packages
;; (elpaca (dash :host github :repo "magnars/dash.el" :main "dash.el")
;;   (provide 'dash))

;; ;; Continue with other packages
;; (elpaca-wait)
;; ;;Turns off elpaca-use-package-mode current declartion
;; ;;Note this will cause the declaration to be interpreted immediately (not deferred).
;; ;;Useful for configuring built-in emacs features.
;; ;;(use-package emacs :elpaca nil :config (setq ring-bell-function #'ignore))

;; ;; Don't install anything. Defer execution of BODY
;; ;;(elpaca nil (message "deferred"))
;; ;; Set user information for a personalized Emacs experience

;; Set user information for a personalized Emacs experience
(setq user-full-name "Matt Lindeboom"
      user-mail-address "matt@b0om.net")

(setq doom-font (font-spec :family "Dank Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Vollkorn" :size 18)
      doom-serif-font (font-spec :family "Vollkorn")
      doom-theme 'doom-leuven
      display-line-numbers-type t
      )
(doom-modeline-mode 1)

;; Configure custom key bindings for efficient workflow navigation, including quick access to Org mode's agenda and capture features
;; (map! :leader
;;       :desc "Open agenda" "o a" #'org-agenda
;;       :desc "Capture something" "o c" #'org-capture)

;; Here, you can add any additional Emacs Lisp configurations that you
;; find necessary for enhancing your Doom Emacs experience.
;; This section is reserved for further customizations and extensions.

;;; Dashboard Customization
(when window-system
  (remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
  (add-hook! '+doom-dashboard-functions :append)
  (setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
  (setq fancy-splash-image (concat doom-user-dir "biggreenbuddha-614.png"))
  (setq-default line-spacing 0.24)
  (modify-all-frames-parameters
   '((right-divider-width . 10)
     (internal-border-width . 10)))
  (dolist (face '(window-divider
                  window-divider-first-pixel
                  window-divider-last-pixel))
    (face-spec-reset-face face)
    (set-face-foreground face (face-attribute 'default :background)))
  (set-face-background 'fringe (face-attribute 'default :background)))
;; Get file icons in dired
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)   ; or use a nicer switcher, see below
  :config
  (persp-mode))
(after! persp-mode
  (setq persp-auto-save-opt 1)          ; Auto-save on close
  (setq persp-auto-resume-time 1)       ; Resume on load
  (setq persp-autokill-buffer-on-remove 'kill-weak)
  (setq persp-save-dir (expand-file-name "workspaces/" doom-local-dir)))

(map! :leader
      :desc "Switch to perspective NAME"       "DEL" #'persp-switch
      :desc "Create new persective with NAME"  "p" #'persp-add-new
      :desc "Switch to buffer in perspective"  "," #'persp-switch-to-buffer
      :desc "Switch to next perspective"       "]" #'persp-next
      :desc "Switch to previous perspective"   "[" #'persp-prev
      :desc "Add a buffer current perspective" "+" #'persp-add-buffer
      :desc "Remove perspective by name"       "-" #'persp-remove-by-name
      :desc "Save state to file"               "s f" #'persp-save-state-to-file)

;;; ORG MODE
(setq org-directory "~/org/")

(use-package mixed-pitch
    :hook
    (text-mode . mixed-pitch-mode)
    :config
    (set-face-attribute 'default nil :font "Dank Mono" :height 150)
    (set-face-attribute 'fixed-pitch nil :font "Dank Mono")
    (set-face-attribute 'variable-pitch nil :font "Vollkorn"))
(add-hook 'mixed-pitch-mode-hook #'solaire-mode-reset)

(use-package org-appear
  :hook (org-mode . org-appear-mode))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(defun dt/insert-auto-tangle-tag ()
  "Insert auto-tangle tag in a literate config."
  (interactive)
  (evil-org-open-below 1)
  (insert "#+auto_tangle: t ")
  (evil-force-normal-state))

(map! :leader
      :desc "Insert auto_tangle tag" "i a" #'dt/insert-auto-tangle-tag)

(map! :leader
      :desc "Vterm popup toggle"     "v t" #'+vterm/toggle
      :desc "Multi vterm create"     "v m" #'multi-vterm
      :desc "Multi vterm next"       "v ]" #'multi-vterm-next)

(use-package multi-vterm
	:config
	(add-hook 'vterm-mode-hook
			(lambda ()
			(setq evil-insert-state-cursor 'box)
			(evil-insert-state)))
	(define-key vterm-mode-map [return]                      #'vterm-send-return)

	(setq vterm-keymap-exceptions nil)
	(evil-define-key 'insert vterm-mode-map (kbd "C-e")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-f")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-a")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-b")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-w")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-n")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-m")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-p")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-j")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-k")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-r")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-g")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-c")      #'vterm--self-insert)
	(evil-define-key 'insert vterm-mode-map (kbd "C-SPC")    #'vterm--self-insert)
	(evil-define-key 'normal vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
	(evil-define-key 'normal vterm-mode-map (kbd ",c")       #'multi-vterm)
	(evil-define-key 'normal vterm-mode-map (kbd ",n")       #'multi-vterm-next)
	(evil-define-key 'normal vterm-mode-map (kbd ",p")       #'multi-vterm-prev)
	(evil-define-key 'normal vterm-mode-map (kbd "i")        #'evil-insert-resume)
	(evil-define-key 'normal vterm-mode-map (kbd "o")        #'evil-insert-resume)
	(evil-define-key 'normal vterm-mode-map (kbd "<return>") #'evil-insert-resume))

;; (use-package! eglot
;;   :config
;;   (add-to-list 'eglot-server-programs
;;                '(python-mode . ("pyright-langserver" "--stdio"))))

(use-package projectile
  :config
  (projectile-global-mode 1))

(use-package counsel
  :after ivy
  :config (counsel-mode))
(use-package ivy
  :custom
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode))
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))
(use-package ivy-rich
  :after ivy
  :ensure t
  :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
  :custom
  (ivy-virtual-abbreviate 'full
   ivy-rich-switch-buffer-align-virtual-buffer t
   ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))
;; (require 'ivy)
;; (require 'counsel)
;; (require 'swiper)
;; (require 'ivy-rich)
;; (require 'all-the-icons-ivy-rich)
(global-set-key (kbd "C-s") 'swiper-isearch)
(map! :leader
      :desc "Open Swiper" "sw" #'swiper
      :desc "Open Counsel-rg" "sc" #'counsel-rg)

(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode))

(setq tab-width 4)
