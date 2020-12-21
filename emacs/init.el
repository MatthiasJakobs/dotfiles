; General UI fixes
(setq inhibit-startup-message t)
(scroll-bar-mode -1)              ; Disable visible scrollbar
(tool-bar-mode -1)                ; Disable tool bar
(tooltip-mode -1)                 ; Disable tooltips
(menu-bar-mode -1)                ; Disable menu bar
(setq ring-bell-function 'ignore) ; No bell whatsover

; Put backups in certain directories
(setq backup-directory-alist `(("." . "~/.emacs_saves")))

; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; Appearance
(set-face-attribute 'default nil :font "Fira Code" :height 100)
(column-number-mode)
(global-hl-line-mode 1)

;; line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)
(dolist (mode '(org-mode-hook
		term-mode-hook
		vterm-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Better compilation (auto-scrolling)
(setq compilation-scroll-output t)

;; Put this stuff in separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

; Package management
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org"   . "https://orgmode.org/elpa/")
			 ("elpa"  . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

; Packages
;; ivy
(use-package ivy
  :diminish   ; do not show mode name in list
  :bind(:map ivy-minibuffer-map
	     ("RET" . ivy-alt-done)
	     ("C-j" . ivy-next-line)
	     ("C-k" . ivy-previous-line)
	     ("C-h" . counsel-up-directory)
	:map ivy-switch-buffer-map
	     ("C-k" . ivy-previous-line)
	     ("C-j" . ivy-next-line)
	:map ivy-reverse-i-search-map
	     ("C-k" . ivy-previous-line))
  :config
)
(ivy-mode 1)
(setq ivy-initial-inputs-alist nil)

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; evil mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybindings nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)
  (define-key evil-motion-state-map (kbd "RET") nil))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; general.el
(use-package general
  :config
  (general-create-definer matty/leader-keys
    :states '(normal motion)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC"))

(general-simulate-key "C-c")
  
;; rainbow-delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; doom-dracula theme
(use-package doom-themes
  :init (load-theme 'doom-dracula t))

;; dired
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :custom ((dired-listing-switches "-agho --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-up-directory
    "l" 'dired-find-file))

;; which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;; doom-modline
(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

;; projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/code")
    (setq projectile-project-search-path '("~/code"))))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

;; git
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-magit
  :after magit)

(use-package git-gutter)
(global-git-gutter-mode +1)

;; org-stuff
(setq org-return-follows-link t)

;; roam
(use-package org-roam
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/exocortex/org-roam/"))

;; terminal
(use-package vterm
  :commands vterm
  :config
  (setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
  (setq vterm-max-scrollback 10000))
(add-hook 'vterm-mode-hook (lambda ()
  (setq-local global-hl-line-mode nil)))

;; lsp
(use-package lsp-mode
  :commands
  (lsp lsp-deferred)
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ivy)

(use-package dap-mode
  :config
  (general-define-key
   :keymaps 'lsp-mode-map
   :prefix lsp-keymap-prefix
   "d" '(dap-hydra t :wk "debugger"))
  (setq dap-auto-configure-features '(repl controls tooltip)))

;; python
(use-package python-mode
  :ensure t
  :hook
  (python-mode . lsp-deferred)
  :config
  (require 'dap-python))

(use-package pyvenv
  :init
  (setenv "WORKON_HOME" "~/.miniconda3/envs")
  :config
  (pyvenv-mode t))

;; Latex
(use-package reftex
  :hook
  (latex-mode . reftex-mode))

(use-package ivy-bibtex
  :config
  (setq bibtex-completion-bibliography '("~/exocortex/library.bib"))
  (setq bibtex-completion-pdf-field "File")
  (setq bibtex-completion-notes-path "~/exocortex/org-roam/")
  (setq ivy-bibtex-default-action 'ivy-bibtex-edit-notes))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection)
         ("C-k" . company-select-previous)
         ("C-j" . company-select-next))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

; Keybindings
(matty/leader-keys
  "SPC" '(counsel-M-x :which-key "M-x")
 
  "b" '(:ignore t :which-key "buffers")
  "bb" '(counsel-switch-buffer :which-key "switch buffers")
  "bs" '(counsel-switch-to-shell-buffer :which-key "shell buffer")
  "bp" '(previous-buffer :which-key "previous buffer")
  "bd" '(kill-this-buffer :which-key "delete buffer")

  "p" '(projectile-command-map :which-key "projectile")
  "/" '(comment-or-uncomment-region :which-key "comment")

  "g" '(magit-status :which-key "git")

  "w" '(evil-window-map :which-key "window")

  "f" '(:ignore t :which-key "files")
  "ff" '(counsel-find-file :which-key "find file")
  "fr" '(vc-rename-file :which-key "rename file")

  "m" '(general-simulate-C-c :which-key "major")

  "d" '(:ignore t :which-key "dap")
  "dd" '(dap-debug :which-key "start debugging")
  "ds" '(dap-disconnect :which-key "stop debugging")
  "dl" '(dap-debug-last :which-key "debug last config")
  "db" '(dap-breakpoint-toggle :which-key "toggle breakpoint")
  "dh" '(dap-hydra :which-key "hydra")
  "dB" '(dap-ui-breakpoints-list :which-key "list breakpoints")
  "dn" '(dap-next :which-key "next")
  "dc" '(dap-continue :which-key "continue")
  "di" '(dap-step-in :which-key "step in")
  "do" '(dap-step-out :which-key "step out")

  "r" '(:ignore t :which-key "research")
  "rb" '(ivy-bibtex :which-key "search bibliography")
  "rf" '(org-roam-find-file :which-key "find note")
  "ri" '(org-roam-insert :which-key "insert note")
  "ra" '(org-roam-alias-add :which-key "add alias")

  "l" '(:ignore t :which-key "lsp")
  "ll" '(lsp :which-key "start lsp")
  "lr" '(lsp-find-references :which-key "find references")
  "ld" '(lsp-find-definition :which-key "find definition"))

