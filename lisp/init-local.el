;;; My custom emacs entry
;;;

;; Show line number
(require 'linum)
(global-linum-mode t)
(setq linum-format "%3d ")

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


(provide 'init-local)
;;;
;;;
