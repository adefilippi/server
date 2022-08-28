#!/bin/bash

if find "/install/scripts/application" -mindepth 1 -maxdepth 1 -type f -print -quit 2>/dev/null | read v; then
  for f in $(find "/install/scripts/application" -name '*.sh' -printf '%p\n' | sort -V -k1 | sort); do
    echo "Executing $f"
    chmod u+x $f
    bash "$f"
  done
else
  echo "No files found in /install/scripts/application, skipping installation"
fi