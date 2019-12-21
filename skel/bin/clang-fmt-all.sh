#!/bin/sh

set -e
set -u

find . \
  \( \
    -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*.cxx" \
    -name "*.h" -o -name "*.hh" -o -name "*.hpp" -o -name "*.hxx" \
  \) \
  -exec clang-format -style=file -i {} +
