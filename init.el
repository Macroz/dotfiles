;;; package --- Emacs dotfile
;;; Commentary:
;;; my Emacs dotfile

;; should be fixed in emacs 26.3 and 27.x
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;; Code:
(require 'package)

;;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(cider
    company
    green-phosphor-theme
    rainbow-delimiters
    rainbow-mode
    mic-paren
    markdown-mode
    git-gutter-fringe+
    ;;ace-jump-mode
    projectile
    minimap
    magit
    whitespace
    web-mode
    js3-mode
    json-mode
    clj-refactor
    dired-sidebar
    tramp-term
    highlight-symbol
    expand-region
    dired-hide-dotfiles
    dired-narrow
    ;;key-chord
    ;;key-seq
    hydra
    iedit
    gh
    mmm-mode
    powerline
    eshell-git-prompt
    diminish
    exec-path-from-shell
    helm-projectile
    wgrep-helm
    imenu-anywhere
    avy
    flycheck
    flycheck-clj-kondo
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(defmacro call-with-negative-argument (command)
  `(lambda ()
     (interactive)
     (prefix-command-preserve-state)
     (setq prefix-arg '-)
     (universal-argument--mode)
     (call-interactively ,command)))

;;(setq mac-command-modifier 'meta)
;;(setq mac-option-modifier 'none)

;; font
;;(set-frame-font "Inconsolata-10:style=Medium")
;;(set-default-font "Inconsolata-12:style=Medium")
;;(set-default-font "Inconsolata-20:style=Medium")
;;(set-default-font "Menlo-20:style=Medium")
(add-to-list 'default-frame-alist '(font . "Inconsolata for Powerline-14:style=Medium"))
;;(add-to-list 'default-frame-alist '(font . "InputSansNarrow-Thin"))

;; disable scrollbars and menus
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)



;; select theme
(load-theme 'green-phosphor t)

;; background color
(set-frame-parameter (selected-frame) 'red '(80 80))
(set-frame-parameter (selected-frame) 'blue '(80 80))
(set-frame-parameter (selected-frame) 'green '(100 100))
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(set-background-color "#102510")
;;(set-background-color "black")
(add-to-list 'default-frame-alist '(alpha 90 90))



;; clojure-mode
(add-to-list 'load-path "~/dev/clojure-mode")
(require 'clojure-mode)

;; rainbow parentheses
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(setq-default frame-background-mode 'dark)

;; parenthesis highlight
(paren-activate)
(setq paren-sexp-mode t)
(setq paren-highlight-at-point t)
(set-face-background 'paren-face-match "#204020")



;; projectile

;;(load-file "~/fork/projectile/projectile.el")
;;(require 'projectile)
;;(load-file "~/fork/helm-projectile/helm-projectile.el")
;;(require 'helm-projectile)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-for-comint-mode t)
 '(backup-by-copying t)
 '(backup-by-copying-when-linked t)
 '(browse-url-browser-function (quote browse-url-chrome))
 '(cider-connected-hook nil)
 '(cider-interactive-eval-output-destination (quote repl-buffer))
 '(cider-lein-parameters "with-profile +dev repl :headless")
 '(cider-mode-line-show-connection nil)
 '(cider-repl-print-length 1000000)
 '(cider-stacktrace-default-filters (quote (java tooling dup)))
 '(cljr-magic-require-namespaces
   (quote
    (("io" . "clojure.java.io")
     ("set" . "clojure.set")
     ("str" . "clojure.string")
     ("walk" . "clojure.walk")
     ("zip" . "clojure.zip")
     ("time-core" . "clj-time.core")
     ("time-format" . "clj-time.format")
     ("time-coerce" . "clj-time.coerce"))))
 '(clojure-defun-indents (quote (PUT POST GET context)))
 '(custom-enabled-themes (quote (green-phosphor)))
 '(custom-safe-themes
   (quote
    ("c158c2a9f1c5fcf27598d313eec9f9dceadf131ccd10abc6448004b14984767c" "0c387e27a3dd040b33c6711ff92e13bd952369a788eee97e4e4ea2335ac5528f" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(dired-clean-confirm-killing-deleted-buffers nil)
 '(dired-dwim-target t)
 '(dired-omit-files "^\\.?#")
 '(dired-sidebar-disable-dired-collapse t)
 '(dired-use-ls-dired t)
 '(ediff-merge-split-window-function (quote split-window-vertically))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(eshell-history-size 10000)
 '(eshell-ls-use-in-dired nil nil (em-ls))
 '(eshell-visual-commands
   (quote
    ("vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm" "less")))
 '(frame-background-mode (quote dark))
 '(global-whitespace-mode t)
 '(grep-files-aliases
   (quote
    (("all" . "* .*")
     ("el" . "*.el")
     ("ch" . "*.[ch]")
     ("c" . "*.c")
     ("cc" . "*.cc *.cxx *.cpp *.C *.CC *.c++")
     ("cchh" . "*.cc *.[ch]xx *.[ch]pp *.[CHh] *.CC *.HH *.[ch]++")
     ("hh" . "*.hxx *.hpp *.[Hh] *.HH *.h++")
     ("h" . "*.h")
     ("l" . "[Cc]hange[Ll]og*")
     ("m" . "[Mm]akefile*")
     ("tex" . "*.tex")
     ("texi" . "*.texi")
     ("asm" . "*.[sS]")
     ("clj" . "*.clj *.cljs"))))
 '(grep-find-command
   (quote
    ("find . -type f -exec grep --color -nH -e  {} +" . 42)))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "target")))
 '(grep-find-template
   "find . <X> -type f <F> -exec grep <C> --color -nH -e <R> {} +")
 '(grep-highlight-matches (quote auto))
 '(grep-template "grep <X> <C> --color -nH -e <R> <F>")
 '(grep-use-null-device nil)
 '(highlight-symbol-idle-delay 0.5)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(linum-format "%d ")
 '(magit-diff-paint-whitespace (quote uncommitted))
 '(magit-diff-section-arguments (quote ("--no-ext-diff")))
 '(magit-ediff-dwim-show-on-hunks t t)
 '(markdown-header-scaling t)
 '(max-specpdl-size 15000)
 '(minimap-enlarge-certain-faces (quote always))
 '(minimap-width-fraction 0.1)
 '(minimap-window-location (quote right))
 '(package-selected-packages
   (quote
    (rainbow-mode use-package flycheck flycheck-clj-kondo flycheck-joker avy imenu-anywhere wgrep-helm helm-projectile diminish eshell-git-prompt powerline zpresent mmm-mode gh dired-collapse dired-narrow iedit cider yaml-mode web-mode tramp-term rainbow-delimiters neotree minimap mic-paren markdown-mode+ magit json-mode js3-mode htmlize highlight-symbol green-phosphor-theme expand-region clojure-mode-extra-font-locking company-mode)))
 '(powerline-gui-use-vcs-glyph t)
 '(powerline-height 40)
 '(projectile-globally-ignored-buffers nil)
 '(projectile-globally-ignored-directories
   (quote
    (".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "node_modules" "resources/node")))
 '(projectile-globally-ignored-file-suffixes (quote ("~")))
 '(projectile-mode t nil (projectile))
 '(rainbow-html-colors-major-mode-list
   (quote
    (html-mode css-mode php-mode nxml-mode clojurescript-mode clojure-mode xml-mode)))
 '(rainbow-r-colors-major-mode-list (quote (clojurescript-mode clojure-mode ess-mode)))
 '(safe-local-variable-values (quote ((cljr-suppress-no-project-warning . t))))
 '(split-height-threshold nil)
 '(term-suppress-hard-newline t)
 '(tramp-connection-properties nil)
 '(tramp-default-method "ssh")
 '(wdired-allow-to-change-permissions (quote advanced))
 '(web-mode-css-indent-offset 2)
 '(wgrep-auto-indent-buffer t)
 '(wgrep-auto-save-buffer t)
 '(whitespace-action nil)
 '(whitespace-line-column nil)
 '(whitespace-style (quote (face tabs trailing newline empty tab-mark))))

;; indent all with tab
(defun macroz-format-buffer ()
  "Format the buffer"
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(defun macroz-format-toplevel-sexp ()
  "Format the toplevel sexp"
  (interactive)
  (save-excursion
    (beginning-of-defun)
    (push-mark)
    (mark-sexp)
    (indent-region (point) (mark))
    (delete-trailing-whitespace (point-min) (point-max))
    (untabify (point-min) (point-max))
    ;;(untabify (point) (mark))
    (pop-mark)))

(defun indent-buffer ()
  (macroz-format-buffer))

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

;;(global-set-key (kbd "C-i") 'indent-sexp)
(global-set-key (kbd "C-M-<tab>") 'macroz-format-buffer)
(global-set-key (kbd "C-M-f") 'toggle-fullscreen)
(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)


(require 'minimap)
;;(global-set-key (kbd "C-x C-o") 'minimap-create)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#102510" :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 102 :width normal :foundry "PfEd" :family "Inconsolata for Powerline"))))
 '(clojure-function-definition-face ((t (:inherit font-lock-function-name-face :weight bold :height 1.8 :family "Ubuntu"))))
 '(clojure-keyword-definition-face ((t (:inherit clojure-keyword-face :weight bold :height 1.8 :family "Ubuntu"))))
 '(clojure-namespace-definition-face ((t (:inherit font-lock-type-face :height 4.0 :family "Ubuntu"))))
 '(clojure-type-definition-face ((t (:inherit font-lock-type-face :weight bold :height 1.8 :family "Ubuntu"))))
 '(clojure-variable-definition-face ((t (:inherit font-lock-variable-name-face :weight bold :height 1.8 :family "Ubuntu"))))
 '(cursor ((t (:background "white"))))
 '(dired-directory ((t (:inherit font-lock-function-name-face :background "#305030"))))
 '(dired-perm-write ((t nil)))
 '(ediff-even-diff-A ((t (:background "dim gray"))))
 '(ediff-even-diff-B ((t (:background "dim gray"))))
 '(ediff-even-diff-C ((t (:background "dim gray"))))
 '(eshell-default-face ((t (:inherit default :foreground "green" :weight light :family "Inconsolata for Powerline"))))
 '(eshell-git-prompt-powerline-dir-face ((t (:background "#205020"))))
 '(eshell-git-prompt-powerline-not-clean-face ((t (:background "indian red"))))
 '(eshell-ls-backup ((t (:foreground "gray"))))
 '(eshell-ls-clutter ((t (:foreground "red" :weight bold))))
 '(eshell-ls-directory ((t (:background "#205020" :foreground "green yellow" :weight bold))))
 '(eshell-ls-product ((t (:foreground "gray"))))
 '(eshell-ls-readonly ((t (:foreground "dark green"))))
 '(eshell-ls-special ((t (:foreground "chartreuse" :weight bold))))
 '(eshell-ls-symlink ((t (:foreground "chartreuse" :weight bold))))
 '(eshell-prompt ((t (:foreground "green yellow" :weight bold))))
 '(flycheck-fringe-error ((t nil)))
 '(flycheck-fringe-info ((t nil)))
 '(flycheck-fringe-warning ((t nil)))
 '(flycheck-info ((t (:underline (:color "white" :style wave)))))
 '(flycheck-warning ((t (:underline (:color "yellow" :style wave)))))
 '(font-lock-comment-delimiter-face ((t (:foreground "dim gray" :height 2.0))))
 '(font-lock-comment-face ((t (:foreground "dim gray" :height 2.0))))
 '(font-lock-doc-face ((t (:foreground "gray50"))))
 '(font-lock-function-name-face ((t (:foreground "green yellow" :weight bold :height 1.0))))
 '(font-lock-keyword-face ((t (:foreground "green yellow" :weight bold))))
 '(font-lock-string-face ((t (:foreground "forest green" :slant oblique))))
 '(font-lock-type-face ((t (:foreground "DarkSeaGreen4"))))
 '(font-lock-variable-name-face ((t (:foreground "green yellow" :weight bold :height 1.0))))
 '(font-lock-warning-face ((t (:background "#504840"))))
 '(fringe ((t (:background "#102510"))))
 '(gh-it-header ((t (:inherit font-lock-type-face :foreground "pale green"))))
 '(gh-it-header-face ((t (:inherit font-lock-function-name-face))))
 '(gh-it-issue-face ((t (:inherit font-lock-function-name-face :foreground "OliveDrab2"))))
 '(gh-it-label-face ((t (:inherit font-lock-comment-face :height 0.5))))
 '(gh-it-milestone-header-face ((t (:inherit gh-it-header-face :height 1.5))))
 '(gh-it-screen-header-face ((t (:inherit gh-it-header-face :height 2.0))))
 '(gh-it-text-face ((t (:inherit font-lock-string-face :background "#153015" :height 0.8))))
 '(hydra-face-amaranth ((t (:foreground "gold" :weight bold))))
 '(hydra-face-blue ((t (:foreground "orange red" :weight bold))))
 '(hydra-face-pink ((t (:foreground "orange" :weight bold))))
 '(hydra-face-red ((t (:foreground "yellow" :weight bold))))
 '(js2-object-property ((t (:inherit font-lock-function-name-face))))
 '(lazy-highlight ((t (:background "PaleVioletRed4"))))
 '(linum ((t (:inherit (shadow default) :box nil))))
 '(markdown-header-face-1 ((t (:foreground "PaleGreen" :weight bold))))
 '(markdown-list-face ((t (:foreground "gray"))))
 '(minimap-active-region-background ((t (:background "gray20"))))
 '(powerline-inactive1 ((t (:background "#555" :foreground "gray70"))))
 '(powerline-inactive2 ((t (:background "#222" :foreground "gray60"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "grey90"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "grey70"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "grey50"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "grey30"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "grey90"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "grey70"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "grey50"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "grey30"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "grey90"))))
 '(region ((t (:background "gray25" :foreground "dim gray"))))
 '(web-mode-function-call-face ((t (:inherit font-lock-variable-name-face))))
 '(zpresent-base ((t (:height 4.0))))
 '(zpresent-whole-screen-face ((t (:background "#102510")))))

;;(require 'key-chord)

;;(key-chord-mode 1)

;;(require 'key-seq)


;; nrepl / cider

(require 'cider)

(setq cider-test-infer-test-ns (lambda (ns) ns))

;; Disable prompt on killing buffer with a process
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

(defun cider-kill ()
  "Kill all cider buffers and processes"
  (interactive)
  (let ((killed-any? nil))
    (dolist (process (process-list))
      (when (string-prefix-p "nrepl" (process-name process))
        (setq killed-any? t)
        (set-process-sentinel process
                              (lambda (proc evt) t))))
    (dolist (buffer (buffer-list))
      (when (string-prefix-p "*cider" (buffer-name buffer))
        (setq killed-any? t)
        (kill-buffer buffer))
      (when (string-prefix-p "*nrepl" (buffer-name buffer))
        (setq killed-any? t)
        (kill-buffer buffer)))
    killed-any?))

(defun force-cider-restart ()
  (interactive)
  (if (cider-kill)
      (message "Killed cider. Press once more to restart.")
    (progn
      (setq cider-lein-parameters "with-profile +dev repl :headless")
      (cider-jack-in nil))))

(defun force-cider-restart-test ()
  (interactive)
  (if (cider-kill)
      (message "Killed cider. Press once more to restart.")
    (progn
      (setq cider-lein-parameters "with-profile +test repl :headless")
      (cider-jack-in nil))))

(defun force-clojurescript-restart ()
  (interactive)
  (if (cider-kill)
      (message "Killed cider. Press once more to restart.")
    (progn
      (setq cider-cljs-lein-repl "(do (use 'figwheel-sidecar.repl-api) (start-figwheel!) (cljs-repl))")
      (cider-jack-in-clj&cljs '(:cljs-repl-type figwheel)))))

(defun macroz-revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (message "Reverting buffer")
  (revert-buffer t t))

(defun macroz-revert-all-buffers-no-confirm ()
  "Revert all buffers without confirmation."
  (interactive)
  (message "Reverting all buffers")
  (dolist (b (buffer-list))
    (with-current-buffer b
      (when (buffer-file-name) ; is it file and thus worth reverting?
        (revert-buffer t t)))))

(defun macroz-clean ()
  "Cleans the file of tabs and whitespace problems"
  (interactive)
  (message "Cleaning file")
  (setq tab-width 2)
  (untabify (point-min) (point-max))
  (whitespace-cleanup))

(defun macroz-format ()
  "Formats the file"
  (interactive)
  (message "Formatting file")
  (indent-region (point-min) (point-max) nil))

(defun macroz-save-and-load-buffer ()
  (interactive)
  (save-buffer)
  (cider-load-buffer))

(defun macroz-run-current-ns-tests ()
  (interactive)
  (macroz-save-and-load-buffer)
  (cider-test-run-ns-tests t))

(defun macroz-projectile-grep ()
  (interactive)
  (helm-projectile-grep)
  ;;(switch-to-buffer-other-window grep-last-buffer)
  )

(global-set-key (kbd "<f9>") 'force-cider-restart)
(global-set-key (kbd "C-<f9>") 'force-cider-restart-test)
(global-set-key (kbd "<f3>") 'helm-projectile-grep)
(global-set-key (kbd "<f5>") 'macroz-revert-buffer-no-confirm)
(global-set-key (kbd "C-<f5>") 'macroz-revert-all-buffers-no-confirm)
(global-set-key (kbd "<f6>") 'macroz-clean)
(global-set-key (kbd "<f1>") 'magit-status)

(setq magit-ediff-dwim-show-on-hunks t)

;; rebind caps-lock to F13
;; put in .bashrc?
;;(if (eq window-system 'x)
;;   (shell-command "xmodmap -e 'clear Lock' -e 'keycode 66 = F13'"))

;;(global-set-key (kbd "<f7>") 'macroz-format)
(global-set-key (kbd "<f7>") 'macroz-run-current-ns-tests)

(defun macroz-mark-sexp-for-eval ()
  (interactive)
  (setq make-marked-buffer (current-buffer))
  (setq make-marked-sexp (cider-last-sexp)))

(defun macroz-eval-marked-sexp ()
  (interactive)
  (when (get-buffer "*cider-out*")
    (kill-buffer "*cider-out*"))
  (if (and make-marked-buffer make-marked-sexp)
      (with-current-buffer make-marked-buffer
        (save-excursion
          (cider--pprint-eval-form make-marked-sexp)))
    (message "First mark sexp with `make-mark-sexp-for-eval`" 'font-lock-warning-face)))

(setq cider-repl-popup-stacktraces t)
(setq cider-repl-use-clojure-font-lock t)

;;(defun clj-mode-hook ()
;;  (cider-mode 1)
;;(highlight-symbol-mode 1)
;;  )

;;(add-hook 'clojure-mode-hook 'clj-mode-hook)
(add-hook 'clojure-mode-hook #'subword-mode)
;;(add-hook 'cider-repl-mode-hook #'subword-mode)

;;; clj-refactor

(defun macroz-clj-refactor-mode-hook ()
  "hook clj-refactor"
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (setq cljr-favor-prefix-notation nil)
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'macroz-clj-refactor-mode-hook)

;; Javascript indentation
(defun macroz-web-mode-hook ()
  "hook special web-mode settings such as indentation"
  ;;(setq js-indent-level 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook #'macroz-web-mode-hook)

;; Killing space across lines

(defun macroz-kill-spaces ()
  (interactive)
  (just-one-space -1))

(global-set-key (kbd "M-SPC") 'macroz-kill-spaces)

;; show tabs
(defface extra-whitespace-face '((t (:background "gray"))) "Used for tabs and such.")

(defvar extra-whitespace-keywords '(("\t" . 'extra-whitespace-face)))


;; use web-mode for JavaScript & .jsx files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css$\\'" . web-mode))

(global-set-key (kbd "<f8>") 'force-clojurescript-restart)


;;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

(require 'tramp-term)

;;(load-file "~/setup/lockstep.el")
;;(require 'lockstep)


;; autocompletion

(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
;;(global-set-key (kbd "TAB") #'company-complete)

(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

(defun delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file, except the last one"
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines)
      ;;(let ((trailnewlines (abs (skip-chars-backward "\n\t"))))
      ;;  (if (> trailnewlines 0)
      ;;      (progn
      ;;        (delete-char trailnewlines))))
      )))

(require 'highlight-symbol)

(require 'expand-region)

(global-set-key (kbd "M-e") nil)
(defhydra hydra-expand-region (global-map "M-e")
  "expand-region"
  ("M-e" er/expand-region "expand")
  ("M-r" er/contract-region "contract"))

;;(key-seq-define-global "er" 'hydra-expand-region/body)
;;(key-seq-define-global "er" 'er/expand-region)
;;(key-seq-define-global "ew" 'er/contract-region)
;;(global-set-key (kbd "C-er") 'er/expand-region)
;;(global-set-key (kbd "C-x C-x") (call-with-negative-argument #'exchange-point-and-mark))

;; projectile

(defun macroz-open-scratch ()
  "Open a project based scratch file for the ongoing work"
  (interactive)
  (let ((file (expand-file-name "scratch.md" (projectile-project-root))))
    (find-file-other-window file)))

(defun macroz-open-wisdom ()
  "Open a wisdom file for random gems of wisdom and todos"
  (interactive)
  (let ((file "/home/markku/dev/wisdom.md" ))
    (find-file-other-window file)))

(defun macroz-open-hours ()
  "Open a hour record file"
  (interactive)
  (let ((file "/home/markku/dev/hours.el" ))
    (find-file-other-window file)))

(require 'projectile)

(global-set-key (kbd "C-p") nil)
(global-set-key (kbd "C-p C-f") 'helm-projectile-find-file)
(global-set-key (kbd "<f2>") 'macroz-open-scratch)
(global-set-key (kbd "C-<f2>") 'macroz-open-wisdom)
(global-set-key (kbd "M-<f2>") 'macroz-open-hours)

(global-set-key (kbd "<f11>") 'macroz-mark-sexp-for-eval)
(global-set-key (kbd "<f12>") 'macroz-eval-marked-sexp)

;; customize rgrep

(defun macroz-modify-grep-text ()
  (let ((start-point (save-excursion
                       (with-current-buffer grep-last-buffer
                         (goto-line 5)
                         (point))))
        (end-point (save-excursion
                     (with-current-buffer grep-last-buffer
                       (goto-char (point-max))
                       (move-beginning-of-line nil)
                       (previous-line)
                       (previous-line)
                       (point)))))
    (save-excursion
      (with-current-buffer grep-last-buffer
        ;;(toggle-read-only)
        (narrow-to-region start-point end-point)))))

;;(defadvice grep (after macroz-modify-grep-text activate) (macroz-modify-grep-text))
;;(defadvice rgrep (after macroz-modify-grep-text activate) (macroz-modify-grep-text))
;;(defadvice recompile (after macroz-modify-grep-text activate) (macroz-modify-grep-text))

(defun macroz-compilation-finish (buffer desc)
  (if (and (string-match "*grep*" (buffer-name buffer))
           (string-match "finished" desc))
      (macroz-modify-grep-text)))

;; custom wgrep
(add-to-list 'load-path "~/fork/wgrep")
(require 'wgrep)



;;(add-hook 'projectile-grep-finished-hook 'macroz-modify-grep-text)
;;(add-hook 'compilation-finish-functions 'macroz-compilation-finish)

(defun macroz-wgrep-indent-all-buffers ()
  "Indent the buffers that wgrep changed."
  (interactive)
  (let ((count 0))
    (dolist (b (buffer-list))
      (with-current-buffer b
        (let ((ovs (wgrep-file-overlays)))
          (when (and ovs (buffer-modified-p))
            (macroz-format-buffer)
            (setq count (1+ count))))))
    (cond
     ((= count 0)
      (message "No buffer has been indented."))
     ((= count 1)
      (message "Buffer has been indented."))
     (t
      (message "%d buffers have been indented." count)))))

;; set backup by copying so that hard link files don't break
(setq backup-by-copying t)

;; highlight symbol
(add-hook 'prog-mode-hook (lambda () (highlight-symbol-mode)))

(defhydra hydra-highlight-symbol-next (global-map "C-n")
  "highlight-symbol-next"
  ("C-n" highlight-symbol-next "next")
  ("C-p" highlight-symbol-prev "previous"))

;;(setq highlight-symbol-on-navigation-p t)


;; remove fringe

(setq-default left-fringe-width 0)
(setq-default right-fringe-width 0)


;; pair programming mode
(global-set-key (kbd "<f10>") 'global-linum-mode)


;; moving regions

(defun move-region (start end n)
  "Move the current region up or down by N lines."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-region-up)
(global-set-key (kbd "M-<down>") 'move-region-down)

(require 'iedit)
(require 'dired-x)

(defun macroz-dired-jump (OTHER-WINDOW)
  (interactive "P")
  (if OTHER-WINDOW
      (dired-jump-other-window)
    (dired-jump)))

(global-set-key (kbd "C-x C-j") 'macroz-dired-jump)
(global-set-key (kbd "C-x C-f") 'dired-x-find-file)

(put 'dired-find-alternate-file 'disabled nil)

(defvar macroz-dired-hide 1)
(defvar macroz-dired-hide-details 0)

(defun macroz-toggle-dired-hide (&optional ARG)
  "Hide and show dired mode files"
  (interactive)
  (setq macroz-dired-hide (if (= 1 macroz-dired-hide) 0 1))
  (dired-omit-mode macroz-dired-hide)
  (dired-hide-dotfiles-mode macroz-dired-hide)
  (message (if (= 1 macroz-dired-hide) "Hiding dotfiles and such" "Showing dotfiles and everything")))

;; (defadvice macroz-dired-readin
;;     (after dired-after-updating-hook first () activate)
;;   "Sort dired listings with directories first before adding marks."
;;   (message "dired-after-updating-hook")
;;   (let ((dired-details-internal-overlay-list  ())) (dired-details-hide)))

(defun macroz-toggle-dired-hide-details-mode (&optional ARG)
  "Hide and show dired file details"
  (interactive)
  (setq macroz-dired-hide-details (if (= 1 macroz-dired-hide-details) 0 1))
  (dired-hide-details-mode macroz-dired-hide-details)
  (message (if (= 1 macroz-dired-hide-details) "Hiding file details" "Showing file details")))

(defun macroz-find-name-dired ()
  (interactive)
  (find-name-dired dired-directory (read-string "Find-name (filename wildcard): ")))

(defun macroz-find-grep-dired ()
  (interactive)
  (find-grep-dired dired-directory (read-string "Find-grep (grep regexp): ")))

(defun macroz-dired-mode-hook ()
  "Custom `dired' mode hook."
  (when (string= "dired-mode" major-mode)
    (dired-omit-mode macroz-dired-hide)
    (dired-hide-dotfiles-mode macroz-dired-hide)
    (dired-hide-details-mode macroz-dired-hide-details)
    (message (buffer-name)))
  ;;(dired-collapse-mode)
  (define-key dired-mode-map "." 'macroz-toggle-dired-hide)
  (define-key dired-mode-map ":" 'macroz-toggle-dired-hide-details-mode)
  (define-key dired-mode-map "," 'dired-collapse-mode)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file) ; was dired-find-file
  (define-key dired-mode-map (kbd "C-<return>") (lambda () (interactive) (find-alternate-file "..")))  ; like dired-up-directory
  (define-key dired-mode-map (kbd "<tab>") 'dired-subtree-toggle)
  (define-key dired-mode-map (kbd "/") 'dired-narrow)
  (define-key dired-mode-map (kbd "C-f") 'macroz-find-name-dired)
  (define-key dired-mode-map (kbd "C-M-f") 'macroz-find-grep-dired)
  (define-key dired-mode-map (kbd "C-c C-p") 'wdired-change-to-wdired-mode)
  ;; these are default options
  ;;(define-key dired-mode-map (kbd "C-x C-s") 'wdired-finish-edit)
  ;;(define-key dired-mode-map (kbd "C-c C-k") 'wdired-abort-changes)
  )

(add-hook 'dired-mode-hook 'macroz-dired-mode-hook)

(require 'dired-sidebar)
(global-set-key (kbd "C-§") 'dired-sidebar-toggle-sidebar)

;;(add-hook 'dired-after-readin-hook 'macroz-toggle-dired-hide)

;;(require 'neotree)

;;(global-set-key (kbd "§") 'neotree-toggle)

(require 'git-gutter-fringe+)
(setq-default left-fringe-width 10)
(setq-default right-fringe-width 0)
(global-git-gutter+-mode 1)

;; gh-it

(add-to-list 'load-path "~/dev/gh-it")

(when (featurep 'gh-it)
  (unload-feature 'gh-it t))
(require 'gh-it)
(setq gh-organization "CSCfi")
(setq gh-repository "rems")
(setq gh-it-issues nil)
(setq gh-it-milestones nil)
(setq cached-gh-it-issues nil)
(setq cached-gh-it-milestones nil)

(defun macroz-reload-gh-it-open-it ()
  (interactive)
  (when (featurep 'gh-it)
    (unload-feature 'gh-it t))
  (require 'gh-it)
  (setq gh-it-organization "CSCfi")
  (setq gh-it-repository "rems")
  (when (not cached-gh-it-issues)
    (gh-it-read-data)
    (setq cached-gh-it-issues gh-it-issues)
    (setq cached-gh-it-milestones gh-it-milestones)
    (message "Cached gh-it data"))

  (setq gh-it-issues cached-gh-it-issues)
  (setq gh-it-milestones cached-gh-it-milestones)
  (gh-it-open-it))

(global-set-key (kbd "C-<f1>") 'macroz-reload-gh-it-open-it)
;;(global-set-key (kbd "C-<f1>") 'gh-open-it)

(setq zpresent-default-background-color "#102520")
(setq zpresent-fullscreen-on-zpresentation nil)
(setq zpresent-delete-other-windows nil)

;; eshell

;;(defface eshell-comment-face '((t (:height 1.0))) "User in eshell for comments")

(defface eshell-default-face '((t (:inherit default :weight light :family "Inconsolata for Powerline"))) "User in eshell for comments")

(defun eshell-other-window (&optional ARG)
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (if ARG (eshell ARG) (eshell))))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(defun macroz-eshell-new ()
  "Open a new instance of eshell."
  (interactive)
  ;;(split-window-below)
  (eshell-other-window 'N))

(defun macroz-eshell ()
  "Open the eshell"
  (interactive)
  (eshell))

(global-set-key (kbd "C-M-<return>") 'macroz-eshell-new)
(global-set-key (kbd "C-<return>") 'macroz-eshell)

(defun macroz-eshell-mode-hook ()
  (interactive)
  (setq buffer-face-mode-face 'eshell-default-face)
  (buffer-face-mode)
  ;;(set (make-local-variable 'font-lock-comment-face) 'eshell-comment-face)
  )

(add-hook 'eshell-mode-hook 'macroz-eshell-mode-hook)

;; powerline

(powerline-default-theme)
(eshell-git-prompt-use-theme 'powerline)

;; remove VC backend from vc-mode-line

(defadvice vc-mode-line (after strip-backend () activate)
  (when (stringp vc-mode)
    (let ((noback (replace-regexp-in-string
                   (format "^ %s." (vc-backend buffer-file-name))
                   " " vc-mode)))
      (setq vc-mode noback))))

;; (setcdr (assq 'vc-mode mode-line-format)
;;         '((:eval (replace-regexp-in-string "^ Git" " " vc-mode)))))

;; diminish, hide minor modes

(require 'diminish)

(diminish 'clj-refactor-mode)
(diminish 'highlight-symbol-mode)
(diminish 'projectile-mode)
(diminish 'git-gutter+-mode)
(diminish 'subword-mode)
(diminish 'yas-minor-mode)
(diminish 'projectile-mode)
(diminish 'company-mode)
(diminish 'global-whitespace-mode)
(diminish 'eldoc-mode)
(diminish 'buffer-face-mode)
(diminish 'auto-revert-mode)
;;(diminish 'dired-hide-dotfiles-mode)
;;(diminish 'dired-omit-mode)
;;(diminish 'dired-mode)

;; multiple cursors
(require 'multiple-cursors)

(defun mc/toggle-cursor-at-point ()
  "Add or remove a cursor at point."
  (interactive)
  (if multiple-cursors-mode
      (message "Cannot toggle cursor at point while `multiple-cursors-mode' is active.")
    (let ((existing (mc/fake-cursor-at-point)))
      (if existing
          (mc/remove-fake-cursor existing)
        (mc/create-fake-cursor-at-point)))))

(add-to-list 'mc/cmds-to-run-once 'mc/toggle-cursor-at-point)
(add-to-list 'mc/cmds-to-run-once 'multiple-cursors-mode)

(global-set-key (kbd "C-M-,") 'mc/toggle-cursor-at-point)
(global-set-key (kbd "C-M-;") 'mc/mark-all-like-this)
(global-set-key (kbd "C-M-:") 'multiple-cursors-mode)

;; PATH setting
;; https://github.com/purcell/exec-path-from-shell

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))



;; Custom commands

(global-set-key (kbd "C-<tab>") 'macroz-format-toplevel-sexp)

(fset 'macroz-sexp-up
      [?\C-\M-k ?\C-\M-u ?\C-y ?\C-\M-k C-M-left C-tab])

(global-set-key (kbd "C-M-<up>") 'macroz-sexp-up)
(put 'downcase-region 'disabled nil)




(defconst macroz-all-parens-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?{ "(}" table)
    (modify-syntax-entry ?} "){" table)
    (modify-syntax-entry ?\( "()" table)
    (modify-syntax-entry ?\) ")(" table)
    (modify-syntax-entry ?\[ "(]" table)
    (modify-syntax-entry ?\] ")[" table)
    (modify-syntax-entry ?\\ "'" table)
    table)
  "A syntax table giving all parenthesis syntax.")

(defun macroz-smart-close-paren ()
  (interactive)
  (let (pos closing)
    (with-syntax-table macroz-all-parens-syntax-table
      (setq pos (save-excursion (up-list -1) (point)))
      (setq closing (matching-paren (char-after pos))))
    (and (eq (char-syntax (char-before pos)) ?\\)
         (not (eq (char-syntax (char-before (1- pos))) ?\\))
         (insert (char-before pos)))
    (insert closing)))

(global-set-key (kbd ")") 'macroz-smart-close-paren)
(global-set-key (kbd "C-M-<backspace>") (lambda () (interactive) (kill-sexp -1)))


;; winner mode
(winner-mode 1)

;; helm projectile

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-§") #'helm-imenu-anywhere)

(global-set-key (kbd "§") #'helm-projectile-grep)
(global-set-key (kbd "<f13>") #'avy-goto-char)

(defun macroz-projectile-project-buffers ()
  (interactive)
  (projectile-current-project-files))

;;(setq imenu-anywhere-buffer-list-function 'projectile-project-buffers)

(require 'flycheck)
(require 'flycheck-clj-kondo)
(add-hook 'clojure-mode-hook 'flycheck-mode)
(setq flycheck-indication-mode nil)



(load-file "/home/markku/dev/highlight-tail/highlight-tail.el")
(require 'highlight-tail)

(setq highlight-tail-colors '(("white" . 0)
                              ("chartreuse" . 30)
                              ("black" . 90)))

(setq highlight-tail-steps 8
      highlight-tail-timer 0.05)

(highlight-tail-mode)

(fset 'macroz-yank-replace-sexp
      [?\C-y ?\C-\M-k C-M-left ?\C-\M-k ?\C-y C-M-left])

(global-set-key (kbd "C-M-y") 'macroz-yank-replace-sexp)

(add-to-list 'load-path "~/dev/rainbow-mode")
(require 'rainbow-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-turn-on)
(add-hook 'web-mode-hook 'rainbow-turn-on)
(add-hook 'css-mode-hook 'rainbow-turn-on)
(add-hook 'clojure-mode-hook 'rainbow-turn-on)
