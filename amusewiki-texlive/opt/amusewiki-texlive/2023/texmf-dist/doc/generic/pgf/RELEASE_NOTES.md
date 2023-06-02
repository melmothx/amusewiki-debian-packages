## [3.1.10] - 2023-01-13 Henri Menke

Even though this release is not too heavy on user-facing additions it has seen a
lot of contributed changes. Thanks to everyone who volunteered their time!

### BREAKING CHANGES

- `\pgfversiondatetime` and `\pgfrevisiondatetime` have been removed.
  `\pgfversiondate` and `\pgfrevisiondate` now use the format `YYYY-MM-DD`.
  `\pgfrevision{,date}` and `\pgfversion{,date}` are synonyms for now, but the
  revision should eventually gain back its original meaning.  However, as of now
  this is not supported by l3build.
- Many operations in `pgfkeys` used to use `\csname` directly which lets the
  given csname become `\relax` in case it wasn't defined. This resulted in some
  leakage of accidentally `\relax`ed keys into the global scope. This has been
  cleaned up a little. To preserve compatibility macros that used to expand to a
  `\relax`ed csname now expand to a primitive `\relax`. This affects the
  user-level commands `\pgfkeysgetvalue` and `\pgfkeysgetvalueof`. For the
  former the change should not be visible except for the number of expansions
  required. For `\pgfkeysgetvalueof`, however, the behavior is manifestly
  different in that it will now expand to an alias for the primitive `\relax` in
  case the value is undefined instead of a `\relax`ed csname. It has always been
  semantically wrong to assign to the result of `\pgfkeysgetvalueof`, but now it
  will have undesired side-effects. Therefore this change is breaking.
- The `textures` and `vtex` drivers have been deprecated. Both engines are no
  longer in active development and lack eTeX features which are required for
  quite some time in PGF.
- The file `pgfutil-common-lists.tex` is deprecated and therefore no longer
  `\input` by `pgfutil-common.tex`. The macros from this file are specifically
  meant for pgfplots and are not used in PGF at all.

### Added

- l3build support for packaging PGF/TikZ
- Add Matrix chat to README
- Add rhombic polihedra #1022
- Add Developer Certificate of Origin (DCO) to Pull Request template and enforce
- Add test set for `graphdrawing` (gd) 
- pgfkeys gained support for loading libraries
- Add dependabot to keep GitHub Actions up to date

### Fixed

- Wrap logic gate symbol in `\pgfinterruptpicture` for shapes in library
  `shapes.gates.logic.IEC`
- Remove superfluous `;` for shape `arrow box`
- Remove superfluous `/utils/exec` in animations
- Gobble `\pgf@stop` when parsing finishes in animations
- Add missing `\pgf@sys@tonumber` before `<dimen>` in drivers and animations
- Rewrite `dash expand off`
- Better unknown key error msg in decorations
- Fix `\let` in drivers for two csnames #1088
- Protect against comma in pgfkeys arguments #389
- Let active `"` expand to non-active `"` in pgfmath #1062
- Protect against comma in `/tikz/rotate fit` argument and make it
  eagerly evaluated #1071
- Set pics/code in angle #1068
- Fix for externalization and horizontal mode
- Avoid spurious tokens in `\pgfcalendarifdate` expansion
- Remove angle restriction #1048
- Fix compatibility of `external` lib with `fadings` lib
- Only clearpage and flush `\pgfutil@everybye` if non-empty #724
- Fix foreach documentation #1039
- Fix pgfmathless documentation #1040
- Blend mode as array is deprecated #1037
- One-step expansion for `\pgfmathrandomitem` in pgfmath #1033
- Check whether expanded is a primitive in all engines
- Reinsert the last token when giving up on a path #1025
- Make `/tikz/local bounding box` aware of `name prefix` and `name suffix`
- Add empty Pattern dictionary to Resources dictionary
- Spelling and typo fixes in the manual
- Update Debian installation instructions
- Suppress white space at line end when `datavisualization` reads from a file 
  #1112
- Form-only patterns have no specified color #1122 
- Make `graphdrawing` work with `name prefix` and `name suffix` options #1087
- pgfkeys was a bit too relaxed around `\relax` #1132
- Remove spurious spaces for `3d view` #1151
- Fix incorrectly placed matrix delimiters for implicitly positioned nodes #1102
- Use `/.append` to fix a wrong usage of `/.add` in pgfmanual #1201

### Changed

- Cleanup `\newif`s
- Remove unused scripts
- Remove experiments/ folder
- Simplify loading by delegating to top-level files
- Promote `Missing character` to errors in building manual
- Flatten the doc tree
- Ensure `\tracinglostchars<3` in `\pgf@picture`
- Use descriptive workflow job ids
- Ensure `doc` v2 is loaded for pgfmanual
- Ensure active `^^M` is non-expandable in `codeexample`

### Contributors

- 3geek14
- BeneIII
- graue70
- Gábor Braun
- Joel Coffman
- Jonathan Spratte
- Joseph Wright
- Mario Frasca
- Michael Kuron
- Michal Hoftich
- muzimuzhi
- PhelypeOleinik
- QJLc
- Stefan Pinnow

