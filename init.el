;;================================================================================
;; list-packages
;;================================================================================
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;;================================================================================
;; load path
;;================================================================================
(setq load-path (append '("~/.emacs.d/lisp/") load-path))

;;================================================================================
;; LANG
;;================================================================================
(set-locale-environment nil)

;;================================================================================
;; key-bindings
;;================================================================================
;;(keyboard-translate ?\C-h ?\C-?)
(define-key global-map (kbd "C-h") 'delete-backward-char) ; 削除
(define-key global-map (kbd "M-?") 'help-for-help)        ; ヘルプ
(define-key global-map (kbd "C-z") 'undo)                 ; undo
(define-key global-map (kbd "C-c i") 'indent-region)      ; インデント
(define-key global-map (kbd "C-c C-i") 'hippie-expand)    ; 補完
(define-key global-map (kbd "C-c ;") 'comment-dwim)       ; コメントアウト
(define-key global-map (kbd "M-g") 'goto-line)            ; 指定行へ移動
(define-key global-map (kbd "C-j") 'newline-and-indent)   ; 改行
;;(define-key global-map (kbd "M-C-g") 'grep) ; grep

;;================================================================================
;; 画像ファイルの表示
;;================================================================================
(auto-image-file-mode t)

;;================================================================================
;; メニューバー、ツールバーの非表示
;;================================================================================
(menu-bar-mode -1)
(tool-bar-mode -1)

;;================================================================================
;; カーソルの点滅をやめる
;;================================================================================
;;(blink-cursor-mode nil)

;;================================================================================
;; 対応する括弧を光らせる
;;================================================================================
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;;================================================================================
;; カーソル位置
;;================================================================================
;; 現在行を目立たせる
;; (global-hl-line-mode)

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

;;================================================================================
;; カーソル行
;;================================================================================
;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)
;; 最終行に必ず一行挿入する
(setq require-final-newline t)
;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;================================================================================
;; バックアップ
;;================================================================================
;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;;================================================================================
;; 履歴
;;================================================================================
;;; 履歴数を大きくする
(setq history-length 10000)

;;; ミニバッファの履歴を保存する
(savehist-mode 1)

;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

;;================================================================================
;; 圧縮
;;================================================================================
(auto-compression-mode t)

;;================================================================================
;; ディレクトリ
;;================================================================================
;; diredを便利にする
(require 'dired-x)

;; diredから"r"でファイル名をインライン編集する
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

(add-hook 'dired-mode-hook
          (lambda ()
            ;; (define-key dired-mode-map (kbd "C-o") 'other-window-or-split)
            (local-unset-key (kbd "C-o"))
            ))

;;================================================================================
;; バッファ名
;;================================================================================
;;; ファイル名が重複していたらディレクトリ名を追加する。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;================================================================================
;; 実行権
;;================================================================================
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;================================================================================
;; スペルチェック
;;================================================================================
;;(setq-default flyspell-mode t)
;;(setq ispell-dictionary "american")

;;================================================================================
;; linum-mode
;;================================================================================
;; (global-linum-mode)
;; (setq linum-format
;;       (lambda (line)
;; (propertize (format
;;  (let ((w (length (number-to-string
;;    (count-lines (point-min) (point-max))))))
;;    (concat "%" (number-to-string w) "d|")) line) 'face 'linum)))

;;================================================================================
;; カラー設定
;;================================================================================
(global-font-lock-mode t)
;;(setq font-lock-support-mode 'fast-lock-mode)
(setq font-lock-maximum-decration t)
(setq fast-lock-cache-directories '("~/.emacs.d/.emacs-flc" "."))

;;================================================================================
;; タブの設定
;;================================================================================
;;タブ幅を 4 に設定
(setq-default tab-width 4)
;;タブ幅の倍数を設定
(setq tab-stop-list
      '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
;;タブではなくスペースを使う
;;(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;;================================================================================
;; 最終更新日の自動挿入
;; ファイルの先頭から 8 行以内に Time-stamp: <> または
;; Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入される
;;================================================================================
;; (require 'time-stamp)
;; ;; 日本語で日付を入れたくないのでlocaleをCにする
;; (defun time-stamp-with-locale-c ()
;;   (let ((system-time-locale "C"))
;;     (time-stamp)
;;     nil))
;; (if (not (memq 'time-stamp-with-locale-c write-file-hooks))
;;     (add-hook 'write-file-hooks 'time-stamp-with-locale-c))
;; (setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %Z %:y")

;;================================================================================
;; Buffer(iswitchb)設定
;;================================================================================
(iswitchb-mode 1) ;;iswitchbモードON
(add-hook 'iswitchb-define-mode-map-hook
          (lambda ()
            (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
            (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
            (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;;================================================================================
;; Tab補完をスペース補完に変更する
;;================================================================================
(if (boundp 'minibuffer-local-filename-completion-map)
    (define-key minibuffer-local-filename-completion-map
      " " 'minibuffer-complete-word))
(if (boundp 'minibuffer-local-must-match-filename-map)
    (define-key minibuffer-local-must-match-filename-map
      " " 'minibuffer-complete-word))

;;================================================================================
;; 現在行をハイライトする
;;================================================================================
;;(require 'hl-line)
;;(global-hl-line-mode 1)
;;(setq hl-line-face 'underline)

;;================================================================================
;; php-mode
;;================================================================================
(add-hook 'php-mode-hook 'php-enable-symfony2-coding-style)

;;================================================================================
;; multiple cursor
;;================================================================================
(require 'multiple-cursors)
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-*")   'mc/mark-all-like-this)
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  '(("C-p"      . 'mc/mark-previous-like-this)
    ("C-n"      . 'mc/mark-next-like-this)
    ("u" . mc/unmark-next-like-this)
    ("U" . mc/unmark-previous-like-this)
    ("s" . mc/skip-to-next-like-this)
    ("S" . mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)))

;;================================================================================
;; インデントをハイライトする
;;================================================================================
(require 'highlight-indentation)
(add-hook 'php-mode-hook 'highlight-indentation-mode)
(add-hook 'web-mode-hook 'highlight-indentation-mode)
(add-hook 'csharp-mode-hook 'highlight-indentation-mode)

;;================================================================================
;; WindowsResizer
;;================================================================================
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))

;;================================================================================
;; ウィンドウ移動に関する設定
;;================================================================================
;; C-q をプリフィックスキー化
(define-key global-map "\C-q" (make-sparse-keymap))

;; quoted-insert は C-q C-q へ割り当て
(global-set-key "\C-q\C-q" 'quoted-insert)

;; window-resizer は C-q C-r (resize) で
(global-set-key "\C-q\C-r" 'window-resizer)

;; C-x o にはもううんざり
(global-set-key "\C-q\C-l" 'windmove-right)
(global-set-key "\C-q\C-h" 'windmove-left)
(global-set-key "\C-q\C-j" 'windmove-down)
(global-set-key "\C-q\C-k" 'windmove-up)

;;================================================================================
;; elscreen
;;================================================================================
(require 'elscreen)
(setq elscreen-prefix-key (kbd "C-o"))
(setq elscreen-display-tab 4)
(setq elscreen-display-screen-number nil)
(when (require 'elscreen nil 'noerror)
  (elscreen-start))

;;(require 'elscreen-persist)
;;(elscreen-persist-mode 1)

;;================================================================================
;; $Id$ を CVS ライクに置き換える
;;================================================================================
;; (when (require 'time-stamp nil t)
;;   (setq time-stamp-start "\\$Id")
;;   (setq time-stamp-end "\\$")
;;   (setq time-stamp-format ": %f %04y/%02m/%02d %02H:%02M:%02S %u Exp ")
;;   (if (not (memq 'time-stamp write-file-hooks))
;;       (setq write-file-hooks
;;             (cons 'time-stamp write-file-hooks))))

;;================================================================================
;; smooth-scroll
;;================================================================================
;;(require 'smooth-scroll)
;;(smooth-scroll-mode t)
(scroll-bar-mode -1)

;;================================================================================
;; undo-tree
;;================================================================================
(require 'undo-tree)
(global-undo-tree-mode)

;;================================================================================
;; yasnippet
;;================================================================================
(require 'yasnippet)
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/lisp/snippets")))
(yas-global-mode 1)
;; insert existing snippets
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; insert new snippets
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; view & edit existing snippets
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;;================================================================================
;; web-mode
;;================================================================================
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))
(setq web-mode-engines-alist
      '(("php"    . "\\.phtml\\'")
        ("blade"  . "\\.blade\\.php\\'")
        ("blade"  . "\\.blade\\.")))
(defun web-mode-hook ()
  "Hooks for Web mode."
  ;; 変更日時の自動修正
  ;;(setq time-stamp-line-limit -200)
  ;;(if (not (memq 'time-stamp write-file-hooks))
  ;;  (setq write-file-hooks
  ;;(cons 'time-stamp write-file-hooks)))
  ;; (setq time-stamp-format " %3a %3b %02d %02H:%02M:%02S %:y %Z")
  ;; (setq time-stamp-start "Last modified:")
  ;; (setq time-stamp-end "$")
  ;; web-modeの設定
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
  ;; htmlの内容をインデント
  ;; TEXTAREA等の中身をインデントすると副作用が起こったりするので
  ;; デフォルトではインデントしない
  ;;(setq web-mode-indent-style 2)
  ;; コメントのスタイル
  ;;   1:htmlのコメントスタイル(default)
  ;;   2:テンプレートエンジンのコメントスタイル
  ;;      (Ex. {# django comment #},{* smarty comment *},{{-- blade comment --}})
  (setq web-mode-comment-style 2)
  ;; 終了タグの自動補完をしない
  ;;(setq web-mode-disable-auto-pairing t)
  ;; color:#ff0000;等とした場合に指定した色をbgに表示しない
  ;;(setq web-mode-disable-css-colorization t)
  ;;css,js,php,etc..の範囲をbg色で表示
  ;; (setq web-mode-enable-block-faces t)
  ;; (custom-set-faces
  ;;  '(web-mode-server-face
  ;;    ((t (:background "grey"))))                  ; template Blockの背景色
  ;;  '(web-mode-css-face
  ;;    ((t (:background "grey18"))))                ; CSS Blockの背景色
  ;;  '(web-mode-javascript-face
  ;;    ((t (:background "grey36"))))                ; javascript Blockの背景色
  ;;  )
  ;;(setq web-mode-enable-heredoc-fontification t)
  )
(add-hook 'web-mode-hook  'web-mode-hook)
;; 色の設定
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((((class color) (min-colors 89)) (:foreground "#c6c6c6"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F")))))

;;================================================================================
;; flycheck
;;================================================================================
;;(add-hook 'php-mode-hook 'flycheck-mode)
;;(setq ns-command-modifier (quote meta))
;;(setq ns-alternate-modifier (quote super))

;;================================================================================
;; smart-compile
;;================================================================================
(require 'smart-compile)
(global-set-key (kbd "C-x c") 'smart-compile)
(global-set-key (kbd "C-x C-x") (kbd "C-x c C-m"))

;;================================================================================
;; helm
;;================================================================================
(when (require 'helm-config nil t)
  (helm-mode 1)

  (define-key global-map (kbd "M-x")     'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  (define-key global-map (kbd "C-c i")   'helm-imenu)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)

  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

  ;; Disable helm in some functions
  (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

  ;; Emulate `kill-line' in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))

  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only if CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))

  (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
    "Transform the pattern to reflect my intention"
    (let* ((pattern (ad-get-arg 0))
           (input-pattern (file-name-nondirectory pattern))
           (dirname (file-name-directory pattern)))
      (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
      (setq ad-return-value
            (concat dirname
                    (if (string-match "^\\^" input-pattern)
                        ;; '^' is a pattern for basename
                        ;; and not required because the directory name is prepended
                        (substring input-pattern 1)
                      (concat ".*" input-pattern)))))))

;;================================================================================
;; editorconfig
;;================================================================================
(require 'editorconfig)
(setq edconf-exec-path "/usr/local/bin/editorconfig")

;;================================================================================
;; org-mode
;;================================================================================
(require 'org-install)
;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-capture)
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; org-modeでの強調表示を可能にする
(add-hook 'org-mode-hook 'turn-on-font-lock)
;; 見出しの余分な*を消す
(setq org-hide-leading-stars t)
;; org-default-notes-fileのディレクトリ
(setq org-directory "~/org/")
;; org-default-notes-fileのファイル名
(setq org-default-notes-file "notes.org")
;; DONEの時刻を記録
(setq org-log-done 'time)
;; アジェンダ表示の対象ファイル
(setq org-agenda-files (list org-directory))
;; アジェンダ表示で下線を用いる
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
(setq hl-line-face 'underline)
;; 標準の祝日を利用しない
(setq calendar-holidays nil)
;; 時刻の表示
(setq org-display-custom-times "<%Y-%m-%d %H:%M:%S>")
(setq org-time-stamp-custom-formats "<%Y-%m-%d %H:%M:%S>")
(add-hook 'org-mode-hook
          (lambda ()
            (set (make-local-variable 'system-time-locale) "C")))
(require 'org-archive)
(setq org-archive-location "archive.org::")
(defun my:org-archive-done-tasks ()
  (interactive)
  ;; ARCHIVE タグを付けるだけなら以下
  (org-map-entries 'org-archive-set-tag "/DONE" 'file))
;; org-archive-location に refile したいなら以下
;;  (org-map-entries 'org-archive-subtree "/DONE" 'file))
;;(add-hook 'org-todo-statistics-hook 'my:org-archive-done-tasks)
;;(add-hook 'org-todo-after-statistics-hook 'my:org-archive-done-tasks)
(setq org-capture-bookmark nil)
(setq org-capture-templates
      `(
        ("0" "Todo" entry
         (file+headline (concat org-directory "na.org") "Tasks")
         ;; "* TODO <%<%Y-%m-%d>> %^{title} %^g\n  %?\n  %a\n  #+BEGIN_QUOTE\n%i\n  #+END_QUOTE"
         "* TODO %^{What is next action?} %^g\n  %?\n"
         :prepend nil
         :unnarrowed nil
         :kill-buffer t
         )
        ("i" "Inbox" entry
         (file+headline (concat org-directory "inbox.org") "Inbox")
         ;; "* TODO <%<%Y-%m-%d>> %:subject %^g\n  %?\n  %a\n  #+BEGIN_QUOTE\n%i\n  #+END_QUOTE"
         "* TODO %^{Add new inbox} :INBOX:\n  %?\n"
         :prepend nil
         :unnarrowed nil
         :kill-buffer t
         )
        ("1" "Project" entry
         (file+headline (concat org-directory "project.org") "Projects")
         ;; "* TODO <%<%Y-%m-%d>> %^{title} %^g\n  %?\n  %a\n  #+BEGIN_QUOTE\n%i\n  #+END_QUOTE"
         "* %^{Add new project} :PROJECT:\n  %?\n"
         :prepend nil
         :unnarrowed nil
         :kill-buffer t
         )
        ("c" "Calendar" entry
         (file+headline (concat org-directory "calendar.org") "Calendar")
         ;; "* TODO <%<%Y-%m-%d>> %^{title} %^g\n  %?\n  %a\n  #+BEGIN_QUOTE\n%i\n  #+END_QUOTE"
         "* %^T %^{Add new calendar} :CALENDAR:\n  %?\n"
         :prepend nil
         :unnarrowed nil
         :kill-buffer t
         )
        ))
(require 'org-agenda)
(define-key global-map (kbd "C-c a") 'org-agenda)
(setq org-agenda-files nil)
(dolist (file
         '("archive.org"
           "inbox.org"
           "na.org"
           "project.org"
           "calendar.org"
           ))
  (add-to-list 'org-agenda-files (concat org-directory file)))
(setq org-agenda-time-leading-zero t)
(setq org-agenda-custom-commands
      '(
        ("i" "Inbox"
         ((agenda "" ((org-agenda-ndays 1)))
          (tags-todo "INBOX"
                     ((org-agenda-files '("~/org/inbox.org"))
                      (org-agenda-sorting-strategy '(time-up priority-up effort-down))))
          ))
        ("0" "Next Actions"
         ((agenda "" ((org-agenda-ndays 1)))
          (todo ""
                ((org-agenda-files '("~/org/na.org"))
                 (org-agenda-sorting-strategy '(time-up priority-up effort-down))))
          ))
        ("1" "Project"
         ((agenda "" ((org-agenda-ndays 1)))
          (tags "PROJECT"
                ((org-agenda-files '("~/org/projects.org"))
                 (org-agenda-sorting-strategy '(time-up priority-up effort-down))))
          ))
        ("c" "Calendar"
         ((agenda "" ((org-agenda-ndays 1)))
          (tags "CALENDAR"
                ((org-agenda-files '("~/org/calendar.org"))
                 (org-agenda-sorting-strategy '(time-up priority-up effort-down))))
          ))
        ))

;;================================================================================
;; whitespace
;;================================================================================
;;(global-whitespace-mode 1)
;;(setq whitespace-style '(face tabs tab-mark spaces space-mark))

;;================================================================================
;; Theme
;;================================================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(org-agenda-files
   (quote
    ("~/org/calendar.org" "~/org/na.org" "~/org/inbox.org" "~/org/archive.org"))))
