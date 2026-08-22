# Professional LaTeX Template

A branded LaTeX document template for creating consistent professional
documents for Altair Infrasec Pvt. Ltd.

## Use the template

Select **Use this template** on GitHub to create a new repository, then update
the configuration values at the top of `template_example.tex`.

The template includes configurable project metadata, branded title and header
layouts, code-listing environments, and information and warning boxes.

## Build locally

A TeX Live installation with `latexmk` and the packages referenced by
`altair_professional.cls` is required.

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error template_example.tex
```

The generated document is written to `template_example.pdf`.

## Syntax-highlighted code

The class provides syntax-highlighted environments for common languages:

```latex
\begin{terminal}{Linux Command Example}
  $ git status
\end{terminal}

\begin{sqlbox}{SQL Query Example}
  SELECT * FROM users WHERE status = 'active';
\end{sqlbox}

\begin{pythonbox}{Python Example}
  print("Hello, Altair!")
\end{pythonbox}

\begin{cbox}{C Example}
  printf("Hello, Altair!\n");
\end{cbox}
```

Code listings use Fira Mono, the PDF-friendly companion to Fira Code, and each
language environment has its own header and icon colors.

`powershell` is also available. For other languages supported by the LaTeX
`listings` package, use the generic environment with the language followed by
the title:

```latex
\begin{codebox}{Java}{Java Example}
  System.out.println("Hello, Altair!");
\end{codebox}
```

To remove generated files:

```bash
latexmk -C template_example.tex
```

## Automated builds and releases

Every push to `main` compiles the document and stores the PDF as a GitHub
Actions artifact for 30 days.

To publish a permanent PDF release, push a version tag:

```bash
git tag v1.0.0
git push origin v1.0.0
```

The workflow creates the corresponding GitHub Release and attaches a file named
like `professional-template-v1.0.0-2026-08-21.pdf`. The date is the UTC release
date.

## License

This project is available under the [MIT License](LICENSE).
