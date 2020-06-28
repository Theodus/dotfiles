#!/bin/bash

set -e
set -u

file_name=$1

echo \
  "require(rmarkdown); render(\"$file_name\", output_format=\"pdf_document\")" | \
  R --vanilla
