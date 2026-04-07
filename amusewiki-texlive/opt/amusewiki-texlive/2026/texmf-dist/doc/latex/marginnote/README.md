# marginnote
An experimental LaTeX package to add notes in the margin, even where `\marginpar` fails

---

LaTeX package `marginnote`

Copyright © 2005—2026 Markus Kohm

Release: 2026-01-05 v1.4d

Licence: LPPL 1.3c (see LICENSE.md)

CTAN Location: https://www.ctan.org/pkg/marginnote

LPPL Maintainance Status: unmaintained

---

The project is currently hosted and managed on
[Codeberg](https://codeberg.org/komascript/marginnote). For safety reasons,
the repository will continue to be mirrored in
[GitHub](https://github.com/komascript/marginnote) for some time. However, [bug
reports](https://codeberg.org/komascript/marginnote/issues) and [pull
requests](https://codeberg.org/komascript/marginnote/pulls) will only be
acknowleged on Codeberg.

## Summary

This package provides the command `\marginnote` that may be used instead of
`\marginpar` at almost every place, where `\marginpar` cannot be used,
e.g. inside floats, footnotes, frames made with framed package …

---

## Download and Installation

[Releases of `marginnote` are available from
CTAN](https://www.ctan.org/pkg/marginnote). You should install it using the
package manager of your TeX distribution. Updates should also be installed
using either MiKTeX upates or the TeX Live manager.

---

## Maintenance, Development, Support

A new maintainer and new developers would be welcome! Until a new maintainer
is found, all support will be shifted to the community. The author will only
create new releases based on qualified pull requests.

---

## Release History

### v1.4d:
* Correction of column detection calculation in two-column mode (by cabohah).

### v1.4c:
* Correction of documentation.

### v1.4b:
* Fix for vertical position of margin notes, e.g., inside lists.
* I do not longer maintain the package. If you want to become the new maintainer, see the title page or the issue section in the manual.

### v1.4a:
* Fix for consecutive odd pages or consecutive even pages in a double-ended document (e.g. with class option twoside) added. Note, however, using consecutive odd pages or consecutive even pages in a double-ended document is still not recommended, because printing with correct margins will still need at least an empty page between two odd or two even pages, because (La)TeX decides on the page counter, e.g., whether to use `\oddsidemargin` or `\evensidemargin` or whether to use `\@oddhead` and `\@oddfoot` or `\@evenhead` and `\@evenfoot`.

### v1.4:
* New options `parboxrestore` (new default to set `\parskip`, `\parindent`, `\par`, `\\` and several other commands an lengths at the beginning of every margin note) and `noparboxrestore` (to use the old default of marginnote before v1.4).

### v1.3:
* Support for two-column mode added.
* Support for engines without `\pdfsavepos` and `\savepos` removed.

### v1.2b:
* Support for package bidi.

### v1.2a:
* Bugfix.

### v1.2:
* Support for LuaTeX since 0.95.

### v1.1i:
* `\ignorespaces` added and `\strut` moved to allow hyphenation of the first word (suggested by Ulrike Fischer)

### v1.1g:
* made it `\long` to allow paragraph breaks at the text arguments of `\marginnote`
* also set `\linewidth`

### v1.1f:
* missing usage of `\marginnotevadjust` at left margins fixed

### v1.1e:
* new options `fulladjust`, `heightadjust`, `depthadjust`, and `noadjust` to change the general default of the vertical adjustment

### v1.1d:
* horizontal position fixed if `\hoffset` is not 0pt or `\pdfhorigin` is not 1in

### v1.1c:
* XeTeX also has `\pdfsavepos`

### v1.0:
* First release
