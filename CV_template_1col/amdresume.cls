% ============================================================
% amdresume.cls
% A LaTeX class for creating resumes
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{amdresume}[2024/09/08 Resume class by Ahmed]

% ============================================================
% Option handling
% ============================================================
\newif\ifAsfalFormat
\AsfalFormatfalse

\DeclareOption{asfal}{\AsfalFormattrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% --- Load base class
\LoadClass{article}

% test : 
%% PDFTeX compatible font setup
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx}          % Times-like font

% ============================================================
% Geometry and layout
% ============================================================
\RequirePackage[a4paper]{geometry}
\geometry{
    a4paper,
    top     = 0.5cm,
    bottom  = 0.5cm,
    right   = 0.5cm,
    left    = 0.5cm
}

% ============================================================
% Colors and TikZ
% ============================================================
\RequirePackage{xcolor}
\definecolor{colorr}{HTML}{3a6358}
\RequirePackage{tikz}
\usetikzlibrary{arrows}

% ============================================================
% Lists
% ============================================================
\RequirePackage{enumitem}
\setlist[itemize]{
    noitemsep,
    left=0pt..1.5em
}
\setlist[description]{itemsep=0pt}
\setlist[enumerate]{align=left}


% ============================================================
% Spacing adjustments
% ============================================================
\RequirePackage{setspace} % Line spacing
\setlength{\parskip}{0em} % Space between paragraphs
\setlength{\itemsep}{0em} % Space between items in a list
\setlength{\parsep}{0em} % Space between paragraphs within an item
\setlength{\partopsep}{0em} % Extra space added to \topsep when environment starts a new paragraph
\setlength{\topsep}{0em} % Space between first list item and preceding paragraph
\setlength{\baselineskip}{0em} % Space between lines


% ============================================================
% Section numbering and page setup
% ============================================================
\setcounter{secnumdepth}{0} % Remove section numbering
\pagenumbering{gobble} % Remove page numbers

% ============================================================
% Title formatting
% ============================================================
\RequirePackage{titlesec}
\titlespacing{\section}{0pt}{*0}{*0}
\titlespacing{\subsection}{0pt}{*0}{*0}
\titlespacing{\subsubsection}{0pt}{*0}{*0}

\RequirePackage{xhfill}

% --- Conditional title rule
\ifAsfalFormat
    \newcommand\ruleafter[1]{#1 \\[-1.5ex] \textcolor{colorr}{\rule[2pt]{\linewidth}{0.5mm}}}
\else
    \newcommand\ruleafter[1]{#1 \hfill \textcolor{colorr}{\rule[2pt]{0.75\linewidth}{0.5mm}}}
\fi

% ===================== Section formatting =====================
\titleformat{\section}
  {\Large\bfseries\uppercase} % formatting
  {}                          % label
  {}                          % sep
  {\ruleafter}                % before-code
  []                          % after-code

% ===================== Subsection formatting =====================
\titleformat{\subsection}
  {\large\bfseries}           % formatting
  {}                          % label
  {0pt}                       % sep
  {}      % content with safe wrapper + your design
  []

% ===================== Subsubsection formatting =====================
\titleformat{\subsubsection}
  {\large\itshape}  % formatting
  {}                              % label
  {0pt}                           % sep
  {}                              % content with safe wrapper + your design
  []


% ============================================================
% Misc packages
% ============================================================
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage[colorlinks=true,
    linkcolor=colorr,
    citecolor=colorr,
    urlcolor= colorr
]{hyperref}

\RequirePackage{fontawesome5}
\RequirePackage{paracol}
\RequirePackage{dashrule}
\RequirePackage{skak}
\newcommand{\divider}{\textcolor{black!30}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

% ============================
