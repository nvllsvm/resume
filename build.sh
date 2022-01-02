#!/usr/bin/env sh
set -e
cd "$(dirname "$0")" || exit 1
IMAGE='nvllsvm_resume'

if command -v podman > /dev/null; then
    docker() {
        podman "$@"
        ret=$?
        return $ret
    }
fi

if ! docker inspect "$IMAGE" > /dev/null 2>&1; then
    docker build . --pull -t "$IMAGE"
fi
docker run -w "$(pwd)" -v "$(pwd):$(pwd)" "$IMAGE" pdflatex resume.tex
