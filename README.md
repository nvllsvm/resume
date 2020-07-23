# Resume
```
$ docker build . -t resume
$ docker run -w "$(pwd)" -v "$(pwd):$(pwd)" resume pdflatex resume.tex
```
