;;; bind-map-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "bind-map" "bind-map.el" (22167 18459 983334
;;;;;;  458000))
;;; Generated autoloads from bind-map.el

(autoload 'bind-map "bind-map" "\
Bind keymap MAP in multiple locations.
If MAP is not defined, this will create a new sparse keymap with
the name MAP. Supports binding in evil states and conditioning
the bindings on major and/or minor modes being active. The
options are controlled through the keyword arguments ARGS, all of
which are optional.

The package evil is only required if one of the :evil-keys is
specified.

:keys (KEY1 KEY2 ...)

The keys to use for the leader binding. These are strings
suitable for use in `kbd'.

:override-minor-modes BOOL

If non nil, make keys in :keys override the minor-mode maps, by
using `emulation-mode-map-alists' instead of the `global-map'.
This is done for the :evil-keys using evil local state maps. If
either :major-modes or :minor-modes is specified, this setting
has no effect.

The overriding behavior can be toggled using the minor mode
MAP-overriding-mode (the name of the minor mode can be customized
in the next keyword). It is enabled by default when you specify
this keyword.

:override-mode-name SYMBOL

The name to use for the minor mode described for the previous
keyword (a default name will be given if this is left
unspecificied). This setting as no effect
if :override-minor-modes is nil or unspecified.

:evil-keys (KEY1 KEY2 ...)

Like :keys but these bindings are only active in certain evil
states.

:evil-states (STATE1 STATE2 ...)

Symbols representing the states to use for :evil-keys. If nil,
use `bind-map-default-evil-states'.

:evil-use-local BOOL

\(Deprecated) This is now equivalent to setting
`:override-minor-modes' to t, which handles evil and non-evil
keys now.

:major-modes (MODE1 MODE2 ...)

If specified, the keys will only be bound when these major modes
are active. If both :major-modes and :minor-modes are nil or
unspecified the bindings are global.

:minor-modes (MODE1 MODE2 ...)

If specified, the keys will only be bound when these minor modes
are active. If both :major-modes and :minor-modes are nil or
unspecified the bindings are global.

:prefix-cmd COMMAND-NAME

Declare a prefix command for MAP named COMMAND-NAME.

\(fn MAP &rest ARGS)" nil t)

(autoload 'bind-map-for-major-mode "bind-map" "\
Short version of `bind-map' if you want to bind a map for a
single major mode. MAJOR-MODE-SYM is the unquoted symbol
representing a major mode. This macro makes the call

\(bind-map map-name
  :major-modes (MAJOR-MODE-SYM)
  ARGS)

where ARGS should include :keys or :evil-keys. The name of the
generated keymap is returned, which is MAJOR-MODE-SYM concatenated
with `bind-map-default-map-suffix'.

\(fn MAJOR-MODE-SYM &rest ARGS)" nil t)

(autoload 'bind-map-for-minor-mode "bind-map" "\
Short version of `bind-map' if you want to bind a map for a
single minor mode. MINOR-MODE-SYM is the unquoted symbol
representing a minor mode. This macro makes the call

\(bind-map map-name
  :minor-modes (MINOR-MODE-SYM)
  ARGS)

where ARGS should include :keys or :evil-keys. The name of the
generated keymap is returned, which is MINOR-MODE-SYM
concatenated with `bind-map-default-map-suffix'.

\(fn MINOR-MODE-SYM &rest ARGS)" nil t)

(autoload 'bind-map-set-keys "bind-map" "\
Add a series of bindings to MAP.
BINDINGS is a series of KEY DEF pairs. Each KEY should be a
string suitable for `kbd'.

\(fn MAP KEY DEF &rest BINDINGS)" nil nil)

(autoload 'bind-map-set-key-defaults "bind-map" "\
Add a series of default bindings to MAP.
Default bindings never override existing ones. BINDINGS is a
series of KEY DEF pairs. Each KEY should be a string suitable for
`kbd'.

\(fn MAP KEY DEF &rest BINDINGS)" nil nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; bind-map-autoloads.el ends here
