%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simon's Lab Letter Class for 1998
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simon Moore, University of Cambridge, Computer Laboratory
% Please use freely (it's just a hack!)
% Source from: http://www.cl.cam.ac.uk/~swm11/letters/index.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% * Times version - uses Times font rather than Sabon which is not
%   available on the dept linux boxes
%
% Class Options:
%  usebwarms    - uses a black and white version of the Univ. arms
%  usecmfont    - uses computer modern font rather than Sabon (works
%                 better with xdvi
%  usetimesfont - uses times font rather than Sabon
%
%  e.g.:
%  \documentclass[usecmfont,usebwarms]{/homes/swm11/texmacros/letters/lablet98}
%
% Compulsory commands:
%  \fromwhome{your name}{qualifications}{title}{email}{phone}{fax}
%  \begin{letter}{their name}{their address}
%  \end{letter}
%
% Extra commands:
%  \lettertitle{title of letter}
%  \setdate{date string}
%  \setsigned{greeting}{signature}
%  \cclist{list of people\\to cc the\\message to}
%  \bwarms              % black and white arms
%
% No name version of letter (as letter but recipents name is not added
% to the address):
%  \begin{letternoname}{their name}{their address}
%  \end{letternoname}
%
% An example of use is available here:
%   /homes/swm11/texmacros/letters/lablet98eg.tex


% bsed on the article class
\LoadClass[11pt,a4paper]{article}
\ProvidesClass{lablet98times}[1999/01/06]

\typeout{Simon Moore's Computer Lab Letter Class for 1998}
\typeout{hacked about by mort, 2015}
\typeout{Times New Roman font version (e.g. for Mac's with MSFT Office)}

\usepackage{url}

%% fonts
\usepackage[T1]{fontenc}
\usepackage{lmodern}
\usepackage{amssymb,amsmath}
\usepackage{eurosym}
\usepackage{upquote}
\usepackage{microtype}
\usepackage{fontspec}
\usepackage{xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text,Scale=MatchUppercase}
\renewcommand{\familydefault}{\rmdefault}
\setmainfont{Times New Roman}
\setmonofont{Consolas}
%% \usepackage{sabon}              % Univ. font is Sabon!
%% \usepackage{times}              % use times rather than sabon
%% \renewcommand{\ttdefault}{cmtt} % but don't use courier for typewriter

% page layout
\pagestyle{plain}
\setlength{\oddsidemargin}{0mm}
\setlength{\evensidemargin}{0mm}
% use -31mm for official skip, -25mm for window envelopes
\setlength{\topmargin}{-25mm}
\setlength{\textwidth}{16cm}
\setlength{\textheight}{265mm}  %235mm if address in footer
%\setlength{\footskip}{25mm}
\parskip 10pt
\parindent 0.0pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% main content commands
\newcommand{\fromnamedetails}{}
\newcommand{\fromquoldetails}{}
\newcommand{\fromjobdetails}{}
\newcommand{\fromemaildetails}{}
\newcommand{\fromphonedetails}{}
\newcommand{\fromfaxdetails}{}
\newcommand{\fromwhom}[6]{
  \renewcommand{\fromnamedetails}{#1}
  \renewcommand{\fromquoldetails}{#2}
  \renewcommand{\fromjobdetails}{#3}
  \renewcommand{\fromemaildetails}{\url{#4}}
  \renewcommand{\fromphonedetails}{#5}
  \renewcommand{\fromfaxdetails}{#6}
}

\newcommand{\towhomname}{}
\newcommand{\towhomaddress}{}
\newcommand{\towhom}[3]{
  \renewcommand{\towhomname}{#1}
  \renewcommand{\towhomaddress}{#2}
}

\newcommand{\greetingdetails}{To Whom It May Concern:}
\newcommand{\greeting}[1]{
  \renewcommand{\greetingdetails}{#1}
}

\newcommand{\closingdetails}{Yours faithfully,}
\newcommand{\closing}[1]{
  \renewcommand{\closingdetails}{#1}
}

\newcommand{\addressdetails}{
  \towhomname\\
  \towhomaddress
}

\newcommand{\referencedetails}{}
\newcommand{\reference}[1]{\renewcommand{\referencedetails}{#1}}

\newcommand{\datedetails}{\today}
\renewcommand{\date}[1]{\renewcommand{\datedetails}{#1}}

\newcommand{\signeddetails}{\fromnamedetails}
\newcommand{\setsigned}[2]{
  \renewcommand{\closing}{#1}\renewcommand{\signeddetails}{#2}
}

\newcommand{\cclistdetails}{}
\newcommand{\cclist}[1]{
  \renewcommand{\cclistdetails}{
    \vspace*{1em}cc:~~\begin{minipage}[t]{100mm}#1\end{minipage}
}}

\newcommand{\cuarms}{\includegraphics{CUni3.eps}}
\newcommand{\bwarms}{
  \typeout{Using B&W version of the arms}
  \renewcommand{\cuarms}{\includegraphics{BWUni3.eps}}
}

\newcommand{\ComputerLaboratory}{
  \fontsize{14pt}{14pt}\bf Computer\hfill Laboratory
}

\newcommand{\titledetails}{}
\renewcommand{\title}[1]{
  \renewcommand{\titledetails}{\begin{center}\bf #1\end{center}}
}

\newcommand{\dolettertop}{%
  \setlength{\unitlength}{1mm}
  \begin{picture}(160,60)(0,0)
    \put(0,40){
      \makebox(160,20)[tl]{
        \parbox{\textwidth}{
          \bf\fromnamedetails\fromquoldetails\\\it\fromjobdetails}
      }
    }
    \put(0,0){
      \makebox(100,15)[tl]{
        \begin{tabular}{@{}p{90mm}@{}}\addressdetails\end{tabular}}
    }
    \put(0,36){\makebox(160,24.5)[tr]{\cuarms}}
    \put(0,35){\makebox(160,24.5)[br]{\parbox{136pt}{\ComputerLaboratory}}}
  \end{picture}

  \datedetails

  \titledetails

  \thispagestyle{empty}%
  \enlargethispage{10mm}%
  \begin{figure}[b!]\swmfoot\end{figure}

    \greetingdetails
}

\renewcommand{\footnoterule}{}
\renewcommand{\thefootnote}{}

\newcommand{\swmfoot}{\fontsize{9pt}{10pt}\rm\hfill\begin{tabular}{@{}l@{ }l@{}}
  & \\
  \multicolumn{2}{@{}l@{}}{Computer Laboratory}\\
  \multicolumn{2}{@{}l@{}}{William Gates Building}\\
  \multicolumn{2}{@{}l@{}}{JJ Thompson Avenue}\\
  \multicolumn{2}{@{}l@{}}{Cambridge~~~CB3 0FG}\\
  \multicolumn{2}{@{}l@{}}{U.K.}\\
  & \\
  Tel: & \fromphonedetails\\
  Fax: & \fromfaxdetails\\
  E-mail: & \fromemaildetails\\
  \end{tabular}%\let\@oddfoot\@empty
}


\newcommand{\doletterbottom}{
  \begin{minipage}{150mm}%\textwidth}
    \centering

    \closingdetails

    \vspace*{48pt}

    \signeddetails

    \cclistdetails
  \end{minipage}
  \cleardoublepage
}

\newenvironment{letter}{\dolettertop}{\doletterbottom}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a few options

\DeclareOption{usebwarms}{\AtBeginDocument{\bwarms}}
\DeclareOption{usetimesfont}{\typeout{Replacing Sabon with Times}
  \AtEndOfClass{\usepackage{times}}}
\DeclareOption{usecmfont}{\typeout{Replacing Sabon with Computer Modern}
  \renewcommand{\ComputerLaboratory}{
    \fontsize{12pt}{12pt}\bf Computer\hfill Laboratory
  }
  \AtEndOfClass{\renewcommand{\rmdefault}{cmr}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax
