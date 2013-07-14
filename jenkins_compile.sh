#!/bin/bash
set -o nounset


echo
echo
echo "================================="
echo "==== Step 2: Compile Arduino ===="
echo "================================="
echo
echo

make -wB build


echo
echo
echo "===================================="
echo "==== Step 3: Compile Unit Tests ===="
echo "===================================="
echo
echo

pushd test > /dev/null
make -wB
popd > /dev/null
