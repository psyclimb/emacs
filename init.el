;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;JMS custom emacs configuration;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Modes
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode +1)
(column-number-mode +1)

;;Modeline
(display-time-mode +1)
(mode-line-bell-mode +1)

;;Prompting
(defalias 'yes-or-no-p 'y-or-n-p)

;;File handling
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq custom-file "/dev/null")

;;Keyboard shortcuts
(defun split-and-follow-horizontally ()
  "Creates a new window horizontally and moves the cursor to that window."
      (interactive)
      (split-window-below)
      (balance-windows)
      (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  "Creates a new window vertically and moves the cursor to that window."
      (interactive)
      (split-window-right)
      (balance-windows)
      (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(defun list-buffers-and-follow (&optional arg)
  "Shows a list of current buffers in the minibuffer and moves the cursor there."
      (interactive "P")
      (display-buffer (list-buffers-noselect arg))
      (other-window 1))
(global-set-key (kbd "C-x C-b") 'list-buffers-and-follow)

(defun dired-shortcut ()
  "Launches dired."
  (interactive)
  (dired "/home/jms/"))
(global-set-key (kbd "C-c d") 'dired-shortcut)

(defun chatgpt-shortcut ()
  "Launches chatgpt."
  (interactive)
  (chatgpt))
(global-set-key (kbd "C-c g") 'chatgpt-shortcut)

(defun emacs-init-shortcut ()
  "Opens my Emacs init.el file."
  (interactive)
  (find-file "/home/jms/.emacs.d/init.el"))
(global-set-key (kbd "C-c i") 'emacs-init-shortcut)

;;Package initialization
(package-initialize)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '( "jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/") t)

(dolist (package '(use-package))
   (unless (package-installed-p package)
     (package-install package)))
;(package-refresh-contents)

;;Packages
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (which-key-mode))

(use-package swiper
      :ensure t
      :bind ("C-s" . 'swiper))

(use-package beacon
  :ensure t
  :diminish beacon-mode
  :init
  (beacon-mode 1))

(use-package define-word
  :ensure t)

(use-package chatgpt
  :ensure t)

;;ChatGPT
;(setq openai-key "key-goes-here")

;;EWW
(add-hook 'eww-mode-hook (lambda () (setq-local shr-inhibit-images t)))

;;Startup buffer
(setq inhibit-startup-message t)
(eshell)
