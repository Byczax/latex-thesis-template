\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}

\LoadClass[12pt]{article}

%%%* ==== SPECIAL OPTIONS ====

\newif\if@engineer
\newif\if@pl

\@engineertrue
\@plfalse

%%%* ==== SPECIAL OPTION EXECTUION ====

% things for engieering thesis
\if@engineer

\fi


% things for polish language
\if@pl
\RequirePackage{polski} % for polish headers

\fi

%%% * ========= PACKAGES ==========

\RequirePackage[
backend=biber,
sorting=ynt
]{biblatex} % bibliography

\RequirePackage{geometry} %change margins
% \RequirePackage[english,polish]{babel} %english and polish language for sections, etc. (document in last given language)
\RequirePackage{polski} %polish language for sections, etc.
\RequirePackage{graphicx} %images
\RequirePackage{float} %fix object positions
\RequirePackage{fancyhdr} % header i footer
\RequirePackage{hyperref} %clickable references
\RequirePackage{calc} % do simple math (add margins)
\RequirePackage{listings} % code highlight in document
%\RequirePackage{minted} % Alternative for code highlight
\RequirePackage{enumitem} % change enumerate format
\RequirePackage{ragged2e} % justify text
\RequirePackage{setspace} % vertical space environments
\RequirePackage{xcolor} % Colorful formatting
\RequirePackage{tocbibind} % Add list of figures and other to table of contents
\RequirePackage{tgtermes} % Font
\RequirePackage{lipsum} % dummy text
\RequirePackage{listing}


%%%* --------------- PARAMETERS --------------- *%%%

%? change font size in line nr. 3
% \renewcommand{\rmdefault}{lmr}  %? Times New Roman??

\def\marginsize{2.5cm}
\def\addleftmargin{0.5cm}

\def\author#1{\gdef\@author{#1}}
\gdef\@author{\@latex@error{No \noexpand\author given}\@ehc}

% \def\workauthor{Zwykły Student}
\def\title#1{\gdef\@title{#1}}
\def\@title{\@latex@error{No \noexpand\title given}\@ehc}

\def\supervisor#1{\gdef\@supervisor{#1}}
\def\@supervisor{\@latex@error{No \noexpand\supervisor given}\@ehc}

\def\fieldofstudy#1{\gdef\@fieldofstudy{#1}}
\def\@fieldofstudy{\@latex@error{No \noexpand\fieldofstudy given}\@ehc}

\def\fieldspeciality#1{\gdef\@fieldspeciality{#1}}
\def\@fieldspeciality{\@latex@error{No \noexpand\fieldspeciality given}\@ehc}

\def\keywords#1{\gdef\@keywords{#1}}
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}

%%%* --------------- METADATA SETUP --------------- *%%%

%%* Hyper references setup *%%
\hypersetup{
     colorlinks,
     citecolor=black,
     filecolor=black,
     linkcolor=black,
     urlcolor=black
}

\geometry{
     a4paper,    
     left=\marginsize + \addleftmargin,
     right=\marginsize,
     top=\marginsize,
     bottom=\marginsize
}

\definecolor{BackgroundColor}{rgb}{0.95,0.95,0.92}
\definecolor{MainColor}{rgb}{0.1,0.8,0}
\definecolor{ZeroBlue}{rgb}{0,0.28,0.73}
\definecolor{DarkRed}{rgb}{0.85,0.16,0.16}

