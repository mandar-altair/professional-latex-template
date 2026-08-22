\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{altair_professional}[2026/03/02 Altair Professional Document Class]

% Load base class
\LoadClass[a4paper,11pt]{article}

% =========================================
% 1. PACKAGES
% =========================================
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled=0.9]{FiraMono}
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

% -- COLORS --
\definecolor{primaryColor}{RGB}{34, 34, 34}      % Very Dark Gray (almost black)
\definecolor{secondaryColor}{RGB}{85, 85, 85}   % Medium Gray
\definecolor{borderColor}{RGB}{204, 204, 204}    % Light Gray for borders
\definecolor{backgroundColor}{RGB}{245, 245, 245}  % Very Light Gray for backgrounds
\definecolor{codeBlockBack}{RGB}{248, 248, 248} % Off-white for code blocks
\definecolor{syntaxKeyword}{RGB}{0, 82, 155}     % Vivid blue
\definecolor{syntaxComment}{RGB}{0, 125, 80}     % Vivid green
\definecolor{syntaxString}{RGB}{190, 45, 45}     % Vivid red
\definecolor{terminalColor}{RGB}{45, 55, 72}
\definecolor{terminalIcon}{RGB}{82, 196, 121}
\definecolor{powerShellColor}{RGB}{1, 75, 150}
\definecolor{powerShellIcon}{RGB}{110, 210, 255}
\definecolor{sqlColor}{RGB}{0, 105, 92}
\definecolor{sqlIcon}{RGB}{139, 229, 218}
\definecolor{pythonColor}{RGB}{48, 84, 150}
\definecolor{pythonIcon}{RGB}{255, 212, 59}
\definecolor{cColor}{RGB}{63, 81, 181}
\definecolor{cIcon}{RGB}{144, 202, 249}
\definecolor{genericCodeColor}{RGB}{106, 76, 147}
\definecolor{genericCodeIcon}{RGB}{225, 190, 255}
\definecolor{infoColor}{RGB}{2, 119, 189}
\definecolor{infoBack}{RGB}{235, 247, 253}
\definecolor{warningColor}{RGB}{198, 92, 0}
\definecolor{warningBack}{RGB}{255, 247, 230}
\definecolor{warningIcon}{RGB}{255, 224, 130}

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
  keywordstyle=\color{syntaxKeyword}\bfseries,
  commentstyle=\color{syntaxComment}\itshape,
  stringstyle=\color{syntaxString},
  breaklines=true,
  columns=fullflexible,
  keepspaces=true,
  numbers=none,
  showstringspaces=false,
  tabsize=2,
  xleftmargin=1.5em,
  framexleftmargin=1.5em,
}

% -- PowerShell Language (not included with listings) --
\lstdefinelanguage{PowerShell}{
  sensitive=false,
  alsoletter={-},
  morekeywords={
    begin,break,catch,class,continue,data,do,dynamicparam,else,elseif,
    end,exit,filter,finally,for,foreach,from,function,if,in,param,
    process,return,switch,throw,trap,try,until,using,var,while,workflow,
    Get-ChildItem,Get-Command,Get-Content,Get-Help,Get-Process,Get-Service,
    Import-Module,New-Item,Remove-Item,Select-Object,Set-Content,Where-Object,
    Write-Error,Write-Host,Write-Output,Write-Warning
  },
  morecomment=[l]{\#},
  morestring=[b]',
  morestring=[b]"
}

% -- Terminal Box (Linux/Generic) --
\newtcblisting{terminal}[1]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=terminalColor,
  arc=2pt, boxrule=1pt,
  title={\textcolor{terminalIcon}{\faTerminal} \ \ #1},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=terminalColor,
  listing only,
  listing options={style=baseListingStyle, language=bash}
}

% -- PowerShell Box (Windows) --
\newtcblisting{powershell}[1]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=powerShellColor,
  arc=2pt, boxrule=1pt,
  title={\textcolor{powerShellIcon}{\faWindows} \ \ PowerShell: #1},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=powerShellColor,
  listing only,
  listing options={style=baseListingStyle, language=PowerShell}
}

% -- SQL Command Box --
\newtcblisting{sqlbox}[1]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=sqlColor,
  arc=2pt, boxrule=1pt,
  title={\textcolor{sqlIcon}{\faDatabase} \ \ SQL: #1},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=sqlColor,
  listing only,
  listing options={style=baseListingStyle, language=SQL}
}

% -- Python Code Box --
\newtcblisting{pythonbox}[1]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=pythonColor,
  arc=2pt, boxrule=1pt,
  title={\textcolor{pythonIcon}{\faPython} \ \ Python: #1},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=pythonColor,
  listing only,
  listing options={style=baseListingStyle, language=Python}
}

% -- C Code Box --
\newtcblisting{cbox}[1]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=cColor,
  arc=2pt, boxrule=1pt,
  title={\textcolor{cIcon}{\faCode} \ \ C: #1},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=cColor,
  listing only,
  listing options={style=baseListingStyle, language=C}
}

% -- Generic Code Box: language, then title --
\newtcblisting{codebox}[2]{
  enhanced, breakable,
  colback=codeBlockBack, colframe=genericCodeColor,
  arc=2pt, boxrule=1pt,
  title={\textcolor{genericCodeIcon}{\faCode} \ \ #2},
  coltitle=white, fonttitle=\bfseries\small,
  colbacktitle=genericCodeColor,
  listing only,
  listing options={style=baseListingStyle, language=#1}
}

% -- Information Note (Blue, Open Callout) --
\newtcolorbox{infoNote}[1]{
  enhanced, breakable,
  colback=infoBack, colframe=infoColor,
  colbacktitle=infoBack, coltitle=infoColor,
  title={\faInfoCircle \ \ \textbf{#1}},
  fonttitle=\bfseries,
  arc=0mm, boxsep=1.5mm,
  leftrule=2.5mm, rightrule=0mm, toprule=0mm, bottomrule=0mm,
}

% -- Warning Box (Amber, Full Border) --
\newtcolorbox{warningBox}[1]{
  enhanced, breakable,
  colback=warningBack, colframe=warningColor,
  coltitle=white,
  title={\textcolor{warningIcon}{\faExclamationTriangle} \ \ \textbf{#1}},
  fonttitle=\bfseries, arc=2pt, boxrule=1pt,
  colbacktitle=warningColor
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
