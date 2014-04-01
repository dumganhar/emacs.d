;;; My custom emacs entry
;;;

;;; Disable cursor blink
;; (blink-cursor-mode 0)

;; Show line number
(global-linum-mode t)
(setq linum-format "%3d ")

(require-package 'window-numbering)

;; Set monospaced fonts for english and chinese
(when (display-graphic-p)
  (setq fonts
        (cond ((eq system-type 'darwin)     '("Monaco"     "STHeiti"))
              ((eq system-type 'gnu/linux)  '("Menlo"     "WenQuanYi Zen Hei"))
              ((eq system-type 'windows-nt) '("Consolas"  "Microsoft Yahei"))))

  (setq face-font-rescale-alist '(("STHeiti" . 1.2) ("Microsoft Yahei" . 1.2) ("WenQuanYi Zen Hei" . 1.2)))
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 14))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family (car (cdr fonts))))))

;; Define indention key
;;; It's kind of sad this doesn't exist normally...
    (defun indent-rigidly-n (n)
      "Indent the region, or otherwise the current line, by N spaces."
      (let* ((use-region (and transient-mark-mode mark-active))
             (rstart (if use-region (region-beginning) (point-at-bol)))
             (rend   (if use-region (region-end)       (point-at-eol)))
             (deactivate-mark "irrelevant")) ; avoid deactivating mark
        (indent-rigidly rstart rend n)))
    (defun indent-rigidly-4 ()
      "Indent the region, or otherwise the current line, by 4 spaces."
      (interactive)
      (indent-rigidly-n 4))
    (defun outdent-rigidly-4 ()
      "Indent the region, or otherwise the current line, by -4 spaces."
      (interactive)
      (indent-rigidly-n -4))

    (global-set-key (kbd "M-]") 'indent-rigidly-4)
    (global-set-key (kbd "M-[") 'outdent-rigidly-4)

;;;

(window-numbering-mode 1)

;; 如果子任务没有全部完成，主任务将不能设置为 DONE 状态
(setq org-enforce-todo-dependencies t)

;; 优先级范围和默认任务的优先级
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?E)
(setq org-default-priority ?E)
;; 优先级醒目外观
(setq org-priority-faces
  '((?A . (:background "red" :foreground "white" :weight bold))
    (?B . (:background "DarkOrange" :foreground "white" :weight bold))
    (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
    (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
    (?E . (:background "SkyBlue" :foreground "black" :weight bold))
))

(provide 'init-local)
;;;
;;;
