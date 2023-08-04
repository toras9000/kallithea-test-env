#!/bin/bash

KALLITEHA_DIR=/work/src/

# overwrite files
if [ -n "$KALLITHEA_OVERRIDE_DIR" ] && [ -d "$KALLITHEA_OVERRIDE_DIR/kallithea" ]; then
    echo "Copy override files..."
    cp -v -RT "$KALLITHEA_OVERRIDE_DIR/kallithea"  "$KALLITEHA_DIR"
fi

# patch files
if [ -n "$KALLITHEA_PATCH_DIR" ] && [ -d "$KALLITHEA_PATCH_DIR" ]; then
    echo "Apply patches..."
    git -C "$KALLITEHA_DIR" apply --reject --whitespace=nowarn -p1 $KALLITHEA_PATCH_DIR/*
fi

exec pytest "$@"
