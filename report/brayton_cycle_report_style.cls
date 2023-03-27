%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Felipe Portales' HomeWorks
% Maintainer: Felipe Portales-Oliva (f.portales.oliva@gmail.com)
% 
% Document class to produce simple yet stylish homework submissions 
%
% This package is public domain, according to :
%    The Unlicense <https://unlicense.org>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Identification

\NeedsTeXFormat{LaTeX2e} % we need to have LaTeX2e for this to compile
\ProvidesClass{fphw_assignment_toc}[2020/10/01] % fphw is the name we need to provide to the documentclass command on the .tex file        % I have edited this class on 06/10/2020

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Preliminary declarations:
%%%% These are some commands where we declare new commands for the class

% We define the macro for the name of the professor
\newcommand{\professor}[1]{ \newcommand{\professorloc}{#1} }
% We define the macro for the name of the course
\newcommand{\course}[1]{ \newcommand{\courseloc}{#1} }
% We define the macro for the name of the institution
\newcommand{\institute}[1]{ \newcommand{\instituteloc}{#1} }
% We define the macro for the name of the class roll
%\newcommand{\roll}[1]{ \newcommand{\rollloc}{#1} }
% We define the macro for the name of the class
\newcommand{\class}[1]{ \newcommand{\classloc}{#1} }
% We define the macro for the name of the session
\newcommand{\session}[1]{ \newcommand{\sessionloc}{#1} }
% We define the macro for the email
\newcommand{\email}[1]{ \newcommand{\emailloc}{#1} }

%these are auxiliary definitions used in the title section
\newcommand{\CourseLang}{Course}
\newcommand{\DateLang}{Submission date}
\newcommand{\StudentLang}{}
\newcommand{\ProfessorLang}{Professor}
%\newcommand{\RollLang}{Partners}           % created by me on [01-10-20]
\newcommand{\ClassLang}{Class}                 % created by me on [01-10-20]
\newcommand{\SessionLang}{Section}     % created by me on [01-10-20]
%\newcommand{\InstituteLang}{}   % created by me on [17-08-20]
\newcommand{\EmailLang}{Email}     % created by me on [01-10-20]

% Header and footers, we will use the titles also
\RequirePackage{fancyhdr}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Options
%%%% We now pass the options of the class

% Two Columns are difficult to read and grade, we will not use them
\DeclareOption{twocolumn}{\OptionNotUsed}

% Two sided paper are difficult to read and grade, we will not use them
\DeclareOption{twoside}{\OptionNotUsed}


\PassOptionsToClass{a4paper}{article}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Bulk Declarations
%%%% Here we do more declarations and call other files

% we need to load 
\LoadClass{article}

% all my packages are loaded here
%\RequirePackage{my_packages}

% we will modify sections, subsections and sub subsections
\RequirePackage{titlesec}
% Modification of section 
%\titleformat{\section}[block]{\Large\bfseries\filcenter}{\thesection.}{.3cm}{} 
\titleformat{\section}[block]{\Large\bfseries\filcenter}{\thesection.}{.3cm}{\fontsize{16}{14.4}\selectfont}


% modification of subsection and sub sub section
%\titleformat{\subsection}[runin]{\bfseries}{ \thesubsection.}
%\titleformat{\subsection}[runin]{\bfseries}{ \thesubsection.}
\titleformat{\subsection}[block]{\normalsize\bfseries\filcenter}{\thesection.}{.3cm}{\fontsize{14}{14.4}\selectfont}
%{1mm}{}[\break]
%{1mm}{}[]
\titleformat{\subsubsection}[runin]{\normalsize\bfseries}{ \thesubsubsection.}
%{1mm}{}[\break]

% Geometry lets us modify the sizes of the document nicely
\RequirePackage{geometry}
% Decent margins for the documents, as it is meant to be printed
\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}



\fancypagestyle{head}{%
 \fancyhf{}% clear all header and footer fields
 \renewcommand{\headrulewidth}{0.4pt} % we want rules 
 \renewcommand{\footrulewidth}{0.4pt}
 \fancyhead[RO] {\footnotesize\thepage}
 \fancyhead[LO] {\footnotesize{\ifx\courseloc\undefined{}\else\itshape\courseloc{} --{} \fi}\makeatletter\@title\makeatother }
 \fancyfoot[RO] {\footnotesize\itshape\makeatletter\@author\makeatother}
 \fancyfoot[LO] {\footnotesize\thepage}            % created by me on [3-10-20]  
}
\fancypagestyle{nohead}{%
 \fancyhf{}% clear all header and footer fields
 \renewcommand{\headrulewidth}{0.4pt}
 \renewcommand{\footrulewidth}{0.4pt}
 \fancyfoot [CO]{\footnotesize\thepage}
}

% New title style for the document
\renewcommand{\maketitle}{
    \newpage      % ensure this is in a new page 
    \thispagestyle{nohead}
    %\topskip 0pt    % it's creating two extra blank pages at the end! why?
    \vspace*{\fill}   % to keep the title vertically at the center of the page % https://tex.stackexchange.com/a/2327/114006
    \begin{center}
        \includegraphics[scale=.3]{mines_logo.png}\\
        \ifx\instituteloc\undefined\else {\scshape \instituteloc}\\[10pt] \fi              % for academic assignment
        \hrule
        \vspace{10pt}
        {\LARGE  \bfseries \@title} \\ [5pt]
        \StudentLang {\itshape \@author} \\ [0pt]
        %\ifx\rollloc\undefined\else\RollLang: {\itshape\rollloc} \\ [0pt]                % created by me on [01-10-20]  
        \ifx\classloc\undefined\else \ClassLang: {\itshape\classloc} \\ [0pt]             % created by me on [01-10-20]    
        \ifx\sessionloc\undefined\else \SessionLang: {\itshape\sessionloc} \\ [0pt]       % created by me on [01-10-20]
        \ifx\emailloc\undefined \else \EmailLang: {\itshape\href{mailto:\emailloc}{\emailloc}} \\ [0pt]  % created by me on [04-10-20]
        %\ifx\instituteloc\undefined{}\else{\InstituteLang {\itshape\instituteloc}}
        \vspace{8pt}
        \hrule
        \vspace{10pt}
        \ifx\courseloc\undefined\else\CourseLang: {\itshape \courseloc{} \ifx\professorloc\undefined{}\else{-- }\fi  }\fi
        \ifx\professorloc\undefined\else{\ProfessorLang: {\itshape\professorloc}} \\ [0pt] \fi 
        \DateLang: {\itshape\@date}
        \vspace{8pt}
        \hrule
        \vspace{20pt} 
    \end{center}
    \vspace*{\fill}
}


\pagestyle{head}
% definition of the "problem" environment
\newsavebox{\problembox}
\newenvironment{problem}
    {\begin{center} \begin{lrbox}{\problembox}\begin{minipage}{.98\textwidth}}
    {\end{minipage}\end{lrbox}\fbox{\usebox{\problembox}} \end{center} }

%%% We finish the class with this command
\endinput