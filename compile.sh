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

# Optional: Clean up auxiliary files (uncomment if desired)
# echo -e "\n${YELLOW}Cleaning up auxiliary files...${NC}"
# rm -f *.aux *.log *.out *.toc *.lof *.lot *.bbl *.blg *.idx *.ind *.ilg

exit 0
