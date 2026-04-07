# Contribute to KOMA-Script

Open source projects are highly dependent on user participation. This is
especially true for projects such as KOMA-Script, which consist of tens of
thousands of lines of code and hundreds of pages of documentation in two
languages. In the past, there have been repeated phases with individual
instances of assistance. The first manual was created in the 1990s thanks to
the commitment of one user. Similarly, the original letter class was
contributed by another developer. Individual users have also repeatedly
distinguished themselves in testing and translation.

In fact, however, KOMA-Script has been and continues to be kept alive and
developed mainly by a single developer. Since the development of the LaTeX
kernel and core packages is progressing at a rapid pace, this is hardly
feasible anymore. Therefore, assistance is urgently needed.

# The Currently Active Contributors

 * Markus Kohm — Maintainance, Development, Implementation, Support and Handyman
 * Marei Peischl — Tagging

As can be seen, the testing area is completely vacant and all other areas are
underrepresented. So **your help is needed!**

## Testing

There are two types of test:

 1. Testing with current releases
 2. Testing code from ongoing development
 
Anyone can perform the first type of testing. All you need to do is regularly
update the LaTeX distribution you are using and then check your existing
documents and, if necessary, any test documents you have developed yourself to
ensure that they still function properly. If an error occurs, it should be
narrowed down using a binary search and then reported via [the issue
tracker](https://sourceforge.net/p/koma-script/tickets/),
together with the resulting minimal working example. Please *don't forget to
minimize the document preamble.*

Anyone can get involved in the transition to the second type of testing. In
addition to the official release, there is always a pre-release version of the
LaTeX kernel and some core packages that is already at an advanced stage of
development. To test these, LaTeX runs are performed with `pdflatex-dev`,
`lualatex-dev`, or `xelatex-dev` (for which the same applies as for `xelatex`)
instead of with `pdflatex`, `lualatex`, or (the now no longer recommended)
`xelatex`. For more details, see
[`latex-base-dev`](https://www.ctan.org/pkg/latex-base-dev). In addition to
testing existing documents, it is also desirable to test the changes
documented in the current LaTeX News (the latest issue of `ltnews*.pdf`,
currently only available in `latex-base-dev`). A particular difficulty here is
assessing whether problems are general problems of the future LaTeX version or
specifically related to KOMA-Script. This can be tested in part by trying to
replace the KOMA-Script classes with standard classes in the complete minimal
examples and removing KOMA-Script packages. If the problem persists, it should
be reported to the LaTeX team. Otherwise, and in unclear cases, reports can be
made either to the LaTeX team and [the KOMA-Script issue
tracker](https://sourceforge.net/p/koma-script/tickets/), or only to the
latter.

The second type of test requires a little more preparation. To do this, you
need to download the [code for the current KOMA-Script
development](https://sourceforge.net/p/koma-script/code/HEAD/tree/trunk/). This
can be done either by using the “Download Snapshot” option provided there or
by checking out the current source into a working directory using a Subversion
client (e.g., `svn` on Linux or OSX, or TortoiseSVN or SilksSVN on
Windows). You can then install this developer version without the manual using
`l3build install` or with the manual using `l3build install --full`. You can
undo the installation with `l3build uninstall`, so that the KOMA-Script
version from the TeX distribution is used again. You can also specify a
different target tree for the installation with 
`l3build install --texmfhome <TEXMF-ROOT>`. 
`<TEXMF-ROOT>` must be set to the root directory of the target
tree. For MiKTeX users, this specification is even mandatory. Depending on the
TeX distribution, this root must then be integrated as an additional TEXMF
tree and removed again after the tests have been completed. For more
information on activating and deactivating additional TEXMF trees, refer to
the instructions for the TeX distribution used. With the developer version
installed, you can then also perform tests as described above.

## Support

As an experienced user, you can also provide assistance to the support
team. To do so, log in to SourceForge, subscribe to the issue tracker, and
follow the reports that come in there. You can now provide assistance in
various ways: 

* If a reported issue seems familiar to you, i.e., you believe it has been
  reported before, you can comment on the new report to provide a link to the
  already known issue. This is quite easy to do by entering the number of the
  report in square brackets and adding a hash sign, for example `[#12]` for a
  link to Issue [#12](https://sourceforge.net/p/koma-script/tickets/12/). If a
  solution to a reported problem can be found in the
  [Wiki](https://sourceforge.net/p/koma-script/_list/wiki), you can also link
  to it. It is usually desirable to link to both the corresponding entry in
  the German and English Wiki. This can be done by using, e.g.,
  `[wiki-en:HowTo]` (English) and `[wiki-de:HowTo]` (German). The part after
  the colon has been deliberately chosen to be identical in both languages.

* If a problem description seems unclear to you and, e.g., a complete
  minimal example or information about the KOMA-Script version used is
  missing, you are welcome to point this out *politely* and, if necessary,
  offer assistance in supplementing the missing information.

* If you know a solution to the problem described—regardless of whether it has
  to do with KOMA-Script or not—you are welcome to provide the solution.

* If you recognize that a problem is unrelated to KOMA-Script, you may also
  point this out and, if necessary, provide assistance on where the problem
  should be reported or inquired about.
  
It should be noted at this point that many support requests are still received
by email. As a rule, the KOMA-Script author asks that problems which appear to
be of general interest be reported in the issue tracker. Unfortunately, this
is often not done. Sometimes the KOMA-Script author adds them
himself. However, such reports often need to be processed, for example
translated into English. If you have enough experience to feel confident about
doing such processing and translation, please feel free to contact us.

## Wiki

[The KOMA-Script Wiki](https://sourceforge.net/p/koma-script/_list/wiki)
already contains a large number of helpful articles,
especially in the HowTo section. Most of them are edited articles from the
former KOMA-Script Documentation Project, also known as the old KOMA-Script
homepage. Some are completely new. However, there are never enough such
pages. So if you discover an interesting problem for which KOMA-Script offers
a nice solution, add it there. However, we ask that you write all articles in
both German and English and sort them into both wikis. All articles in the
wiki are considered public domain! Please do not publish any articles there
under special rights restrictions, as this always hinders the further
development of articles and runs counter to the purpose of a wiki for an open
source project.

## Development

The actual development of KOMA-Script, i.e., improving the code and
implementing new features, is also possible. Improving the code is based on
testing and support (see above) and supplements this with proposed solutions
through code changes. This can be done in a variety of ways, for example,
through push requests, proposed solutions in the issue tracker, or direct
collaboration. For the latter, please contact the KOMA-Script maintainer by
email. However, please understand that not every developer can become a
write-access user in the repository.

Packages are also frequently split off from KOMA-Script. In many cases, this
is done in the hope that a new maintainer for the package in question will be
found sooner or later. If you are interested, please contact the KOMA-Script
maintainer by email.

Even within KOMA-Script, there are individual packages that have not (yet)
been split off but are nevertheless relatively independent from the rest of
KOMA-Script. Here, too, an internal, gradual takeover of development, leading
to a split-off as a separate project, is conceivable.

And then there are special areas that may have their own manager who drives
and monitors development in close cooperation with the main maintainer. One
example is the area of tagging and metadata, which currently has its own
manager (see above). Other such areas are possible.

## Maintainance

Last but not least, the entire development of KOMA-Script should be
transferred to a new maintainer at some point. The target date for this is
currently April 2032.
