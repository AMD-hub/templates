%% inseaclass - INSEA report/thesis class
%% Generated: 2025/10/26
%% Purpose: modular, well-commented .cls based on user's supplied preamble

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{insea}[2025/10/26 INSEA custom class]

% -----------------------------------------------------------------------------% 
% === 0. Class options and preliminary defaults ===
% -----------------------------------------------------------------------------% 
% Options: green, red, oneside, twoside, draft, mintedoff, language
\newcommand{\headlinecolor}{\normalcolor}

\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{red}}}

\DeclareOption{oneside}{\PassOptionsToClass{oneside}{report}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{report}}
\DeclareOption{draft}{\PassOptionsToClass{draft}{report}}
\DeclareOption{mintedoff}{\def\INSEA@minted@disabled{1}}

% Language options
\DeclareOption{french}{\def\INSEA@lang{french}}
\DeclareOption{english}{\def\INSEA@lang{english}}

% Pass any unknown options to report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

% Default language if none specified
\providecommand{\INSEA@lang}{french}

% Load base class
\IfFileExists{report.cls}{}{\ClassWarning{insea}{report class not found}}
\LoadClass[12pt]{report}

% -----------------------------------------------------------------------------% 
% === 1. Font and Language Setting  ===
% -----------------------------------------------------------------------------% 

% --- Microtype (with footnote support) ---
\RequirePackage{microtype}
\PassOptionsToPackage{draft}{microtype}


% --- Fonts & encoding ---
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{textcomp}

% --- Language ---
\RequirePackage[\INSEA@lang]{babel}

% --- Dummy text for testing ---
\RequirePackage{lipsum}


% -----------------------------------------------------------------------------%
% === 2. Document geometry & general layout ===
% Change margins/spacing here
% -----------------------------------------------------------------------------%
\RequirePackage[margin=2.54cm]{geometry}
\setlength{\parindent}{0.5cm}
\linespread{1.1}
\setlength{\parskip}{0pt}
\raggedbottom
\sloppy


% -----------------------------------------------------------------------------%
% === 3. Header & footer ===
% Centralize logic for headers here. Edit contents of \fancyhead below.
% -----------------------------------------------------------------------------%
\RequirePackage{fancyhdr}

%  header height
\setlength{\headheight}{15.5pt} % or 16pt if you still get the warning
\addtolength{\topmargin}{-2pt}  % compensate vertical shift (optional)

\pagestyle{fancy}
\fancyhf{}
\fancyhead[RO,LE]{\textbf{\thepage}}
\fancyhead[RE,LO]{\nouppercase{\leftmark}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% frontpage style
\fancypagestyle{frontpage}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
}


% % -----------------------------------------------------------------------------%
% % === 4. Headings, chapters, sections formatting ===
% % Edit title appearance and numbering here
% % -----------------------------------------------------------------------------%
\RequirePackage[explicit]{titlesec}
\RequirePackage{titlesec}
\RequirePackage{titlesec, titletoc}

% Chapter/section numbering 
\renewcommand{\chaptername}{Chapitre}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand\thesection{\thechapter.\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\arabic{subsection}.\roman{subsubsection}}


