\NeedsTeXFormat{LaTeX2e}
%此文档类基于CTeX文档类，作为preamble部分，有以下功能性
%0.香香的A.T力场，对BUG的最强拒绝
%1.导入必要宏包
%2.设置页边距、行距、默认字号、字体
%3.设置页眉页脚
%4.设置目录样式
%5.声明思源黑体字体族（此字体需要安装，免费商用），这是由于\heiti只有一种字重且不想使用伪加粗
%6.设置一级、二级、三级、四级标题的格式、图表标题样式、脚注样式
%7.设置中英文摘要的样式
%8.设置封面样式
%9.设置参考文献格式，采用GBT7714 2005版
\ProvidesClass{ZJUTbachelor}[2026/04/22 2022数学科学学院本科毕业论文，Edited by Jimmy Zhou]
%默认5号字体，a4纸张，1.25倍行距（LaTeX中单倍行距为字体的1.2倍，word中单倍行距是字体的1.3倍）因此1.25*1.3/1.2=1.3541667
\LoadClass[zihao=5,a4paper,linespread=1.3541667,UTF8,fontset=none]{ctexart} 

\RequirePackage{etoolbox}
\RequirePackage{pdfpages} %用于嵌入pdf
\RequirePackage{cite} %破折号连接连续引用
\RequirePackage{mathrsfs,amsfonts,amssymb,amsmath,amscd,bm} %数学包
\RequirePackage{array} %增强了tabular环境的功能，可以更好的排版表格。
\RequirePackage{enumitem} %增强列表功能
\RequirePackage{zhnumber} %中文数字，其实可以不导入，CTeX已集成可以用\chinese{计数器}实现。
\RequirePackage{datetime}
\RequirePackage{booktabs} %三线表
\RequirePackage{graphicx} %导入图片
\RequirePackage{float} %浮动体位置
\RequirePackage{multirow} %纵向合并表格单元格，不支持换行
\RequirePackage{makecell} %也能纵向合并表单单元格，支持换行
\RequirePackage{listings} %插入代码块
\RequirePackage{extarrows} %为了用长等号

\RequirePackage{mhchem} 
\RequirePackage{chemfig}
\newcommand*{\newchemfig}[1]{~\chemfig{#1}~}

\RequirePackage{caption} % 图表标题设置



% 图题：中文宋体五号加粗，英文 Times New Roman 五号加粗
\DeclareCaptionFont{zjutfigfont}{\songti\zihao{5}\bfseries}

% 图号与图题之间空两格
\DeclareCaptionLabelSeparator{zjutfigsep}{\hspace{1em}}

% 图号按章编号：图3-2
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}

\captionsetup[figure]{
	font=zjutfigfont,
	labelfont=zjutfigfont,
	textfont=zjutfigfont,
	labelsep=zjutfigsep,
	justification=centering,
	singlelinecheck=true,
	position=bottom,
	aboveskip=0pt,
	belowskip=1\baselineskip
}

% 表题格式设置
\DeclareCaptionFont{zjuttabfont}{\songti\zihao{5}\bfseries}

% 表号与表题之间空两格
\DeclareCaptionLabelSeparator{zjuttabsep}{\hspace{1em}}

% 表号按章顺序号：表5-4
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}

\captionsetup[table]{
	font=zjuttabfont,
	labelfont=zjuttabfont,
	textfont=zjuttabfont,
	labelsep=zjuttabsep,
	justification=centering,
	singlelinecheck=true,
	position=top,
	aboveskip=1\baselineskip,
	belowskip=0pt
}

% 三线表线宽
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}

