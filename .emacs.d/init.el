;; ================================================================
;; packaging

;(package-initialize)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;(add-to-list 'load-path "~/.emacs.d/elisp/")

;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; ================================================================
;; key assign / basic settings

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key (kbd "C-c e") 'eval-current-buffer)
(global-set-key (kbd "C-c l") 'goto-line)    ;; goto line
(global-set-key (kbd "C-x C-b") 'ibuffer)  ; ibuffer
;(global-set-key (kbd "C-m") 'newline-and-indent)

(setq ring-bell-function 'ignore)    ;; beep off
(setq inhibit-startup-message t)

;;================================================================
;; language-mode

;; haml-mode
(autoload 'haml-mode "haml-mode" "Mode for editing haml files" t)
(setq auto-mode-alist  (append '(("\\.haml$" . haml-mode)) auto-mode-alist))

;; slim-mode
(autoload 'slim-mode "slim-mode" "Mode for editing slim source files" t)
(add-to-list 'auto-mode-alist '("\\.slim?\\'" . slim-mode))

;; .erb
(setq auto-mode-alist  (append '(("\\.erb$" . html-mode)) auto-mode-alist))
(setq auto-mode-alist  (append '(("\\.scss$" . css-mode)) auto-mode-alist))

;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Mode for editing ruby source files" t)
(setq auto-mode-alist (append '(("\\.rb$" . ruby-mode)
				("\\.ruby$" . ruby-mode)
				("\\.ru$" . ruby-mode)
				("\\.rake$" . ruby-mode)
				("\\.cgi$" . ruby-mode)
				("Gemfile" . ruby-mode)
				(".gemspec" . ruby-mode)
				("Rakefile" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (electric-indent-mode 1)))
	     ;;	     (define-key ruby-mode-map "\C-m" 'newline-and-indent)))

;; yaml-mode

(autoload 'yaml-mode "yaml-mode" "" t)
(setq auto-mode-alist  (append '(("\\.yml$" . yaml-mode)) auto-mode-alist))
(add-hook 'yaml-mode-hook
	  '(lambda ()
	     (define-key yaml-mode-map "\C-j" 'newline-and-indent)))

;; markdown-mode
(autoload 'markdown-mode "markdown-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\.erb$" . markdown-mode))

;; coffee-mode
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 4)
       (set (make-local-variable 'coffee-tab-width) 4))
  )

(add-hook 'coffee-mode-hook
	  '(lambda() (coffee-custom)))

;; robocup
;(require 'rubocop)
;(add-hook 'ruby-mode-hook 'rubocop-mode)

;; ================================================================
;; insert

;; insert date
(global-set-key (kbd "C-c d") 'insert-date)
(defun insert-date ()
  "insert date"
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

;; auto-insert
(define-skeleton frontmatter-skeleton
  "Default Frontmatter"
  ""
  "---\n"
  "title: \n"
  "date: " (format-time-string "%Y-%m-%d") "\n"
  "\n"
  "---"
  "\n\n"
  )

(require 'autoinsert)
(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert-query nil)
(setq auto-insert-alist 
      '(
	("\\.html\\.md$" . frontmatter-skeleton)
	("\\.html\\.md\\.erb$" . frontmatter-skeleton)
	))

;; snippet
(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/yasnippet-snippets" ))


;; middleman-blog: article-front matter
(defun insert-article-frontmatter ()
  (interactive)
;  (insert (concat "---\ntitle: \ndate: " (format-time-string "%Y-%m-%d") "\ncategory: \n\n---\n")))
  (insert (concat "---\ntitle: \ndate: " (format-time-string "%Y-%m-%d") "\n\n---\n")))
(define-key global-map "\C-ca" 'insert-article-frontmatter)

;================================================================
;; default directory

;;(cd "~/")
(setq default-directory "~/")
;;(setq command-line-default-directory "~/vagrant/centos65/source/")
;;(setq command-line-default-directory source-directory)
(setq command-line-default-directory default-directory)

;(global-set-key (kbd "C-c m") (lambda () (interactive)(find-file memo-filename)))
;;(add-hook 'after-init-hook (lambda () (interactive)(find-file memo-filename)))


;; ================================================================
;; initial frame / fonts
(setq default-frame-alist
      (append (list '(foreground-color . "black")
		    '(background-color . "LemonChiffon")
		    '(background-color . "gray")
		    '(border-color . "black")
		    '(mouse-color . "black")
		    '(cursor-color . "black")
;;		    '(ime-font . (w32-logfont "ＭＳ ゴシック"
;;					      0 16 400 0 nil nil nil
;;					      128 1 3 49)) ; TrueType のみ
;;		    '(font . "bdf-fontset")    ; BDF
;;		    '(font . "private-fontset"); TrueType
		    '(width . 100)
		    '(height . 50)
		    '(top . 30)
		    '(left . 500))
	      default-frame-alist))

;; ================================================================
;;; japanese language

;'(w32-ime-initialize)
;(global-set-key [M-kanji] 'ignore) 
;(global-set-key [kanji] 'ignore)  ; See more at: http://yohshiy.blog.fc2.com/blog-entry-169.html#sthash.P4hJnxxH.dpuf

;;; japanese language (mozc)
(set-language-environment "Japanese")
;(setq default-input-method "japanese-anthy")

(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
;(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)
(global-set-key (kbd "M-<zenkaku-hankaku>") 'toggle-input-method)

;; mozc
(require 'mozc)
(require 'mozc-im)
(require 'mozc-popup)
;(require 'mozc-cursor-color)

(setq default-input-method "japanese-mozc-im")
(setq mozc-helper-program-name "mozc_emacs_helper.sh")
;(setq mozc-helper-program-name "mozc_emacs_helper")

(advice-add 'mozc-session-execute-command
            :after (lambda (&rest args)
                     (when (eq (nth 0 args) 'CreateSession)
                       ;; (mozc-session-sendkey '(hiragana)))))
                       (mozc-session-sendkey '(Hankaku/Zenkaku)))))


;(add-hook 'mozc-mode-hook
;  (lambda()
;    (define-key mozc-mode-map (kbd "<zenkaku-hankaku>") 'toggle-input-method)))

;;;;;;;;;;;;;;;;

;; fonts
(set-face-attribute 'default nil :family "Migu 1M" :height 110)  ;; default font
(set-face-attribute 'variable-pitch nil :family "Migu 1M" :height 110) ;; propotional
(set-face-attribute 'fixed-pitch nil :family "Migu 1M" :height 110) ;; touhaba
(set-face-attribute 'tooltip nil :family "Migu 1M" :height 80) ;; tooltips



;; ================================================================
;; utility functions

;; ignore extension on file-open
(defadvice completion-file-name-table (after ignoring-backups-f-n-completion activate)
  "filter out results when the have completion-ignored-extensions"
  (let ((res ad-return-value))
    (if (and (listp res)
          (stringp (car res))
          (cdr res)) ; length > 1, don't ignore sole match
        (setq ad-return-value
          (completion-pcm--filename-try-filter res)))))

;; rename file and buffer
(global-set-key (kbd "C-x w") 'rename-file-and-buffer)
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))


;; delete file and buffer
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))


;;;
;;; end of file
;;;

