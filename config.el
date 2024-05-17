;; Set user information for a personalized Emacs experience
(setq user-full-name "Matt Lindeboom"
      user-mail-address "matt@b0om.net")

(setq doom-font (font-spec :family "Dank Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Vollkorn" :size 18)
      doom-serif-font (font-spec :family "Vollkorn")
      doom-theme 'leuven
      display-line-numbers-type t
      )
(doom-modeline-mode 1)

;; Configure custom key bindings for efficient workflow navigation, including quick access to Org mode's agenda and capture features
(map! :leader
      :desc "Open agenda" "o a" #'org-agenda
      :desc "Capture something" "o c" #'org-capture)

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

;;; ORG MODE
(setq org-directory "~/org/")
;; Set default, fixed and variable pitch fonts
;; Use M-x menu-set-font to view available fonts
(when window-system
(let* ((variable-tuple
          (cond ((x-list-fonts "Rokkitt") '(:font "Rokkitt"))
                ((x-list-fonts "Sono Monospace") '(:font "Sono Monospace"))
                ((x-list-fonts "DejaVu Sans")   '(:font "DejaVu Sans"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight normal)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline :foreground "#8f0900" ,@variable-tuple))))
     `(org-level-7 ((t (,@headline :foreground "#880019" ,@variable-tuple))))
     `(org-level-6 ((t (,@headline :foreground "#790029" ,@variable-tuple))))
     `(org-level-5 ((t (,@headline :foreground "#690032" ,@variable-tuple))))
     `(org-level-4 ((t (,@headline :foreground "#590039" ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline :foreground "#46003e" ,@variable-tuple :height 1.25))))
     `(org-level-2 ((t (,@headline :foreground "#30023d" ,@variable-tuple :height 1.5))))
     `(org-level-1 ((t (,@headline :foreground "#1a0638" ,@variable-tuple :height 1.675))))
     `(org-document-title ((t (,@headline :foreground "#030030" ,@variable-tuple :height 2.0 :underline nil)))))))
(use-package mixed-pitch
    :hook
    (text-mode . mixed-pitch-mode)
    :config
    (set-face-attribute 'default nil :font "Sono Monospace" :height 150)
    (set-face-attribute 'fixed-pitch nil :font "Sono Monospace")
    (set-face-attribute 'variable-pitch nil :font "Rokkitt"))
(add-hook 'mixed-pitch-mode-hook #'solaire-mode-reset)

;; Improve org mode looks
(setq org-startup-indented t
          org-pretty-entities t
          org-hide-emphasis-markers t
          org-startup-with-inline-images t
          org-image-actual-width '(300))
;; Improved Org Mode bullets
(setq org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))
;; Show hidden emphasis markers
(use-package org-appear
  :hook (org-mode . org-appear-mode))
;; Distraction free writing mode
;; (use-package olivetti
;;     :init
;;     (setq olivetti-body-width .67)
;;     :config
;;     (defun distraction-free ()
;;       "Distraction-free writing environment"
;;       (interactive)
;;       (if (equal olivetti-mode nil)
;;           (progn
;;             (window-configuration-to-register 1)
;;             (delete-other-windows)
;;             (text-scale-increase 2)
;;             (olivetti-mode t))
;;         (progn
;;           (jump-to-register 1)
;;           (olivetti-mode 0)
;;           (text-scale-decrease 2))))
;;     :bind
;;     (("<f9>" . distraction-free)))

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)   ; or use a nicer switcher, see below
  :config
  (persp-mode))

(use-package projectile
  :config
  (projectile-global-mode 1))

(setq shell-file-name "/usr/local/bin/fish"
      vterm-max-scrollback 5)

    (use-package forge
  :after magit)

(setq web-mode-engines-alist '(("django" . "\\.html\\'"))
