#!/bin/bash
SAXONJAR="./jar/saxon9he.jar"
java -cp $SAXONJAR net.sf.saxon.Transform -t -s:essay-plaintext-params.xml essay-plaintext.xslt outdir=output

java -cp $SAXONJAR net.sf.saxon.Transform -t -s:multichoice-params.xml multichoice.xslt outdir=output
