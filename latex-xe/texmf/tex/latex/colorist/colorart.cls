%%
%% This is file `colorist/colorart.cls',
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
\ProvidesClass{colorart}
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
\RequirePackage{iftex}
\ifPDFTeX
\RequirePackage[T1]{fontenc}
\RequirePackage{inputenc}
\fi
\if@colorclass@customfont\else
\RequirePackage{mathpazo}
\RequirePackage{newpxtext}
\fi
\RequirePackage{amssymb}

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
    \let\colorist@textsc\relax
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
    \let\colorist@textsc\relax
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
%% End of file `colorist/colorart.cls'.
