#!/bin/bash
java -cp ./jar/saxon9he.jar net.sf.saxon.Transform -t -s:multichoice-params.xml multichoice.xslt outdir=output
