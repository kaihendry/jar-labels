.PHONY: all clean distclean view print
.DELETE_ON_ERROR:

PRINTER ?= Brother_DCP_L2530DW_series

# Default target
all: labels.pdf

# Build the PDF from LaTeX source
labels.pdf: labels.tex Makefile
	@if command -v tectonic >/dev/null 2>&1; then \
		tectonic "$<"; \
	elif command -v pdflatex >/dev/null 2>&1; then \
		pdflatex -interaction=nonstopmode -halt-on-error "$<" && \
		pdflatex -interaction=nonstopmode -halt-on-error "$<"; \
	else \
		echo "No LaTeX engine found. On macOS, run: brew install tectonic" >&2; \
		echo "See README.md for setup instructions." >&2; \
		exit 1; \
	fi

# Print one sheet on plain A4 paper using the Brother AirPrint queue.
print: labels.pdf
	lp -d "$(PRINTER)" -n 1 -o PageSize=A4 -o MediaType=stationery \
		-o InputSlot=tray-1 -o cupsPrintQuality=High -o Duplex=None \
		-o orientation-requested=3 -o number-up=1 -o print-scaling=none "$<"

# Clean up auxiliary files
clean:
	rm -f labels.aux labels.log labels.out labels.toc labels.synctex.gz labels.xdv

# Clean everything including the PDF
distclean: clean
	rm -f labels.pdf

# View the PDF (requires a PDF viewer)
view: labels.pdf
	@if [ "$$(uname -s)" = Darwin ]; then \
		open labels.pdf; \
	elif command -v xdg-open >/dev/null 2>&1; then \
		xdg-open labels.pdf; \
	elif command -v evince >/dev/null 2>&1; then \
		evince labels.pdf; \
	else \
		echo "Please open labels.pdf manually"; \
	fi
