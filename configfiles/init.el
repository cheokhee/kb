(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(avy-all-windows (quote all-frames))
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs.d/.backup"))))
 '(calendar-latitude 37.3)
 '(calendar-longitude -121.9)
 '(column-number-mode t)
 '(company-idle-delay 1)
 '(cua-delete-selection t)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(cua-remap-control-v nil)
 '(delete-old-versions t)
 '(dired-listing-switches "-Al")
 '(electric-indent-mode nil)
 '(elpy-rpc-python-command "python3")
 '(enable-recursive-minibuffers t)
 '(fill-column 100)
 '(helm-for-files-preferred-list (quote (helm-source-buffers-list helm-source-recentf helm-source-bookmarks helm-source-file-cache helm-source-files-in-current-dir helm-source-locate)))
 '(ibuffer-default-sorting-mode (quote major-mode))
 '(ibuffer-expert t)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-save-directory-list-file "~/.emacs.d/.ido.last")
 '(ido-use-filename-at-point (quote guess))
 '(imenu-auto-rescan t)
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(kill-whole-line t)
 '(pcomplete-ignore-case t)
 '(projectile-completion-system (quote helm))
 '(python-python-command "python3")
 '(python-shell-interpreter "python3")
 '(read-file-name-completion-ignore-case t)
 '(recentf-max-menu-items 25)
 '(recentf-save-file "~/.emacs.d/.recentf")
 '(require-final-newline t)
 '(savehist-file "~/.emacs.d/.savehistory")
 '(savehist-mode t nil (savehist))
 '(scroll-bar-mode (quote right))
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smex-save-file "~/.emacs.d/.smex-items")
 '(split-width-threshold 9999)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(user-full-name "Cheok Hee")
 '(user-mail-address "blah@com")
 '(version-control t)
 '(w3m-coding-system (quote utf-8))
 '(w3m-default-coding-system (quote utf-8))
 '(w3m-file-coding-system (quote utf-8))
 '(w3m-file-name-coding-system (quote utf-8))
 '(w3m-terminal-coding-system (quote utf-8)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 130 :width normal)))))
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)
(global-linum-mode t)
(setq linum-format "%d ")
(setq initial-scratch-message nil)
(setq scroll-step 1)
(setq scroll-conservatively 1000000)
(require 'recentf)
(recentf-mode 1)
(global-set-key (kbd "C-c j") 'recentf-open-files)
(add-to-list 'load-path "~/.emacs.d/cheok")
;(add-to-list 'load-path "/usr/share/emacs24/site-lisp/global")
;if need psgml.el, enhance sgml mode to provide folding, but no syntax coloring
;(add-to-list 'load-path "~/.emacs.d/cheok/psgml-1.3.2")
;(require 'ide-skel)
(require 'sqlplus)
;(iswitchb-mode 1)
(setq show-help-function nil)
(put 'upcase-region 'disabled nil)
(setq mouse-yank-at-point t)
;original: ("\\.sql\\'" . sql-mode)
(delq (assoc "\\.sql\\'" auto-mode-alist) auto-mode-alist)
(add-to-list 'auto-mode-alist '("\\.sql\\'" . sqlplus-mode))
(setq scroll-preserve-screen-position t)
(put 'scroll-left 'disabled nil)
(column-number-mode 1)
(show-paren-mode 1)
;(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
(global-set-key (kbd "<M-up>") (lambda () (interactive) (scroll-down 1)))
(global-set-key (kbd "<M-down>") (lambda () (interactive) (scroll-up 1)))
;; change kill-ring-save to copy current line when the region is not active
(put 'kill-ring-save 'interactive-form
   '(interactive
      (if (use-region-p)
             (list (region-beginning) (region-end))
             (list (line-beginning-position) (line-beginning-position 2)))))
;jump to beginning of next word
(defun next-word (&optional n)
	 (interactive "p")
	 (let ((word (thing-at-point 'symbol))
		(char (following-char)))
	   (if (and (not (eq word nil)) (not (equal char 32)))
	       (forward-word n))
	   (forward-word n)
	   (backward-word n)))
;M-f was bound to forward-word
(global-set-key (kbd "M-f") 'next-word)
;M-e was bound to forward-sentence
(global-set-key (kbd "M-e") 'forward-word)
(global-set-key (kbd "M-n") 'mark-word)
(setq mouse-drag-copy-region nil)
(ido-mode t)
;(setq ido-file-extensions-order '(".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
(setq bookmark-default-file "~/.emacs.d/.emacs.bmk")
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/.emacs-places")
;(setq make-backup-files nil)
(require 'goto-last-change)
;(require 'smex)
(global-set-key (kbd "M-x") 'helm-M-x)
;(require 'json-pretty-print)
(setq next-screen-context-lines 7)
(require 'highlight-symbol)
(global-set-key [(control f6)] 'highlight-symbol-at-point)
(global-set-key [(control f7)] 'highlight-symbol-next)
(global-set-key [(control f8)] 'highlight-symbol-prev)
(global-set-key (kbd "<mouse-2>") 'mouse-yank-at-click)
;;
;;Delete selection before pasting with mouse
(defadvice mouse-yank-at-click (before delete-region-before-paste (click arg))
  (progn
    (run-hooks 'mouse-leave-buffer-hook)
    (if (use-region-p) (cua-delete-region))))
(ad-activate 'mouse-yank-at-click)
(defadvice mouse-yank-secondary (before delete-region-before-paste (click))
  (progn
    (run-hooks 'mouse-leave-buffer-hook)
    (if (use-region-p) (cua-delete-region))))
(ad-activate 'mouse-yank-secondary)
(require 'point-undo)
(global-set-key (kbd "C-c ,") 'point-undo)
(global-set-key (kbd "C-c .") 'point-redo)
(savehist-mode 1)
(defun dos2unix ()
  "Convert a DOS formatted text buffer to UNIX format"
  (interactive)
  (set-buffer-file-coding-system 'undecided-unix nil))
;(set-default buffer-file-coding-system 'undecided-unix)
;(set-default-coding-systems 'undecided-unix)
;;(prefer-coding-system 'utf-8-unix)
;;(list-coding-systems) -> shows a list of coding systems with mnemonic
(defun toggle-view-mode ()
  (interactive)
  (view-mode 'toggle))
(global-set-key (kbd "C-c z") 'toggle-view-mode)
(add-hook 'python-mode-hook
   (lambda ()
       (define-key python-mode-map (kbd "M-p") 'python-shell-switch-to-shell)
       (define-key python-mode-map (kbd "M-,") 'pop-tag-mark)))
(global-set-key (kbd "<f11>") 'zygospore-toggle-delete-other-windows)
(global-set-key (kbd "<f12>") 'delete-window)
(require 'dired+)
;(eval-after-load "w32-browser"
;  '(progn
;    (define-key dired-mode-map (kbd "<C-f12>") 'dired-w32explore)))
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-mini)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(eval-after-load "ibuf-ext"
  '(progn
     (add-to-list 'ibuffer-never-show-predicates "*Buffer List*")
     (add-to-list 'ibuffer-never-show-predicates "*Help*")
     (add-to-list 'ibuffer-never-show-predicates "*Apropos*")
     (add-to-list 'ibuffer-never-show-predicates "*Completions*")
     (add-to-list 'ibuffer-never-show-predicates "*Messages*")
     (add-to-list 'ibuffer-never-show-predicates "*scratch*")
     (add-to-list 'ibuffer-never-show-predicates "*GNU Emacs*")))
(set-register ?i '(file . "~/.emacs.d/init.el"))
(set-register ?q '(file . "~/d/cheok/IRIS4/sql/qa_DnD.sql"))
(set-register ?t '(file . "~/d/cheok/tasks/cheok_notes.txt"))
(set-register ?g '(file . "/home/heech/gitrepo/kb/notes/things.txt"))
(set-register ?n '(file . "/home/heech/gitrepo/kb/notes/notes.txt"))
(set-register ?v '(file . "/home/heech/d/cheok/IRIS4/DD/invoice-prob/invoice-prob.txt"))
(defun put-buffer-name ()
  "Put current buffer name at point"
  (interactive)
  (let (buffer)
	(setq buffer (if (window-minibuffer-p)
					 (window-buffer (minibuffer-selected-window))
				     (current-buffer)))
	(insert (buffer-name buffer))))
(defun put-file-name ()
  "Put current file name at point"
  (interactive)
  (let (buffer)
	(setq buffer (if (window-minibuffer-p)
					 (window-buffer (minibuffer-selected-window))
				     (current-buffer)))
	(insert (buffer-file-name buffer))))
;;; func prin1-to-string : like printString of Smalltalk
;;; example: (prin1-to-string (car (buffer-list)))
;; flet is obsolete since 24.3, use cl-flet
;; cl-flet does not work
(require 'cl)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (flet ((process-list ())) ad-do-it))
(setq-default abbrev-mode t)
(quietly-read-abbrev-file)
(global-set-key (kbd "C-x s") (lambda () (interactive) (save-some-buffers 1)))
;; kill-buffer-query-functions is a hook defined in subr.el
;; it points to the process-kill-buffer-query-function, which prompts the user if
;; killing a buffer that has a running process.
;; This function kills the buffer without prompting
(global-set-key (kbd "C-c k")
				(lambda () (interactive)
				  (let ((kill-buffer-query-functions nil))
					(kill-buffer-and-window))))
(require 'kill-ring-ido)
(global-set-key (kbd "C-c r") 'helm-show-kill-ring)
(global-set-key (kbd "C-c s")
				(lambda () (interactive)
				  (kill-ring-ido t "search-ring: " search-ring)))
(add-hook 'org-mode-hook
   (lambda ()
       (define-key org-mode-map (kbd "C-c i") 'org-insert-heading-respect-content)))
(add-hook 'write-file-functions 'delete-trailing-whitespace)
(global-set-key (kbd "C-c l") 'goto-last-change)
;(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
;(autoload 'groovy-mode "groovy-mode")
(global-set-key (kbd "<f9>") 'indent-rigidly)
(defun my-newline ()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))
(global-set-key (kbd "C-c o") 'my-newline)
(defun my-newline-above ()
  (interactive)
  (previous-line)
  (my-newline))
(global-set-key (kbd "C-c u") 'my-newline-above)
;(autoload 'gtags-mode "gtags")
;(add-hook 'java-mode-hook
;   (lambda ()
;       (gtags-mode 1)))
;;;
;; If on space/tab, jump to the next non-space char
;; If not on space/tab, jump to the next non-space char after the next series of space/tab
;; similar to W in vim
;; \n is not recognized in Lisp mode, hence the extra \\|$
;; (defun my-next-word-1 ()
;; 	 (let* ((char (following-char)) (regexp "[^ \t\n]\\|\\'")
;; 			(is-on-space (or (equal char 32) (equal char 10) (equal char 9))))
;; 	   (if is-on-space
;; 		   (search-forward-regexp regexp)
;; 		   (progn (search-forward-regexp "[ \t\n]\\|$") (search-forward-regexp regexp)))
;; 	   (unless (eobp) (backward-char))))
(defun is-on-space ()
  (let ((char (following-char)))
	(or (equal char 32) (equal char 10) (equal char 9))))
(defun forward-until-non-space ()
  (while (and (is-on-space) (not (eobp)))
	(forward-char)))
(defun forward-until-space ()
  (while (and (not (is-on-space)) (not (eobp)))
	(forward-char)))
(defun my-next-word-1 ()
  (if (is-on-space)
	  (forward-until-non-space)
	  (progn (forward-until-space) (forward-until-non-space))))
;; similar to W in vim
(defun my-next-word (&optional n)
  (interactive "p")
  (let ((count n))
	(while (> count 0)
	  (my-next-word-1)
	  (setq count (1- count)))))
(global-set-key (kbd "C-c n") 'my-next-word)
(defun backward-until-non-space ()
  (while (and (is-on-space) (not (bobp)))
	(backward-char)))
(defun backward-until-space ()
  (while (and (not (is-on-space)) (not (bobp)))
	(backward-char)))
;;does not handle this case:
;;first line is a blank line (just a newline char), second line begins with non-space
(defun my-previous-word-1 ()
  (let ()
	(unless (bobp)
	  (progn
		(backward-char)
		(if (is-on-space)
			(progn (backward-until-non-space) (backward-until-space))
		    (backward-until-space))
		(unless (bobp) (forward-char))))))
;; similar to B in vim
(defun my-previous-word (&optional n)
  (interactive "p")
  (let ((count n))
	(while (> count 0)
	  (my-previous-word-1)
	  (setq count (1- count)))))
(global-set-key (kbd "C-c b") 'my-previous-word)
(defun my-end-word ()
  (interactive)
  (unless (is-on-space) (forward-until-space)))
(global-set-key (kbd "C-c e") 'my-end-word)
;; remove all text properties: facemenu-remove-all
(add-to-list 'yank-excluded-properties 'font)
(add-to-list 'yank-excluded-properties 'face)
;; XML pretty print
;; sgml-mode; then sgml-pretty-print )
(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this. The function inserts linebreaks to separate tags that have
nothing but whitespace between them. It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n") (setq end (1+ end)))
    (indent-region begin end))
  (message "Ah, much better!"))

; (modify-syntax-entry ?_ "w")
(add-hook 'text-mode-hook
  (lambda () (modify-syntax-entry ?_ "w")))
;;
; see the syntax of the + character: (char-to-string (char-syntax ?+))
;; align-regexp
;;variable: split-width-threshold: I want my pop-up window to split
;;horizontally even on wide-screen monitor
;;variable: split-height-threshold
(require 'yasnippet)
(yas-global-mode 1)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-c y") 'yas-expand)
;(ac-config-default)
(setq smtpmail-default-smtp-server "blah.com")

;original ("\\.rb\\'" . ruby-mode)
(delq (assoc "\\.rb\\'" auto-mode-alist) auto-mode-alist)
(add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
(add-hook 'js3-mode-hook
  (lambda ()
    (tern-mode t)
    (company-mode)
    (add-to-list 'company-backends 'company-tern)))
;(eval-after-load 'tern
;  '(progn
;       (require 'tern-auto-complete)
;       (tern-ac-setup)))
;(add-to-list 'ac-modes 'js3-mode)
;(add-hook 'js3-mode-hook
;   (lambda ()
;       (define-key js3-mode-map (kbd "C-.") 'tern-ac-complete)))
;(require 'nodejs-repl)
(defun delete-tern-process ()
  (interactive)
  (delete-process "Tern"))
(setenv "ORACLE_HOME" "/home/heech/sql-client")
(setenv "SQLPATH" "/home/heech/sql-client/sqlplus")

(defun term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
      (term-line-mode)))
(eval-after-load 'term
  '(progn
     (define-key term-mode-map (kbd "C-c C-j") 'term-toggle-mode)
     (define-key term-raw-map (kbd "C-c C-j") 'term-toggle-mode)))

(setq browse-url-browser-function 'w3m-goto-url-new-session)
;(global-set-key (kbd "C-c b") 'browse-url-at-point)
;(autoload 'idomenu "idomenu" nil t)
(global-set-key (kbd "C-c i") 'helm-imenu)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c f") 'helm-for-files)
;emacs-init-time to find out time for init at start-up
(global-set-key (kbd "<f6>") 'goto-line)
;(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-c c") 'company-manual-begin)
(elpy-enable)
(put 'dired-find-alternate-file 'disabled nil)
(global-anzu-mode 1)
(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (company-mode)))
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-common-hook
  (lambda ()
    (delete 'company-clang company-backends)
    (company-mode)
    (ggtags-mode 1)))
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))
(setq
  helm-gtags-ignore-case t
  helm-gtags-auto-update t
  helm-gtags-use-input-at-cursor t
  helm-gtags-pulse-at-cursor t
  helm-gtags-prefix-key "\C-cg"
  helm-gtags-suggested-key-mapping t)
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)
;(ws-butler-global-mode 1)
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))
(global-set-key (kbd "M-i") 'helm-swoop)
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
(load-file "~/.emacs.d/cheok/oracle.elc")
(add-hook 'go-mode-hook
   (lambda ()
     (setq gofmt-command "goimports")
     (company-mode)
     (hs-minor-mode)
     (add-hook 'before-save-hook 'gofmt-before-save nil t)
     (flycheck-mode)
     (define-key go-mode-map (kbd "M-.") 'godef-jump)
     (define-key go-mode-map (kbd "M-,") 'pop-tag-mark)))
(progn
  ;; set arrow keys in isearch. left/right is backward/forward, up/down is history. press Return to exit
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )
  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)
)
(global-set-key (kbd "C-,") 'avy-goto-subword-1)
(global-set-key (kbd "C-.") 'avy-goto-char-in-line)
(global-set-key (kbd "C-'") 'avy-goto-line)
(define-key isearch-mode-map (kbd "C-,") 'avy-isearch)
