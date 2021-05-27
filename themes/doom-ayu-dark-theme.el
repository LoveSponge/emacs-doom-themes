;;; doom-ayu-dark-theme.el --- inspired by Atom One Dark -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-ayu-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-ayu-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-ayu-dark-theme
  :type 'boolean)

(defcustom doom-ayu-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-ayu-dark-theme
  :type 'boolean)

(defcustom doom-ayu-dark-comment-bg doom-ayu-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-ayu-dark-theme
  :type 'boolean)

(defcustom doom-ayu-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-ayu-dark-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-ayu-dark
  "A dark theme inspired by Ayu Dark"

  ;; name        default   256       16
  (
   ;; common
   (common-accent         '("#E6B450" "orange"  "orange" ))
   (common-bg             '("#0A0E14" "black"   "black"  ))
   (common-fg             '("#B3B1AD" "grey"    "grey"   ))
   (common-ui             '("#4D5566" "grey"    "grey"   ))
   ;; syntax
   (syntax-tag            '("#39BAE6" "cyan"    "blue"   ))
   (syntax-func           '("#FFB454" "yellow"  "yellow" ))
   (syntax-entity         '("#59C2FF" "blue"    "blue"   ))
   (syntax-string         '("#C2D94C" "green"   "green"  ))
   (syntax-regexp         '("#95E6CB" "teal"    "green"  ))
   (syntax-markup         '("#F07178" "red"     "red"    ))
   (syntax-keyword        '("#FF8F40" "orange"  "orange" ))
   (syntax-special        '("#E6B673" "yellow"  "yellow" ))
   (syntax-comment        '("#626A73" "grey"    "grey"   ))
   (syntax-constant       '("#FFEE99" "magenta" "purple" ))
   (syntax-operator       '("#F29668" "orange"  "orange" ))
   (syntax-error          '("#FF3333" "red"     "red"    ))
   ;; ui
   (ui-line               '("#00010A"))
   (ui-panel-bg           '("#0D1016"))
   (ui-panel-shadow       '("#00010A"))
   (ui-panel-border       '("#000000"))
   (ui-gutter-normal      (doom-darken common-ui 0.99))
   (ui-gutter-active      (doom-darken common-ui 0.06))
   (ui-selection-bg       '("#273747"))
   (ui-selection-inactive '("#1B2733"))
   (ui-selection-border   '("#304357"))
   (ui-guide-active       (doom-darken common-ui 0.13))
   (ui-guide-normal       (doom-darken common-ui 0.66))
   ;; vcs
   (vcs-added             '("#91B362" "green" "green" ))
   (vcs-modified          '("#6994BF" "blue"  "blue"  ))
   (vcs-removed           '("#D96C75" "red"   "red"   ))

   (bg         common-bg)
   (bg-alt     ui-line)
   (base0      ui-gutter-normal)
   (base1      ui-gutter-active)
   (base2      ui-selection-bg)
   (base3      ui-selection-inactive)
   (base4      ui-selection-border)
   (base5      ui-guide-active)
   (base6      ui-guide-normal)
   (base7      ui-panel-shadow)
   (base8      ui-panel-border)
   (fg         common-fg)
   (fg-alt     common-ui)
   (grey       syntax-comment)
   (red        syntax-markup)
   (orange     syntax-keyword)
   (green      syntax-string)
   (teal       syntax-regexp)
   (yellow     syntax-func)
   (blue       syntax-entity)
   (dark-blue  (doom-darken syntax-entity 0.4))
   (magenta    syntax-constant)
   (violet     (doom-lighten syntax-constant 0.4))
   (cyan       syntax-tag)
   (dark-cyan  (doom-darken syntax-tag 0.4))

   ;; face categories -- required for all themes
   (highlight      common-accent)
   (vertical-bar   ui-panel-border)
   (selection      ui-selection-inactive)
   (builtin        syntax-func)
   (comments       (if doom-ayu-dark-brighter-comments syntax-comment syntax-comment))
   (doc-comments   (if doom-ayu-dark-brighter-comments syntax-comment syntax-comment))
   (constants      syntax-constant)
   (functions      syntax-func)
   (keywords       syntax-keyword)
   (methods        syntax-func)
   (operators      syntax-operator)
   (type           syntax-special)
   (strings        syntax-string)
   (variables      common-fg)
   (numbers        syntax-func)
   (region         ui-selection-bg)
   (error          syntax-error)
   (warning        yellow)
   (success        green)
   (vc-modified    vcs-modified)
   (vc-added       vcs-added)
   (vc-deleted     vcs-removed)

   ;; custom categories
   (hidden     (car bg))
   (-modeline-bright doom-ayu-dark-brighter-modeline)
   (-modeline-pad
    (when doom-ayu-dark-padded-modeline
      (if (integerp doom-ayu-dark-padded-modeline) doom-ayu-dark-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt highlight)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(car bg-alt) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1)))
   )

  ;; --- extra faces ------------------------
  (
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;; evil
   (evil-goggles-default-face :inherit 'region :background (doom-blend region bg 0.5))
   (evil-ex-lazy-highlight :inherit 'region :background (doom-blend region bg 1.9))

   ;; lsp
   (lsp-face-highlight-read :inherit 'region)

   ((line-number &override) :foreground comments)
   ((line-number-current-line &override) :foreground fg)

   (font-lock-comment-face
    :foreground comments
    :background (if doom-ayu-dark-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Doom modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight) :weight 'normal)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'normal)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'normal)
   ;; (doom-modeline-project-dir :foreground green :weight 'bold) ;; good for testing faces...
   (doom-modeline-buffer-modified :foreground red :weight 'bold)

   ;; ivy-mode
   (ivy-current-match :background bg)
   (ivy-minibuffer-match-face-1 :foreground cyan :weight 'bold)
   (ivy-minibuffer-match-face-2 :foreground magenta :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground teal :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground green :weight 'bold)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten common-bg 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)
   (org-headline-done :foreground syntax-comment)
   ((org-block &override) :background ui-panel-border)
   ((org-quote &override) :background ui-panel-border)
   ((org-block-begin-line &override) :background common-bg :foreground syntax-comment)
   ((org-document-info-keyword &override) :foreground syntax-comment)

   ;; rjsx
   (rjsx-tag :foreground cyan)
   (rjsx-tag-bracket-face :foreground (doom-darken cyan 0.5))
   (rjsx-attr :foreground syntax-func)

   ;; company
   (company-tooltip :foreground common-fg :background common-bg)
   (company-tooltip-annotation :foreground common-fg)
   (company-tooltip-selection :background ui-line)
   (company-tooltip-search :foreground common-accent :weight 'bold)
   (company-scrollbar-bg :background common-bg)
   (company-scrollbar-fg :background syntax-comment)

   (hl-line :background ui-line)
   (highlight-numbers-number :foreground syntax-func :weight 'normal)

   ;; treemacs
   (treemacs-file-face :foreground fg)
   (treemacs-directory-face :foreground fg)
   (treemacs-git-modified-face :foreground vcs-modified)

   ;; diff-mode
   (diff-removed :foreground vcs-removed)
   )
  )

;;; doom-ayu-dark-theme.el ends here
