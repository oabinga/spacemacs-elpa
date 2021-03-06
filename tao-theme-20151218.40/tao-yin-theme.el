;;; tao-yin-theme.el --- A dark golden mean grayscale color theme for Emacs.

;; Copyright (C) 2014 Peter Kosov <11111000000 at email.com>
;; Author: Peter <11111000000 at email.com>
;; Contributors: Jasonm23 <jasonm23@gmail.com>
;; Package-Requires:            ((cl-lib "0.5"))
;;
;; Original faces taken from Zenburn theme port (c) by Bozhidar Batsov
;;
;; Color palette generated automatically by golden-ratio algorithm v1.0
;;
;; URL: http://github.com/11111000000/tao-theme-emacs
;; Version: 1.0

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
;;; Code:

(require 'tao-yinyang-common)

(deftheme tao-yin "The Tao color theme dark")

(tao-with-color-variables
  tao-theme-golden-grayscale-yin-palette
  (tao-apply-custom-theme 'tao-yin))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'tao-yin)

;;;###autoload

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
;;; tao-yin-theme.el ends here
