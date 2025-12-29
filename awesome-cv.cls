%% Start of file `awesome-cv.cls'.
% Awesome CV Class File
% Modified for Daniel Neira - Final version with compact spacing and font fixes.

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{awesome-cv}[2017/02/05 v1.6.1 Awesome Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{ifxetex}
\RequirePackage{xifthen}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage[quiet]{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{unicode-math}
\defaultfontfeatures{Extension = .otf}
\RequirePackage{fontawesome}
\usepackage{academicons}
\RequirePackage[default,opentype]{sourcesanspro}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{parskip}
\RequirePackage[hidelinks,unicode]{hyperref}

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
\geometry{left=2.0cm, top=1.5cm, right=2.0cm, bottom=2.0cm, footskip=.5cm}
\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{awesome-red}{HTML}{DC3522}

\colorlet{awesome}{awesome-red}
\colorlet{darktext}{darkgray}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}

\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesanspro} 

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{32pt}{1em}\headerfontlight\color{graytext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{32pt}{1em}\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{7.6pt}{1em}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{6.8pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}

\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\slshape\color{awesome} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\upshape\color{text} #1}}

\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{text} #1}}

%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}

\newcommand{\acvSectionTopSkip}{5mm}
\newcommand{\acvSectionContentTopSkip}{3mm}

\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}

\newcommand*{\cventry}[5]{
  \vspace{0.5mm}
  \setlength\tabcolsep{0pt}%
  \setlength{\extrarowheight}{0pt}%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}%
    \ifempty{#2#3}{\entrypositionstyle{#1} & \entrydatestyle{#4} \\}%
      {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\%
      \entrypositionstyle{#1} & \entrydatestyle{#4} \\}%
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}%
  \end{tabular*}%
  \vspace{-1.0mm} % Espacio reducido entre el cargo y las viñetas
}

% ENTORNO DE VIÑETAS COMPACTO
\newenvironment{cvitems}{%
  \vspace{-1.5mm} % "Succiona" la lista hacia arriba para pegarla al cargo
  \begin{justify}
  \begin{itemize}[
    leftmargin=3ex, 
    nosep, 
    noitemsep, 
    topsep=0pt, 
    partopsep=0pt, 
    parsep=0pt
  ]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\bullet}
}{%
  \end{itemize}
  \end{justify}
  \vspace{1.0mm}
}

\newenvironment{cvskills}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-1.0mm}
  \begin{center}
    \setlength\tabcolsep{1ex}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
}{%
    \end{tabular*}
  \end{center}
}

\newcommand*{\cvskill}[2]{%
	\skilltypestyle{#1} & \skillsetstyle{#2} \\
}

% Personal Information
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\address}[1]{\def\@address{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}

\newcommand*{\makecvheader}[1][C]{%
  \begin{center}
    \headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\space\@lastname}%
    \\[\acvHeaderAfterNameSkip]%
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\[\acvHeaderAfterAddressSkip]}}%
    \headersocialstyle{%
      \faEnvelope\acvHeaderIconSep\@email\acvHeaderSocialSep%
      \faMobile\acvHeaderIconSep\@mobile\acvHeaderSocialSep%
      \faLinkedinSquare\acvHeaderIconSep\@linkedin\acvHeaderSocialSep%
      \faGithubSquare\acvHeaderIconSep\@github%
    }
  \end{center}
}

\newcommand*{\makecvfooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}}
}

\renewcommand{\section}[1]{%
	\vspace{\acvSectionTopSkip}
	\sectionstyle{#1}
	\phantomsection
	\color{gray}\vhrulefill{0.9pt}
}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}