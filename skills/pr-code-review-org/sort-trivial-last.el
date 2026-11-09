;;; sort-trivial-last.el --- Sort PR changed files, all-trivial files last -*- lexical-binding: t; -*-

;;; Commentary:

;; Used by pr_code_review_org.py after enrichment.  Sorts the file headings
;; under `* Changes' so that a file whose only child heading is `trivial
;; changes' sorts after every other file.  Other files keep their order.

;;; Code:

(require 'org)
(require 'subr-x)

(defconst pr-code-review-org-trivial-heading "trivial changes"
  "Title of the subheading that groups trivial hunks within a file.")

(defun pr-code-review-org--only-trivial-p ()
  "Return non-nil if the file heading at point has only a trivial child heading."
  (let* ((child-stars (make-string (1+ (org-current-level)) ?*))
         (end (save-excursion (org-end-of-subtree t t)))
         (titles '()))
    (save-excursion
      (forward-line 1)
      (while (re-search-forward (format "^%s \\(.*\\)$" (regexp-quote child-stars)) end t)
        (push (string-trim (match-string-no-properties 1)) titles)))
    (and titles
         (seq-every-p (lambda (title)
                        (string-equal-ignore-case title pr-code-review-org-trivial-heading))
                      titles))))

(defun pr-code-review-org-sort-trivial-last (file)
  "Sort the file headings under `* Changes' in FILE, all-trivial files last."
  (with-temp-buffer
    (insert-file-contents file)
    (org-mode)
    (goto-char (point-min))
    (re-search-forward "^\\* Changes$")
    (org-sort-entries nil ?f
                      (lambda () (if (pr-code-review-org--only-trivial-p) 1 0))
                      #'<)
    (write-region nil nil file)))

(provide 'sort-trivial-last)
;;; sort-trivial-last.el ends here
