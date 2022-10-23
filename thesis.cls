\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}

\LoadClass[12pt]{article}

%%%* ==== SPECIAL OPTIONS ====

\newif\if@engineer
\newif\if@master
\newif\if@pl
\newif\if@en

\@engineertrue
\@plfalse


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

%%%* --------------- VARIABLES --------------- *%%%
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

% STATIC VARIABLES
\if@en
\def\@university{Wrocław University of Science and Technology}
\def\@faculty{Faculty of Information and Communication Technology}

\def\@tfieldofstudy{Field of study}
\def\@tspecialisation{Speciality}
\def\@tsupervisor{Supervisor}
\def\@tconsultant{Consultant}
\def\@tkeywords{Keywords}
% \fi
\else
% \if@pl
\def\@university{Politechnika Wrocławska}
\def\@faculty{Wydział Informatyki i Telekomunikacji}
%
\def\@tfieldofstudy{Kierunek}
\def\@tspecialisation{Specjalność}
\def\@tsupervisor{Opiekun pracy}
\def\@tconsultant{Konsultant}
\def\@tkeywords{Słowa kluczowe}
% \def\dlistoflistings{Spis listingów}
% \def\dappendix{Dodatki}
% \renewcommand\figurename{Rys.}
\fi
%%%* ==== SPECIAL OPTION EXECTUION ====


% things for polish language
\if@pl
\RequirePackage{polski} % for polish headers

\fi

%%%* --------------- PARAMETERS --------------- *%%%

%? change font size in line nr. 3
% \renewcommand{\rmdefault}{lmr}  %? Times New Roman??

\def\marginsize{2.5cm}
\def\addleftmargin{0.5cm}

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


\renewcommand\maketitle{%
	\pagenumbering{gobble}%
	\thispagestyle{empty}%
	\hypersetup{pageanchor=false}%
    {
    % \fontfamily{mdugm}\selectfont - why it's removing special formating?
	\begin{center}
		\textbf{\LARGE\@university}
		
		\vspace{.2cm}\textbf{\Large \@faculty}
		
		\vspace{-.3cm}\rule{\textwidth}{.1pt}
	\end{center}

    \vspace{.3cm}
	\begin{flushleft}
		\begin{minipage}[t]{\textwidth/2}
			\begin{tabular}{ l l }
				\@tfieldofstudy
            : & \textbf{\@fieldofstudy} \\
				\ifdef{\@fieldspeciality}{\@tspecialisation: & \textbf{\@fieldspeciality}}{}
			\end{tabular}
		\end{minipage}
	\end{flushleft}
	
	\vspace{2cm}
	\begin{center}
		{\Huge	\if@en%
					\MakeUppercase{\if@engineer Engineering \fi \if@master Master \fi thesis }%
					\fi%
                \if@pl%
					\MakeUppercase{Praca dyplomowa}
					\vspace{.4em}\MakeUppercase{\if@engineer{inżynierska}\fi\if@master{magisterska}\fi}%
      				\fi}
      			
		\vspace{2cm plus .3fill}

        {\huge \textbf{\@title}}\\
		
		\vspace{1.5cm}{\huge\@author}
		
		\vspace{3cm}{\large \@tsupervisor}
		
		\vspace{.2cm}{\large\bfseries\@supervisor}
	\end{center}
	\vspace{\fill}
	
	\begin{flushleft}
		\normalsize \@tkeywords: \@keywords
	\end{flushleft}
	
	\vspace{.2cm}
	\begin{center}   
		\rule{\textwidth}{.2pt}
		
		\vspace{-.2cm}\large \MakeUppercase{Wrocław} \the\year
	\end{center}
    }
\clearpage
% \if@druk%
\hbox{}
\cleardoublepage
% \fi
\restoregeometry
}

\renewcommand\listoflistings{
    \phantomsection
    \addcontentsline{toc}{section}{\codelisting}
    \lstlistoflistings
}



