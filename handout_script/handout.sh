#!/bin/sh

FINAL_OUTPUT="final_handout.pdf"
LINES="lines.pdf"

TMPDIR="tmphandout"
HANDOUT="$TMPDIR/handout.pdf"
HANDOUT_TMP="$TMPDIR/tmp.pdf"
TMPJAM_OUTPUT="$TMPDIR/tmp_pdfjam.pdf"

mkdir -p $TMPDIR

pdftk "$1" burst output "$TMPDIR/p%04d.pdf"
for p in $TMPDIR/*.pdf; do
    pdfs="$pdfs $p $LINES"
done

pdftk $pdfs cat output "$HANDOUT_TMP"
pdfjam --nup 2x4 --landscape --frame false --noautoscale false --delta "0.2cm 0.3cm" --scale 0.95 "$HANDOUT_TMP" --outfile "$TMPJAM_OUTPUT"

pdfcrop --margins '5 5 5 5' "$TMPJAM_OUTPUT" "$FINAL_OUTPUT"
#pdfjam-slides6up --frame false --outfile "$TMPDIR" "$HANDOUT"

trap 'rm -rf "$TMPDIR"' EXIT
