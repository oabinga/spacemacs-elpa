;;; flycheck-buttercup.el --- Flycheck: Extensions to Buttercup -*- lexical-binding: t; -*-

;; Copyright (C) 2016 Sebastian Wiesner and Flycheck contributors

;; Author: Sebastian Wiesner <swiesner@lunaryorn.com>
;; Keywords: lisp, tools

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Extensions to Buttercup to write BDD tests for Flycheck.
;;
;; Buttercup is a BDD testing framework for Emacs, see URL
;; `https://github.com/jorgenschaefer/emacs-buttercup/'.  Flycheck uses
;; Buttercup extensively for new tests.
;;
;; This library provides extensions to Buttercup to write Specs for Flycheck.
;;
;; * Custom matchers
;;
;; (expect 'foo :to-be-local) - Is `foo' a local variable in the current buffer?

;;; Code:

(require 'buttercup)
(require 'flycheck)
(require 'seq)

(defun flycheck-buttercup-format-error-list (errors)
  "Format ERRORS into a human-readable string."
  (mapconcat (lambda (e) (flycheck-error-format e 'with-file-name))
             errors "\n"))


;;; Data matchers

(buttercup-define-matcher :to-be-empty-string (s)
  (if (equal s "")
      (cons t (format "Expected %S not be an empty string" s))
    (cons nil (format "Expected %S to be an empty string" s))))

(buttercup-define-matcher :to-match-with-group (re s index match)
  (let* ((matches? (string-match re s))
         (result (and matches? (match-string index s))))
    (if (and matches? (equal result match))
        (cons t (format "Expected %S not to match %S with %S in group %s"
                        re s match index))

      (cons nil (format "Expected %S to match %S with %S in group %s, %s"
                        re s match index
                        (if matches?
                            (format "but got %S" result)
                          "but did not match"))))))


;;; Emacs feature matchers

(buttercup-define-matcher :to-be-local (symbol)
  (if (local-variable-p symbol)
      (cons t (format "Expected %S not to be a local variable, but it is"
                      symbol))
    (cons nil (format "Expected %S to be a local variable, but it is not"
                      symbol))))


;;; Flycheck matchers

(buttercup-define-matcher :to-be-equal-flycheck-errors (a b)
  (let ((a-formatted (flycheck-buttercup-format-error-list a))
        (b-formatted (flycheck-buttercup-format-error-list b)))
    (if (equal a b)
        (cons t (format "Expected
%s
not to be equal to
%s" a-formatted b-formatted))
      (cons nil (format "Expected
%s
to be equal to
%s" a-formatted b-formatted)))))

(provide 'flycheck-buttercup)
;;; flycheck-buttercup.el ends here
