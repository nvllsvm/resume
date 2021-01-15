#!/usr/bin/env sh
set -e
cd "$(dirname "$0")" || exit 1
IMAGE='nvllsvm_resume'

if ! podman inspect "$IMAGE" > /dev/null 2>&1; then
    podman build . --pull -t "$IMAGE"
fi
podman run -w "$(pwd)" -v "$(pwd):$(pwd)" "$IMAGE" pdflatex resume.tex
