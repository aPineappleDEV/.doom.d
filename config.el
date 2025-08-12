;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; |0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000|
;; |+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+- beginning of my configuration +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-|
;; |0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000|

;; ============================
;;           TESTING
;; ============================

;; nothing to test...

;; ============================

;; |-------------------------------------------------------------------------------------------------------------------------------------------|
;; |++++++++++++++++++++++++++++++++++++++++++++++++++++++           !VANITY!            ++++++++++++++++++++++++++++++++++++++++++++++++++++++|
;; |-------------------------------------------------------------------------------------------------------------------------------------------|

;; ============================
;;          GENERAL
;; ============================

;; oooooo THEME ooooooo
(setq doom-theme 'doom-gruvbox)

;; oooooo FONT  ooooooo
(setq! doom-font (font-spec :family "Unifont" :size 20 :weight 'medium))

;; change the git file/dir name background color in vterm to make the file/dir name readable
(after! vterm
  (set-face-attribute 'vterm-color-green nil :background "black")
  )

;; maximize window frame on open
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; ============================
;;   DASHBOARD CUSTOMIZATION
;; ============================
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-loaded)
(add-hook! '+doom-dashboard-functions (hide-mode-line-mode 1))
(setq! +doom-dashboard--width -250)
(setq! +doom-dashboard-name "P I N E A P P L E")
(setq frame-title-format '("%b    |    E M A C S")
      icon-title-format frame-title-format)

(defun my-ascii-art ()
  (let* ((banner '(
"                                     ⠒⠦⣄⣠⠄                       "
"                                     ⣠  ⢹⣿⡆                      "
"                                    ⣠⡏  ⢸⣿⣧                      "
"                                   ⢀⣿   ⣾⣿⡟⡆         ⣀⡀          "
"                                   ⣾⡿⣆ ⢰⣿⣿⡇⢹      ⣠⣴⣾⡟           "
"                                  ⢀⡏ ⠹⣆⣾⣿⣷⠇⠘⡇  ⢠⣴⣿⣿⣿⡿            "
"                           ⣀⡤⣶⠖⣤  ⢸   ⣿⣿⣿⡟  ⢧⣤⣾⣿⣿⣿⡏⢠⠃   ⢠⠏       "
"                    ⢀⡀    ⠚⠛⠛⢻⡀⠈⠳⣄⢸   ⢹⣿⣿⣦⣀⡀⢸⣿⣯⠛⢻⣿⣶⡟  ⢀⣤⣿        "
"                     ⠙⢶⢤⡀     ⣇  ⠈⣿   ⠘⣿⣿⣿⣽⣻⣿⣿⣿⡷⠋⠙⡿ ⣠⠔⣉⣠⠇        "
"                      ⠈⠆⠙⠲⣄⡀  ⢻   ⠸⣇   ⣿⣿⣿⣿⣿⣾⣿⣿⣷⠶⠞⠛⣿⠹⠶⢿⡟         "
"                      ⢤⡀⠄ ⠈⠻⣤ ⢘⣦ ⣦⣼⣧   ⢻⣿⣿⣿⣿⠟⠃⠋    ⣿⣶⣤⡄⠃⣀⣤⣤⣶⡿⠁   "
"              ⠈⠙⠛⠻⢿⣆⠠⣄⡈⢻⣷⣔⢦⡀⠈⣷⣽⣿⡿⠃⢿⣿⡄  ⠸⣿⣿⠋⠁  ⣀   ⣸⣿⣿⣿⣿⣿⣿⣽⠿⠋     "
"                   ⠉⠳⣄⠙⢦⣽⣞⢧⡹⣿⣿⣿⣸⠁ ⠈⢿⣿⣤⡄⢠⣿⣧⣀⣠⡶⢿⡿⠁ ⢀⣿⣿⣿⣿⣿⡿⠟⠁       "
"              ⠰⠶⢤⣤⣀⣀⡀⠘⢦⡀⢹⣿⡏⠻⣝⣿⣿⡿   ⣨⡿⠋⣷⣾⣿⠿⠋⠙⠿⢾⡇  ⣸⣿⣿⣿⣿⣏⣀⣤⣶⡖⢒⣶⡾⠋  "
"                 ⠈⠙⠺⣭⣝⣾⣇ ⢹⣷⡀⠹⣜⣿⣿⡶⣤⣴⣯⢀⣀⣻⣿⣟⡀   ⢸⡇  ⣿⣿⣿⣏⣼⣿⣿⣿⣟⣠⠟⠉                  _                              __                "
"                    ⠈⢻⣿⣿  ⢻⣷⡀⠙⠛⣿⣿⣿⣿⣿⣛⡋⣹⣿⠁    ⣼⣇ ⢰⣿⣿⣿⣿⣿⣿⣿⠟⢛⠁             ____  (_)___  ___  ____ _____  ____  / /__              "
"                      ⠘⢿⣧  ⠻⣿⣄ ⠻⣿⣿⣿⣿⣿⣿⣿⣿⡄   ⢸⣿⡇ ⢸⣿⣿⣿⡿⠟⢁⣴⠞ ⠛⠛⡦⣤⡀        / __ \\/ / __ \\/ _ \\/ __ `/ __ \\/ __ \\/ / _ \\             "
"             ⣀⣀⣀⣀⣀⣀⣀⡀  ⠈⢻⣷⣦⣀⣿⣿⣦⣬⣿⡟⣿⣿⣿⣿⣿⣿⣇⡀  ⢸⣿⡆ ⣸⣿⠟⢁⣤⣾⣿⠛       ⢀      / /_/ / / / / /  __/ /_/ / /_/ / /_/ / /  __/             "
"               ⠈⠉⠉⠻⢿⣿⣷⡶⠒⠺⢿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣿⣿⠛⢿⣧⣿⣷⣰⣤⣾⡟⠁⣰⢟⣱⣾⣿⠿⠿⠖⠋       ⣸⡦    / .___/_/_/ /_/\\___/\\__,_/ .___/ .___/_/\\___/              "
"                ⣠⣶⠿⠛⠛⠻⠿⢦⣤⣴⣿⣿⣿⣿⣻⣿⣿⣿⣿⣧⣤⣼⣿⣿⠛⢻⣿⣿⣿⣧⣞⡻⢿⣿⣿⣶⡢⣄         ⠘⠳   /_/                      /_/   /_/                          "
"              ⢀⡞⠋  ⢀⣤⣴⣂⣄⣿⣿⢿⣿⣿⣿⣿⣿⣿⣽⡿⣿⣿⣿⣿⡿⢠⢼⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣌⢂                                                                         "
"              ⠛⢁⣴⣿⠿⠿⠿⢛⣽⣿⣿⣿⣿⣿⣿⣿⡟⠈⠻⠿⣿⣻⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣤⣀⡀⠈⣿ ⠂             ░███████  ░█████████████   ░██████    ░███████   ░███████  "
"              ⠐⠛⣹⣇⣀⣰⣦⣬⣭⣿⣿⣿⣿⠛⠙⠿⣷⣦ ⢀ ⢉⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣍⠉⠙⢶⡇ ⢠⠆           ░██    ░██ ░██   ░██   ░██       ░██  ░██    ░██ ░██        "
"              ⣀⡴⢻⣿⣿⣿⣿⣍⣹⣿⡟⠛⠣   ⠈⠉⣑⣿⣶⣾⣿⣿⣿⣿⣿⡟⠻⣾⠿⠟⢻⣿⣯⠋⠳⡀⠈⣷⣤⡏            ░█████████ ░██   ░██   ░██  ░███████  ░██         ░███████  "
"           ⢠⣶⣿⢿⡟⠛⢻⣿⣧⣤⡾⣻⣿⣧⣄  ⢀⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡿⣿⣾⣦ ⠈⠙⠿⣆⠄⢻⡀⠛⣯             ░██        ░██   ░██   ░██ ░██   ░██  ░██    ░██        ░██ "
"         ⣠⢴⣾⢿⣧⣿⣿⣶⣶⣞⣛⣻⣿⣻⡏⣛⣻⣷⣿⣷⣮⡿⠻⣿⣿⣿⠿⣿⡟⢿⣦⢹⡞⢮⡙⢿⣧⢠  ⠘  ⣧ ⠛⠃             ░███████  ░██   ░██   ░██  ░█████░██  ░███████   ░███████  "
"        ⣼⣿⣿⣷⠾⣻⠋⠻⣿⣏⠋⠙⣟⡟⣻⣿⣿⣿⢻⣏⡟⣿⣿⣟⣿⣿⣿⣿⣿⣝⢷⣿⡇ ⠈⢿⣾⣿⣿⣶⡀ ⠄⠆⢿                                                                           "
"       ⣴⣿⢙⣿⡿⢴⡋⢀⣴⣿⡟⠙⠂⠈⣧⣿⣿⠟⠻⣾⣿⣿⣍⡉⠻⣾⣩⣿⣿⣿⣻⡿⣿⣅⡀ ⠘⣿⠟⠘⠛⢿⣾⣶⣀⡿                                                                           "
"     ⢀⣼⣾⣿⡟⣿⣷ ⣙⣛⣻⣿⣧⣤⣤⣴⣟⠛⢻⣿⣿⣿⣤⣤⣮⡟⣿⣷⣶⠗⣻⣿⣯⣷⣾⣿⠁  ⢸⣇   ⠙⣿⣿⠃                                                                           "
"     ⣾⣿⣿⡟⣧⣾⣿⡛⢁⡤⡶ ⢹⣿⣟⠁⣠⡄ ⢿⠻⢧⣴⠏⢘⡇⣿⠛⠋⠈⠁⣿⣦⣙⣻⣿⡿⠂ ⢸⡟⠃   ⠘⠋                                                                            "
"    ⣸⣿⢻⣿⣄⣹⣿⣿⡛⣿⣹⣁⢀⣼⡇⢹⣿⣻⣷⣾⣿⣆⠸⠿⠋⠛⣛⣿⣦⡄⣀⣴⠿⡿⣿⣿⡿⡇                       "
"   ⣰⡿⣿ ⣿⣿⠇ ⣿⣿⠋⠈⢉⣽⣿⣿⣄⣉⣂⣹⣶⠿⢿⣷⣶⣶⣿⣽⣿⡿⣻⢿⣭⠦ ⣿⣯⣿⡇                       "
"  ⣸⣿⣷⢙⣿⡏⣿  ⣿⣿⣶⡾⠛⣹⢶⣿⣿⡟⢻⡏⠰⣆⣈⢻⡎⢿⣋⡽⠛⢷⣹⡀ ⠙ ⣛⣿⣿⡇                       "
" ⢸⣿⣹⣿⣿⣿⡿⠛⠓⣛⣿⣿⢿⣃⡞⡟ ⠈⢹⠙⢿⣣⡜⠃⠙⢹⣷⠘⠋⠘⠒⢚⣿⣿⣦⡤⢻⣻⣿⡟⠁                       "
" ⣸⣟⣿⡿ ⢿⣶⣴⣿⣿⠃⢿⣌⣹⡛⢧⣤⣀⣸⡇⠼⠛⠳⠤⠶⢾⣿⣤⣄⣠⡤⠛⣛⣷⠘⣧⣴⢿⡟⠁                        "
"⠈⢻⣿⡙⠳ ⣨⣿⣿⢹⡿⣄⢸⣿⡏⠻⢂⣠⣼⣽⣿⣄⣀⣀⣴⡖⢛⣉⢻⣿⣷ ⣠⢿⣿⡼⣿⣋⣾⡵⠃                        "
"⠢⣼⣿⡹⢶⣤⣿⢿⣿⠘⢧⡿⠶⣿⣷⣿⣟⣻⣿⡆⠉⢻⣿⣿⣿⠃⢠⠿⣶⣷⠘⠚⣇ ⣿⣦⣶⣾⡏                          "
" ⣈⣿⣷⢺⢿⢻⠈⣿⡶ ⢀⣾⣿⣿⣿⠟⠛⠿⡟⢠⡀⡇⠹⣤⡼⠃ ⢉⣿⡄ ⣈⣼⣿⡛⡛⠋                           "
" ⢀⣈⣳⡎⠈⣏⠋⣻⣿⣿⠋ ⣿⠃⠹⣦⣾⣶⡇⢸⡄⣿⡄   ⢉⡿⣯⣿⣾⡿⣿⣽⣧⠟                            "
"   ⠙⢧⣀ ⣠⣿⣿⠋⠳⡄⢿⣦⣄⠋ ⠈⠛⠛⠳⣿⣿⡦⣾⡟⠉⣶⡈⣿⣿⡞⣛⡉                              "
"    ⠘⠿⢷⣿⡇⣿  ⢷⠘⣿⠛⢀⣇⣀⣠⣴⣾⣿⠉⠙⣏⣀⣾⠿⣿⣿⢋⡌⠉⠉                              "
"       ⢷⣻⣿⡦⠴⠾⠂⢻⣶⠟⣋⣉⣉⡙⢻⣗ ⠺⣾⣽⡿⠶⣾⡿⠋⠁                                "
"        ⠈⠻⣦⣤⣤⣤⡟⠙⣟⣻⡿⠛⣿⠿⣿⢫⠞⢋⣠⣤⠿⡥⠤                                  "
"            ⠈⢻⣿⣦⡙⠁⢠⠦⠼⠶⢿⣟⠛⠛⠃                                      "
"              ⠈⡙⠛⠒⠒⠲⢿⡏⣛⠛⡀                                        "
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

(define-derived-mode +doom-dashboard-mode special-mode
  (format "pineapples are good"))

;; ============================
;;        BEACON MODE
;; ============================
(beacon-mode 1)
(setq! beacon-dont-blink-commands '(previous-line forward-line))
(setq! beacon-blink-when-focused 't)

;; ============================
;;        DOOM MODELINE
;; ============================
(setq! doom-modeline-total-line-number t)


;; |-------------------------------------------------------------------------------------------------------------------------------------------|
;; |++++++++++++++++++++++++++++++++++++++++++++++++++++++        !FUNCTIONALITY!        ++++++++++++++++++++++++++++++++++++++++++++++++++++++|
;; |-------------------------------------------------------------------------------------------------------------------------------------------|

;; ============================
;;           GENERAL
;; ============================

;; display line numbers on the side
(setq display-line-numbers-type t)

;; prevent emacs daemon from stopping automatically
(setq! server-stop-automatically nil)

;; remember which line the file was closed at
(global-line-reminder-mode t)

;; prevent usage of mouse
(inhibit-mouse-mode t)

;; prevent auto save
(auto-save-mode -1)

;; focus follows cursor
(setq mouse-autoselect-window t)

;; unbind C-x C-z so i dont accidentally close the window
(global-unset-key (kbd "C-x C-z"))


;; ============================
;;          Kill Ring
;; ============================
(map! :leader
      :desc "Browse kill ring"
      "l k"
      'browse-kill-ring)

;; ============================
;;          PROJECTILE
;; ============================
(setq! projectile-project-search-path '("/mnt/6F3BD10716AFAD5C/CODE/"))
(setq! projectile-ignored-projects '("~/" "~/.doom.d" "~/.emacs.d" "/mnt/6F3BD10716AFAD5C/NOTES"))

;; ============================
;;          EVIL STUFF
;; ============================
(map! "M-r" 'evil-multiedit-match-all)

;; ============================
;;       DRAG-STUFF MODE
;; ============================
(drag-stuff-mode t)
(map! "M-<up>" 'drag-stuff-up)
(map! "M-<down>" 'drag-stuff-down)

;; ============================
;;           LOOKUP
;; ============================
(map! :leader
      :prefix
      :desc "+lookup"
      "c l")
(map! :leader
      :desc "lookup documentation"
      "c l k"
      '+lookup/documentation)
(map! :leader
      :desc "lookup definition"
      "c l d"
      '+lookup/definition)
(map! :leader
      :desc "lookup references"
      "c l D"
      '+lookup/references)
(map! :leader
      :desc "lookup implementation"
      "c l i"
      '+lookup/implementations)
(map! :leader
      :desc "lookup type definition"
      "c l t"
      '+lookup/type-definition)

;; ============================
;;         LSP BRIDGE
;; ============================


(setq! lsp-bridge-python-lsp-server "pylsp")
(setq! lsp-bridge-enable-hover-diagnostic t)

(map! :leader
      :desc "Rename symbol (LSP-BRIDGE)"
      "c r"
      'lsp-bridge-rename)

(map! :leader
      :desc "Format code (LSP-BRIDGE)"
      "c f"
      'lsp-bridge-code-format)

(map! :leader
      :desc "Popup documentation (LSP-BRIDGE)"
      "c k"
      'lsp-bridge-popup-documentation)

(map! :leader
      :desc "Go to definition (LSP-BRIDGE)"
      "c d"
      'lsp-bridge-find-def)

(map! :leader
      :desc "Find references (LSP-BRIDGE)"
      "c D"
      'lsp-bridge-find-references)

(map! :leader
      :desc "Find implementation (LSP-BRIDGE)"
      "c i"
      'lsp-bridge-find-impl)

(map! :leader
      :desc "Find type definition (LSP-BRIDGE)"
      "c t"
      'lsp-bridge-find-type-def)

(map! :leader
      :desc "Documentation in buffer (LSP-BRIDGE)"
      "c b d"
      'lsp-bridge-show-documentation)

(map! :leader
      :desc "List diagnostics (LSP-BRIDGE)"
      "c x"
      'lsp-bridge-diagnostic-list)

(map! :leader
      :desc "Code actions (LSP-BRIDGE)"
      "c a"
      'lsp-bridge-code-action)

;; ============================
;;        DAPE DEBUGGER
;; ============================
(map! "<f5>" 'dape-quit)
(map! "<f7>" 'dape-continue)
(map! "<f8>" 'dape-next)
(map! "<f6>" 'dape-step-in)
(map! "<f9>" 'dape-step-out)

;; ============================
;;  OTHER PROGRAMMING PACKAGES
;; ============================

(require 'highlight-parentheses)
(add-hook 'prog-mode-hook #'highlight-parentheses-mode)
(add-hook 'minibuffer-setup-hook #'highlight-parentheses-minibuffer-setup)

;; ============================
;;          ORG STUFF
;; ============================

(setq org-directory "/mnt/6F3BD10716AFAD5C/NOTES/")
(with-eval-after-load 'org (global-org-modern-mode))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(require 'org-download)
(add-hook 'org-mode-hook 'org-download-enable)
(add-hook 'dired-mode-hook 'org-download-enable)

(setq org-roam-directory "/mnt/6F3BD10716AFAD5C/NOTES/")
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
(add-hook 'org-mode-hook 'org-modern-mode)

;; ============================
;;            DEFT
;; ============================

(setq! deft-directory '"/mnt/6F3BD10716AFAD5C/NOTES/")
(setq! deft-extensions '("org"))
(setq! deft-recursive 't)

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
;;       SCROLL-ON-JUMP
;; ============================

(with-eval-after-load 'evil
  (scroll-on-jump-advice-add evil-undo)
  (scroll-on-jump-advice-add evil-redo)
  (scroll-on-jump-advice-add evil-jump-item)
  (scroll-on-jump-advice-add evil-jump-forward)
  (scroll-on-jump-advice-add evil-jump-backward)
  (scroll-on-jump-advice-add evil-ex-search-next)
  (scroll-on-jump-advice-add evil-ex-search-previous)
  (scroll-on-jump-advice-add evil-forward-paragraph)
  (scroll-on-jump-advice-add evil-backward-paragraph)
  (scroll-on-jump-advice-add evil-goto-mark)

  ;; Actions that themselves scroll.
  (scroll-on-jump-with-scroll-advice-add evil-goto-line)
  (scroll-on-jump-with-scroll-advice-add evil-goto-first-line)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-down)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-up)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-center)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-top)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-bottom))

(with-eval-after-load 'goto-chg
  (scroll-on-jump-advice-add goto-last-change)
  (scroll-on-jump-advice-add goto-last-change-reverse))

(global-set-key (kbd "<C-M-next>") (scroll-on-jump-interactive 'diff-hl-next-hunk))
(global-set-key (kbd "<C-M-prior>") (scroll-on-jump-interactive 'diff-hl-previous-hunk))
(setq! scroll-on-jump-duration 0.4)

;; |0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000|
;; |+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-    end of my configuration    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-|
;; |0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000|

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
;; (load-theme 'kaolin t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "/mnt/6F3BD10716AFAD5C/NOTES/")


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
