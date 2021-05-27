;;; doom-ayu-light-theme.el --- inspired by Atom One Dark -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-ayu-light-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-ayu-light-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-ayu-light-theme
  :type 'boolean)

(defcustom doom-ayu-light-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-ayu-light-theme
  :type 'boolean)

(defcustom doom-ayu-light-comment-bg doom-ayu-light-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-ayu-light-theme
  :type 'boolean)

(defcustom doom-ayu-light-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-ayu-light-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-ayu-light
  "A light theme inspired by Ayu Light"

  ;; name             default   256       16
  (
   ;; common
   (common-accent   '("#FF9940" "orange"  "orange" ))
   (common-bg       '("#FAFAFA" "white"   "white"  ))
   (common-fg       '("#575F66" "grey"    "grey"   ))
   (common-ui       '("#8A9199" "grey"    "grey"   ))
   (test            '("#2EA8E6" "grey"    "grey"   ))
   ;; syntax
   (syntax-tag      '("#55B4D4" "cyan"    "blue"   ))
   (syntax-func     '("#F2AE49" "yellow"  "yellow" ))
   (syntax-entity   '("#399EE6" "blue"    "blue"   ))
   (syntax-string   '("#86B300" "green"   "green"  ))
   (syntax-regexp   '("#4CBF99" "teal"    "green"  ))
   (syntax-markup   '("#F07171" "red"     "red"    ))
   (syntax-keyword  '("#FA8D3E" "orange"  "orange" ))
   (syntax-special  '("#E6BA7E" "yellow"  "yellow" ))
   (syntax-comment  '("#ABB0B6" "grey"    "grey"   ))
   (syntax-constant '("#A37ACC" "magenta" "purple" ))
   (syntax-operator '("#ED9366" "orange"  "orange" ))
   (syntax-error    '("#F51818" "red"     "red"    ))
   ;; ui
   (ui-line               (doom-lighten common-ui 0.79))
   (ui-panel-bg           (doom-darken '("#ffffff") 0.07))
   (ui-panel-shadow       (doom-lighten '("#424a50") 0.4))
   (ui-panel-border       '("#f0f0f0"))
   (ui-gutter-normal      (doom-lighten common-ui 0.66))
   (ui-gutter-active      (doom-lighten common-ui 0.33))
   (ui-selection-bg       '("#d1e4f4"))
   (ui-selection-inactive '("#e7e8e9"))
   (ui-selection-border   '("#e1e1e2"))
   (ui-guide-active       (doom-lighten common-ui 0.59))
   (ui-guide-normal       (doom-lighten common-ui 0.23))
   ;; vcs
   (vcs-added    '("#99bf4d" "green" "green" ))
   (vcs-modified '("#709ecc" "blue"  "blue"  ))
   (vcs-removed  '("#f27983" "red"   "red"   ))

   (bg         common-bg)
   (bg-alt     ui-panel-bg)
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
   ;; (builtin        syntax-entity)
   (comments       (if doom-ayu-light-brighter-comments syntax-comment syntax-comment))
   (doc-comments   (if doom-ayu-light-brighter-comments syntax-comment syntax-comment))
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
   (-modeline-bright doom-ayu-light-brighter-modeline)
   (-modeline-pad
    (when doom-ayu-light-padded-modeline
      (if (integerp doom-ayu-light-padded-modeline) doom-ayu-light-padded-modeline 4)))

   (modeline-fg     common-ui)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (doom-darken blue 0.475)
      `(,(doom-darken (car bg) 0.05) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(car bg) ,@(cdr bg)))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1)))
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
    :background (if doom-ayu-light-comment-bg (doom-lighten bg 0.05)))
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

   (js2-object-property :foreground blue)

   ;; rjsx
   (rjsx-tag :foreground cyan)
   (rjsx-tag-bracket-face :foreground (doom-lighten cyan 0.5))
   (rjsx-attr :foreground syntax-func)

   (web-mode-html-tag-face :foreground cyan)
   (web-mode-html-tag-bracket-face :foreground (doom-lighten cyan 0.5))
   (web-mode-html-attr-name-face :foreground syntax-func)

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

;;; doom-ayu-light-theme.el ends here
