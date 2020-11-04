; General UI fixes
(setq inhibit-startup-message t)
(scroll-bar-mode -1)              ; Disable visible scrollbar
(tool-bar-mode -1)                ; Disable tool bar
(tooltip-mode -1)                 ; Disable tooltips
(menu-bar-mode -1)                ; Disable menu bar
(setq ring-bell-function 'ignore) ; No bell whatsover

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
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join))

;; general.el
(use-package general
  :config
  (general-create-definer matty/leader-keys
    :states '(normal motion)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC"))
  
;; rainbow-delimiters
(use-package rainbow-delimiters
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; dracula theme
(use-package dracula-theme
  :init
  (load-theme 'dracula t))

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
(custom-set-variables '(git-gutter:hide-gutter t)) ; Do not show if no changes

;; terminal
(use-package vterm
  :commands vterm
  :config
  (setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
  (setq vterm-max-scrollback 10000))

;; lsp
(defun efs/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . efs/lsp-mode-setup)
  :init
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
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

  "g" '(magit-status :which-key "git")

  "w" '(evil-window-map :which-key "window")

  "f" '(:ignore t :which-key "files")
  "ff" '(counsel-find-file :which-key "find file")
  "fr" '(vc-rename-file :which-key "rename file")

  "l" '(:ignore t :which-key "lsp"))

; TODOS
; counsel-ag
