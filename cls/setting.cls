%%%% 参考了https://www.wondercv.com/的模板
\ProvidesClass{setting}

% --- Class options ---
% Some ATS/online application systems flag PDF actions (e.g. /OpenAction, /AA)
% as "illegal code". Use class option `upload` to disable hyperref and avoid
% generating such actions in the output PDF.
\newif\ifsetting@upload
\setting@uploadfalse
\DeclareOption{upload}{\setting@uploadtrue}
\DeclareOption{nolinks}{\setting@uploadtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass[8pt]{extarticle}

% disable indent globally
\setlength{\parindent}{0pt}

% use hyperlink for email and url
\ifsetting@upload
  \usepackage{url}
  \urlstyle{tt}
  % Fallback: render link text only.
  \providecommand{\href}[2]{#2}
\else
  \usepackage{hyperref}
  \usepackage{url}
  \hypersetup{
      colorlinks=true,
      linkcolor=cyan,
      urlcolor=cyan,
      citecolor=cyan,
  }
  \urlstyle{tt}
\fi

\usepackage{enumitem}

%%%% 利用tikz来定位照片和学校Logo
\usepackage{graphicx}
\usepackage{tikz}
\usetikzlibrary{calc}

% some general improvements, defines the XeTeX logo
\RequirePackage{xltxtra}
% use xifthen
\RequirePackage{xifthen}
\RequirePackage{array}
\RequirePackage{longtable}
% FontAwesome icons (optional)
% Some minimal TeX installations don't ship `fontawesome.sty`.
% Fall back to simple text tokens so compilation still succeeds.
\newif\ifsetting@fontawesome
\IfFileExists{fontawesome.sty}{%
  % Font files use a different search path from ordinary TeX inputs.
  \IfFontExistsTF{FontAwesome.otf}{\setting@fontawesometrue}{}%
}{}%
\ifsetting@fontawesome
  \defaultfontfeatures[FontAwesome]{Extension=.otf}% Resolve via TeX font files.
  \RequirePackage{fontawesome}%
\else
  \ClassWarning{setting}{FontAwesome package or font not found. Falling back to text tokens for icon commands. Install TeX Live package `fontawesome`/`texlive-fontawesome` (or `texlive-fonts-extra`) to enable icons.}%
  \providecommand{\faChevronCircleRight}{\textbullet}%
  \providecommand{\faAngleRight}{>}%
  \providecommand{\faAt}{@}%
  \providecommand{\faCalendar}{\textsf{DATE}}%
  \providecommand{\faCircle}{\textbullet}%
  \providecommand{\faCircleThin}{\textbullet}%
  \providecommand{\faCogs}{\textsf{SKILL}}%
  \providecommand{\faEnvelopeO}{\textsf{MAIL}}%
  \providecommand{\faExternalLink}{\textsf{LINK}}%
  \providecommand{\faGithub}{\textsf{GH}}%
  \providecommand{\faGraduationCap}{\textsf{EDU}}%
  \providecommand{\faHeart}{\textsf{AWD}}%
  \providecommand{\faHome}{\textsf{WEB}}%
  \providecommand{\faInfo}{\textsf{INFO}}%
  \providecommand{\faInstitution}{\textsf{UNI}}%
  \providecommand{\faLinkedin}{\textsf{in}}%
  \providecommand{\faLinkedinSquare}{\textsf{in}}%
  \providecommand{\faMapMarker}{\textsf{LOC}}%
  \providecommand{\faMobilePhone}{\textsf{MOB}}%
  \providecommand{\faPhone}{\textsf{TEL}}%
  \providecommand{\faRssSquare}{\textsf{RSS}}%
  \providecommand{\faUser}{\textsf{ID}}%
  \providecommand{\faViadeo}{\textsf{V}}%
  \providecommand{\faWechat}{\textsf{WX}}%
  \providecommand{\faWrench}{\textsf{PROJ}}%
\fi
% use xcolor for customizing color
\RequirePackage{xcolor}

\RequirePackage[super]{nth}
%%%% define color
\definecolor{ICBlue}{HTML}{0a4aa3} % IC Blue
\definecolor{DarkGray}{HTML}{404040} % 定义深灰色

%%% \widthof[]{} 用于特殊对齐
\usepackage{calc}


% loading fonts
\usepackage{fontspec}
\usepackage{xeCJK}
\CJKsetecglue{} %% 取消中文与数字之间间隙

% Open fonts supplied by TeX Live; no bundled font files required.
% Latin Modern provides Latin glyphs, Fandol provides Chinese glyphs.
\setmainfont{lmroman10-regular.otf}[
    BoldFont = lmroman10-bold.otf,
    ItalicFont = lmroman10-italic.otf,
    BoldItalicFont = lmroman10-bolditalic.otf
]
\setCJKmainfont{FandolHei-Regular.otf}[
    BoldFont = FandolHei-Bold.otf,
    ItalicFont = FandolKai-Regular.otf
]

\xeCJKsetup{CJKglue=\hskip -0.5pt plus 0.05\baselineskip} 


\usepackage{relsize}
\usepackage{xspace}

\usepackage[
	a4paper,
	left=1.2cm,
	right=1.2cm,
	top=1.5cm,
	bottom=1cm,
	nohead
]{geometry}
\renewcommand{\baselinestretch}{1.2} %定义行间距1.2

\usepackage{titlesec}
\usepackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
% \setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=*}
\setlist[enumerate]{topsep=0.25em, leftmargin=*}

\titleformat{\section}         % Customise the \section command 
  {\large\bfseries\raggedright\color{ICBlue}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {}                           % Can be used to insert code before the heading
  [{\color{ICBlue}\titlerule}]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1.6}{*1.2}

\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*1}{*0.5}

