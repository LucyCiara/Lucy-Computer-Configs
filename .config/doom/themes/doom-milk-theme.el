;;; doom-milk-theme.el --- based on Gitleptune's Milk theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: February 22, 2022 (#708)
;; Author: paladhammika <https://github.com/paladhammika>
;; Maintainer:
;; Source: https://github.com/Gitleptune/milk-theme
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup doom-milk-theme nil
  "Options for the `doom-milk' theme."
  :group 'doom-themes)

(defcustom doom-milk-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-milk-theme
  :type 'boolean)

(defcustom doom-milk-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-milk-theme
  :type 'boolean)

(defcustom doom-milk-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-milk-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme doom-milk
  "A milkpurple and milkred theme based of https://github.com/Gitleptune/milk-theme"

  ;; name        default   256           16
  ((bg         '("#0d0e13" "black"       "black"  ))
   (fg         '("#ead9bb" "#ead9bb"     "brightwhite"  ))

   (bg-alt     '("#15151e" "black"       "black"        ))
   (fg-alt     '("#ac3231" "#ac3231"     "white"        ))

   (base0      '("#0d0e13" "#0d0e13"     "black"        ))
   (base1      '("#15151e" "#15151e"     "brightblack"  ))
   (base2      '("#1e1a27" "#1e1a27"     "brightblack"  ))
   (base3      '("#291e30" "#291e30"     "brightblack"  ))
   (base4      '("#362137" "#362137"     "brightblack"  ))
   (base5      '("#44243c" "#44243c"     "brightblack"  ))
   (base6      '("#52263f" "#52263f"     "brightblack"  ))
   (base7      '("#832743" "#832743"     "brightblack"  ))
   (base8      '("#ac3231" "#ac3231"     "white"        ))

   (grey       base4)
   (milkpurple      "#52263f")
   (milkblack       "#0d0e13")
   (milkred      "#ac3231")
   (red        '("#ac3231" "#ac3231" "red"          ))
   (orange     '("#ba6810" "#ba6810" "brightred"    ))
   (green      '("#84d23c" "#84d23c" "green"        ))
   (teal       '("#38ca88" "#38ca88" "brightgreen"  ))
   (yellow     '("#ae9e00" "#ae9e00" "yellow"       ))
   (blue       '("#44b9b1" "#44b9b1" "brightblue"   ))
   (dark-blue  '("#6962c0" "#6962c0" "blue"         ))
   (magenta    '("#d47593" "#d47593" "brightmagenta"))
   (violet     '("#52263f" "#52263f" "magenta"      ))
   (cyan       '("#92fcfa" "#92fcfa" "brightcyan"   ))
   (dark-cyan  '("#44b9b1" "#44b9b1" "cyan"         ))

   (highlight      milkred)
   (vertical-bar   (doom-darken base1 0.1))
   (selection      milkblack)
   (builtin        orange)
   (comments       (if doom-milk-brighter-comments dark-cyan base8))
   (doc-comments   (doom-lighten (if doom-milk-brighter-comments dark-cyan base5) 0.25))
   (constants      violet)
   (functions      orange)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        green)
   (variables      (doom-lighten magenta 0.4))
   (numbers        yellow)
   (region         milkpurple)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if doom-milk-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-milk-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-milk-padded-modeline
      (if (integerp doom-milk-padded-modeline) doom-milk-padded-modeline 4))))

  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-milk-brighter-comments (doom-lighten bg 0.05) 'unspecified))
   ;; (hl-line                                     :background milkpurple)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-milk-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-milk-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
    ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#261b17" :foreground "#1b110e")

   ;;;; ivy
   (ivy-current-match :background milkred :distant-foreground milkpurple :weight 'bold)
   (ivy-cursor :foreground bg-alt
               :background fg)
   (ivy-minibuffer-match-highlight  :foreground yellow :weight 'bold)
   (ivy-highlight-face              :foreground yellow :weight 'bold)

   ;;;; orderless
   (orderless-match-face-0 :weight 'bold :foreground (doom-blend milkred   fg 0.8) :background (doom-blend milkred  bg 0.1))
   (orderless-match-face-1 :weight 'bold :foreground (doom-blend red     fg 0.6) :background (doom-blend red    bg 0.1))
   (orderless-match-face-2 :weight 'bold :foreground (doom-blend green   fg 0.6) :background (doom-blend green  bg 0.1))
   (orderless-match-face-3 :weight 'bold :foreground (doom-blend cyan    fg 0.6) :background (doom-blend cyan   bg 0.1))

   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)

   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)

   ;;;; ediff <built-in>
   (ediff-current-diff-A        :foreground red :weight 'bold :background (doom-lighten red 0.4))
   (ediff-current-diff-B        :foreground green :weight 'bold :background (doom-lighten green 0.4))
   (ediff-current-diff-C        :foreground blue :weight 'bold :background (doom-lighten blue 0.4))

   ;;;; org <built-in>
   (org-level-1 :bold t :foreground milkred :weight 'bold)
   (org-level-2 :foreground yellow)
   (org-level-3 :foreground orange)

   ;;;; solaire-mode
   (solaire-hl-line-face :background milkpurple)
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))
  ;;;; Base theme variable overrides-
  ())

;;; doom-milk-theme.el ends here
