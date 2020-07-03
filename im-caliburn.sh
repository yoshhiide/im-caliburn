#!/bin/bash

if [ $# -ne 1 ]; then
  echo "1 argument is required."
  exit 1
fi

infile=$1
workfile="temp.jpg"
outfile="${infile}_output.jpg"

`\cp $infile $workfile`;

# colorspace
#`\convert $workfile -colorspace rgb -colorspace srgb $workfile`;

# level
`\convert $workfile -normalize $workfile`;

# equalize file
`\convert $workfile -equalize $workfile`;

# level
`\convert $workfile -level 3%,98% $workfile`;

# contrast
#`\convert $workfile -linear-stretch 0%,30% $workfile`;

# evaluate:1
#`\convert $workfile -evaluate log 1.1 $workfile`;

# brightness
#`\convert $workfile -modulate 110 $workfile`;


# [last]noise reduction
`\convert $workfile -noise 2 $workfile`;

# output
`\mv $workfile $outfile`;

