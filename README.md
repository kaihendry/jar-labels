# Praze preserve labels

Builds an A4 sheet of **12 Praze Spiced Chutney labels**, dated **Oct 2026**,
in three columns and four rows. Each label uses a different font family and a
double rounded border, within a 60 x 40 mm area.
Edit `\labelbrand`, `\labelproduct`, and `\labeldate` in `labels.tex` to change
the wording or date.

## Build and preview

On macOS with Homebrew:

```sh
brew install tectonic
make
make view
```

[Tectonic](https://tectonic-typesetting.github.io/book/latest/installation/)
downloads the required LaTeX packages and fonts on the first build, so that
build needs an internet connection. It also runs the necessary LaTeX passes
automatically. There is no Homebrew formula named `pdflatex`.

`make` uses Tectonic when available, or falls back to `pdflatex` from an existing
TeX Live/MacTeX installation. On Linux, install Tectonic using its instructions
above, or use TeX Live with the LaTeX, TikZ/PGF, and font packages required by
`labels.tex`.

The output is `labels.pdf`. `make view` opens it with the default PDF viewer on
macOS or Linux. Print on A4 at actual size (100% scale).

`make clean` removes auxiliary files; `make distclean` also removes the PDF.

## Print on the Brother DCP-L2530DW

The PDF contains vector borders and embedded outline fonts for sharp text and
lines. Print the PDF directly; do not convert it to a screenshot or JPEG.

For the configured macOS AirPrint queue, load plain A4 paper into the main tray,
then run this command when ready to print one sheet:

```sh
make print
```

This selects A4 portrait, plain paper, the main tray, High quality, actual size,
and single-sided printing. The installed Brother queue maps High to
**1200 x 1200 dpi**. These options apply only to this job. To use another queue
name, run `make print PRINTER=your_queue_name`; list queues with `lpstat -p`.
Use `make -n print` to inspect the command without sending a print job.

To print from Preview instead, open the PDF with `make view` and choose:

- Paper size: **A4**, portrait, one page per sheet.
- Scale: **100% / Actual Size** (disable Scale to Fit).
- Quality: **High / Best**, or **1200 dpi** if offered.
- Media: **Plain Paper** for ordinary paper, using the main tray.
- Two-sided printing: **Off**; Toner Save: **Off**, if offered.

Brother documents the available resolutions in its
[DCP-L2530DW specifications](https://support.brother.com/g/b/spec.aspx?c=gb&lang=en&prod=dcpl2530dw_eu).
If you later use adhesive label stock, use laser-compatible sheets, select the
Labels media setting, and follow Brother's
[manual-feed instructions](https://support.brother.com/g/b/sp/faqend.aspx?c=gb&faqid=faq00002216_008&ftype3=1964&lang=en&prod=dcpl2530dw_eu)
with the rear output cover open instead of using the plain-paper command above.

## Background

<img src="https://s.natalian.org/2026-01-12/labels.jpeg" alt="sticking on labels to jars">

https://gisthost.github.io/?e904e7b92d9250b2aaf3e97c31d9756e/index.html

Transcript via `uvx claude-code-transcripts --gist`

Video: https://youtube.com/shorts/gItMDCIRkEE?feature=share

