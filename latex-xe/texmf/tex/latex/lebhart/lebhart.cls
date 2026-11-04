%%
%% This is file `lebhart/lebhart.cls',
%% generated with the docstrip utility.

%% Copyright (C) 2021 by Jinwen XU
%% 
%% This is part of the colorist class series.
%% 
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3c of this license or (at
%% your option) any later version. The latest version of this license is in
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2020-10-01]
\ProvidesClass{lebhart}
    [2021/12/16 A colorful article style]
\def\colorclass@baseclass{article}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{
    family = @colorclass,
    prefix = @colorclass@,
}
\DeclareBoolOption[false]{draft}
\DeclareBoolOption[false]{fast}
\DeclareBoolOption[false]{useosf}
\DeclareBoolOption[false]{lmodern}
\DeclareBoolOption[false]{palatino}
\DeclareBoolOption[false]{times}
\DeclareBoolOption[false]{garamond}
\DeclareBoolOption[false]{noto}
\DeclareBoolOption[false]{biolinum}
\DeclareBoolOption[false]{customfont}
\DeclareStringOption{thmnum}[PJL@thmnum@default]

\newif\if@colorclass@bfivepaper\@colorclass@bfivepaperfalse
\DeclareVoidOption{b5paper}{\@colorclass@bfivepapertrue}
\newif\if@colorclass@afourpaper\@colorclass@afourpaperfalse
\DeclareVoidOption{a4paper}{\@colorclass@afourpapertrue}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{\colorclass@baseclass}}
\ProcessKeyvalOptions*\relax
\LoadClass{\colorclass@baseclass}

\if@colorclass@draft
    \@colorclass@fasttrue
\fi
\if@colorclass@lmodern
    \@colorclass@customfonttrue
\fi
\if@colorclass@palatino
    \@colorclass@customfonttrue
\fi
\if@colorclass@times
    \@colorclass@customfonttrue
\fi
\if@colorclass@garamond
    \@colorclass@customfonttrue
\fi
\if@colorclass@noto
    \@colorclass@customfonttrue
\fi
\if@colorclass@biolinum
    \@colorclass@customfonttrue
\fi

%%================================
%% Page layout
%%================================
\RequirePackage{silence}
\WarningFilter{geometry}{Over-specification in}
\RequirePackage[heightrounded]{geometry}
\geometry{
    papersize={8.5in,11in},
    % total={47em,66em},
    total={6.500in,9.130in},
    hmarginratio=1:1,
    vmarginratio=1:1,
    footnotesep=2em plus 2pt minus 2pt,
}
\if@colorclass@bfivepaper
\geometry{
    b5paper,
    % total={40em,59em},
    total={5.535in,8.160in},
    hmarginratio=1:1,
    vmarginratio=1:1,
    footnotesep=2em plus 2pt minus 2pt,
}
\fi
\if@colorclass@afourpaper
\geometry{
    a4paper,
    % total={47em,70em},
    total={6.500in,9.685in},
    hmarginratio=1:1,
    vmarginratio=1:1,
    footnotesep=2em plus 2pt minus 2pt,
}
\fi

\RequirePackage{indentfirst}

\if@colorclass@fast
    \PassOptionsToPackage{fast}{colorist}
    \RequirePackage{draftwatermark}
    \DraftwatermarkOptions{text={\normalfont DRAFT},color=paper!95!-paper}
\fi

\RequirePackage{colorist}

%%================================
%% Fonts
%%================================
\if@colorclass@customfont\else
    \if@colorclass@fast
        \RequirePackage{mathpazo}
    \fi
\fi

\PassOptionsToPackage{no-math,quiet}{fontspec}
\RequirePackage{fontspec}

\IfFileExists{colorist-font.tex}{
    \input{colorist-font.tex}
}{
\IfFontExistsTF{Palatino Linotype}{%
    \setmainfont{Palatino Linotype}
        [\if@colorclass@useosf Numbers = OldStyle\fi]
}{
    \setmainfont{TeXGyrePagellaX-Regular.otf}[
        BoldFont       = TeXGyrePagellaX-Bold.otf ,
        ItalicFont     = TeXGyrePagellaX-Italic.otf ,
        BoldItalicFont = TeXGyrePagellaX-BoldItalic.otf,
        \if@colorclass@useosf Numbers = OldStyle\fi ]
}
    \setsansfont{SourceSansPro-Regular.otf}[
        Scale          = MatchLowercase ,
        BoldFont       = SourceSansPro-Bold.otf ,
        ItalicFont     = SourceSansPro-RegularIt.otf ,
        BoldItalicFont = SourceSansPro-BoldIt.otf ]
    \setmonofont{NewCMMono10-Regular.otf}[
        Scale          = 1.05 ,
        BoldFont       = NewCMMono10-Bold.otf ,
        ItalicFont     = NewCMMono10-Italic.otf ,
        BoldItalicFont = NewCMMono10-BoldOblique.otf ]
}

\PassOptionsToPackage{fontset=none,scheme=plain}{ctex}
\RequirePackage{ctex}

\IfFileExists{colorist-font.cjk.tex}{
    \input{colorist-font.cjk.tex}
}{
\IfFontExistsTF{SourceHanSerifSC-Regular}{%
    \setCJKmainfont{SourceHanSerifSC-Regular}[
        BoldFont       = SourceHanSerifSC-Bold ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanSerifSC-Bold ]
}{
    \setCJKmainfont{FandolSong-Regular.otf}[
        BoldFont       = FandolSong-Bold.otf ,
        ItalicFont     = FandolKai-Regular.otf ,
        BoldItalicFont = FandolKai-Regular.otf ,
        BoldItalicFeatures = {FakeBold=4} ]
}

\IfFontExistsTF{SourceHanSansSC-Regular}{%
    \setCJKsansfont{SourceHanSansSC-Regular}[
        BoldFont       = SourceHanSansSC-Bold ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanSansSC-Bold ]
}{
    \setCJKsansfont{FandolHei-Regular.otf}[
        BoldFont       = FandolHei-Bold.otf ,
        ItalicFont     = * ,
        BoldItalicFont = FandolHei-Bold.otf ]
}

\IfFontExistsTF{SourceHanMonoSC-Regular}{%
    \setCJKmonofont{SourceHanMonoSC-Regular}[
        BoldFont       = SourceHanMonoSC-Medium ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanMonoSC-Medium ]
}{
    \setCJKmonofont{FandolFang-Regular.otf}[
        BoldFont       = * ,
        BoldFeatures   = {FakeBold=4} ,
        ItalicFont     = * ,
        BoldItalicFont = * ,
        BoldItalicFeatures = {FakeBold=4} ]
}

\if@PJLlang@enable@CN
\IfFontExistsTF{SourceHanSerifSC-Regular}{%
    \setCJKfamilyfont{SCmain}{SourceHanSerifSC-Regular}[
        BoldFont       = SourceHanSerifSC-Bold ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanSerifSC-Bold ]
}{
    \setCJKfamilyfont{SCmain}{FandolSong-Regular.otf}[
        BoldFont       = FandolSong-Bold.otf ,
        ItalicFont     = FandolKai-Regular.otf ,
        BoldItalicFont = FandolKai-Regular.otf ,
        BoldItalicFeatures = {FakeBold=4} ]
}
\IfFontExistsTF{SourceHanSansSC-Regular}{%
    \setCJKfamilyfont{SCsans}{SourceHanSansSC-Regular}[
        BoldFont       = SourceHanSansSC-Bold ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanSansSC-Bold ]
}{
    \setCJKfamilyfont{SCsans}{FandolHei-Regular.otf}[
        BoldFont       = FandolHei-Bold.otf ,
        ItalicFont     = * ,
        BoldItalicFont = FandolHei-Bold.otf ]
}
\IfFontExistsTF{SourceHanMonoSC-Regular}{%
    \setCJKfamilyfont{SCmono}{SourceHanMonoSC-Regular}[
        BoldFont       = SourceHanMonoSC-Medium ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanMonoSC-Medium ]
}{
    \setCJKfamilyfont{SCmono}{FandolFang-Regular.otf}[
        BoldFont       = * ,
        BoldFeatures   = {FakeBold=4} ,
        ItalicFont     = * ,
        BoldItalicFont = * ,
        BoldItalicFeatures = {FakeBold=4} ]
}
\fi

\if@PJLlang@enable@TC
\IfFontExistsTF{SourceHanSerifTC-Regular}{%
    \setCJKfamilyfont{TCmain}{SourceHanSerifTC-Regular}[
        BoldFont       = SourceHanSerifTC-Bold ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanSerifTC-Bold ]
}{
    \setCJKfamilyfont{TCmain}{FandolSong-Regular.otf}[
        BoldFont       = FandolSong-Bold.otf ,
        ItalicFont     = FandolKai-Regular.otf ,
        BoldItalicFont = FandolKai-Regular.otf ,
        BoldItalicFeatures = {FakeBold=4} ]
}
\IfFontExistsTF{SourceHanSansTC-Regular}{%
    \setCJKfamilyfont{TCsans}{SourceHanSansTC-Regular}[
        BoldFont       = SourceHanSansTC-Bold ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanSansTC-Bold ]
}{
    \setCJKfamilyfont{TCsans}{FandolHei-Regular.otf}[
        BoldFont       = FandolHei-Bold.otf ,
        ItalicFont     = * ,
        BoldItalicFont = FandolHei-Bold.otf ]
}
\IfFontExistsTF{SourceHanMonoTC-Regular}{%
    \setCJKfamilyfont{TCmono}{SourceHanMonoTC-Regular}[
        BoldFont       = SourceHanMonoTC-Medium ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanMonoTC-Medium ]
}{
    \setCJKfamilyfont{TCmono}{FandolFang-Regular.otf}[
        BoldFont       = * ,
        BoldFeatures   = {FakeBold=4} ,
        ItalicFont     = * ,
        BoldItalicFont = * ,
        BoldItalicFeatures = {FakeBold=4} ]
}
\fi

\if@PJLlang@enable@JP
\IfFontExistsTF{SourceHanSerif-Regular}{%
    \setCJKfamilyfont{JPmain}{SourceHanSerif-Regular}[
        BoldFont       = SourceHanSerif-Bold ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanSerif-Bold ]
}{
    \setCJKfamilyfont{JPmain}{FandolSong-Regular.otf}[
        BoldFont       = FandolSong-Bold.otf ,
        ItalicFont     = FandolKai-Regular.otf ,
        BoldItalicFont = FandolKai-Regular.otf ,
        BoldItalicFeatures = {FakeBold=4} ]
}
\IfFontExistsTF{SourceHanSans-Regular}{%
    \setCJKfamilyfont{JPsans}{SourceHanSans-Regular}[
        BoldFont       = SourceHanSans-Bold ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanSans-Bold ]
}{
    \setCJKfamilyfont{JPsans}{FandolHei-Regular.otf}[
        BoldFont       = FandolHei-Bold.otf ,
        ItalicFont     = * ,
        BoldItalicFont = FandolHei-Bold.otf ]
}
\IfFontExistsTF{SourceHanMono-Regular}{%
    \setCJKfamilyfont{JPmono}{SourceHanMono-Regular}[
        BoldFont       = SourceHanMono-Medium ,
        ItalicFont     = * ,
        BoldItalicFont = SourceHanMono-Medium ]
}{
    \setCJKfamilyfont{JPmono}{FandolFang-Regular.otf}[
        BoldFont       = * ,
        BoldFeatures   = {FakeBold=4} ,
        ItalicFont     = * ,
        BoldItalicFont = * ,
        BoldItalicFeatures = {FakeBold=4} ]
}
\fi

\WarningFilter{latexfont}{Font shape}
\WarningFilter{latexfont}{Some font}

\def\CJKsffamily{}
\def\CJKttfamily{}

\apptocmd{\sffamily}{\CJKsffamily}{}{\FAIL}
\apptocmd{\ttfamily}{\CJKttfamily}{}{\FAIL}

\if@PJLlang@enable@CN
\gappto{\PJLlang@langconfig@CN}{%
    \def\CJKsffamily{\CJKfamily{SCsans}}%
    \def\CJKttfamily{\CJKfamily{SCmono}}%
    \CJKfamily{SCmain}%
}
\fi

\if@PJLlang@enable@TC
\gappto{\PJLlang@langconfig@TC}{%
    \def\CJKsffamily{\CJKfamily{TCsans}}%
    \def\CJKttfamily{\CJKfamily{TCmono}}%
    \CJKfamily{TCmain}%
}
\fi

\if@PJLlang@enable@JP
\gappto{\PJLlang@langconfig@JP}{%
    \def\CJKsffamily{\CJKfamily{JPsans}}%
    \def\CJKttfamily{\CJKfamily{JPmono}}%
    \CJKfamily{JPmain}%
}
\fi
}

\if@colorclass@customfont\else
\if@colorclass@fast
\RequirePackage{amssymb}
\else
\PassOptionsToPackage
    {warnings-off={mathtools-colon,mathtools-overbracket}}{unicode-math}
\RequirePackage{unicode-math}
\unimathsetup{math-style=ISO, partial=upright, nabla=upright}
\setmathfont{Asana-Math.otf}
\IfFontExistsTF{Neo Euler}{%
\setmathfont[range={up/{Latin,latin,Greek,greek},
                    bfup/{Latin,latin,Greek,greek},
                    cal, bfcal, frak, bffrak,
                    `(,`),`[,`],`\{,`\},`:,`=,\ne,\equiv,`/,\backslash,
                    \in,\notin,\ni,\subset,\supset,\subseteq,\supseteq,
                    \rightarrow,\leftarrow,\mapsto,\hookrightarrow,\hookleftarrow,
                    \sum,\prod,\coprod,
                    \sqrt,\int,\iint,\iiint,\oint},
              script-features={},
              sscript-features={},
              Scale = 1.05,
            ]{Neo Euler}
}{}
\setmathfont[range={\leq,\geq,\ll,\gg,\lll,\ggg,\leqslant,\geqslant},
              Scale = 0.95,
            ]{latinmodern-math.otf}
