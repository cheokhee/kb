(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs.d/.backup"))))
 '(calendar-latitude 37.3)
 '(calendar-longitude -121.9)
 '(column-number-mode t)
 '(cua-delete-selection t)
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(cua-remap-control-v nil)
 '(delete-old-versions t)
 '(dired-listing-switches "-Al")
 '(enable-recursive-minibuffers t)
 '(ibuffer-default-sorting-mode (quote major-mode))
 '(ibuffer-expert t)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-save-directory-list-file "~/.emacs.d/.ido.last")
 '(ido-use-filename-at-point (quote guess))
 '(kill-whole-line t)
 '(python-python-command "python3")
 '(recentf-max-menu-items 25)
 '(recentf-save-file "~/.emacs.d/.recentf")
 '(savehist-file "~/.emacs.d/.savehistory")
 '(savehist-mode t nil (savehist))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(smex-save-file "~/.emacs.d/.smex-items")
 '(split-width-threshold 9999)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(version-control t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))
;(package-initialize)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
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
;(require 'sqlplus)
;(iswitchb-mode 1)
(setq show-help-function nil)
(put 'upcase-region 'disabled nil)
(setq mouse-yank-at-point t)
;original: ("\\.sql\\'" . sql-mode)
;(delq (assoc "\\.sql\\'" auto-mode-alist) auto-mode-alist)
;(add-to-list 'auto-mode-alist '("\\.sql\\'" . sqlplus-mode))
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
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
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
       (define-key python-mode-map (kbd "M-p") 'python-shell-switch-to-shell)))
(global-set-key (kbd "<f11>") 'delete-other-windows)
(global-set-key (kbd "<f12>") 'delete-window)
(require 'dired+)
;(eval-after-load "w32-browser"
;  '(progn
;    (define-key dired-mode-map (kbd "<C-f12>") 'dired-w32explore)))
(global-set-key (kbd "C-x C-b") 'ibuffer)
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
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-flet ((process-list ())) ad-do-it))
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
(global-set-key (kbd "C-c r") 'kill-ring-ido)
(global-set-key (kbd "C-c s")
				(lambda () (interactive)
				  (kill-ring-ido t "search-ring: " search-ring)))
(add-hook 'org-mode-hook
   (lambda ()
       (define-key org-mode-map (kbd "C-c i") 'org-insert-heading-respect-content)))
(add-hook 'write-file-functions 'delete-trailing-whitespace)
(global-set-key (kbd "C-c l") 'goto-last-change)
(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))
(autoload 'groovy-mode "groovy-mode")
(global-set-key (kbd "<f9>") 'indent-rigidly)
(defun my-newline ()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))
(global-set-key (kbd "C-c o") 'my-newline)
(autoload 'gtags-mode "gtags")
(add-hook 'java-mode-hook
   (lambda ()
       (gtags-mode 1)))
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
;; the opposite of my-next-word
;; similar to B in vim
;; (defun my-previous-word-1 ()
;;      (let (char is-on-space regexp)
;; 	   (unless (bobp)
;; 		 (progn
;; 		   (backward-char)
;; 	       (setq char (following-char))
;; 		   (setq regexp "[ \t\n]\\|\\`")
;; 	       (setq is-on-space (or (equal char 32) (equal char 10) (equal char 9)))
;; 	       (if is-on-space
;; 		     (progn (search-backward-regexp "[^ \t\n]\\|\\`") (search-backward-regexp regexp))
;; 		     (search-backward-regexp regexp))
;; 	       (unless (bobp) (forward-char))))))
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
(global-set-key (kbd "C-c p") 'my-previous-word)
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