% 蓝色圆角矩形模块（与 section 左右对齐）
\newcommand{\overall}[1]{%
  \par\vspace{0.5em}% 默认与前一部分留出间距
  \noindent
  \setlength{\fboxsep}{0.7em}%
  \setlength{\fboxrule}{0.5pt}%
  \tikz[baseline]{\node[
    draw=ICBlue,
    rounded corners=0.9ex,
    line width=0.5pt,
    fill=white,
    inner xsep=0.7em,
    inner ysep=0.5em,
    text width=\dimexpr\linewidth-2\fboxsep-2\fboxrule\relax,
    align=left,
    % text=ICBlue,
    anchor=base west
  ] {#1};}%
  \par\vspace{0em}%
}

\newcommand{\logosection}[2]{%
    \section{\Large\makebox[\widthof{\faGraduationCap}][c]{\color{ICBlue}#1}\  #2}
}


\newcommand{\dateRange}[2]{
    {#1 -- \makebox[\widthof{#1}][s]{#2}}
}


\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}

\makeatletter
\def\@cvname{}
\def\@cvjobtitle{}
\def\@cvcontact{}
\def\@cvphoto{}
\def\@cvinfo{} % 用于存放基本信息
\def\@cvphotosize{2cm}

\newcommand{\photo}[2]{
  \def\@cvphotosize{#1}
  \def\@cvphoto{#2}
}

\newcommand{\name}[2]{
  \def\@cvname{#1} 
  \def\@cvjobtitle{#2}
}

\newcommand{\PersionalInfo}[1]{
  \def\@cvinfo{#1}
}

\def\@cvlogo{}
\newcommand{\logo}[1]{
  \def\@cvlogo{#1}
}

% \newcommand{\renderCVHeader}{
%   \vspace*{-1cm} 
%   \ifx\@cvphoto\@empty
%     \begin{minipage}{\linewidth}
%       {\Huge\bfseries\color{ICBlue}\@cvname}\ {\huge\textnormal{|\ \@cvjobtitle}}\par
%       \vspace{0.8ex}
%       {\normalsize\@cvcontact}\par
%       \vspace{0.5ex}
%       {\normalsize\@cvinfo}
%     \end{minipage}
%   \else
%     \begin{minipage}
%       \ifx\@cvlogo\@empty\else \@cvlogo \vspace{2ex} \fi
%     \end{minipage}
%     \begin{minipage}{\dimexpr\linewidth-\@cvphotosize-1.8em\relax}
%       {\Huge\bfseries\color{ICBlue}\@cvname}\ {\huge\textnormal{|\ \@cvjobtitle}}\par
%       \vspace{0.8ex}
%       {\normalsize\@cvcontact}\par
%       \vspace{0.5ex}
%       {\normalsize\@cvinfo}
%     \end{minipage}
%     \hfill
%     \begin{minipage}{\@cvphotosize}
%       \includegraphics[width=\linewidth]{\@cvphoto}
%     \end{minipage}
%   \fi
%   \par\vspace{0.9ex}
% }

\newcommand{\renderCVHeader}{
  \vspace*{-1cm} 
  \ifx\@cvphoto\@empty
    % 如果没有头像，保持原样或根据需要调整
    \begin{minipage}{\linewidth}
      {\Huge\bfseries\color{ICBlue}\@cvname}\ {\huge\textnormal{|\ \@cvjobtitle}}\par
      \vspace{0.8ex}
      {\normalsize\@cvcontact}\par
      \vspace{0.5ex}
      {\normalsize\@cvinfo}
    \end{minipage}
  \else 
    % 1. 左侧：Logo (宽度设为 3cm，可根据 Logo 大小调整)
    \begin{minipage}[c][\@cvphotosize][t]{2cm}
      \ifx\@cvlogo\@empty\else \@cvlogo \fi
    \end{minipage}
    \hfill
    % 2. 中间：姓名与信息 (宽度自动计算：总宽 - 左侧Logo宽 - 右侧头像宽 - 间距)
    % 假设 Logo 宽 3cm，头像宽 \@cvphotosize，间距 1.8em
    \begin{minipage}[c][\@cvphotosize][t]{\dimexpr\linewidth-5.5cm-\@cvphotosize-3em\relax}
      \vspace{0.5ex} % 微调垂直对齐
      {\Huge\bfseries\color{ICBlue}\@cvname}\ {\huge\textnormal{|\ \@cvjobtitle}}\par
      \vspace{0.8ex}
      {\normalsize\@cvcontact}\par
      \vspace{0.5ex}
      {\normalsize\@cvinfo}
    \end{minipage}
    % \hfill
    % 3. 右侧：头像
    \begin{minipage}[c][\@cvphotosize][t]{\@cvphotosize}
      \includegraphics[width=\linewidth]{\@cvphoto}
    \end{minipage}
    
    % --- 三栏布局结束 ---
  \fi
  \par\vspace{0.9ex}
}



\newcommand{\contactInfo}[3]{
    \def\@cvcontact{%
      \faPhone\ {#1} \quad
      \faEnvelopeO\ \href{mailto:#2}{#2} \quad
      \faHome\ \href{#3}{#3}%
    }
    \renderCVHeader
}

\newcommand{\basicContactInfo}[6]{
    \def\@cvcontact{%
      \faPhone { |} \faWechat\ {#1} \quad
      \faEnvelopeO\ {#2}%
    }
    \def\@cvinfo{%
      \faUser\ {#3} \quad
      \faMapMarker\ {#4} \quad
      \faCalendar\ {#5} \quad
      \faUser\ {#6} \quad
    }
    \renderCVHeader
}

\makeatother

% \role{信号与信息处理}{博士}
\newcommand{\role}[2]{
  {\par \textit{#1} ~ #2 \par}
  \vspace{0.5ex}
}

\newcommand{\biInfo}[2]{
    {#1 \quad #2}
}

\newcommand{\tripleInfo}[3]{
    {#1 \quad #2 \quad #3}
}

% YAAC-like experience block support
\newlength{\cvleftcolumn}
\setlength{\cvleftcolumn}{1.1cm}
\newlength{\cvrightcolumnlength}
\setlength{\cvrightcolumnlength}{\dimexpr\textwidth-\cvleftcolumn-2em-\arrayrulewidth\relax}

\newcolumntype{E}{p{\cvrightcolumnlength}}
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}m{#1}}

\newcommand{\cvtag}[1]{%
  \csname tikz\endcsname[baseline]\node[
    anchor=base,
    draw=ICBlue!45,
    rounded corners=0.5ex,
    inner xsep=0.9ex,
    inner ysep=0.45ex,
    text height=1.3ex,
    text depth=.35ex
  ]{#1};
}

% \newcommand{\cvtag}[1]{%
%   \csname tikz\endcsname[baseline]\node[
%     anchor=base,
%     draw=ICBlue,           % 边框颜色（也可以设为 none 去掉边框）
%     fill=ICBlue,           % 填充颜色：蓝色
%     text=white,            % 字体颜色：白色
%     rounded corners=0.5ex,
%     inner xsep=1.2ex,
%     inner ysep=0.5ex,
%     text height=1.3ex,
%     text depth=.25ex
%   ]{\bfseries #1};
% }

\newenvironment{experiences}{%
\setlength{\LTleft}{0pt}
\setlength{\LTright}{0pt}
\setlength{\LTpre}{3pt}
\setlength{\LTpost}{0pt}
\setlength{\tabcolsep}{0pt}
\begin{longtable}{@{} L{\cvleftcolumn} @{\hspace{1em}} | @{\hspace{1em}} E @{}}
}{%
\end{longtable}
}

\newcommand\experience[5]{
  % 第一行：日期和职位/公司名
  {\smaller \hfill #1} & {#2} \\
  % 第二行：合并处理 #3, #4 和 #5
  {\smaller \hfill #3} &
  \begin{minipage}[t]{\cvrightcolumnlength}
    % 1. 如果 #4 有内容，渲染 #4
    \ifthenelse{\isempty{#4}}{}{
        #4
        % 2. 只有当 #4 和 #5 同时存在时，才添加垂直间距
        \ifthenelse{\isempty{#5}}{}{}
    }
    % 3. 如果 #5 有内容，渲染 #5
    \ifthenelse{\isempty{#5}}{}{
        \footnotesize{\foreach \n in {#5}{\cvtag{\n}}}%
    }
  \end{minipage} \\
}

\newenvironment{GeneralSkills}{%
% Measure a four-character bold label at the current font size.
% Recalculate both columns together to preserve the total table width.
\settowidth{\cvleftcolumn}{\bfseries 荣誉奖励}%
\addtolength{\cvleftcolumn}{0.2em}%
\setlength{\cvrightcolumnlength}{\dimexpr\linewidth-\cvleftcolumn-2em-\arrayrulewidth\relax}%
\setlength{\LTleft}{0pt}
\setlength{\LTright}{0pt}
\setlength{\LTpre}{3pt}
\setlength{\LTpost}{0pt}
\setlength{\tabcolsep}{0pt}
\begin{longtable}{@{} L{\cvleftcolumn} @{\hspace{1em}} | @{\hspace{1em}} E @{}}
}{%
\end{longtable}
}


% 定义条目命令
% \begin{GeneralSkills}
%     \GeneralSkill{荣誉奖项}{Git, Docker, VS Code, IntelliJ}
% \end{GeneralSkills}

\newcommand\GeneralSkill[2]{
  {\bfseries\hfill#1}&#2 \\
}


% 定义技能标签的通用命令 \showtags{标签列表}
\newcommand{\showtags}[1]{
    {
        \footnotesize
        \foreach \n in {#1}{
            \cvtag{\n}\enspace
        }
    }
}