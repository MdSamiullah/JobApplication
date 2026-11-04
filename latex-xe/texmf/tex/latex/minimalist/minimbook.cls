%%
%% This is file `minimalist/minimbook.cls',
%% generated with the docstrip utility.

%% Copyright (C) 2021 by Jinwen XU
%% 
%% This is part of the minimalist class series.
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
\ProvidesClass{minimbook}
    [2021/12/16 A simple and clear book style]
\def\minimclass@baseclass{book}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{
    family = @minimclass,
    prefix = @minimclass@,
}
\DeclareBoolOption[false]{draft}
\DeclareBoolOption[false]{fast}
\DeclareBoolOption[false]{classical}
\DeclareBoolOption[false]{useindent}
\DeclareBoolOption[false]{useosf}
\DeclareBoolOption[false]{lmodern}
\DeclareBoolOption[false]{palatino}
\DeclareBoolOption[false]{times}
\DeclareBoolOption[false]{garamond}
\DeclareBoolOption[false]{noto}
\DeclareBoolOption[false]{biolinum}
\DeclareBoolOption[false]{customfont}
\DeclareStringOption{thmnum}[PJL@thmnum@default]

\newif\if@minimclass@bfivepaper\@minimclass@bfivepaperfalse
\DeclareVoidOption{b5paper}{\@minimclass@bfivepapertrue}
\newif\if@minimclass@afourpaper\@minimclass@afourpaperfalse
\DeclareVoidOption{a4paper}{\@minimclass@afourpapertrue}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{\minimclass@baseclass}}
\ProcessKeyvalOptions*\relax
\LoadClass{\minimclass@baseclass}

\if@minimclass@draft
    \@minimclass@fasttrue
\fi
\if@minimclass@classical\else
    \@minimclass@useindenttrue
\fi
\if@minimclass@lmodern
    \@minimclass@customfonttrue
\fi
\if@minimclass@palatino
    \@minimclass@customfonttrue
\fi
\if@minimclass@times
    \@minimclass@customfonttrue
\fi
\if@minimclass@garamond
    \@minimclass@customfonttrue
\fi
\if@minimclass@noto
    \@minimclass@customfonttrue
\fi
\if@minimclass@biolinum
    \@minimclass@customfonttrue
\fi

%%================================
%% Page layout
%%================================
\RequirePackage{silence}
\WarningFilter{geometry}{Over-specification in}
\RequirePackage[heightrounded]{geometry}
\geometry{
    papersize={7in,10in},
    % total={40em,60em},
    total={5.535in,8.300in},
    hmarginratio=1:1,
    vmarginratio=1:1,
    footnotesep=2em plus 2pt minus 2pt,
}
\if@minimclass@bfivepaper
\geometry{
    b5paper,
    % total={40em,59em},
    total={5.535in,8.160in},
    hmarginratio=1:1,
    vmarginratio=1:1,
    footnotesep=2em plus 2pt minus 2pt,
}
\fi
\if@minimclass@afourpaper
\geometry{
    a4paper,
    % total={47em,70em},
    total={6.500in,9.685in},
    hmarginratio=1:1,
    vmarginratio=1:1,
    footnotesep=2em plus 2pt minus 2pt,
}
\fi

\if@minimclass@fast
    \PassOptionsToPackage{fast}{minimalist}
    \RequirePackage{draftwatermark}
    \DraftwatermarkOptions{text={\normalfont DRAFT},color=paper!95!-paper}
\fi
\if@minimclass@useindent
    \RequirePackage{indentfirst}
\else
    \AtEndPreamble{\RequirePackage{parskip}}
\fi
\RequirePackage{minimalist}

%%================================
%% Fonts
%%================================
\RequirePackage{iftex}
\ifPDFTeX
\RequirePackage[T1]{fontenc}
\RequirePackage{inputenc}
\fi
\if@minimclass@customfont\else
\RequirePackage{mathpazo}
\RequirePackage{newpxtext}
\fi
\RequirePackage{amssymb}

\if@minimclass@lmodern
    \RequirePackage{amssymb}
    \if@minimclass@useosf
        \RequirePackage{cfr-lm}
    \else
        \RequirePackage{lmodern}
    \fi
    \PJLsetlinespacing{\setstretch{1.00}}
\fi

\if@minimclass@palatino
    \RequirePackage{amssymb}
    \RequirePackage{mathpazo}
    \PassOptionsToPackage{defaultsups}{newpxtext}
    \RequirePackage{newpxtext}
    % \RequirePackage{newpxmath}
    \let\openbox\relax
    \PJLsetlinespacing{\setstretch{1.07}}
    \if@minimclass@useosf\useosf\fi
\fi

\if@minimclass@times
    \RequirePackage{amssymb}
    \PassOptionsToPackage{defaultsups}{newtxtext}
    \RequirePackage{newtxtext}
    \RequirePackage{newtxmath}
    \let\openbox\relax
    \PJLsetlinespacing{\setstretch{1.00}}
    \if@minimclass@useosf\useosf\fi
\fi

\if@minimclass@garamond
    \RequirePackage{amssymb}
    \if@minimclass@useosf\else
        \PassOptionsToPackage{lining}{ebgaramond}
    \fi
    \RequirePackage{ebgaramond-maths}
    \RequirePackage{ebgaramond}
    % \RequirePackage{garamondlibre}
    \PJLsetlinespacing{\setstretch{1.00}}
\fi

\if@minimclass@noto
    \RequirePackage{amssymb}
    \if@minimclass@useosf
        \PassOptionsToPackage{oldstyle}{notomath}
    \fi
    \RequirePackage{anyfontsize}
    \RequirePackage{notomath}
    \PJLsetlinespacing{\setstretch{1.00}}
\fi

\if@minimclass@biolinum
    \RequirePackage{amssymb}
    % \RequirePackage{mathpazo}
    % \RequirePackage[sansmath]{libertinust1math}
    \ifPDFTeX
        \if@minimclass@useosf
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
            \if@minimclass@useosf Numbers = OldStyle\fi ]
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

%%================================
%% Index
%%================================
\AtEndPreamble{
\pretocmd{\printindex}{\LocallyStopLineNumbers}{}{}
\apptocmd{\printindex}{\ResumeLineNumbers}{}{}
}

\endinput
%%
%% End of file `minimalist/minimbook.cls'.
