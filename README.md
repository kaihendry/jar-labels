# jar-labels

Printable A4 labels for jars, made with LaTeX.

The current sheet has **12 Praze Spicy Apple Chutney labels**, dated **Oct 2026**,
in three columns and four rows. Each label has a different font family and a
rounded double border. The cut size is **60 x 40 mm (6 x 4 cm)**.

Corner cut marks, dimension arrows, and a 50 mm ruler show the physical size.
The header explains how to cut out the labels and stick them onto glass jars
with milk.

## Build and preview

On macOS with Homebrew:

```sh
brew install tectonic
make
make view
```

`make` creates `labels.pdf`. [Tectonic](https://tectonic-typesetting.github.io/book/latest/installation/)
downloads its LaTeX packages and fonts on the first build, which needs an
internet connection. It handles the required LaTeX passes automatically.

The Makefile falls back to `pdflatex` if Tectonic is unavailable. An existing
TeX Live/MacTeX installation needs the LaTeX, TikZ/PGF, and font packages used by
`labels.tex`. On Linux, use the Tectonic installation instructions above or
your TeX Live packages.

`make clean` removes auxiliary files; `make distclean` also removes the PDF.
Generated files are ignored by Git.

## Change the labels

Edit these definitions near the top of `labels.tex`:

```tex
\newcommand{\labelbrand}{Praze}
\newcommand{\labelproduct}{Spicy Apple\\Chutney}
\newcommand{\labeldate}{Oct 2026}
```

Use `\\` to insert a line break. Font choices are in `\selectlabelfont`, with
matching names in `\getfontname`.

Keep the sheet to 12 labels maximum, with a different font family on each label.
Avoid typewriter/monospaced fonts. Keep the artwork as vectors with embedded
fonts, and retain the cut marks, dimension arrows, scale ruler, and milk
instructions outside the labels. Rebuild and check the PDF after editing.

## Print

For the Brother DCP-L2530DW macOS AirPrint queue, load plain A4 paper in the
main tray, then print one sheet with:

```sh
make print
```

This selects A4 portrait, plain paper, the main tray, High quality, actual size,
and single-sided printing. The installed queue maps High to **1200 x 1200 dpi**.
These settings apply only to this job.

Use `make -n print` to inspect the command without printing. List printer queues
with `lpstat -p`; select another with `make print PRINTER=your_queue_name`.

When printing from Preview, select **A4**, **100% / Actual Size**, **High / Best**
quality, **Plain Paper**, and **one page per sheet**. Turn off two-sided printing
and Toner Save if offered. Print the PDF directly to preserve sharp text and
lines. Check that the printed ruler measures exactly **5 cm**, then cut out at
the corner marks and stick onto the jars with milk.

See Brother's [DCP-L2530DW specifications](https://support.brother.com/g/b/spec.aspx?c=gb&lang=en&prod=dcpl2530dw_eu).
For adhesive label stock, use laser-compatible sheets, select Labels as the
media type, and follow the [manual-feed instructions](https://support.brother.com/g/b/sp/faqend.aspx?c=gb&faqid=faq00002216_008&ftype3=1964&lang=en&prod=dcpl2530dw_eu)
with the rear output cover open instead of using the plain-paper command above.

## Background

This project started with marmalade labels made with the help of Claude.

![Original marmalade labels on jars](https://s.natalian.org/2026-01-12/labels.jpeg)

- [Original conversation](https://gisthost.github.io/?e904e7b92d9250b2aaf3e97c31d9756e/index.html),
  exported using `uvx claude-code-transcripts --gist`.
- [Short video](https://youtube.com/shorts/gItMDCIRkEE?feature=share).
