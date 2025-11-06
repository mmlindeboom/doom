;;; doom-leuven-theme.el --- Port of the elegant Leuven Emacs theme for Doom Emacs -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Copyright (C) 2003-2025 Free Software Foundation, Inc.
;;
;; Author: Fabrice Niessen <(concat "fniessen" at-sign "pirilampo.org")>
;; Doom port maintainer: Your Name <your.email@example.com>
;; URL: https://github.com/fniessen/emacs-leuven-theme
;; Version: 1.0.0
;; Package-Requires: ((emacs "25.1") (doom-themes "2.0.0"))
;; Keywords: custom themes, faces

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Port of the "leuven" theme for Doom Emacs.
;; The original Leuven theme offers a clean, elegant, and visually appealing
;; design for Emacs. While especially suited for Org mode, it enhances
;; readability across various contexts. Designed for white backgrounds, it
;; provides a pleasant and highly readable environment for extended use.
;;
;;; Code:

(require 'doom-themes)

;; Compiler pacifier
(defvar modeline-bg)

;;
;;; Variables

(defgroup doom-leuven-theme nil
  "Options for the `doom-leuven' theme."
  :group 'doom-themes)

(defcustom doom-leuven-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-leuven-theme
  :type '(choice integer boolean))

;; Define customization variables for vterm colors
(defcustom doom-leuven-vterm-bg "#FFDD70"
  "Background color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-fg "#333333"
  "Foreground color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-black "#000000"
  "Black color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-red "#ff0000"
  "Red color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-green "#00ff00"
  "Green color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-yellow "#ffff00"
  "Yellow color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-blue "#0000ff"
  "Blue color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-magenta "#ff00ff"
  "Magenta color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-cyan "#019595"
  "Cyan color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

(defcustom doom-leuven-vterm-white "#ffdd70"
  "White color for vterm in the doom-leuven theme."
  :group 'doom-leuven-theme
  :type 'string)

;; Reuse original leuven scaling functions
(defcustom doom-leuven-scale-org-document-title t
  "Scale Org document title.
This can be nil for unscaled, t for using the theme default, or a scaling
number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling")))
(defcustom doom-leuven-scale-outline-headlines t
  "Scale `outline' (and `org') level-1 headlines.
This can be nil for unscaled, t for using the theme default, or a scaling
number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling")))

(defcustom doom-leuven-scale-org-agenda-structure t
  "Scale Org agenda structure lines, like dates.
This can be nil for unscaled, t for using the theme default, or a scaling
number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling")))

(defcustom doom-leuven-scale-volatile-highlight t
  "Increase size in the `next-error' face.
This can be nil for unscaled, t for using the theme default, or a scaling
number."
  :type '(choice
          (const :tag "Unscaled" nil)
          (const :tag "Default provided by theme" t)
          (number :tag "Set scaling")))

;;;###autoload
(defun doom-leuven-scale-font (control default-height)
  "Function for splicing optional font heights into face descriptions.
CONTROL can be a number, nil, or t.  When t, use DEFAULT-HEIGHT."
  (cond
   ((numberp control) (list :height control))
   ((eq t control) (list :height default-height))
   (t nil)))

;;
;;; Theme definition

(def-doom-theme doom-leuven
    "A port of the elegant Leuven theme with a light background"

  ;; name      default     256       16
  ((bg         '("#FFFFFF" "#FFFFFF" "white"))
   (bg-alt     '("#ECECEC" "#ECECEC" "white"))
   (base0      '("#F7F7F7" "#F7F7F7" "white"))     ; Highlight background (more subtle)
   (base1      '("#EFEFEF" "#EFEFEF" "brightblack"))
   (base2      '("#E0E0E0" "#E0E0E0" "brightblack"))
   (base3      '("#CCCCCC" "#CCCCCC" "brightblack"))
   (base4      '("#9A9A9A" "#9A9A9A" "brightblack"))
   (base5      '("#7F7F7F" "#7F7F7F" "brightblack"))
   (base6      '("#555555" "#555555" "brightblack"))
   (base7      '("#333333" "#333333" "brightblack"))
   (base8      '("#000000" "#000000" "black"))
   (fg         '("#333333" "#333333" "black"))
   (fg-alt     '("#595959" "#595959" "brightblack"))

   (grey       base5)
   (red        '("#D8ABA7" "#D8ABA7" "red"))
   (orange     '("#FF8C00" "#FF8C00" "brightred"))
   (green      '("#89C58F" "#89C58F" "green"))
   (teal       '("#008080" "#008080" "brightgreen"))
   (yellow     '("#F4EB80" "#F4EB80" "yellow"))
   (blue       '("#335EA8" "#335EA8" "brightblue"))
   (dark-blue  '("#006DAF" "#006DAF" "blue"))
   (magenta    '("#BA36A5" "#BA36A5" "magenta"))
   (violet     '("#6434A3" "#6434A3" "brightmagenta"))
   (cyan       '("#008ED1" "#008ED1" "brightcyan"))
   (dark-cyan  '("#006FE0" "#006FE0" "cyan"))

   ;; Leuven specific colors
   (code-block-bg         '("#FFFFE0" "#FFFFE0" "white"))   ; Light yellow
   (code-inline-bg        '("#F4FFF4" "#F4FFF4" "white"))   ; Light green
   (highlight-blue        '("#B6D6FD" "#B6D6FD" "white"))
   (highlight-yellow      '("#F6FECD" "#F6FECD" "white"))
   (region                '("#8ED3FF" "#8ED3FF" "white"))   ; Light blue
   (volatile-highlight    '("#9E3699" "#9E3699" "white"))   ; Purple
   (match                 '("#FFFF00" "#FFFF00" "yellow"))  ; Yellow

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base2)
   (selection      region)
   (builtin        dark-cyan)
   (comments       '("#A0A1A7" "#A0A1A7" "brightblack"))
   (doc-comments   '("#036A07" "#036A07" "green"))
   (constants      '("#D0372D" "#D0372D" "red"))
   (functions      '("#006699" "#006699" "blue"))
   (keywords       '("#0000FF" "#0000FF" "blue"))
   (methods        functions)
   (operators      base7)
   (type           violet)
   (strings        '("#008000" "#008000" "green"))
   (variables      magenta)
   (numbers        constants)
   (region         region)
   (error          '("#F22659" "#F22659" "red"))
   (warning        '("#FF9977" "#FF9977" "orange"))
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (modeline-bg     "#8c1eff")
   (modeline-bg-alt (doom-darken "#e1dce6" 0.1))
   (modeline-fg     '("#85CEEB" "#85CEEB" "white"))
   (modeline-fg-alt '("#F0F0EF" "#F0F0EF" "white"))

   (org-level-1-bg '("#F0F0F0" "#F0F0F0" "white"))
   (org-level-2-bg '("#E5F4FB" "#E5F4FB" "white"))
   (org-level-3-bg '("#EFFFEF" "#EFFFEF" "white"))

   ;; Custom vterm colors (these can be customized by setting variables)
   (vterm-bg       (default-value 'doom-leuven-vterm-bg))
   (vterm-fg       (default-value 'doom-leuven-vterm-fg))
   (vterm-black    (default-value 'doom-leuven-vterm-black))
   (vterm-red      (default-value 'doom-leuven-vterm-red))
   (vterm-green    (default-value 'doom-leuven-vterm-green))
   (vterm-yellow   (default-value 'doom-leuven-vterm-yellow))
   (vterm-blue     (default-value 'doom-leuven-vterm-blue))
   (vterm-magenta  (default-value 'doom-leuven-vterm-magenta))
   (vterm-cyan     (default-value 'doom-leuven-vterm-cyan))
   (vterm-white    (default-value 'doom-leuven-vterm-white)))

  ;;;; Base theme face overrides
  (((highlight &override) :background highlight-blue)
   (lazy-highlight :background match :foreground "black" :distant-foreground "black")
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box `(:line-width 1 :color "#ff901f")
    :padding (when doom-leuven-padded-modeline
               (if (integerp doom-leuven-padded-modeline) doom-leuven-padded-modeline 4)))
   (mode-line-inactive
    :background (doom-darken modeline-bg-alt 0.1) :foreground modeline-fg-alt
    :box `(:line-width 1 :color "#4E4E4C")
    :padding (when doom-leuven-padded-modeline
               (if (integerp doom-leuven-padded-modeline) doom-leuven-padded-modeline 4)))
   (mode-line-emphasis :foreground "white" :weight 'bold)

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;;;; doom-modeline
   (doom-modeline-bar :background "#8c1eff")

   ;;;; ediff <built-in>
   (ediff-current-diff-A :background (doom-lighten red 0.8) :foreground red)
   (ediff-current-diff-B :background (doom-lighten green 0.8) :foreground green)
   (ediff-current-diff-C :background (doom-lighten cyan 0.8) :foreground cyan)

   ;;;; eshell <built-in>
   (eshell-prompt :foreground blue :weight 'bold)

   ;;;; font-lock
   (font-lock-builtin-face :foreground builtin :weight 'normal)
   (font-lock-comment-face :foreground comments :slant 'italic)
   (font-lock-comment-delimiter-face :foreground "#8D8D84")
   (font-lock-constant-face :foreground constants)
   (font-lock-doc-face :foreground doc-comments)
   (font-lock-function-name-face :foreground functions :weight 'normal)
   (font-lock-keyword-face :foreground keywords)
   (font-lock-preprocessor-face :foreground "#808080")
   (font-lock-string-face :foreground strings)
   (font-lock-type-face :foreground type :weight 'normal)
   (font-lock-variable-name-face :foreground variables)
   (font-lock-warning-face :foreground warning :weight 'bold)

   ;;;; isearch
   (isearch :foreground "white" :background blue :weight 'bold :underline "black")
   (isearch-fail :weight 'bold :foreground "black" :background "#FFCCCC")

   ;;;; line-number
   (line-number :foreground "#3b3245" :background "#e1dce6")
   (line-number-current-line :foreground "#f222ff" :background "#341c4d")

   ;;;; lsp-mode
   (lsp-face-highlight-textual :background base0)
   (lsp-face-highlight-read :background base0)
   (lsp-face-highlight-write :background base0)
   (lsp-headerline-breadcrumb-separator-face :foreground fg)

   ;;;; magit
   (magit-branch-current :box `(:line-width 1 :color "#00CC33") :foreground "black" :background "#AAFFAA")
   (magit-diff-hunk-heading :foreground "#990099" :background "#FFEEFF")
   (magit-diff-hunk-heading-highlight :foreground "#990099" :background "#FFEEFF")
   (magit-diff-added :foreground "black" :background "#DDFFDD")
   (magit-diff-removed :foreground "black" :background "#FEE8E9")

   ;;;; outline <built-in>
   (outline-1 :background org-level-1-bg :foreground "#3C3C3C" :weight 'bold
              :height (if doom-leuven-scale-outline-headlines 1.3 1.0)
              :overline "#A7A7A7")
   (outline-2 :foreground "#123555" :background org-level-2-bg :weight 'bold :height 1.0
              :overline "#123555")
   (outline-3 :foreground "#005522" :background org-level-3-bg :weight 'bold :height 1.0)
   (outline-4 :foreground "#EA6300" :weight 'bold :slant 'normal :height 1.0)
   (outline-5 :foreground "#E3258D" :weight 'bold :slant 'normal :height 1.0)
   (outline-6 :foreground "#0077CC" :weight 'bold :slant 'italic :height 1.0)
   (outline-7 :foreground "#2EAE2C" :weight 'bold :slant 'italic :height 1.0)
   (outline-8 :foreground "#FD8008" :weight 'bold :slant 'italic :height 1.0)

   ;;;; org <built-in>
   (org-level-1 :inherit 'outline-1)
   (org-level-2 :inherit 'outline-2)
   (org-level-3 :inherit 'outline-3)
   (org-level-4 :inherit 'outline-4)
   (org-level-5 :inherit 'outline-5)
   (org-level-6 :inherit 'outline-6)
   (org-level-7 :inherit 'outline-7)
   (org-level-8 :inherit 'outline-8)

   (org-document-title :foreground "black" :weight 'bold
                       :height (if doom-leuven-scale-org-document-title 1.8 1.0))
   (org-document-info :foreground "#484848")
   (org-document-info-keyword :foreground cyan :background "#EAEAFF")

   (org-todo :box `(:line-width 1 :color "#D8ABA7") :foreground "#D8ABA7"
             :weight 'bold :background "#FFE6E4")
   (org-done :box `(:line-width 1 :color "#89C58F") :foreground "#89C58F"
             :weight 'bold :background "#E2FEDE")

   (org-table :foreground "dark green" :background "#EEFFEE")
   (org-code :foreground "#006400" :background "#F4FFF4" :inherit 'fixed-pitch-serif)
   (org-verbatim :foreground "#0066CC" :background "#F7FDFF")
   (org-block :foreground "#000088" :background code-block-bg)
   (org-block-begin-line :foreground "#555555" :background "#E2E1D5" :underline "#A7A6AA")
   (org-block-end-line :foreground "#555555" :background "#E2E1D5" :overline "#A7A6AA")

   (org-date :foreground "#00459E" :underline t)
   (org-headline-done :height 1.0 :weight 'normal :foreground "#ADADAD")
   (org-footnote :foreground cyan :underline t)
   (org-tag :weight 'normal :slant 'italic :foreground "#9A9FA4" :background "white")
   (org-special-keyword :foreground "#00BB00" :background "#EEFFEE" :weight 'bold)

   ;;;; org-agenda
   (org-agenda-date :foreground "#1662AF" :weight 'bold
                    :height (if doom-leuven-scale-org-agenda-structure 1.6 1.0))
   (org-agenda-date-today :foreground "#4F4A3D" :background "#FFFFCC" :weight 'bold
                          :height (if doom-leuven-scale-org-agenda-structure 1.6 1.0))
   (org-agenda-date-weekend :foreground "#4E4E4E" :weight 'bold
                            :height (if doom-leuven-scale-org-agenda-structure 1.6 1.0))
   (org-agenda-structure :foreground "#1F8DD6" :weight 'bold
                         :height (if doom-leuven-scale-org-agenda-structure 1.6 1.0))

   ;;;; vterm
   (vterm :foreground vterm-fg :background vterm-bg)
   (vterm-color-default :foreground vterm-fg :background vterm-bg)
   (vterm-color-black :foreground vterm-black :background vterm-black)
   (vterm-color-red :foreground vterm-red :background vterm-red)
   (vterm-color-green :foreground vterm-green :background vterm-green)
   (vterm-color-yellow :foreground vterm-yellow :background vterm-yellow)
   (vterm-color-blue :foreground vterm-blue :background vterm-blue)
   (vterm-color-magenta :foreground vterm-magenta :background vterm-magenta)
   (vterm-color-cyan :foreground vterm-cyan :background vterm-cyan)
   (vterm-color-white :foreground vterm-white :background vterm-white))

  ;;;; Base theme variable overrides-
  ())

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'doom-leuven-theme)
;;; doom-leuven-theme.el ends here
