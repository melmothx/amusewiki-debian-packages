TFM & VF font for upTeX/upLaTeX based on "jis font TFM & VF set"
================================================================


The files in this bundle are
based on "jis font TFM & VF set"
by ASCII Corporation (currently ASCII MEDIA WORKS Inc.)
and modified for upTeX/upLaTeX.
These are available under the license agreement in "README_ASCII_Corp.txt".

このバンドルのファイルは、
株式会社アスキー(現 株式会社アスキー・メディアワークス)による
「jisフォントTFM&VFセット」をもとに
upTeX/upLaTeX向けに改変したものです。
"README_ASCII_Corp.txt" の内容にしたがってご利用ください。


Added or modified Setting from jis.tfm / jis.tfm から追加・変更した設定
----------------------------------------------------------------------

### upjis, upjpn for Japanese / 日本語

* Type1: U+FF5F U+3018 U+3016 U+301D U+00AB U+2329 U+301A
* Type2: U+FF60 U+3019 U+3017 U+301F U+00BB U+232A U+301B U+301E
* Type3: U+00B7
* Type5: JIS 0x213D -> U+2014 and U+2015

### upsch for Simplified Chinese / 中国語簡体字

* Type1: U+FF5F U+3018 U+3016 U+301D U+2329 U+301A
* Type2: U+FF60 U+3019 U+3017 U+301F U+232A U+301B U+301E
* Type3: U+00B7
* Type5: U+2014 and U+2015
* move from Type3 to Type2 (only horizontal): U+FF1A U+FF1B
* Type4 (only horizontal): U+FF01 U+FF1F

### uptch for Traditional Chinese / 中国語繁体字

* Type1: U+FF5F U+3018 U+3016 U+301D U+2329 U+301A U+FE59 U+FE5B U+FE5D
* Type2: U+FF60 U+3019 U+3017 U+301F U+232A U+301B U+301E U+FE5A U+FE5C U+FE5E
* Type3: U+00B7
* move from Type2 to Type3: U+3001 U+FF0C
* move from Type4 to Type3: U+3002 U+FF0E
* rename from Type5 to Type4: U+2014 and U+2015

### upkor for Korean / 韓国語

* Type1: U+FF5F U+3018 U+3016 U+2329 U+301A
* Type2: U+FF60 U+3019 U+3017 U+232A U+301B
* Type3: U+00B7
* Type5: U+2014 and U+2015

| Unicode | Name in Unicode                           |   | JIS X 0213 | Name in JIS
|:------:|--------------------------------------------|:--:|:-------:|--------------------
| U+00AB | LEFT-POINTING DOUBLE ANGLE QUOTATION MARK  | « | 1-09-08 | 始め二重山括弧引用記号/始めギュメ
| U+00BB | RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK | » | 1-09-18 | 終わり二重山括弧引用記号/終わりギュメ
| U+00B7 | MIDDLE DOT                                 | · | 1-09-14 | 中点（ラテン）
| U+2329 | LEFT-POINTING ANGLE BRACKET                | 〈  | NA      | NA
| U+232A | RIGHT-POINTING ANGLE BRACKET               | 〉  | NA      | NA
| U+3001 | IDEOGRAPHIC COMMA                          | 、 | 1-01-02 | 読点
| U+3002 | IDEOGRAPHIC FULL STOP                      | 。 | 1-01-03 | 句点
| U+3016 | LEFT WHITE LENTICULAR BRACKET              | 〖 | 1-02-58 | 始めすみ付き括弧(白)
| U+3017 | RIGHT WHITE LENTICULAR BRACKET             | 〗 | 1-02-59 | 終わりすみ付き括弧(白)
| U+3018 | LEFT WHITE TORTOISE SHELL BRACKET          | 〘 | 1-02-56 | 始め二重亀甲括弧
| U+3019 | RIGHT WHITE TORTOISE SHELL BRACKET         | 〙 | 1-02-57 | 終わり二重亀甲括弧
| U+301A | LEFT WHITE SQUARE BRACKET                  | 〚 | NA      | NA
| U+301B | RIGHT WHITE SQUARE BRACKET                 | 〛 | NA      | NA
| U+301D | REVERSED DOUBLE PRIME QUOTATION MARK       | 〝 | 1-13-64 | 始めダブルミニュート
| U+301E | DOUBLE PRIME QUOTATION MARK                | 〞 | NA      | NA
| U+301F | LOW DOUBLE PRIME QUOTATION MARK            | 〟 | 1-13-65 | 終わりダブルミニュート
| U+FF01 | FULLWIDTH EXCLAMATION MARK                 | ！ | 1-01-10 | 感嘆符
| U+FF0C | FULLWIDTH COMMA                            | ， | 1-01-04 | コンマ
| U+FF0E | FULLWIDTH FULL STOP                        | ． | 1-01-05 | ピリオド
| U+FF1A | FULLWIDTH COLON                            | ： | 1-01-07 | コロン
| U+FF1B | FULLWIDTH SEMICOLON                        | ； | 1-01-08 | セミコロン
| U+FF1F | FULLWIDTH QUESTION MARK                    | ？ | 1-01-09 | 疑問符
| U+FF5F | FULLWIDTH LEFT WHITE PARENTHESIS           | ｟ | 1-02-54 | 始め二重パーレン
| U+FF60 | FULLWIDTH RIGHT WHITE PARENTHESIS          | ｠ | 1-02-55 | 終わり二重パーレン