\lstset{
	breaklines=true, % break line to prevent overflow
	numbers=left, % numerate lines
	numberstyle=\tiny, % decrease number size
	tabsize=2, % how many space in tab
	breakatwhitespace=true, % break line at whitespace character
	%%* White characters *%%
	showspaces=false,        
	showtabs=false,
	showstringspaces=false,
	%%* Format colors *%%
	backgroundcolor=\color{BackgroundColor},
	commentstyle=\color{gray},
	keywordstyle=\color{MainColor},
	% keywordstyle={[2]\color{DarkRed}},
    % keywordstyle={[3]\color{ZeroBlue}},
	%%* Language *%%
	language=[Sharp]C,
	%%* More keywords for format *%%
	morekeywords={new,end},
	% morekeywords={[2]new,end},
	% morekeywords={[3]new,end},
	% Add polish letters %
	literate=
	{ą}{{\k{a}}}1
	{ę}{{\k{e}}}1
	{Ą}{{\k{A}}}1
	{Ę}{{\k{E}}}1
	{ś}{{\'{s}}}1
	{Ś}{{\'{S}}}1
	{ź}{{\'{z}}}1
	{Ź}{{\'{Z}}}1
	{ń}{{\'{n}}}1
	{Ń}{{\'{N}}}1
	{ć}{{\'{c}}}1
	{Ć}{{\'{C}}}1
	{ó}{{\'{o}}}1
	{Ó}{{\'{O}}}1
	{ż}{{\.{z}}}1
	{Ż}{{\.{Z}}}1
	{ł}{{\l{}}}1
	{Ł}{{\l{}}}1
}

\setlength\parindent{0pt}

\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

\renewcommand{\figurename}{Fig.}
\renewcommand{\figurename}{Tab.}

% name code listing
\def\codelisting{Fragmenty kodu}
\renewcommand{\lstlistlistingname}{\codelisting}

%%* Where is bibliography file? *%%
\addbibresource{bib.bib}

%%% * ========= TITLE PAGE ==========
\newcommand\textbox[1]{%
    \parbox{.49\textwidth}{#1}%
  }
\renewcommand\maketitle{

    
    \begin{titlepage}
        \pagestyle{empty}
        % \fontfamily{garamond}\selectfont
        \begin{center}
            \textbf{
                \begingroup
                \fontsize{20pt}{12pt}\selectfont
                Politechnika Wrocławska\\
                \endgroup
                \begingroup
                \fontsize{16pt}{12pt}\selectfont
                Wydział Informatyki i Telekomunikacji
                \endgroup
            }
    
            \smallskip
            \hrule
            \vspace{0.5cm}
        \end{center}
        \begin{justify}
            \begingroup
            \fontsize{14pt}{12pt}\selectfont
            %\noindent\hbox to 0.5\textwidth
            % \noindent {Kierunek:} \textbox\@fieldofstudy \hfill%{Kierunek:}Informatyka Techniczna (ITE)
            % \noindent\hbox to 0.5\textwidth{Specjalność:} \@fieldspeciality \hfill%{Specjalność:}Grafika i systemy multimedialne (IGM)
            \noindent \textbox{Kierunek:\hfill}\@fieldofstudy
            \vspace*{1mm}

            \noindent \textbox{Specjalność:\hfill}\@fieldspeciality
    
            \endgroup
        \end{justify}
        \begin{spacing}{2}
            \begin{center}
                \begingroup
                \fontsize{26pt}{12pt}\selectfont
                PRACA DYPLOMOWA\\
                INŻYNIERSKA\\
                \endgroup
                \vspace{1.5cm}
                \begingroup
                \fontsize{18pt}{12pt}\selectfont
                Tytuł pracy\\
                \@title\\
                \endgroup
                \begingroup
                \fontsize{16pt}{12pt}\selectfont
                Imię i nazwisko dyplomata\\
                \@author\\
                \endgroup
                \begingroup
                \fontsize{14pt}{12pt}\selectfont
                Opiekun pracy\\
                \@supervisor\\
                \endgroup
            \end{center}
        \end{spacing}

        \vspace{\fill}
	
        \begin{flushleft}
            \normalsize Słowa kluczowe: \@keywords
        \end{flushleft}
        
        \vspace{.2cm}
        \begin{center}   
            \rule{\textwidth}{.2pt}
            
            \vspace{-.2cm}\large \MakeUppercase{Wrocław} \the\year
        \end{center}
    \end{titlepage}

    \hbox{}
    \thispagestyle{empty}
    \cleardoublepage
}

\renewcommand\listoflistings{
    \phantomsection
    \addcontentsline{toc}{section}{\codelisting}
    \lstlistoflistings
}



