;; .emacs

;; startup
(add-to-list  'load-path "~/emacs")
(setq inhibit-startup-message t)

;; General settings
(setq indent-tabs-mode nil)
(setq line-number-mode t)
(setq column-number-mode t)
(setq require-final-newline nil)
(setq display-buffer-reuse-frames t)
(when (boundp 'osx-key-mode-map)
  (define-key osx-key-mode-map (kbd "A-w") 'kill-this-buffer)
)

;; Keep emacs from pooping backup files all over the place
(setq make-backup-files nil)

;; Try to make emacs behave on high latency filesystems (sshfs)
(setq auto-save-default nil)
(setq auto-save-interval 1200)

;; Tramp
;(add-to-list  'load-path "~/emacs/tramp/lisp")
;(add-to-list  'load-path "~/emacs/tramp/contrib")
;(add-to-list 'Info-default-directory-list "~/emacs/tramp/info/")
(require 'tramp)
(setq tramp-default-method "rsync")

;; diff
(setq diff-switches "-u")

;; c-mode
(require 'cc-mode)
(setq c-tab-always-indent nil)
(setq c-basic-offset 4)
(setq c-indent-level 4)
(c-set-offset 'defun-open        0)
(c-set-offset 'defun-close       0)
(c-set-offset 'block-open        0)
(c-set-offset 'block-close       0)
(c-set-offset 'brace-list-open   0)
(c-set-offset 'brace-list-close  0)
(c-set-offset 'brace-list-intro  0)
(c-set-offset 'brace-list-entry  0)
(c-set-offset 'substatement      4)
(c-set-offset 'substatement-open 0)

;; cperl
(require 'cperl-mode)
(setq cperl-label-offset 0)
(setq cperl-tab-always-indent nil)
(setq cperl-indent-level 4)
(setq cperl-label-offset 0)
(setq cperl-continued-statement-offset 2)
(setq cperl-font-lock t)
(setq cperl-close-paren-offset -4)
(setq cperl-indent-parens-as-block t)
;; Use cperl for perl
(defalias 'perl-mode 'cperl-mode)
(autoload 'cperl-mode "cperl-mode" "Perl editing mode" t)
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\)$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pod$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.t$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.cgi$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.plx$" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))


;; perltidy
(defun perltidy-region ()
  "Run perltidy on the current region."
  (interactive)
  (save-excursion
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)
    (cperl-mode)))


;; Drupal
(defun drupal-mode ()
  "Drupal php-mode"
  (interactive)
  (php-mode)
  (message "Drupal mode activated")
  (setq case-fold-search t)
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (setq c-basic-offset 2)
  (c-set-offset 'arglist-cont           0)
  (c-set-offset 'case-label             2)
  (c-set-offset 'arglist-intro          c-basic-offset)
  (c-set-offset 'arglist-close          0)
)
(add-to-list 'auto-mode-alist '("/drupal.*\\.\\(module\\|test\\|install\\|theme\\|php\\|inc\\)$" . drupal-mode))
(add-to-list 'auto-mode-alist '("/drupal.*\\.info" . conf-windows-mode))

(defun my-php-mode ()
  "My php-mode"
  (interactive)
  (drupal-mode)
  (message "My PHP mode activated")
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-intro          4)
)
(add-to-list 'auto-mode-alist '("\\.php$" . my-php-mode))


;; Guess Style
(autoload 'guess-style-set-variable "guess-style" nil t)
(autoload 'guess-style-guess-variable "guess-style")
(autoload 'guess-style-guess-all "guess-style" nil t)


;; GEBEN DBGp debug protocol
(add-to-list  'load-path "~/emacs/geben")
(autoload 'geben "geben" "PHP Debugger on Emacs" t)


;; SVN
;;(require 'vc-svn)

;; YAML
(add-to-list 'load-path "~/emacs/yaml")
(autoload 'yaml-mode "yaml-mode.el" "Major mode for editin YAML" t)
(setq auto-mode-list (cons '("\\.ya?ml$" . yaml-mode) auto-mode-alist))

;; Markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))


;; Show whitespace (particularly tabs)
(require 'show-wspace)
(add-hook 'font-lock-mode-hook 'show-ws-highlight-tabs)


(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(column-number-mode t)
 '(confirm-kill-emacs (quote y-or-n-p))
 '(cperl-electric-parens nil)
 '(cperl-under-as-char t)
 '(fortran-tab-mode-default nil t)
 '(global-font-lock-mode t nil (font-lock))
 '(perl-label-offset 0)
 '(tab-always-indent nil)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(default ((t (:stipple nil :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :family "adobe-courier")))))