#### About EM DASH & HORIZONTAL BAR / ダッシュ(全角)について

* Unicode U+2014: EM DASH
* Unicode U+2015: HORIZONTAL BAR
* JIS X 0208    01-29 ダッシュ(全角) (0x213D)
* JIS X 0213  1-01-29 ダッシュ(全角)

JIS -> Unicode conversion is ambiguous and depends on tables.

* 0x213D -> U+2014 : JIS, Macintosh, nkf, JavaJRE1.4.0 or later
* 0x213D -> U+2015 : Windows, gd, JavaJRE1.3.1, upTeX


ChangeLog
---------

### uptex-fonts-20220310
* cmap/UTF8-UTF16:
  Updated (Version: 1.008).

### uptex-fonts-20200229
* cmap/UTF8-UTF16:
  Updated (Version: 1.007).
* cmap/UniJISup-UTF16-H,UniJIS2004up-UTF16-H:
  Refer to Adobe-Japan1-7 (2019/07/30).

### uptex-fonts-20190209
* cmap/UTF8-UTF16:
  Updated (Version: 1.006).
* cmap/cid_mapping.md,UniJISup-UTF16-{H,V},UniJIS2004up-UTF16-{H,V}:
  Add U+32FF.

### uptex-fonts-20180328
* cmap/cid_mapping.md,UniJISup-UTF16-V,UniJIS2004up-UTF16-V:
  Add U+301E.
* source/punctuation.md,Makefile,makepl.perl,upjisr-h{,-hk}.pl,upjisr-v.pl,
  up{sch,tch,kor}r-{h,v}.pl:
  Refine punctuation marks and parentheses.
* tfm/,vf/: Update.

### uptex-fonts-20180211
* cmap/UTF8-UTF16:
  Updated (Version: 1.004).
* cmap/cid_mapping.md,UniJISup-UTF16-{H,V},UniJIS2004up-UTF16-{H,V}:
  New CMap files and document on the new cid mapping.
* Add U+00B7 to char_type 3.
* source/Makefile,makejvf-upjis.cnf,makejvf-upjpn.cnf:
  Added characters of Supplementary Ideographic Plane to upjis\*.vf
  Added CJK Unified Ideographs Extension F to upjpn\*.vf & upcns\*.vf

### uptex-1.00 [2012/01/15] TTK
* re-package for upTeX/upLaTeX Ver.1.00 distribution.
* makepl.perl, upjisr-h{,-hk}.pl, upjisr-v.pl,
  upjis{r,g}-{h,v}.tfm, up{jpn,kor,sch,tch}{rm,gt}-{h,v}.tfm:
  add U+2014 as Type 5 in tfm files.
* upjpn{rm,gt}-{h,v}.vf:
  add CJK Unified Ideographs Extension C,D.
* Makefile:
  update.

### v20110507a [2011/05/07] TTK
* re-package for upTeX/upLaTeX based on uptex-0.30 distribution.


References
----------
1.  [Adobe Type Tools / CMap Resources @ GitHub](https://github.com/adobe-type-tools/cmap-resources)