%ref,eqref命令没有间距太丑了
\newcommand*{\tabref}[1]{\tablename~\ref{#1}~}
\newcommand*{\figref}[1]{\figurename~\ref{#1}~}
\newcommand*{\neweqref}[1]{公式~\eqref{#1}~}

\RequirePackage{hyperref} %超链接
\hypersetup{hidelinks} %不显示颜色框

\RequirePackage{fontspec}

\setmainfont{Times New Roman}

\setCJKmainfont{Songti SC}
\setCJKfamilyfont{zjutsong}{Songti SC}

\setCJKsansfont{Heiti SC}[AutoFakeBold=4]
\setCJKmonofont{Songti SC}

\setCJKfamilyfont{zjuthei}{Heiti SC}[AutoFakeBold=4]
\setCJKfamilyfont{zjutkai}{Songti SC}
\ExplSyntaxOn
\cs_if_exist:NTF \songti
	{ \cs_set:Npn \songti { \CJKfamily{zjutsong} } }
	{ \cs_new:Npn \songti { \CJKfamily{zjutsong} } }
\cs_if_exist:NTF \heiti
	{ \cs_set:Npn \heiti { \CJKfamily{zjuthei} } }
	{ \cs_new:Npn \heiti { \CJKfamily{zjuthei} } }
\cs_if_exist:NTF \kaishu
	{ \cs_set:Npn \kaishu { \CJKfamily{zjutkai} } }
	{ \cs_new:Npn \kaishu { \CJKfamily{zjutkai} } }
\ExplSyntaxOff

\RequirePackage{geometry}  % 页面设置
\geometry{a4paper,left=2.5cm,right=2cm,bottom=2.5cm,,top=3cm} %版面页边距上3cm，下2.5cm，左2.5cm，右2cm

\RequirePackage{fancyhdr} %页眉页脚
\pagestyle{fancy} %empty不显示页眉页脚
\fancyhf{}
\fancyhead[C]{\centering\songti\zihao{-5}浙江工业大学毕业设计（论文）} %页眉加“浙江工业大学毕业设计（论文）”，字体为宋体小五号，居中
\fancyfoot[C]{\centering\songti\zihao{-5}\thepage} %页码用宋体小五号字页面底端居中。
% 页眉底部到正文区域顶部的距离
\setlength{\headsep}{25pt}

\RequirePackage[bottom]{footmisc} %脚注紧贴页脚
\RequirePackage{pifont} %脚注圆圈内数字
\renewcommand\thefootnote{\ding{\numexpr171+\value{footnote}}}




\RequirePackage[titles]{tocloft} %目录设置
\setlength{\cftbeforetoctitleskip}{0ex}\setlength{\cftaftertoctitleskip}{0ex} %“目录”这个标题的前后垂直距离
\setlength{\cftbeforesecskip}{0ex}\setlength{\cftbeforesubsecskip}{0ex}\setlength{\cftbeforesubsubsecskip}{0ex} %section,subsection,subsubsection垂直距离
\cftsetpnumwidth{1em}  %\@pnumwidth，页码离最后一个点的距离
\cftsetindents{section}{0em}{5em} %section的indent和numwidth
\cftsetindents{subsection}{2.5em}{3em} %subsection的的indent和numwidth
\cftsetindents{subsubsection}{5em}{4em} %subsubsection的indent和numwidth
\cftsetindents{figure}{0em}{5em} %figure的indent和numwidth
\cftsetindents{table}{0em}{5em} %table的indent和numwidth
\renewcommand{\cftdotsep}{2} %标题和页码中间的点的间距
\renewcommand{\cftsecdotsep}{\cftdotsep} %section标题和页码中间画点，点间距为\cftdotsep
\renewcommand{\cfttabpresnum}{表} %图列前面加上“表”字
\renewcommand{\cftfigpresnum}{图} %图列前面加上“图”字
\counterwithin{table}{section}
\counterwithin{figure}{section}
\counterwithin{equation}{section}

% 图号按章顺序号：图3-2
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
% 目录内容：中文宋体小四号，英文 Times New Roman 小四号
\renewcommand{\cftsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftsubsubsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftfigpagefont}{\songti\zihao{-4}}
\renewcommand{\cfttabpagefont}{\songti\zihao{-4}}
\renewcommand{\cftsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftfigfont}{\songti\zihao{-4}}
\renewcommand{\cfttabfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecleader}{\cftsecleader} %以下，定义所有leader都和section一样
\renewcommand{\cftsubsubsecleader}{\cftsecleader}
\renewcommand{\cftsubsubsecleader}{\cftsecleader}
\renewcommand{\cfttableader}{\cftsecleader}
\renewcommand{\cftfigleader}{\cftsecleader}


%因为\heiti只有一种字重（粗细），优先使用思源黑体；若未安装则回退到系统黑体
\IfFontExistsTF{Source Han Sans SC}{
	\setCJKfamilyfont{siyuanheiti}{Source Han Sans SC}[BoldFont=*-Medium]
}{
	\setCJKfamilyfont{siyuanheiti}{Heiti SC}[BoldFont=Heiti SC]
}
\newcommand*{\siyuanheiti}{\CJKfamily{siyuanheiti}}
\newcommand*{\siyuanheitiBold}{\CJKfamily{siyuanheiti}\bfseries}

%章节标题设置
\ctexset{
	bibname = {\siyuanheitiBold\zihao{3}参考文献},
	contentsname = {\siyuanheitiBold\zihao{3}目\hspace{2em}录},
	listfigurename = {\siyuanheitiBold\zihao{3}图\hspace{2em}列},
	listtablename = {\siyuanheitiBold\zihao{3}表\hspace{2em}列},
	figurename = {图},
	tablename = {表},
	section/name = {第,章},
    section/number = \Chinese{section},
    section/format = {\centering\siyuanheitiBold\zihao{3}},
    section/aftername = \quad,
    section/indent = 0pt,
    section/beforeskip = 0pt,
    section/afterskip = 25pt,
    subsection/number = \arabic{section}.\arabic{subsection},
    subsection/format = {\siyuanheitiBold\zihao{4}},
	subsection/numberformat = {\normalfont\rmfamily\zihao{4}\mdseries},
    subsection/aftername = \quad,
    subsection/indent = 0pt,
    subsection/beforeskip = 24pt,
    subsection/afterskip = 12pt,
	subsubsection/number = \arabic{section}.\arabic{subsection}.\arabic{subsubsection},
    subsubsection/format = {\siyuanheitiBold\zihao{-4}},
	subsubsection/numberformat = {\normalfont\rmfamily\zihao{-4}\mdseries},
    subsubsection/aftername = \quad,
    subsubsection/indent = 0pt,
    subsubsection/beforeskip = 0pt,
    subsubsection/afterskip = 0pt,
	paragraph/format = {\rmfamily\songti\zihao{-4}\linespread{1.25}\selectfont},
	appendix/name = {附录}
}
%一级标题（每章标题）：中文黑体三号、英文Times New Roman三号，居中，1.25倍行距，段前段后各0磅,上面空1行，下面空2行。
%二级标题（节号与节标题）：节号以X.X的形式标注（如2.3为第二章第三节），中文黑体四号、英文Times New Roman四号，1.25倍行距，段前24磅、段后12磅，左起顶格，两端对齐，节号与节标题之间空1格。
%三级标题（小节号与小节标题）：小节号以X.X.X的形式标注（如2.3.4为第二章第三节第四小节），中文黑体小四号、英文Times New Roman小四号，1.25倍行距，段前段后各0磅，左起顶格，两端对齐，小节号与小节标题之间空1格。
%摘要的中英文标题切换
\newif\ifAbstractEN
\providecommand\AbstractEN{
	\ifAbstractEN
	\ctexset{abstractname={\mdseries\zihao{3}\fontfamily{Times New Roman}ABSTRACT}}%roman 三号
	\else
    \ctexset{abstractname={\siyuanheitiBold\zihao{3}\bfseries 摘\hspace{2em}要}} %黑体三号，字间空2格。这里建议用siyuanheitiBold，与word差不多
	\fi
} 



%自定义宏包，项目地址https://gitee.com/walkeraguo/gbt7714-bibtex-style
%参照《文后参考文献著录规则》（GBT 7714-2005）执行。
\RequirePackage[numbers,2005]{gbt7714} 
%\bibliographystyle{unsrt}

%字号
%初号 \zihao{0}
%小初号 \zihao{-0}
%一号 \zihao{1}
%小一号 \zihao{-1}
%二号 \zihao{2}
%小二号 \zihao{-2}
%三号 \zihao{3}
%小三号 \zihao{-3}
%四号 \zihao{4}
%小四号 \zihao{-4}
%五号 \zihao{5}
%小五号 \zihao{-5}
%六号 \zihao{6}
%小六号 \zihao{-6}
%七号 \zihao{7}
%八号 \zihao{8}

%字体
%宋体 \songti
%黑体 \heiti
%楷体 \kaishu
%微软雅黑 \yahei
%思源黑体 \siyuanheiti
%思源黑体加粗 \siyuanheitiBold

%定义传递参数：论文题目
\providecommand\thesis[1]{\providecommand\@thesis{#1}}
\providecommand\mysupervisor[1]{\providecommand\@mysupervisor{#1}}
\providecommand\myname[1]{\providecommand\@myname{#1}}
\providecommand\studentid[1]{\providecommand\@studentid{#1}}
\providecommand\department[1]{\providecommand\@department{#1}}
\providecommand\major[1]{\providecommand\@major{#1}}
\providecommand\class[1]{\providecommand\@class{#1}}



%封面：不改变字体大小，若论文标题过长，则换行处理
\providecommand{\Cover}{
	\thispagestyle{empty}
	{\centering
		%适用思源黑体，要自行安装。因为CTeX的\heiti只有一种字重（粗细），思源黑体有7种
		\begin{figure}[H]
			\centering
			\includegraphics*[width=0.8\linewidth]{pics/logo}
		\end{figure}
		\vspace{12ex}				
		{\songti\zihao{1}\bfseries 本科生毕业设计（论文）}
		\vspace{10ex}



\begin{center}
{\heiti\zihao{3}\bfseries
\begin{tabular}{@{}p{3em}p{20em}@{}}
{\heiti\zihao{3}\bfseries 题目：} &
\underline{\makebox[20em][c]{你的论文题目}} \\[0.8em]

&
\underline{\makebox[20em][c]{（可以分两行书写）}}
\end{tabular}
}
\end{center}



		\vspace{20ex}

		\begin{center}
		{\songti\zihao{-3}\bfseries
		\renewcommand{\arraystretch}{1.25}
		\begin{tabular}{@{}p{6em}p{16em}@{}}
		学\hspace{2em}院： & \underline{\makebox[14em][c]{\@department}} \\

		专\hspace{2em}业： & \underline{\makebox[14em][c]{\@major}} \\

		班\hspace{2em}级： & \underline{\makebox[14em][c]{\@class}} \\

		学\hspace{2em}号： & \underline{\makebox[14em][c]{\@studentid}} \\

		学生姓名： & \underline{\makebox[14em][c]{\@myname}} \\

		指导老师： & \underline{\makebox[14em][c]{\@mysupervisor}} \\

		提交日期： & \underline{\makebox[14em][c]{}} \\
		\end{tabular}
		}
		\end{center}
		\newpage
	}
}


%中文摘要
\providecommand{\ZhAbstract}[2]{	
	\begin{table}[H]
		\centering
		%黑体，三号，居中
		\siyuanheitiBold\zihao{3}\parbox{0.75\linewidth}{\centering \@thesis} \\[4ex]
		%宋体，小四
		\songti\zihao{-4}\makebox[\linewidth][c]{学生姓名：\@myname\hspace{5em}指导教师：\@mysupervisor} \\[3ex]
		\songti\zihao{-4}\makebox[\linewidth][c]{浙江工业大学\@department} \\[4ex]
	\end{table}
	\AbstractENfalse\AbstractEN
	    \begin{abstract}
	    \vspace*{15pt}
	% 宋体，小四；行距沿用模板全局设置，摘要二字下面空一行
	    \zihao{-4}\songti
	    \setlength{\parindent}{2em}
	    #1

	    \vspace*{15pt}

	    \noindent{\siyuanheitiBold\zihao{-4}\bfseries 关键词：}{\songti\zihao{-4}#2}				
    \end{abstract}
    \phantomsection
    \addcontentsline{toc}{section}{中文摘要}
    \pagebreak
}


\providecommand\Enthesis[1]{\providecommand\@Enthesis{#1}}
\providecommand\Enmyname[1]{\providecommand\@Enmyname{#1}}
\providecommand\Enmysupervisor[1]{\providecommand\@Enmysupervisor{#1}}
\providecommand\Endepartment[1]{\providecommand\@Endepartment{#1}}

%英文摘要
\providecommand{\EnAbstract}[2]{
	\begin{table}[H]
		\centering
		%Times New Roman ，三号，居中
		 \vspace*{15pt}
        \begin{center}
	        {\zihao{3}
	        \parbox{\linewidth}{\centering \MakeUppercase{\@Enthesis}}
	        }
        \end{center}

         \vspace*{45pt}
		%Times New Roman ，小四
		\zihao{-4}\makebox[\linewidth][c]{Student：\@Enmyname\hspace{5em}Advisor：\@Enmysupervisor} \\[4ex]
		\zihao{-4}\parbox{\linewidth}{\centering \@Endepartment\\Zhejiang University of Technology} \\[4ex]
	\end{table}
    \AbstractENtrue\AbstractEN
    \begin{abstract}
	     \vspace*{30pt}
        % Times New Roman 小四；行距沿用模板全局设置；首行缩进2字符
	    \zihao{-4}
	    \setlength{\parindent}{2em}
	    #1

	     \vspace*{15pt}

	    \noindent{\zihao{-4}\bfseries KEY WORDS:}{\zihao{-4}#2}
    \end{abstract}
	\phantomsection
    \addcontentsline{toc}{section}{英文摘要}
    \pagebreak
}

% 正文格式：中文宋体小四号，英文 Times New Roman 小四号；
% 行距沿用 \LoadClass 中的 linespread=1.3541667；
% 首行缩进 2 字符，段前段后 0 磅
\AtBeginDocument{
	\songti\zihao{-4}\selectfont
	\setlength{\parindent}{2em}
	\setlength{\parskip}{0pt}
}

%目录、表列、图列
% 目录、表列、图列
\providecommand{\makeTOCandLOTandLOF}{%
    {%
        \clearpage
        \pagestyle{fancy}

        % 目录内容：宋体小四号，1.25倍行距
        \songti\zihao{-4}
        \renewcommand{\baselinestretch}{1.25}\selectfont
        \setlength{\parskip}{0pt}

        % 目录
        \phantomsection
        \addcontentsline{toc}{section}{目录}
        \tableofcontents

        % 表列
        \clearpage
        \phantomsection
        \addcontentsline{toc}{section}{表列}
        \listoftables

        % 图列
        \clearpage
        \phantomsection
        \addcontentsline{toc}{section}{图列}
        \listoffigures

        \clearpage
    }%
}

% 参考文献正文格式：宋体五号，英文 Times New Roman 五号，段前段后 0 磅
\AtBeginEnvironment{thebibliography}{
	\songti\zihao{5}\selectfont
	\setlength{\parskip}{0pt}
	\setlength{\itemsep}{0pt}
}

% 致谢
% 致谢
% 致谢
% 致谢
\providecommand{\makeAcknowledge}[1]{	
	\newpage
    \phantomsection
    \addcontentsline{toc}{section}{致谢}

	% 有页眉时，标题上方不再额外加空白
	\vspace*{0pt}

	% “致  谢”：黑体三号，中间空2字，居中
	\noindent\makebox[\linewidth][c]{%
		{\siyuanheitiBold\zihao{3}致\hspace{1em}谢}%
	}
	\par

	% 标题下面空2行
	\vspace{30pt}

	% 致谢正文：中文宋体小四号，英文 Times New Roman 小四号
	{
		\songti\zihao{-4}\selectfont
		\setlength{\parindent}{2em}
		\setlength{\parskip}{0pt}
		#1
	}
}

%附录
\providecommand{\makeAppendix}[1]{	
	\newpage
	\appendix		
	\songti\zihao{5} #1
}
