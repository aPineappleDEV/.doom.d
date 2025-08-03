;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;;(setq doom-font 'cozette)
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This i s the default:
;; (setq doom-theme 'doom-gruvbox)
(load-theme 'zenburn t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/NOTES/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; ============================
;;   DASHBOARD CUSTOMIZATION
;; ============================
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-loaded)
(add-hook! '+doom-dashboard-mode-hook #'hide-mode-line-mode)
(setq! +doom-dashboard--width 200)

(defun my-ascii-art ()
  (let* ((banner '(
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠒⠦⣄⣠⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠀⠀⢹⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡏⠀⠀⢸⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⠀⠀⠀⣾⣿⡟⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡿⣆⠀⢰⣿⣿⡇⢹⠀⠀⠀⠀⠀⠀⣠⣴⣾⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡏⠀⠹⣆⣾⣿⣷⠇⠘⡇⠀⠀⢠⣴⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⣶⠖⣤⠀⠀⢸⠀⠀⠀⣿⣿⣿⡟⠀⠀⢧⣤⣾⣿⣿⣿⡏⢠⠃⠀⠀⠀⢠⠏⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠚⠛⠛⢻⡀⠈⠳⣄⢸⠀⠀⠀⢹⣿⣿⣦⣀⡀⢸⣿⣯⠛⢻⣿⣶⡟⠀⠀⢀⣤⣿⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢶⢤⡀⠀⠀⠀⠀⠀⣇⠀⠀⠈⣿⠀⠀⠀⠘⣿⣿⣿⣽⣻⣿⣿⣿⡷⠋⠙⡿⠀⣠⠔⣉⣠⠇⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠆⠙⠲⣄⡀⠀⠀⢻⠀⠀⠀⠸⣇⠀⠀⠀⣿⣿⣿⣿⣿⣾⣿⣿⣷⠶⠞⠛⣿⠹⠶⢿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢤⡀⠄⠀⠈⠻⣤⠀⢘⣦⠀⣦⣼⣧⠀⠀⠀⢻⣿⣿⣿⣿⠟⠃⠋⠀⠀⠀⠀⣿⣶⣤⡄⠃⣀⣤⣤⣶⡿⠁⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠻⢿⣆⠠⣄⡈⢻⣷⣔⢦⡀⠈⣷⣽⣿⡿⠃⢿⣿⡄⠀⠀⠸⣿⣿⠋⠁⠀⠀⣀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣽⠿⠋⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠳⣄⠙⢦⣽⣞⢧⡹⣿⣿⣿⣸⠁⠀⠈⢿⣿⣤⡄⢠⣿⣧⣀⣠⡶⢿⡿⠁⠀⢀⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠶⢤⣤⣀⣀⡀⠘⢦⡀⢹⣿⡏⠻⣝⣿⣿⡿⠀⠀⠀⣨⡿⠋⣷⣾⣿⠿⠋⠙⠿⢾⡇⠀⠀⣸⣿⣿⣿⣿⣏⣀⣤⣶⡖⢒⣶⡾⠋⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠺⣭⣝⣾⣇⠀⢹⣷⡀⠹⣜⣿⣿⡶⣤⣴⣯⢀⣀⣻⣿⣟⡀⠀⠀⠀⢸⡇⠀⠀⣿⣿⣿⣏⣼⣿⣿⣿⣟⣠⠟⠉⠀⠀⠀⠀              _                              __                "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⠀⠀⢻⣷⡀⠙⠛⣿⣿⣿⣿⣿⣛⡋⣹⣿⠁⠀⠀⠀⠀⣼⣇⠀⢰⣿⣿⣿⣿⣿⣿⣿⠟⢛⠁⠀⠀⠀⠀⠀⠀       ____  (_)___  ___  ____ _____  ____  / /__              "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣧⠀⠀⠻⣿⣄⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⢸⣿⡇⠀⢸⣿⣿⣿⡿⠟⢁⣴⠞⠀⠛⠛⡦⣤⡀⠀⠀      / __ \\/ / __ \\/ _ \\/ __ `/ __ \\/ __ \\/ / _ \\             "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀⠈⢻⣷⣦⣀⣿⣿⣦⣬⣿⡟⣿⣿⣿⣿⣿⣿⣇⡀⠀⠀⢸⣿⡆⠀⣸⣿⠟⢁⣤⣾⣿⠛⠀⠀⠀⠀⠀⠀⠀⢀⠀     / /_/ / / / / /  __/ /_/ / /_/ / /_/ / /  __/             "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠻⢿⣿⣷⡶⠒⠺⢿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣿⣿⠛⢿⣧⣿⣷⣰⣤⣾⡟⠁⣰⢟⣱⣾⣿⠿⠿⠖⠋⠀⠀⠀⠀⠀⠀⠀⣸⡦    / .___/_/_/ /_/\\___/\\__,_/ .___/ .___/_/\\___/              "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⠿⠛⠛⠻⠿⢦⣤⣴⣿⣿⣿⣿⣻⣿⣿⣿⣿⣧⣤⣼⣿⣿⠛⢻⣿⣿⣿⣧⣞⡻⢿⣿⣿⣶⡢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠳   /_/                      /_/   /_/                          "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠋⠀⠀⢀⣤⣴⣂⣄⣿⣿⢿⣿⣿⣿⣿⣿⣿⣽⡿⣿⣿⣿⣿⡿⢠⢼⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣌⢂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                                               "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢁⣴⣿⠿⠿⠿⢛⣽⣿⣿⣿⣿⣿⣿⣿⡟⠈⠻⠿⣿⣻⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣤⣀⡀⠈⣿⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀    ░███████  ░█████████████   ░██████    ░███████   ░███████  "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠛⣹⣇⣀⣰⣦⣬⣭⣿⣿⣿⣿⠛⠙⠿⣷⣦⠀⢀⠀⢉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣍⠉⠙⢶⡇⠀⢠⠆⠀⠀⠀⠀⠀⠀⠀⠀   ░██    ░██ ░██   ░██   ░██       ░██  ░██    ░██ ░██        "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡴⢻⣿⣿⣿⣿⣍⣹⣿⡟⠛⠣⠀⠀⠀⠈⠉⣑⣿⣶⣾⣿⣿⣿⣿⣿⡟⠻⣾⠿⠟⢻⣿⣯⠋⠳⡀⠈⣷⣤⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀   ░█████████ ░██   ░██   ░██  ░███████  ░██         ░███████  "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣿⢿⡟⠛⢻⣿⣧⣤⡾⣻⣿⣧⣄⠀⠀⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡿⣿⣾⣦⠀⠈⠙⠿⣆⠄⢻⡀⠛⣯⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ░██        ░██   ░██   ░██ ░██   ░██  ░██    ░██        ░██ "
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢴⣾⢿⣧⣿⣿⣶⣶⣞⣛⣻⣿⣻⡏⣛⣻⣷⣿⣷⣮⡿⠻⣿⣿⣿⠿⣿⡟⢿⣦⢹⡞⢮⡙⢿⣧⢠⠀⠀⠘⠀⠀⣧⠀⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀    ░███████  ░██   ░██   ░██  ░█████░██  ░███████   ░███████  "
"⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣷⠾⣻⠋⠻⣿⣏⠋⠙⣟⡟⣻⣿⣿⣿⢻⣏⡟⣿⣿⣟⣿⣿⣿⣿⣿⣝⢷⣿⡇⠀⠈⢿⣾⣿⣿⣶⡀⠀⠄⠆⢿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                                               "
"⠀⠀⠀⠀⠀⠀⠀⣴⣿⢙⣿⡿⢴⡋⢀⣴⣿⡟⠙⠂⠈⣧⣿⣿⠟⠻⣾⣿⣿⣍⡉⠻⣾⣩⣿⣿⣿⣻⡿⣿⣅⡀⠀⠘⣿⠟⠘⠛⢿⣾⣶⣀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                                               "
"⠀⠀⠀⠀⠀⢀⣼⣾⣿⡟⣿⣷⠀⣙⣛⣻⣿⣧⣤⣤⣴⣟⠛⢻⣿⣿⣿⣤⣤⣮⡟⣿⣷⣶⠗⣻⣿⣯⣷⣾⣿⠁⠀⠀⢸⣇⠀⠀⠀⠙⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                                               "
"⠀⠀⠀⠀⠀⣾⣿⣿⡟⣧⣾⣿⡛⢁⡤⡶⠀⢹⣿⣟⠁⣠⡄⠀⢿⠻⢧⣴⠏⢘⡇⣿⠛⠋⠈⠁⣿⣦⣙⣻⣿⡿⠂⠀⢸⡟⠃⠀⠀⠀⠘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                                               "
"⠀⠀⠀⠀⣸⣿⢻⣿⣄⣹⣿⣿⡛⣿⣹⣁⢀⣼⡇⢹⣿⣻⣷⣾⣿⣆⠸⠿⠋⠛⣛⣿⣦⡄⣀⣴⠿⡿⣿⣿⡿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⣰⡿⣿⠀⣿⣿⠇⠀⣿⣿⠋⠈⢉⣽⣿⣿⣄⣉⣂⣹⣶⠿⢿⣷⣶⣶⣿⣽⣿⡿⣻⢿⣭⠦⠀⣿⣯⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⣸⣿⣷⢙⣿⡏⣿⠀⠀⣿⣿⣶⡾⠛⣹⢶⣿⣿⡟⢻⡏⠰⣆⣈⢻⡎⢿⣋⡽⠛⢷⣹⡀⠀⠙⠀⣛⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⢸⣿⣹⣿⣿⣿⡿⠛⠓⣛⣿⣿⢿⣃⡞⡟⠀⠈⢹⠙⢿⣣⡜⠃⠙⢹⣷⠘⠋⠘⠒⢚⣿⣿⣦⡤⢻⣻⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⣸⣟⣿⡿⠀⢿⣶⣴⣿⣿⠃⢿⣌⣹⡛⢧⣤⣀⣸⡇⠼⠛⠳⠤⠶⢾⣿⣤⣄⣠⡤⠛⣛⣷⠘⣧⣴⢿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠈⢻⣿⡙⠳⠀⣨⣿⣿⢹⡿⣄⢸⣿⡏⠻⢂⣠⣼⣽⣿⣄⣀⣀⣴⡖⢛⣉⢻⣿⣷⠀⣠⢿⣿⡼⣿⣋⣾⡵⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠢⣼⣿⡹⢶⣤⣿⢿⣿⠘⢧⡿⠶⣿⣷⣿⣟⣻⣿⡆⠉⢻⣿⣿⣿⠃⢠⠿⣶⣷⠘⠚⣇⠀⣿⣦⣶⣾⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⣈⣿⣷⢺⢿⢻⠈⣿⡶⠀⢀⣾⣿⣿⣿⠟⠛⠿⡟⢠⡀⡇⠹⣤⡼⠃⠀⢉⣿⡄⠀⣈⣼⣿⡛⡛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⢀⣈⣳⡎⠈⣏⠋⣻⣿⣿⠋⠀⣿⠃⠹⣦⣾⣶⡇⢸⡄⣿⡄⠀⠀⠀⢉⡿⣯⣿⣾⡿⣿⣽⣧⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠙⢧⣀⠀⣠⣿⣿⠋⠳⡄⢿⣦⣄⠋⠀⠈⠛⠛⠳⣿⣿⡦⣾⡟⠉⣶⡈⣿⣿⡞⣛⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠘⠿⢷⣿⡇⣿⠀⠀⢷⠘⣿⠛⢀⣇⣀⣠⣴⣾⣿⠉⠙⣏⣀⣾⠿⣿⣿⢋⡌⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⢷⣻⣿⡦⠴⠾⠂⢻⣶⠟⣋⣉⣉⡙⢻⣗⠀⠺⣾⣽⡿⠶⣾⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀         ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⣤⣤⣤⡟⠙⣟⣻⡿⠛⣿⠿⣿⢫⠞⢋⣠⣤⠿⡥⠤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣦⡙⠁⢠⠦⠼⠶⢿⣟⠛⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⡙⠛⠒⠒⠲⢿⡏⣛⠛⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))


(setq +doom-dashboard-ascii-banner-fn #'my-ascii-art)


;; ============================
;;        SET VARIABLE
;; ============================
(setq server-stop-automatically nil)
(setq dap-python-debugger 'debugpy)
(setq projectile-project-search-path '("/home/pineapple/CODE/"))
(setq deft-directory '"/home/pineapple/NOTES/")
(setq deft-extensions '("org"))
(setq deft-recursive 't)
(beacon-mode 1)
(setq beacon-dont-blink-commands '(previous-line forward-line))
(setq beacon-blink-when-focused 't)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; ============================
;;        DAP CONFIGS
;; ============================

(require 'dap-python)
(require 'dap-node)

;; ============================
;;          KEYBINDS
;; ============================

(map! "<f5>" 'dap-disconnect)
(map! "<f7>" 'dap-continue)
(map! "<f8>" 'dap-next)
(map! "<f6>" 'dap-step-in)
(map! "<f9>" 'dap-step-out)
(map! "M-r" 'evil-multiedit-match-all)
(global-unset-key (kbd "C-x C-z"))
(map! "M-<up>" 'drag-stuff-up)
(map! "M-<down>" 'drag-stuff-down)
(map! :leader
      "y"
      'yascroll-bar-mode)

;; ============================
;;            OTHER
;; ============================
(drag-stuff-mode t)
(global-yascroll-bar-mode 1)
(global-line-reminder-mode t)
(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)
(inhibit-mouse-mode t)
(setq deft-strip-summary-regexp "\\`\\(.+\n\\)+\n")
    (defun cm/deft-parse-title (file contents)
    "Parse the given FILE and CONTENTS and determine the title.
  If `deft-use-filename-as-title' is nil, the title is taken to
  be the first non-empty line of the FILE.  Else the base name of the FILE is
  used as title."
      (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
        (if begin
            (string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
          (deft-base-filename file))))

    (advice-add 'deft-parse-title :override #'cm/deft-parse-title)

    (setq deft-strip-summary-regexp
          (concat "\\("
                  "[\n\t]" ;; blank
                  "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
                  "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
                  "\\)"))

;; ============================
;;          ORG STUFF
;; ============================

(with-eval-after-load 'org (global-org-modern-mode))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'org-download)
(add-hook 'dired-mode-hook 'org-download-enable)

(setq org-roam-directory "/home/pineapple/NOTES/")
(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(defun my-org-faces ()
    (set-face-attribute 'org-document-title nil :height 2.5)
    (set-face-attribute 'org-document-info nil :height 2.5)
    (set-face-attribute 'org-document-info-keyword nil :height 0.5)
    (set-face-attribute 'org-level-1 nil :height 2.0)
    (set-face-attribute 'org-level-2 nil :height 1.8)
    (set-face-attribute 'org-level-3 nil :height 1.6)
    (set-face-attribute 'org-level-4 nil :height 1.4)
    (set-face-attribute 'org-level-5 nil :height 1.2)
    )

(add-hook 'org-mode-hook #'my-org-faces)
;; (add-hook! 'org-mode-hook 'doom-docs-mode)
(add-hook 'org-mode-hook 'org-modern-mode)
