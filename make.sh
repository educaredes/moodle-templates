#!/bin/bash
java -cp ./jar/saxon9he.jar net.sf.saxon.Transform -t -s:essay-plaintext-params.xml essay-plaintext.xslt outdir=output
