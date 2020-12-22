;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Joey Bloom"
      user-mail-address "15joeybloom@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; , instead of SPC m
(setq doom-localleader-key ",")

;; SPC SPC is M-x like spacemacs
(map! :leader :desc "Open like spacemacs" "SPC" #'counsel-M-x)

;; SPC n opens the nth window
(map! :leader "0" #'winum-select-window-0-or-10)
(map! :leader "1" #'winum-select-window-1)
(map! :leader "2" #'winum-select-window-2)
(map! :leader "3" #'winum-select-window-3)
(map! :leader "4" #'winum-select-window-4)
(map! :leader "5" #'winum-select-window-5)
(map! :leader "6" #'winum-select-window-6)
(map! :leader "7" #'winum-select-window-7)
(map! :leader "8" #'winum-select-window-8)
(map! :leader "9" #'winum-select-window-9)

;; workspace commands start with SPC l like spacemacs
;; Mnemonic: "layout"
;; stolen from .emacs.d/modules/config/default/+evil-bindings.el
(map! :leader (:when (featurep! :ui workspaces)
               (:prefix-map ("l" . "workspace")
                :desc "Display tab bar"           "TAB" #'+workspace/display
                :desc "Switch workspace"          "."   #'+workspace/switch-to
                :desc "Switch to last workspace"  "`"   #'+workspace/other
                :desc "New workspace"             "n"   #'+workspace/new
                :desc "Load workspace from file"  "l"   #'+workspace/load
                :desc "Save workspace to file"    "s"   #'+workspace/save
                :desc "Delete session"            "x"   #'+workspace/kill-session
                :desc "Delete this workspace"     "d"   #'+workspace/delete
                :desc "Rename workspace"          "r"   #'+workspace/rename
                :desc "Restore last session"      "R"   #'+workspace/restore-last-session
                :desc "Next workspace"            "]"   #'+workspace/switch-right
                :desc "Previous workspace"        "["   #'+workspace/switch-left
                :desc "Switch to 1st workspace"   "1"   #'+workspace/switch-to-0
                :desc "Switch to 2nd workspace"   "2"   #'+workspace/switch-to-1
                :desc "Switch to 3rd workspace"   "3"   #'+workspace/switch-to-2
                :desc "Switch to 4th workspace"   "4"   #'+workspace/switch-to-3
                :desc "Switch to 5th workspace"   "5"   #'+workspace/switch-to-4
                :desc "Switch to 6th workspace"   "6"   #'+workspace/switch-to-5
                :desc "Switch to 7th workspace"   "7"   #'+workspace/switch-to-6
                :desc "Switch to 8th workspace"   "8"   #'+workspace/switch-to-7
                :desc "Switch to 9th workspace"   "9"   #'+workspace/switch-to-8
                :desc "Switch to final workspace" "0"   #'+workspace/switch-to-final)))

;; SPC t c to toggle fill column indicator
(map! :leader "tc" #'fci-mode)

;; , e f eval-defun
(map! :map emacs-lisp-mode-map :localleader :n "ef" #'eval-defun)
(map! :map clojure-mode-map :localleader :n "ef" #'cider-eval-defun-at-point)

(use-package! aggressive-indent
  :hook
  (clojure-mode . aggressive-indent-mode)
  (lisp-mode . aggressive-indent-mode)
  (emacs-lisp-mode . aggressive-indent-mode))

;; (use-package! evil-cleverparens
;;   :hook
;;   (clojure-mode . evil-cleverparens-mode)
;;   (lisp-mode . evil-cleverparens-mode)
;;   (emacs-lisp-mode . evil-cleverparens-mode))

(use-package! fill-column-indicator
  :hook
  (clojure-mode . fci-mode))

(use-package! smartparens
  :init (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
  :hook ((clojure-mode . smartparens-strict-mode)
         (lisp-mode . smartparens-strict-mode)
         (emacs-lisp-mode . smartparens-strict-mode)))

;; Fix unbalanced parens in insert state
;; https://github.com/hlissner/doom-emacs/issues/478
(after! smartparens
  (dolist (brace '("(" "{" "[" "'" "\""))
    (sp-pair brace nil :unless nil)))

(after! clojure-mode
  (define-clojure-indent
    (are 1)
    (match-result 1)
    (wrap-response 3)
    (p 1)))

(set-popup-rule! "^\\*cider-repl" :select nil :side 'right :size 80)

;; paredit
(map! :leader
      (:prefix-map ("k" . "smartparens")
       "s" #'sp-forward-slurp-sexp
       "S" #'sp-backward-slurp-sexp
       "b" #'sp-forward-barf-sexp
       "B" #'sp-backward-barf-sexp
       "e" #'sp-splice-sexp-killing-forward
       "E" #'sp-splice-sexp-killing-backward
       "r" #'sp-raise-sexp
       "c" #'sp-convolute-sexp
       "t" #'sp-transpose-sexp
       "J" #'sp-join-sexp)
      (:prefix-map ("j" . "split")
       "s" #'sp-split-sexp))