\setmathfont[range={up/num, bfup/num}
            ]{texgyrepagella-math.otf}

\AtBeginDocument{
\let\mid@original\mid
\renewcommand{\mid}{\hspace{-.2em}\mid@original\hspace{-.2em}}
\let\nmid@original\nmid
\renewcommand{\nmid}{\hspace{-.2em}\nmid@original\hspace{-.2em}}
\renewcommand{\frac}[2]{\genfrac{}{}{}{}{
    \mathchoice
        {\raisebox{-.15em}{$\displaystyle #1$}}
        {\raisebox{-.15em}{$\textstyle #1$}}
        {\raisebox{-.08em}{$\scriptstyle #1$}}
        {\scriptscriptstyle #1}
}{
    \mathchoice
        {\raisebox{.08em}{$\displaystyle #2$}}
        {\raisebox{.08em}{$\textstyle #2$}}
        {\raisebox{.05em}{$\scriptstyle #2$}}
        {\scriptscriptstyle #2}
}}
}

\RequirePackage{tikz-cd}
\newbox\xratbelow
\newbox\xratabove
\renewcommand{\xrightarrow}[2][]{%
    \setbox\xratbelow=\hbox{\ensuremath{\scriptstyle #1}}%
    \setbox\xratabove=\hbox{\ensuremath{\scriptstyle #2}}%
    \pgfmathsetlengthmacro{\xratlen}{max(\wd\xratbelow, \wd\xratabove) + .8em}%
    \mathrel{\tikz [->, baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) -- node[below=3pt] {\box\xratbelow}
        node[above=2pt] {\box\xratabove}
        (\xratlen,0) ;}}
\renewcommand{\xleftarrow}[2][]{%
    \setbox\xratbelow=\hbox{\ensuremath{\scriptstyle #1}}%
    \setbox\xratabove=\hbox{\ensuremath{\scriptstyle #2}}%
    \pgfmathsetlengthmacro{\xratlen}{max(\wd\xratbelow, \wd\xratabove) + .8em}%
    \mathrel{\tikz [<-, baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) -- node[below=3pt] {\box\xratbelow}
        node[above=2pt] {\box\xratabove}
        (\xratlen,0) ;}}
\renewcommand{\xleftrightarrow}[2][]{%
    \setbox\xratbelow=\hbox{\ensuremath{\scriptstyle #1}}%
    \setbox\xratabove=\hbox{\ensuremath{\scriptstyle #2}}%
    \pgfmathsetlengthmacro{\xratlen}{max(\wd\xratbelow, \wd\xratabove) + .8em}%
    \mathrel{\tikz [<->, baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) -- node[below=3pt] {\box\xratbelow}
        node[above=2pt] {\box\xratabove}
        (\xratlen,0) ;}}
\renewcommand{\xhookrightarrow}[2][]{%
    \setbox\xratbelow=\hbox{\ensuremath{\scriptstyle #1}}%
    \setbox\xratabove=\hbox{\ensuremath{\scriptstyle #2}}%
    \pgfmathsetlengthmacro{\xratlen}{max(\wd\xratbelow, \wd\xratabove) + .8em}%
    \mathrel{\tikz [baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) edge[commutative diagrams/hookrightarrow] node[below=3pt] {\box\xratbelow}
        node[above=2pt] {\box\xratabove}
        (\xratlen,0) ;}}
\renewcommand{\xhookleftarrow}[2][]{%
    \setbox\xratbelow=\hbox{\ensuremath{\scriptstyle #1}}%
    \setbox\xratabove=\hbox{\ensuremath{\scriptstyle #2}}%
    \pgfmathsetlengthmacro{\xratlen}{max(\wd\xratbelow, \wd\xratabove) + .8em}%
    \mathrel{\tikz [baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) edge[commutative diagrams/hookleftarrow] node[below=3pt] {\box\xratbelow}
        node[above=2pt] {\box\xratabove}
        (\xratlen,0) ;}}
\renewcommand{\xmapsto}[2][]{%
    \setbox\xratbelow=\hbox{\ensuremath{\scriptstyle #1}}%
    \setbox\xratabove=\hbox{\ensuremath{\scriptstyle #2}}%
    \pgfmathsetlengthmacro{\xratlen}{max(\wd\xratbelow, \wd\xratabove) + .8em}%
    \mathrel{\tikz [baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) edge[commutative diagrams/mapsto] node[below=3pt] {\box\xratbelow}
        node[above=2pt] {\box\xratabove}
        (\xratlen,0) ;}}
\newcommand{\xlongequal}[2][]{%
    \setbox\xratbelow=\hbox{\ensuremath{\scriptstyle #1}}%
    \setbox\xratabove=\hbox{\ensuremath{\scriptstyle #2}}%
    \pgfmathsetlengthmacro{\xratlen}{max(\wd\xratbelow, \wd\xratabove) + .8em}%
    \mathrel{\tikz [baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) edge[commutative diagrams/equal] node[below=3pt] {\box\xratbelow}
        node[above=2pt] {\box\xratabove}
        (\xratlen,0) ;}}

\AtBeginDocument{
\renewcommand{\twoheadrightarrow}{%
    \mathrel{\tikz [baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) edge[commutative diagrams/twoheadrightarrow] (.8em,0) ;}}

\renewcommand{\twoheadleftarrow}{%
    \mathrel{\tikz [baseline=-.55ex, every node/.style={inner sep=0pt}]
        \draw (0,0) edge[commutative diagrams/twoheadleftarrow] (.8em,0) ;}}
}
\fi
\fi

\if@colorclass@lmodern
    \RequirePackage{amssymb}
    \if@colorclass@useosf
        \RequirePackage{cfr-lm}
    \else
        \RequirePackage{lmodern}
    \fi
    \PJLsetlinespacing{\setstretch{1.00}}
\fi

\if@colorclass@palatino
    \RequirePackage{amssymb}
    \RequirePackage{mathpazo}
    \PassOptionsToPackage{defaultsups}{newpxtext}
    \RequirePackage{newpxtext}
    % \RequirePackage{newpxmath}
    \let\openbox\relax
    \PJLsetlinespacing{\setstretch{1.07}}
    \if@colorclass@useosf\useosf\fi
\fi

\if@colorclass@times
    \RequirePackage{amssymb}
    \PassOptionsToPackage{defaultsups}{newtxtext}
    \RequirePackage{newtxtext}
    \RequirePackage{newtxmath}
    \let\openbox\relax
    \PJLsetlinespacing{\setstretch{1.00}}
    \if@colorclass@useosf\useosf\fi
    \let\colorist@sffamily\relax
\fi

\if@colorclass@garamond
    \RequirePackage{amssymb}
    \if@colorclass@useosf\else
        \PassOptionsToPackage{lining}{ebgaramond}
    \fi
    \RequirePackage{ebgaramond-maths}
    \RequirePackage{ebgaramond}
    % \RequirePackage{garamondlibre}
    \PJLsetlinespacing{\setstretch{1.00}}
    \let\colorist@sffamily\relax
\fi

\if@colorclass@noto
    \RequirePackage{amssymb}
    \if@colorclass@useosf
        \PassOptionsToPackage{oldstyle}{notomath}
    \fi
    \RequirePackage{anyfontsize}
    \RequirePackage{notomath}
    \PJLsetlinespacing{\setstretch{1.00}}
\fi

\if@colorclass@biolinum
    \RequirePackage{amssymb}
    % \RequirePackage{mathpazo}
    % \RequirePackage[sansmath]{libertinust1math}
    \ifPDFTeX
        \if@colorclass@useosf
            \PassOptionsToPackage{osf}{biolinum}
        \fi
        \RequirePackage{biolinum}
        \renewcommand*\familydefault{\biolinum@family}
    \else
        \PassOptionsToPackage{no-math}{fontspec}
        \RequirePackage{fontspec}
        \setmainfont{LinBiolinum_R.otf}[
            BoldFont       = LinBiolinum_RB.otf ,
            ItalicFont     = LinBiolinum_RI.otf ,
            BoldItalicFont = LinBiolinum_RBO.otf,
            \if@colorclass@useosf Numbers = OldStyle\fi ]
    \fi
    \PJLsetlinespacing{\setstretch{1.05}}
    \RequirePackage[italic,defaultmathsizes]{mathastext}
\fi

\def\PJL@font@alreadyset{}

\PassOptionsToPackage{verbose=silent}{microtype}
\RequirePackage{microtype}
\PassOptionsToPackage{all}{nowidow}
\RequirePackage{nowidow}
\RequirePackage{embrac}

%%================================
%% Graphics
%%================================
\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage{wrapfig}
\RequirePackage{float}
\RequirePackage{caption}
\captionsetup{font=small}

\endinput
%%
%% End of file `lebhart/lebhart.cls'.