% Chapter title look
\titleformat{\chapter}[display]
{\centering\normalfont\Huge}
{\titlerule[5pt]\vspace{3pt}\titlerule[2pt]\vspace{3pt}\textbf{\MakeUppercase{\chaptername} \thechapter}}
{0pt}
{\titlerule[2pt]\vspace{1pc}\Huge\MakeUppercase{#1}}


% Numberless chapter (e.g., for front matter)
\titleformat{name=\chapter,numberless}[display]
{\centering\normalfont\Huge}
{\titlerule[2pt]\vspace{-20pt}}
{0pt}
{\Huge\MakeUppercase{#1} \addcontentsline{toc}{chapter}{#1}}


% ======= Appendices =======
\RequirePackage[toc,page]{appendix}

% % --- Language-aware naming ---
\addto\captionsfrench{%
  \renewcommand{\appendixname}{ANNEXE}%
  \renewcommand{\appendixpagename}{ANNEXES}%
  \renewcommand{\appendixtocname}{ANNEXES}%
}
\addto\captionsenglish{%
  \renewcommand{\appendixname}{APPENDIX}%
  \renewcommand{\appendixpagename}{APPENDICIES}%
  \renewcommand{\appendixtocname}{APPENDICIES}%
}

% -----------------------------------------------------------------------------%
% === 5. Figures, tables and captions behaviour ===
% Customize numbering and caption text
% -----------------------------------------------------------------------------%
% ======= Figures =======
% --- Caption/numberring ---
\counterwithout{figure}{chapter}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\figurename}{Figure:}
\renewcommand{\fnum@figure}{\figurename~\thefigure}
% --- Graphics & floats ---
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage{adjustbox}

% --- TikZ and decorations ---
\RequirePackage{tikz}
\RequirePackage{tkz-base} 
\RequirePackage{tkz-tab}  
\usetikzlibrary{calc,trees,positioning,arrows,chains,shapes.geometric,decorations.pathreplacing,decorations.pathmorphing,shapes,matrix}



% ======= Tables =======
% --- Caption/numberring ---
\counterwithout{table}{chapter}
\renewcommand{\tablename}{Tableau:}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\fnum@table}{\tablename~\thetable}


% --- tabular/longtable ---
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{array,colortbl}
\RequirePackage{makecell}
\RequirePackage{threeparttable}
\RequirePackage{hhline}


% ======= Common =======
\RequirePackage{subcaption}
\RequirePackage{caption}
\newcommand{\source}[1]{\vspace{-5pt}\caption*{\hfill \textbf{Source}: \textit{#1}}}
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{7}

% -----------------------------------------------------------------------------%
% === 6. Table of contents tuning ===
% Tweak spacing/alignment without tocloft package
% -----------------------------------------------------------------------------%
\RequirePackage{shorttoc}
\setcounter{tocdepth}{4}

\makeatletter
% --- Horizontal alignment settings ---
\renewcommand{\@pnumwidth}{2em}   % width reserved for page numbers
\renewcommand{\@tocrmarg}{3em}    % right margin after page numbers
\renewcommand{\@dotsep}{2}        % dot spacing between title and page number
% --- Vertical spacing control ---
\let\oldl@chapter\l@chapter
\renewcommand{\l@chapter}[2]{%
  \ifnum\c@tocdepth>0 % avoid big gaps for unnumbered chapters
    \addpenalty{-\@highpenalty}%
    \addvspace{-3pt}% reduce this to tighten further
  \fi
  \oldl@chapter{#1}{#2}%
}
\let\oldl@section\l@section
\renewcommand{\l@section}[2]{\addvspace{1pt}\oldl@section{#1}{#2}}
\makeatother


% -- LOT/LOF costumization --
\makeatletter
\renewcommand{\l@table}[2]{%
  \@dottedtocline{1}{1.5em}{2.2em}{\tablename~#1 }{#2}}
\renewcommand{\l@figure}[2]{%
  \@dottedtocline{1}{1.5em}{2.2em}{\figurename~#1 }{#2}}
\makeatother

\addto\captionsfrench{%
  \renewcommand{\listfigurename}{LISTE DES FIGURES}
  \renewcommand{\listtablename}{LISTE DES TABLEAUX}
  \renewcommand{\contentsname}{TABLE DE MATIÈRE}
  \renewcommand{\bibname}{BIBLIOGRAPHIE}
  \renewcommand{\refname}{BIBLIOGRAPHIE} 
}

\addto\captionsenglish{%
  \renewcommand{\listfigurename}{LIST OF FIGURES}
  \renewcommand{\listtablename}{LIST OF TABLES}
  \renewcommand{\contentsname}{TABLE OF CONTENTS}
  \renewcommand{\bibname}{BIBLIOGRAPHY}
}


\makeatletter
\@addtoreset{chapter}{part}
\makeatother  


% --- mini toc ----
\RequirePackage[titles]{tocloft} 
\newcommand{\minitocname}{Sommaire}
\newcommand{\setlanguageEN}{\renewcommand{\minitocname}{Contents}}
\newcommand{\setlanguageFR}{\renewcommand{\minitocname}{Sommaire}}


\newcommand{\chaptertoc}{%
  \begingroup
    \setcounter{tocdepth}{1} 
    \startcontents[chapters]
    \printcontents[chapters]{}{1}{} 
  \endgroup
}

\newcommand{\intro}[2]{
\noindent
\begin{minipage}[t]{0.48\textwidth}
    #1
    \textbf{\minitocname}
    \chaptertoc
\end{minipage}%
\hfill
\begin{minipage}[t]{0.48\textwidth}
    #2
\end{minipage}
\newpage
}


% -----------------------------------------------------------------------------%
% === 6.5 Links tuning ===
% Costumize links 
% -----------------------------------------------------------------------------%
\RequirePackage{url}
\PassOptionsToPackage{table,xcdraw}{xcolor}


\definecolor{darkgray}{gray}{0.1} 
\RequirePackage[colorlinks=true,
    linkcolor=darkgray,
    citecolor=darkgray,
    urlcolor=darkgray
]{hyperref}



% -----------------------------------------------------------------------------%
% === 7. Shortcuts, math macros and actuarial symbols ===
% Put most-used macros here so you can edit them easily
% -----------------------------------------------------------------------------%
% Math Packages
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{mathtools}
\RequirePackage{dsfont}
\RequirePackage{siunitx}


% Math ShortCuts
\newcommand{\1}{\mathds{1}}
\newcommand{\expo}[1]{\exp\left\{#1\right\}}
\newcommand{\lno}[1]{\ln\left\{#1\right\}}


% items/enums/align 
\RequirePackage{enumitem}
\RequirePackage{setspace}
\RequirePackage{microtype}

\linespread{1.1}
\setlist[itemize,1]{label=$\bullet$}

% utilities
\RequirePackage{subfiles}
\RequirePackage{pdfpages}
\newcommand{\TitleInput}[1]{
  \includepdf[pages={1}]{#1}
  \pagenumbering{gobble} 
  \thispagestyle{plain} 
  \clearpage\mbox{}\clearpage 
  \pagenumbering{arabic}  
}

% Shortcuts for mathbb and mathcal
% Call this in your preamble

% For \mathcal letters (\A, \B, ..., \Z)
\newcommand{\A}{\mathcal{A}}
\newcommand{\B}{\mathcal{B}}
\newcommand{\C}{\mathcal{C}}
\newcommand{\D}{\mathcal{D}}
\newcommand{\E}{\mathcal{E}}
\newcommand{\F}{\mathcal{F}}
\newcommand{\G}{\mathcal{G}}
\renewcommand{\H}{\mathcal{H}} % H is often used by other packages
\newcommand{\I}{\mathcal{I}}
\newcommand{\J}{\mathcal{J}}
\newcommand{\K}{\mathcal{K}}
\renewcommand{\L}{\mathcal{L}} % L is often used
\newcommand{\M}{\mathcal{M}}
\newcommand{\N}{\mathcal{N}}
\renewcommand{\O}{\mathcal{O}} % O is sometimes used
\renewcommand{\P}{\mathcal{P}} % P might conflict
\newcommand{\Q}{\mathcal{Q}}
\newcommand{\R}{\mathcal{R}} 
\renewcommand{\S}{\mathcal{S}} % S might conflict
\newcommand{\T}{\mathcal{T}}
\newcommand{\U}{\mathcal{U}}
\newcommand{\V}{\mathcal{V}}
\newcommand{\W}{\mathcal{W}}
\newcommand{\X}{\mathcal{X}}
\newcommand{\Y}{\mathcal{Y}}
\newcommand{\Z}{\mathcal{Z}}

% For \mathbb letters (\AA, \BB, ..., \ZZ)
\renewcommand{\AA}{\mathbb{A}} % A might conflict
\newcommand{\BB}{\mathbb{B}}
\newcommand{\CC}{\mathbb{C}}
\newcommand{\DD}{\mathbb{D}}
\newcommand{\EE}{\mathbb{E}}
\newcommand{\FF}{\mathbb{F}}
\newcommand{\GG}{\mathbb{G}}
\newcommand{\HH}{\mathbb{H}}
\newcommand{\II}{\mathbb{I}}
\newcommand{\JJ}{\mathbb{J}}
\newcommand{\KK}{\mathbb{K}}
\newcommand{\LL}{\mathbb{L}}
\newcommand{\MM}{\mathbb{M}}
\newcommand{\NN}{\mathbb{N}}
\newcommand{\OO}{\mathbb{O}}
\newcommand{\PP}{\mathbb{P}}
\newcommand{\QQ}{\mathbb{Q}}
\newcommand{\RR}{\mathbb{R}}
\renewcommand{\SS}{\mathbb{S}} % S might conflict
\newcommand{\TT}{\mathbb{T}}
\newcommand{\UU}{\mathbb{U}}
\newcommand{\VV}{\mathbb{V}}
\newcommand{\WW}{\mathbb{W}}
\newcommand{\XX}{\mathbb{X}}
\newcommand{\YY}{\mathbb{Y}}
\newcommand{\ZZ}{\mathbb{Z}}


% Define bold vectors for lowercase letters
\newcommand{\ba}{\mathbf{a}}
\newcommand{\bb}{\mathbf{b}}
\newcommand{\bc}{\mathbf{c}}
\newcommand{\bd}{\mathbf{d}}
\newcommand{\be}{\mathbf{e}}
\newcommand{\bff}{\mathbf{f}}
\newcommand{\bg}{\mathbf{g}}
\newcommand{\bh}{\mathbf{h}}
\newcommand{\bi}{\mathbf{i}}
\newcommand{\bj}{\mathbf{j}}
\newcommand{\bk}{\mathbf{k}}
\newcommand{\bl}{\mathbf{l}}
\newcommand{\bm}{\mathbf{m}}
\newcommand{\bn}{\mathbf{n}}
\newcommand{\bo}{\mathbf{o}}
\newcommand{\bp}{\mathbf{p}}
\newcommand{\bq}{\mathbf{q}}
\newcommand{\br}{\mathbf{r}}
\newcommand{\bs}{\mathbf{s}}
\newcommand{\bt}{\mathbf{t}}
\newcommand{\bu}{\mathbf{u}}
\newcommand{\bv}{\mathbf{v}}
\newcommand{\bw}{\mathbf{w}}
\newcommand{\bx}{\mathbf{x}}
\newcommand{\by}{\mathbf{y}}
\newcommand{\bz}{\mathbf{z}}

% Define bold matrices for uppercase letters
\newcommand{\bA}{\mathbf{A}}
\newcommand{\bB}{\mathbf{B}}
\newcommand{\bC}{\mathbf{C}}
\newcommand{\bD}{\mathbf{D}}
\newcommand{\bE}{\mathbf{E}}
\newcommand{\bF}{\mathbf{F}}
\newcommand{\bG}{\mathbf{G}}
\newcommand{\bH}{\mathbf{H}}
\newcommand{\bI}{\mathbf{I}}
\newcommand{\bJ}{\mathbf{J}}
\newcommand{\bK}{\mathbf{K}}
\newcommand{\bL}{\mathbf{L}}
\newcommand{\bM}{\mathbf{M}}
\newcommand{\bN}{\mathbf{N}}
\newcommand{\bO}{\mathbf{O}}
\newcommand{\bP}{\mathbf{P}}
\newcommand{\bQ}{\mathbf{Q}}
\newcommand{\bR}{\mathbf{R}}
\newcommand{\bS}{\mathbf{S}}
\newcommand{\bT}{\mathbf{T}}
\newcommand{\bU}{\mathbf{U}}
\newcommand{\bV}{\mathbf{V}}
\newcommand{\bW}{\mathbf{W}}
\newcommand{\bX}{\mathbf{X}}
\newcommand{\bY}{\mathbf{Y}}
\newcommand{\bZ}{\mathbf{Z}}
% -----------------------------------------------------------------------------%
% === 7.5 Theorem, boxes, and custom environments ===
% Add theorem styles and tcolorbox based environments here
% -----------------------------------------------------------------------------%
\RequirePackage{fontawesome5}

\RequirePackage[theorems]{tcolorbox}
\newtheorem{theorem}{Théorème}[section]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemme}
\newtheorem{definition}[theorem]{Définition}

\numberwithin{equation}{section} % numbering of equations
\hyphenpenalty=100000 % preventing splitting of words
\sloppy 
\raggedbottom 


\tcbuselibrary{skins, theorems,breakable}

\definecolor{codeboxTitle}{HTML}{898989}
\definecolor{codeboxBackground}{HTML}{f3f3f3}
\definecolor{codeboxFrame}{HTML}{e2e2e2}


\tcbset{my box/.style={breakable,
    enhanced, fonttitle=\bfseries,
    colback=codeboxBackground, colframe=codeboxFrame,
    coltitle=white, colbacktitle=codeboxTitle,
    attach boxed title to top left={xshift=0.3cm,
                                    yshift*=-\tcboxedtitleheight/2},
    boxed title style={
      before upper=\hspace*{0.5cm}, % reserve space for the image
      overlay={
       \node at ([xshift=0.5cm]frame.west)
         {\color{white}\faCode\color{black}};
      }
    }
  }
}

\newtcolorbox[auto counter, number within=section]{codebox}[2][]{%
  my box, title={Code Implementation~(\thetcbcounter): #2}, #1}


  
\RequirePackage{listings}

\definecolor{comment}{HTML}{609752}
\definecolor{keyword}{HTML}{a156cc}
\definecolor{number}{HTML}{2e8e6a}
\definecolor{string}{HTML}{cf755e}
\definecolor{basic}{HTML}{000000}

\renewcommand\lstlistingname{Code}
\renewcommand\lstlistlistingname{LISTE DES CODES}

\lstdefinestyle{mystyle}{
    commentstyle=\color{comment},
    keywordstyle=\color{keyword},
    numberstyle=\color{number},
    stringstyle=\color{string},
    basicstyle = \ttfamily \color{basic},
    breakatwhitespace=true,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    inputencoding=utf8,
    extendedchars=true,
    literate={à}{{\'a}}1 {ã}{{\~a}}1 {é}{{\'e}}1 {è}{{\`e}}1 
}

\lstset{style=mystyle}

% -----------------------------------------------------------------------------%
% === 8. Acknowledgement & Dedicace   ===
% Customize your Acknowledgement & Dedicace
% -----------------------------------------------------------------------------%
\RequirePackage{pifont,frcursive}

\makeatletter
\newcommand{\@acknowledgement}{Remerciement}
\newcommand{\@dedicace}{Dédicace}
\makeatother

%  Acknowledgement
\makeatletter
\newenvironment{acknowledgement}[2]{%
  \def\insea@ack@inst{#1}%
  \def\insea@ack@date{#2}%
  \markboth{\@acknowledgement}{\@acknowledgement}%
  \par\vspace*{3\baselineskip}%
  \begin{center}%
    \begin{minipage}{0.85\textwidth}%
}{%
    \end{minipage}%
    \par\vspace{2ex}%
    {\large\bfseries\insea@ack@inst}\par
    \vspace{0.5ex}%
    \insea@ack@date\par
  \end{center}%
  \vspace*{3\baselineskip}%
}
\makeatother


\RequirePackage{pifont,frcursive}
\newenvironment{dedicace}[1]
    {
    \markboth{\@dedicace}{\@dedicace}
    \noindent
\begin{minipage}[t][0.37\textheight][t]{\textwidth}
    \begin{center}
    \baselineskip=8mm 
    \fontfamily{pzc}\selectfont 
    \Large 
    }    
    { 
    \end{center}
    \vspace{1cm}
\end{minipage} }



% -----------------------------------------------------------------------------%
% === 9. Bibliography costumisation   ===
% Customize your Biblio
% -----------------------------------------------------------------------------%
% --- Quotes & bibliography ---
\RequirePackage{csquotes} % good habit, keeps quotes consistent
\RequirePackage[
  backend=biber,
  style=numeric,   % or 'numeric' if you prefer [1], [2], ...
  sorting=nyt         % name, year, title
]{biblatex}
