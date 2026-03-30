#!/bin/bash

# LaTeX Compilation Script for modelo.tex
# This script compiles the LaTeX document with bibliography support

set -e  # Exit on error

MAIN_FILE="modelo"
TEX_FILE="${MAIN_FILE}.tex"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}========================================${NC}"
echo -e "${YELLOW}Compiling ${TEX_FILE}${NC}"
echo -e "${YELLOW}========================================${NC}"

# Check if the .tex file exists
if [ ! -f "$TEX_FILE" ]; then
    echo -e "${RED}Error: ${TEX_FILE} not found!${NC}"
    exit 1
fi

# First pass: pdflatex
echo -e "\n${GREEN}[1/4] Running pdflatex (first pass)...${NC}"
pdflatex -interaction=nonstopmode "$TEX_FILE" > /dev/null || {
    # Check if PDF was generated despite errors
    if [ ! -f "${MAIN_FILE}.pdf" ]; then
        echo -e "${RED}Error during first pdflatex pass. Check ${MAIN_FILE}.log for details.${NC}"
        exit 1
    fi
}

# Run bibtex
echo -e "\n${GREEN}[2/4] Running bibtex...${NC}"
bibtex "$MAIN_FILE" > /dev/null 2>&1 || {
    echo -e "${YELLOW}Warning: bibtex encountered issues. Continuing...${NC}"
}

# Second pass: pdflatex (to include bibliography)
echo -e "\n${GREEN}[3/4] Running pdflatex (second pass)...${NC}"
pdflatex -interaction=nonstopmode "$TEX_FILE" > /dev/null || {
    # Check if PDF was generated despite errors
    if [ ! -f "${MAIN_FILE}.pdf" ]; then
        echo -e "${RED}Error during second pdflatex pass. Check ${MAIN_FILE}.log for details.${NC}"
        exit 1
    fi
}

# Third pass: pdflatex (to fix references)
echo -e "\n${GREEN}[4/4] Running pdflatex (third pass)...${NC}"
pdflatex -interaction=nonstopmode "$TEX_FILE" > /dev/null || {
    # Check if PDF was generated despite errors
    if [ ! -f "${MAIN_FILE}.pdf" ]; then
        echo -e "${RED}Error during third pdflatex pass. Check ${MAIN_FILE}.log for details.${NC}"
        exit 1
    fi
}

echo -e "\n${GREEN}========================================${NC}"
echo -e "${GREEN}Compilation successful!${NC}"
echo -e "${GREEN}Output: ${MAIN_FILE}.pdf${NC}"
echo -e "${GREEN}========================================${NC}"

# Optional: Clean up auxiliary files (use -c/--clean to remove aux files after successful compilation)
CLEAN=0
KEEP_BBL=0

# Parse optional flags (checked after compilation)
while [ $# -gt 0 ]; do
    case "$1" in
        -c|--clean)
            CLEAN=1
            shift
            ;;
        --keep-bbl)
            KEEP_BBL=1
            shift
            ;;
        -h|--help)
            echo -e "${YELLOW}Usage: $0 [-c|--clean] [--keep-bbl]${NC}"
            echo -e "${YELLOW}  -c, --clean    Remove auxiliary files after successful compilation${NC}"
            echo -e "${YELLOW}  --keep-bbl     Keep the generated .bbl file (ignored if not cleaning)${NC}"
            exit 0
            ;;
        *)
            shift
            ;;
    esac
done

# If requested, remove common LaTeX auxiliary files but keep essential sources and outputs
if [ "$CLEAN" -eq 1 ]; then
    echo -e "\n${YELLOW}Cleaning up auxiliary files...${NC}"
    # Make globs that don't match expand to empty
    shopt -s nullglob
    patterns=( \
        "*.aux" "*.log" "*.out" "*.toc" "*.lof" "*.lot" \
        "*.blg" "*.brf" "*.idx" "*.ind" "*.ilg" "*.xwm" \
        "*.nav" "*.snm" "*.synctex.gz" "*.fdb_latexmk" "*.fls" \
        "*.run.xml" "*~" "*.bak" "*.dvi" "*.ps" "*.spl" \
    )

    # Remove .bbl by default unless user asked to keep it
    if [ "$KEEP_BBL" -eq 0 ]; then
        patterns+=("*.bbl")
    fi

    for p in "${patterns[@]}"; do
        for f in $p; do
            rm -f "$f" 2>/dev/null || true
        done
    done
    shopt -u nullglob
    echo -e "${GREEN}Cleanup complete. Kept: ${MAIN_FILE}.pdf, *.tex, *.bib, *.bst, *.sty, *.cls, and image files.${NC}"
fi

exit 0
