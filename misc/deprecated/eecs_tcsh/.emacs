;; Make a non-standard key binding.  We can put this in
;; c-mode-base-map because c-mode-map, c++-mode-map, and so on,
;; inherit from it.
(defun my-c-initialization-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-initialization-hook)

;; offset customizations not in my-c-style
;; This will take precedence over any setting of the syntactic symbol
;; made by a style.
(setq c-offsets-alist '((member-init-intro . ++)))
;; --------------- My Change (Tak) -------------- 
(set-default 'cursor-type 'bar) ;; make cursor a vertical bar
;; (global-linum-mode t) ;; show line-numbers on the LHS by default


(global-set-key "\C-Z" nil) ;; I find emacs' control-Z behavior to be pretty annoying

(normal-erase-is-backspace-mode 0) ;; http://www.nongnu.org/emacsdoc-fr/manuel/lossage.html, http://www.hypexr.org/linux_ruboff.php

;; associate colormode depneding on the file extension (or names)
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gitignore$" . shell-script-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gitconfig$" . shell-script-mode) auto-mode-alist))

(custom-set-variables
 '(inhibit-startup-screen t) ;; don't show the welcome to emacs screen
 '(show-paren-mode t) ;; hilight corresponding paranthesis
)

;; --- for matlab mode from free will (3/15/2013) ---
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;; Add support for matlab-mode
(require 'matlab-load)

;; Rebind tab for working on terminals
(defun remap-terminal-tab-4-matlab ()
  (turn-on-eldoc-mode)
  (local-set-key (kbd "TAB") 'matlab-shell-tab))
(add-hook 'matlab-shell-mode-hook 'remap-terminal-tab-4-matlab)
;; Add support for ESS
(require 'ess-site)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ess-eval-visibly nil)
 '(ess-tab-complete-in-script t)
 '(inhibit-startup-screen t)
 '(matlab-comment-region-s "% ")
 '(uniquify-buffer-name-style (quote reverse) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
 
 (add-hook 'ess-mode-hook
	  (lambda () (outline-minor-mode 1 )))

(add-hook 'ess-mode-hook
 	  (lambda () (set (make-local-variable 'outline-regexp) "[#]+")))
 
 (add-hook 'matlab-mode-hook
	  (lambda () (outline-minor-mode 1 )))

(add-hook 'matlab-mode-hook
 	  (lambda () (set (make-local-variable 'outline-regexp) "[%]\\{2,\\}+")))
;; ----------- End my change (Tak) --------
;; Create my personal style.
(defconst my-c-style
  '((c-tab-always-indent        . t)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C Programming Style")
(c-add-style "PERSONAL" my-c-style)

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  ;; set my personal style for the current buffer
  (c-set-style "PERSONAL")
  ;; other customizations
  (setq tab-width 5
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like auto-newline, but not hungry-delete
  (c-toggle-auto-newline 1))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
