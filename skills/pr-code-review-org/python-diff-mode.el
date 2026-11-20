;;; python-diff-mode.el --- Python highlighting with diff-coloured +/- lines -*- lexical-binding: t; -*-

;; Use from an org source block as `#+begin_src python-diff'.  Lines that begin
;; with `+' or `-' take the `diff-added' or `diff-removed' face; every other
;; line is highlighted as Python.

;; (with-eval-after-load 'org
;;  (load "~/code/aioa-core/python-diff-mode"))

;;; Code:

(require 'dash)
(require 'python)
(require 'diff-mode)

(defconst python-diff-prefix-faces
  '(("+" . diff-added)
    ("-" . diff-removed))
  "Alist from a leading diff prefix to the face colouring that line.")

(defconst python-diff-font-lock-keywords
  (--map (list (rx bol (literal (car it)) (* nonl) eol)
               (list 0 (list 'quote (cdr it)) t))
         python-diff-prefix-faces)
  "Font-lock keywords that paint diff lines over Python's own highlighting.")

(define-derived-mode python-diff-mode python-mode "Python-Diff"
  "Python major mode that colours lines starting with `+' or `-' as diff."
  (font-lock-add-keywords nil python-diff-font-lock-keywords 'append))

(with-eval-after-load 'org-src
  (add-to-list 'org-src-lang-modes '("python-diff" . python-diff)))

(provide 'python-diff-mode)
;;; python-diff-mode.el ends here
