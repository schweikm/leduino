#!/bin/bash
set -o nounset


echo
echo
echo "========================="
echo "==== Step 6: Doxygen ===="
echo "========================="
echo
echo

doxygen support/Doxyfile
echo Done!
