\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{altair_professional}[2026/03/02 Altair Professional Document Class]

% Load base class
\LoadClass[a4paper,11pt]{article}

% =========================================
% 1. PACKAGES
% =========================================
\RequirePackage[utf8]{inputenc}
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{titlesec}
\RequirePackage[svgnames,table]{xcolor}
\RequirePackage{listings}
\RequirePackage{hyperref}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{float}
\RequirePackage{fontawesome5}
\RequirePackage[most]{tcolorbox}
\tcbuselibrary{skins, breakable, listings}

% =========================================
% 2. USER CONFIGURATION MACROS
%    These are defined to prevent errors if not set in the main document.
%    Users should redefine them in their .tex file.
% =========================================
\newcommand{\companyName}{}
\newcommand{\projectName}{}
\newcommand{\projectCode}{}
\newcommand{\docTitle}{}
\newcommand{\docVersion}{}
\newcommand{\softVersion}{}
\newcommand{\docAuthor}{}
\newcommand{\logoFile}{}

% =========================================
% 3. STYLE SETUP
% =========================================

% -- COLORS (PROFESSIONAL GRAYSCALE PALETTE) --
\definecolor{primaryColor}{RGB}{34, 34, 34}      % Very Dark Gray (almost black)
\definecolor{secondaryColor}{RGB}{85, 85, 85}   % Medium Gray
\definecolor{borderColor}{RGB}{204, 204, 204}    % Light Gray for borders
\definecolor{backgroundColor}{RGB}{245, 245, 245}  % Very Light Gray for backgrounds
\definecolor{codeBlockBack}{RGB}{248, 248, 248} % Off-white for code blocks

% -- PAGE GEOMETRY --
\geometry{a4paper, top=25mm, bottom=25mm, left=20mm, right=20mm, headheight=30pt}

% -- HEADER & FOOTER --
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\ifx\logoFile\empty\else\includegraphics[height=0.8cm]{\logoFile}\fi}
\fancyhead[R]{\nouppercase{\leftmark}}
\fancyfoot[L]{\small \projectName{} (\projectCode) v\docVersion}
\fancyfoot[R]{Page \thepage\ of \pageref{LastPage}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\newcommand{\doclink}[2]{\href{#1}{#2}}
\newcommand{\uv}{\texttt{uv}} % Defined here for general use

% -- HYPERLINKS --
\hypersetup{
  colorlinks=true,
  linkcolor=primaryColor,
  urlcolor=primaryColor,
  pdftitle={\projectName{} - \docTitle}
}

% =========================================
% 4. CUSTOM BOX ENVIRONMENTS (ROBUST & PROFESSIONAL)
% =========================================

% -- General Listing Style --
\lstdefinestyle{baseListingStyle}{
  basicstyle=\ttfamily\small\color{black},
  breaklines=true,
  numbers=none,
  xleftmargin=1.5em,
  framexleftmargin=1.5em,
}

% -- Terminal Box (Linux/Generic) --
\newtcblisting{terminal}[1]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=borderColor,
  arc=2pt, boxrule=1pt,
  title={\faTerminal \ \ #1},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=secondaryColor,
  listing only,
  listing options={style=baseListingStyle}
}

% -- PowerShell Box (Windows) --
\newtcblisting{powershell}[1]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=borderColor,
  arc=2pt, boxrule=1pt,
  title={\faWindows \ \ PowerShell: #1},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=secondaryColor,
  listing only,
  listing options={style=baseListingStyle}
}

% -- SQL Command Box --
\newtcblisting{sqlbox}[1]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=borderColor,
  arc=2pt, boxrule=1pt,
  title={\faDatabase \ \ SQL: #1},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=secondaryColor,
  listing only,
  listing options={style=baseListingStyle}
}

% -- Info Note (Gray, Left Bar) --
\newtcolorbox{infoNote}[1]{
  enhanced, breakable,
  colback=backgroundColor, colframe=secondaryColor,
  coltitle=white,
  title={\faInfoCircle \ \ \textbf{#1}},
  fonttitle=\bfseries,
  arc=0mm, leftrule=3mm, rightrule=0mm, toprule=0mm, bottomrule=0mm,
}

% -- Warning Box (Dark Gray, Full Border) --
\newtcolorbox{warningBox}[1]{
  enhanced, breakable,
  colback=backgroundColor, colframe=primaryColor,
  coltitle=white,
  title={\faExclamationTriangle \ \ \textbf{#1}},
  fonttitle=\bfseries, arc=2pt, boxrule=1pt,
  colbacktitle=secondaryColor
}

% =========================================
% 5. TITLE PAGE (integrated into the class)
% =========================================
\renewcommand{\maketitle}{
  \begin{titlepage}
    \centering
    \vspace*{1cm}
    \ifx\logoFile\empty\else\includegraphics[width=0.3\textwidth]{\logoFile}\fi
    \vspace{2cm}

    {\Huge \bfseries \textcolor{primaryColor}{\projectName}}\\[0.5cm]
    {\Large Project Code: \projectCode}\\[1cm]
    {\huge \bfseries \docTitle}
    \vspace{1.5cm}

    \begin{center}
      \renewcommand{\arraystretch}{1.8}
      \begin{tabularx}{0.8\textwidth}{|>{\bfseries}l|X|}
        \hline
        Company          & \companyName \\ \hline
        Project Name     & \projectName \\ \hline
        Document Version & \docVersion \\ \hline
        Software Version & \softVersion \\ \hline
        Date             & \today \\ \hline
        Author           & \docAuthor \\ \hline
      \end{tabularx}
    \end{center}

    \vfill
    {\large \companyName} \\
    \vspace{1cm}
  \end{titlepage}
}
