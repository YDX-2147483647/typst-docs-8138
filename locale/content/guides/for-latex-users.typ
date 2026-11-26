#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-table, example, info, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Guide for LaTeX Users",
    zh-status: "proofread",
    zh: "LaTeX用户指南",
  ),
  route: "/guides/for-latex-users",
  description: babel(
    en: "Are you a LaTeX user? This guide explains the differences and similarities between Typst and LaTeX so you can get started quickly.",
    zh-status: "need proofread",
    zh: "您是LaTeX用户吗？本指南解释了Typst和LaTeX之间的差异和相似之处，以便您可以快速入门。",
  ),
)

#babel(
  en: [
    This page is a good starting point if you have used LaTeX before and want to try out Typst. We will explore the main differences between these two systems from a user perspective. Although Typst is not built upon LaTeX and has a different syntax, you will learn how to use your LaTeX skills to get a head start.

    Just like LaTeX, Typst is a markup-based typesetting system: You compose your document in a text file and mark it up with commands and other syntax. Then, you use a compiler to typeset the source file into a PDF. However, Typst also differs from LaTeX in several aspects: For one, Typst uses more dedicated syntax (like you may know from Markdown) for common tasks. Typst's commands are also more principled: They all work the same, so unlike in LaTeX, you just need to understand a few general concepts instead of learning different conventions for each package. Moreover Typst compiles faster than LaTeX: Compilation usually takes milliseconds, not seconds, so the web app and the compiler can both provide instant previews.

    In the following, we will cover some of the most common questions a user switching from LaTeX will have when composing a document in Typst. If you prefer a step-by-step introduction to Typst, check out our @tutorial[tutorial].
  ],
  zh-status: "need proofread",
  zh: [
    如果你已经使用过LaTeX，并想要尝试Typst,这篇文章是个很好的入门指南。我们将从用户的角度出发，解释这两套系统之间主要的不同点。虽然Typst并不基于LaTeX，语法也完全不同，但通过这篇文章，你可以方便地将LaTeX的使用经验转化过来。

    跟LaTeX一样，Typst是一门「基于标记的排版系统」。首先在纯文本里编写文档，然后通过一系列命令和语法对其进行修饰，最后使用编译器将源文件排版并渲染成PDF文件。然而，Typst跟LaTeX之间也在以下几个方面存在区别：首先，在日常任务上，Typst使用更专用的语法(这一点可以类比Markdown)。Typst的命令也更加统一：在LaTeX中，你可能需要为不同软件包学习不同的语法和约定，但在Typst中，命令总是保持一致，所以你只需要理解一些基本的概念。此外Typst比LaTeX快得多：Typst文件的编译通常只需要几毫秒，而不是几秒，正因如此Typst的网页版和编译器可以实现实时增量渲染。

    在接下来的部分里，我们将回答从LaTeX切换到Typst时一些常见的问题。如果你更喜欢从头了解Typst，请阅读我们的@tutorial[教程]。
  ],
)

= #babel(en: [Installation], zh-status: "need proofread", zh: [安装]) <installation>
#babel(
  en: [
    You have two ways to use Typst: In #link("https://typst.app/signup/")[our web app] or by #link("https://github.com/typst/typst/releases")[installing the compiler] on your computer. When you use the web app, we provide a batteries-included collaborative editor and run Typst in your browser, no installation required.

    If you choose to use Typst on your computer instead, you can download the compiler as a single, small binary which any user can run, no root privileges required. Unlike popular LaTeX distributions such as TeX Live, packages are downloaded when you first use them and then cached locally, keeping your Typst installation lean. You can use your own editor and decide where to store your files with the local compiler.
  ],
  zh-status: "need proofread",
  zh: [
    你有两种方式使用Typst：在#link("https://typst.app/signup/")[我们的Web应用程序]中，或者在你的计算机上#link("https://github.com/typst/typst/releases")[安装编译器]。当你使用Web应用程序时，我们提供一个内置的协作编辑器，并在你的浏览器中运行Typst，无需安装。

    如果你选择在你的计算机上使用Typst，你可以将编译器作为一个单独的小二进制文件下载，任何用户都可以运行，无需root权限。与LaTeX不同，包在你第一次使用时下载，然后在本地缓存，保持你的Typst安装精简。你可以使用你自己的编辑器，并决定在本地编译器中存储文件的位置。
  ],
)

= #babel(
  en: short-or-long[Getting Started][How do I create a new, empty document?],
  zh-status: "need proofread",
  zh: [如何创建一个新的空文档？],
) <getting-started>
#babel(
  en: [
    That's easy. You just create a new, empty text file (the file extension is `.typ`). No boilerplate is needed to get started. Simply start by writing your text. It will be set on an empty A4-sized page. If you are using the web app, click "+ Empty document" to create a new project with a file and enter the editor. @parbreak[Paragraph breaks] work just as they do in LaTeX, just use a blank line.
  ],
  zh-status: "need update",
  zh: [
    很简单，你只需要创建一个空的文本文档（文件后缀是`.typ`），无需额外的模板，你就可以直接开始编写，默认使用A4纸张大小。如果您使用的是Web App，可以单击 "+ Empty document"，创建一个带有文件的新项目，然后进入编辑器。

    @parbreak[段落分隔符]和LaTeX相同，空一行即可：
  ],
)

```example
Hey there!

Here are two paragraphs. The
output is shown to the right.
```

#babel(
  en: [
    If you want to start from an preexisting LaTeX document instead, you can use #link("https://pandoc.org")[Pandoc] to convert your source code to Typst markup. This conversion is also built into our web app, so you can upload your `.tex` file to start your project in Typst.
  ],
  zh-status: "need proofread",
  zh: [
    如果你想直接从原有的LaTeX文档迁移过来，你可以使用#link("https://pandoc.org")[Pandoc]将其转换为Typst格式。这个转换的工具也集成进了Typst的Web App中，你可以直接上传你的LaTeX文件，然后在上面继续编写。
  ],
)

= #babel(
  en: short-or-long[Elements][How do I create section headings, emphasis, ...?],
  zh-status: "need proofread",
  zh: [我如何创建章节标题，强调，...？],
) <elements>
#babel(
  en: [
    LaTeX uses the command `\section` to create a section heading. Nested headings are indicated with `\subsection`, `\subsubsection`, etc. Depending on your document class, there is also `\part` or `\chapter`.

    In Typst, @heading[headings] are less verbose: You prefix the line with the heading on it with an equals sign and a space to get a first-order heading: `[= Introduction]`. If you need a second-order heading, you use two equals signs: `[== In this paper]`. You can nest headings as deeply as you'd like by adding more equals signs.

    Emphasis (usually rendered as italic text) is expressed by enclosing text in `[_underscores_]` and strong emphasis (usually rendered in boldface) by using `[*stars*]` instead.

    Here is a list of common markup commands used in LaTeX and their Typst equivalents. You can also check out the @reference:syntax[full syntax cheat sheet].
  ],
  zh-status: "need proofread",
  zh: [
    LaTeX使用`\section`命令创建章节标题。多级标题分别用`\subsection`、`\subsection`等表示。根据文档种类的不同，还有`\part`和`\chapter`。

    在Typst中，标题没那么啰嗦：在标题所在的行，前面加上等号和空格，就得到了一级标题：`[= Introduction]`。  如果你需要一个二级标题，使用两个等号：`[== In this paper]`。  在前面加上更多的等号，你可以嵌套任意层级的标题。

    #info[
      *译者注：*

      类比Markdown中`#`的作用，在接下来的阅读中你会不断看到这种「Markdown+LaTeX」杂糅的产物，结合这两者分别的痛点，可以更加深入了解Typst设计这些语法的原因。
    ]

    强调（通常以斜体字呈现）是通过用`[_underscores_]`来表达，而着重的强调（通常以黑体字呈现）是通过使用`[*Star*]`来表达。

    下面是LaTeX中使用的常见标记命令，以及Typst中对应的表示方式。你也可以查看@reference:syntax[完整的语法备忘单]。
  ],
)

#docs-table(
  table.header(
    babel(en: [Element], zh-status: "need proofread", zh: [元素]),
    [LaTeX],
    [Typst],
    [See],
  ),

  babel(en: [Strong emphasis], zh-status: "need proofread", zh: [着重强调]),
  [`\textbf{strong}`],
  [`[*strong*]`],
  [@strong],

  babel(en: [Emphasis], zh-status: "need proofread", zh: [强调]),
  [`\emph{emphasis}`],
  [`[_emphasis_]`],
  [@emph],

  babel(en: [Link], zh-status: "proofread", zh: [链接]),
  [`\url{https://typst.app}`],
  [`[https://typst.app/]`],
  [@link],

  babel(en: [Label], zh-status: "proofread", zh: [标签]),
  [`\label{intro}`],
  [`[<intro>]`],
  [@label],

  babel(en: [Reference], zh-status: "proofread", zh: [交叉引用]),
  [`\ref{intro}`],
  [`[@intro]`],
  [@ref],

  babel(en: [Citation], zh-status: "proofread", zh: [文献引用]),
  [`\cite{humphrey97}`],
  [`[@humphrey97]`],
  [@cite],

  babel(en: [Monospace (typewriter)], zh-status: "need proofread", zh: [等宽文字 / 代码]),
  [`\texttt{mono}`],
  [`text` or `mono` functions],
  [@text, @math.mono[`mono`]],

  [Code],
  babel(en: [`lstlisting` environment], zh-status: "need proofread", zh: [`lstlisting`环境]),
  [``` [`print(f"{x}")`]```],
  [@raw],

  [Verbatim],
  babel(en: [`verbatim` environment], zh-status: "need proofread", zh: [`verbatim`环境]),
  [``` [`#typst-code()`]```],
  [@raw],

  babel(en: [Bullet list], zh-status: "proofread", zh: [项目符号列表]),
  babel(en: [`itemize` environment], zh-status: "need proofread", zh: [`itemize`环境]),
  [`[- List]`],
  [@list],

  babel(en: [Numbered list], zh-status: "proofread", zh: [编号列表]),
  babel(en: [`enumerate` environment], zh-status: "need proofread", zh: [`enumerate`环境]),
  [`[+ List]`],
  [@enum],

  babel(en: [Term list], zh-status: "proofread", zh: [术语列表]),
  babel(en: [`description` environment], zh-status: "need proofread", zh: [`description`环境]),
  [`[/ Term: List]`],
  [@terms],

  babel(en: [Figure], zh-status: "need proofread", zh: [图表]),
  babel(en: [`figure` environment], zh-status: "need proofread", zh: [`figure`环境]),
  [`figure` function],
  [@figure],

  babel(en: [Table], zh-status: "proofread", zh: [表格]),
  babel(en: [`table` environment], zh-status: "need proofread", zh: [`table`环境]),
  [`table` function],
  [@table],

  babel(en: [Equation], zh-status: "proofread", zh: [公式]),
  babel(
    en: [`$x$`, `align` / `equation` environments],
    zh-status: "need proofread",
    zh: [`$x$`, `align`/`equation`环境],
  ),
  [`[$x$]`, `[$ x = y $]`],
  [@math.equation[`equation`]],
)

#babel(
  en: [
    @list[Lists] do not rely on environments in Typst. Instead, they have lightweight syntax like headings. To create an unordered list (`itemize`), prefix each line of an item with a hyphen:
  ],
  zh-status: "need proofread",
  zh: [
    在Typst中，使用@list[列表]并不需要创建「环境」，而采用一种更为轻量的语法。只需要在每行开头前，加入连字符`-`，就可以创建一个无序列表（`itemize`）：
  ],
)

````example
To write this list in Typst...

```latex
\begin{itemize}
  \item Fast
  \item Flexible
  \item Intuitive
\end{itemize}
```

...just type this:

- Fast
- Flexible
- Intuitive

````

#babel(
  en: [
    Nesting lists works just by using proper indentation. Adding a blank line in between items results in a more @list.tight[widely] spaced list.

    To get a @enum[numbered list] (`enumerate`) instead, use a `+` instead of the hyphen. For a @terms[term list] (`description`), write `[/ Term: Description]` instead.
  ],
  zh-status: "need proofread",
  zh: [
    通过正确的缩进，可以实现列表间嵌套。在每项间添加空行，可以得到一个行间距更大的列表。

    用`+`代替连字符`-`，可以得到@enum[有序列表]（`enumerate`）。用`[/Term: Description]`，可以得到@terms[术语列表]（`description`）。
  ],
)

Note that the @raw[`raw` function] and syntax (e.g. ``` [`raw`]```) only work for verbatim (unformatted) text. If you require formatting, you can use the @text[`text` function] with a monospace font instead, like in the example below:

```example
#text(
  font: "DejaVu Sans Mono",
  size: 0.8em,
)[monospace *bold*]
```

= #babel(
  en: short-or-long[Commands][How do I use a command?],
  zh-status: "need proofread",
  zh: [我如何使用一个命令？],
) <commands>
#babel(
  en: [
    LaTeX heavily relies on commands (prefixed by backslashes). It uses these _macros_ to affect the typesetting process and to insert and manipulate content. Some commands accept arguments, which are most frequently enclosed in curly braces: `\cite{rasmus}`.

    Typst differentiates between @reference:scripting:blocks[markup mode and code mode]. The default is markup mode, where you compose text and apply syntactic constructs such as `[*stars for bold text*]`. Code mode, on the other hand, parallels programming languages like Python, providing the option to input and execute segments of code.

    Within Typst's markup, you can switch to code mode for a single command (or rather, _expression_) using a hash (`#`). This is how you call functions to, for example, split your project into different @reference:scripting:modules[files] or render text based on some @reference:scripting:conditionals[condition]. Within code mode, it is possible to include normal markup @content[_content_] by using square brackets. Within code mode, this content is treated just as any other normal value for a variable.
  ],
  zh-status: "need proofread",
  zh: [
    LaTeX十分依赖以反斜杠`\`开头的命令，它需要通过这些_宏_来排版、插入或改变内容。有些命令接受参数，通常使用大括号括起来。`\cite{rasmus}`

    Typst区分两种模式：@reference:scripting:blocks[「标记模式」和「脚本模式」]。默认处在「标记模式」下。此模式中，你可以直接编排文本、使用不同的语法结构，如`*使用星号标记粗体文本*`。而「脚本模式」下，则提供一个类似Python的编程语言，提供了输入、执行代码的选项。

    在Typst的标记模式中，你可以使用井号（`#`）来使用单个命令（或者_表达式_）。例如，你可以通过这种方式来分割不同的@reference:scripting:modules[文件]，或者基于某些@reference:scripting:conditionals[条件]渲染文字。在「脚本模式」下，也可以通过方括号来包含正常的@content[内容块]，这些内容如同其他变量一样，被视作一种值。
  ],
)

```example
First, a rectangle:
#rect()

Let me show how to do
#underline([_underlined_ text])

We can also do some maths:
#calc.max(3, 2 * 4)

And finally a little loop:
#for x in range(3) [
  Hi #x.
]
```

#babel(
  en: [
    A function call always involves the name of the function (@rect, @underline, @calc.max, @array.range[`range`]) followed by parentheses (as opposed to LaTeX where the square brackets and curly braces are optional if the macro requires no arguments). The expected list of arguments passed within those parentheses depends on the concrete function and is specified in the @reference[reference].
  ],
  zh-status: "need proofread",
  zh: [
    #info[
      *译者注：*

      这段英文原文就表述的很不清晰，这里提供一点解释。

      标记模式，如同Markdown，不需要额外的内容，默认就处在这个标记模式下：可以直接使用`_text_`或者`*text*`来实现斜体/粗体（参考上文）。

      脚本模式，以`#`开头（类比LaTeX中以`\`开头来书写命令），仅仅存在于一个命令（表达式）中，当这个表达式结束之后，一切又回到标记模式中。在脚本模式中，无需额外使用`#`（命令/关键字会直接识别，不同于LaTeX），同时在命令中也可以使用标记模式（使用`[]`，比如例子给出的`[Hi #x]`）。

      此外：

      - 在标记模式中，可以引用脚本模式的函数、值，都通过`#`进行标记。
      - 在脚本模式中，函数返回值为`content`的会在当前位置渲染出来，如果没有显示指明返回值，则默认会将函数体内的所有内容块相加并返回。
      - 在脚本模式中，使用标记模式的内容（`Content`），也可以作为变量的值。
    ]

    不同于LaTeX，Typst中函数定义总是要求函数名（@rect, @underline, @calc.max, @array.range[`range`]）+ 括号的形式（而LaTeX中，没有参数的情况下，@[]和{}都是可以忽略的）。需要向函数传递的具体参数可以在@reference[参考]中找到。
  ],
)

== #babel(en: [Arguments], zh-status: "need proofread", zh: [参数]) <arguments>
#babel(
  en: [
    A function can have multiple arguments. Some arguments are positional, i.e., you just provide the value: The function `[#lower("SCREAM")]` returns its argument in all-lowercase. Many functions use named arguments instead of positional arguments to increase legibility. For example, the dimensions and stroke of a rectangle are defined with named arguments:
  ],
  zh-status: "need proofread",
  zh: [
    一个函数可以有多个参数，有些参数是位置参数，只需提供变量的值即可(不需要提供参数名称),例如：函数`[#lower("SCREAM")]`以全小写的方式返回其传入值。很多函数使用命名参数来提高可读性，例如创建一个指定大小和描边的正方形，可以使用如下命名参数：
  ],
)

```example
#rect(
  width: 2cm,
  height: 1cm,
  stroke: red,
)
```

#babel(
  en: [
    You specify a named argument by first entering its name (above, it's `width`, `height`, and `stroke`), then a colon, followed by the value (`2cm`, `1cm`, `red`). You can find the available named arguments in the @reference[reference page] for each function or in the autocomplete panel when typing. Named arguments are similar to how some LaTeX environments are configured, for example, you would type `\begin{enumerate}[label={\alph*)}]` to start a list with the labels `a)`, `b)`, and so on.

    Often, you want to provide some @content[content] to a function. For example, the LaTeX command `\underline{Alternative A}` would translate to `[#underline([Alternative A])]` in Typst. The square brackets indicate that a value is @content[content]. Within these brackets, you can use normal markup. However, that's a lot of parentheses for a pretty simple construct. This is why you can also move trailing content arguments after the parentheses (and omit the parentheses if they would end up empty).
  ],
  zh-status: "need proofread",
  zh: [
    指定一个命名参数时，首先输入参数名（上面的`width`、`height`和`stroke`），然后是冒号和对应的值（`2cm`、`1cm`、`red`）。你可以在「函数的参考页」或者「自动补全」中找到可用的命名参数。命名参数类似于一些LaTeX环境的配置方式，例如，你可以输入`\begin{enumerate}[label={alph*)}]`来启动一个带有标签`a)`、`b)`等的列表。

    多数情况，你会想要向函数传递一些@content[内容块]。例如，在LaTeX中的命令`\underline{Alternative A}`，在Typst中可以写成`#underline([Alternative A])`。方括号表示其中的值是一个@content[内容块]。在这些方括号中，你可以使用正常的标记语法。不过这样写的话，需要的括号还是太多了，因此你可以把「位于尾部的内容块」移到括号外（如果没有其他参数，可以忽略`()`）：
  ],
)

```example
Typst is an #underline[alternative]
to LaTeX.

#rect(fill: aqua)[Get started here!]
```

== #babel(en: [Data types], zh-status: "need proofread", zh: [数据类型]) <data-types>
#babel(
  en: [
    You likely already noticed that the arguments have distinctive data types. Typst supports many @type[data types]. Below, there is a table with some of the most important ones and how to write them. In order to specify values of any of these types, you have to be in code mode!
  ],
  zh-status: "need proofread",
  zh: [
    你可能已经注意到了，上文提到的这些参数有着不同的数据类型。Typst支持多种@type[数据类型]，下表是其中一些比较重要的类型和以及他们的声明办法。只有处在脚本模式中才能声明这些类型：
  ],
)

#docs-table(
  table.header(
    babel(en: [Data type], zh-status: "need proofread", zh: [数据类型]),
    babel(en: [Example], zh-status: "need proofread", zh: [示例]),
  ),

  babel(en: [@content[Content]], zh-status: "need proofread", zh: [@content[内容块 (content)]]),
  [`{[*fast* typesetting]}`],

  babel(en: [@str[String]], zh-status: "need proofread", zh: [@str[字符串 (str)]]),
  [`{"Pietro S. Author"}`],

  babel(en: [@int[Integer]], zh-status: "need proofread", zh: [@int[整型 (int)]]),
  [`{23}`],

  babel(en: [@float[Floating point number]], zh-status: "need proofread", zh: [@float[浮点数 (float)]]),
  [`{1.459}`],

  babel(en: [@length[Absolute length]], zh-status: "need proofread", zh: [@length[绝对长度 (absolute length)]]),
  [`{12pt}`, `{5in}`, `{0.3cm}`, ...],

  babel(en: [@ratio[Relative length]], zh-status: "need proofread", zh: [@ratio[相对长度 (relative length)]]),
  [`{65%}`],
)

#babel(
  en: [
    The difference between content and string is that content can contain markup, including function calls, while a string really is just a plain sequence of characters.

    Typst provides @reference:scripting:conditionals[control flow constructs] and @reference:scripting:operators[operators] such as `+` for adding things or `==` for checking equality between two variables.

    You can also store values, including functions, in your own @reference:scripting:bindings[variables]. This can be useful to perform computations on them, create reusable automations, or reference a value multiple times. The variable binding is accomplished with the let keyword, which works similar to `\newcommand`:
  ],
  zh-status: "need proofread",
  zh: [
    内容块和字符串的区别在于，内容可以包含标记，包括函数调用，而字符串实际上只是一个普通的字符序列。

    Typst提供了@reference:scripting:conditionals[条件分支、循环结构]，以及常用的@reference:scripting:operators[运算符]，例如`+`和`==`。

    你也可以在你定义的@reference:scripting:bindings[变量]中存储值（包括函数）。在计算、流程复用或者需要反复使用一个值的时候可能会用到。创建新变量的关键字是`let`，和LaTeX中`\newcommand`类似。
  ],
)

```example
// Store the integer `5`.
#let five = 5

// Define a function that
// increments a value.
#let inc(i) = i + 1

// Reference the variables.
I have #five fingers.

If I had one more, I'd have
#inc(five) fingers. Whoa!
```

== #babel(
  en: short-or-long[Rules][Commands to affect the remaining document],
  zh-status: "need proofread",
  zh: short-or-long[规则][影响后续内容的命令],
) <rules>
#babel(
  en: [
    In LaTeX, some commands like `\textbf{bold text}` receive an argument in curly braces and only affect that argument. Other commands such as `\bfseries bold text` act as switches (LaTeX calls this a declaration), altering the appearance of all subsequent content within the document or current scope.

    In Typst, the same function can be used both to affect the appearance for the remainder of the document, a block (or scope), or just its arguments. For example, `[#text(weight: "bold")[bold text]]` will only embolden its argument, while `[#set text(weight: "bold")]` will embolden any text until the end of the current block, or the end of the document, if there is none. The effects of a function are immediately obvious based on whether it is used in a call or a @reference:styling:set-rules[set rule.]
  ],
  zh-status: "need proofread",
  zh: [
    在LaTeX中，例如 `\textbf{bold text}` 的命令通过大括号传入参数，并且只影响括号内的内容。而有些命令，比如 `\bfseries bold text`「起到开关的作用」(在LaTeX中这被叫做声明)，在这行命令后的所有内容都会受这个命令的影响。

    在Typst中，一个函数既可以用来影响文档的剩余部分，也可以只影响传入的参数。举例来说，`[#text(weight: "bold")[bold text]]` 仅仅会加粗传入的参数，而 `#set text(weight: "bold")` 的影响会持续「到当前块结束」（或者，如果不在内容块中，影响文档的剩余部分）。根据使用方式的不同（直接调用/在@reference:styling:set-rules[setrule]）可以直观的表示函数的作用方式。
  ],
)

```example
I am starting out with small text.

#set text(14pt)

This is a bit #text(18pt)[larger,]
don't you think?
```

#babel(
  en: [
    Set rules may appear anywhere in the document. They can be thought of as default argument values of their respective function:
  ],
  zh-status: "need proofread",
  zh: [
    Set rules 可以出现在文档的任何部分。它们的作用方式可以类比向函数传递默认参数。
  ],
)

```example
#set enum(numbering: "I.")

Good results can only be obtained by
+ following best practices
+ being aware of current results
  of other researchers
+ checking the data for biases
```

#babel(
  en: [
    The `+` is syntactic sugar (think of it as an abbreviation) for a call to the @enum[`{enum}`] function, to which we apply a set rule above. @reference:syntax[Most syntax is linked to a function in this way.] If you need to style an element beyond what its arguments enable, you can completely redefine its appearance with a @reference:styling:show-rules[show rule] (somewhat comparable to `\renewcommand`).

    You can achieve the effects of LaTeX commands like `\textbf`, `\textsf`, `\rmfamily`, `\mdseries`, and `\itshape` with the @text.font[`font`], @text.style[`style`], and @text.weight[`weight`] arguments of the `text` function. The text function can be used in a set rule (declaration style) or with a content argument. To replace `\textsc`, you can use the @smallcaps function, which renders its content argument as smallcaps. Should you want to use it declaration style (like `\scshape`), you can use an @reference:styling:show-rules[_everything_ show rule] that applies the function to the rest of the scope:
  ],
  zh-status: "need proofread",
  zh: [
    `+`是调用 @enum[`{enum}`] 函数的语法糖（可以把它看作是一种简写），我们在上面应用了一个set rule。从这个意义上讲，@reference:syntax[大多数的特殊语法都是只是某一个函数的简写]。如果你需要重新定义一个组件的样式（仅修改传递参数无法实现），你可以通过@reference:styling:show-rules\完全重定义其样式（与LaTeX中`\renewcommand`相似，类似于定义了一个_宏_）.

    你可以通过@text.font[`font`]、@text.style[`style`]和@text.weight[`weight`]参数来实现LaTeX命令`\textbf`,`\textsf`,`\rmfamily`,`\mdseries`,和`\itshape`的效果。`text`函数可以在set规则（声明风格）中使用，也可以带有内容参数。为了替换`\textsc`，你可以使用`smallcaps`函数，它会将其内容参数渲染为小型大写字母。如果你想要使用它的声明风格（类似于`\scshape`），你可以使用一个@reference:styling:show-rules[_everything_ show规则]来将这个函数应用到作用域的其余部分：
  ],
)

```example
#show: smallcaps

Boisterous Accusations
```

= #babel(
  en: short-or-long[Templates][How do I load a document class?],
  zh-status: "need proofread",
  zh: [如何加载一个文档类 / 模板？],
) <templates>
#babel(
  en: [
    In LaTeX, you start your main `.tex` file with the `\documentclass{article}` command to define how your document is supposed to look. In that command, you may have replaced `article` with another value such as `report` and `amsart` to select a different look.

    When using Typst, you style your documents with @function[functions]. Typically, you use a template that provides a function that styles your whole document. First, you import the function from a template file. Then, you apply it to your whole document. This is accomplished with a @reference:styling:show-rules[show rule] that wraps the following document in a given function. The following example illustrates how it works:
  ],
  zh-status: "need proofread",
  zh: [
    在LaTeX中，`.tex`文件通常以`\documentclass{article}`开头，来定义文档的样式。在这个命令中，你也可以把`article`替换为`report`和`amsart`来更改文档的样式。

    在Typst中，你可以通过@function[函数]来修改文档的样式。通常情况下，你可以使用模板中提供的函数来修改整个文档。首先，你可以通过`#import`来导入模板函数。然后你使用这个函数来对文档使用样式。具体的做法是通过@reference:styling:show-rules\来将整个文档包装在这个函数中，具体如下：
  ],
)

#example(
  single: true,
  ```
  >>> #let conf(
  >>>   title: none,
  >>>   authors: (),
  >>>   abstract: [],
  >>>   doc,
  >>> ) = {
  >>>   set text(font: "Libertinus Serif", 11pt)
  >>>   set par(justify: true)
  >>>   set page(
  >>>     "us-letter",
  >>>     margin: auto,
  >>>     header: align(
  >>>       right + horizon,
  >>>       title
  >>>     ),
  >>>     numbering: "1",
  >>>     columns: 2
  >>>   )
  >>>
  >>>   show heading.where(
  >>>     level: 1
  >>>   ): it => block(
  >>>     align(center,
  >>>       text(
  >>>         13pt,
  >>>         weight: "regular",
  >>>         smallcaps(it.body),
  >>>       )
  >>>     ),
  >>>   )
  >>>   show heading.where(
  >>>     level: 2
  >>>   ): it => box(
  >>>     text(
  >>>       11pt,
  >>>       weight: "regular",
  >>>       style: "italic",
  >>>       it.body + [.],
  >>>     )
  >>>   )
  >>>
  >>>   place(top, float: true, scope: "parent", {
  >>>     set align(center)
  >>>     text(17pt, title)
  >>>
  >>>     let count = calc.min(authors.len(), 3)
  >>>     grid(
  >>>       columns: (1fr,) * count,
  >>>       row-gutter: 24pt,
  >>>       ..authors.map(author => [
  >>>         #author.name \
  >>>         #author.affiliation \
  >>>         #link("mailto:" + author.email)
  >>>       ]),
  >>>     )
  >>>
  >>>     par(justify: false)[
  >>>       *Abstract* \
  >>>       #abstract
  >>>     ]
  >>>   })
  >>>
  >>>   set align(left)
  >>>   doc
  >>> }
  <<< #import "conf.typ": conf
  #show: conf.with(
    title: [
      Towards Improved Modelling
    ],
    authors: (
      (
        name: "Theresa Tungsten",
        affiliation: "Artos Institute",
        email: "tung@artos.edu",
      ),
      (
        name: "Eugene Deklan",
        affiliation: "Honduras State",
        email: "e.deklan@hstate.hn",
      ),
    ),
    abstract: lorem(80),
  )

  Let's get started writing this
  article by putting insightful
  paragraphs right here!
  >>> #lorem(500)
  ```,
)

#babel(
  en: [
    The @reference:scripting:modules[`{import}`] statement makes @function[functions] (and other definitions) from another file available. In this example, it imports the `conf` function from the `conf.typ` file. This function formats a document as a conference article. We use a show rule to apply it to the document and also configure some metadata of the article. After applying the show rule, we can start writing our article right away!

    You can also use templates from Typst Universe (which is Typst's equivalent of CTAN) using an import statement like this: `[#import "@preview/elsearticle:0.2.1": elsearticle]`. Check the documentation of an individual template to learn the name of its template function. Templates and packages from Typst Universe are automatically downloaded when you first use them.

    In the web app, you can choose to create a project from a template on Typst Universe or even create your own using the template wizard. Locally, you can use the `typst init` CLI to create a new project from a template. Check out #link("https://typst.app/universe/search/?kind=templates")[the list of templates] published on Typst Universe. You can also take a look at the #link("https://github.com/qjcg/awesome-typst")[`awesome-typst` repository] to find community templates that aren't available through Universe.

    You can also @tutorial:making-a-template[create your own, custom templates.] They are shorter and more readable than the corresponding LaTeX `.sty` files by orders of magnitude, so give it a try!

    #info[
      Functions are Typst's "commands" and can transform their arguments to an output value, including document _content._ Functions are "pure", which means that they cannot have any effects beyond creating an output value / output content. This is in stark contrast to LaTeX macros that can have arbitrary effects on your document.

      To let a function style your whole document, the show rule processes everything that comes after it and calls the function specified after the colon with the result as an argument. The `.with` part is a _method_ that takes the `conf` function and pre-configures some of its arguments before passing it on to the show rule.
    ]
  ],
  zh-status: "need proofread",
  zh: [
    这里的@reference:scripting:modules[`import`]命令，导入了在其他文件中声明的函数，从而可以在当前文件中使用。在这个例子中，它从`conf.typ`中导入了`conf`函数。这个函数会将整个文章的样式整理成一个会议论文。我们通过show rule把这个样式应用到全局，同时也设置了文档的一些元数据。在应用show rule之后，我们就可以开始写文章了。

    #info[
      在Typst中，函数被称为"命令"，它们可以将其参数转化为输出值，包括文档_内容_。函数是"纯"的，这意味着它们除了创建一个输出值/输出内容外，不能产生任何副作用。这与LaTeX的宏形成了鲜明的对比，后者可以对你的文档产生任意的效果。

      为了使一个函数应用到整个文档，showrule会处理其后的所有内容，并将其结果作为参数传递给指定的函数。`.with`是一个_方法_，它接受`conf`函数，并在将其传递给show规则之前预先配置一些参数。

      *译者注：*

      `#show: conf.with(title: [标题])` 等价于Lambda表达式形式的 `#show: it => conf(title: [标题], it)`
    ]

    在Web App中，你可以选择一些预先定义好的模板，甚至可以通过模板向导创建自己的模板。在本地命令行中，你也可以使用`typst init`来从模板创建项目。查看发布在TypstUniverse上的#link("https://typst.app/universe/search?kind=templates")[模板列表], 这是官方的包管理库。你也可以访问#link("https://github.com/qjcg/awesome-typst")[Awesome Typst 仓库]来查看一些社区提供，尚没有以包发布的模板。

    你也可以@tutorial:making-a-template[创建你自己的自定义的模板]。它们比相应的LaTeX的`.sty`文件短得多，可读性也高得多，所以不妨一试！
  ],
)

= #babel(
  en: short-or-long[Packages][How do I load packages?],
  zh-status: "need proofread",
  zh: [如何导入包？],
) <packages>
#babel(
  en: [
    Typst is "batteries included," so the equivalent of many popular LaTeX packages is built right-in. Below, we compiled a table with frequently loaded packages and their corresponding Typst functions.
  ],
  zh-status: "need proofread",
  zh: [
    Typst就像那种自带电池的玩具，许多流行的LaTeX包的对应功能是直接内置到Typst里的。在下面我们列出一些LaTeX中常用的包，和他们对应的Typst命令：
  ],
)

#docs-table(
  table.header(
    babel(en: [LaTeX Package], zh-status: "need proofread", zh: [LaTeX包]),
    babel(en: [Typst Alternative], zh-status: "need proofread", zh: [Typst替代]),
  ),

  [graphicx, svg],
  babel(en: [@image function], zh-status: "need proofread", zh: [@image 函数]),

  [tabularx, tabularray],
  babel(en: [@table, @grid functions], zh-status: "need proofread", zh: [@table, @grid 函数]),

  [fontenc, inputenc, unicode-math],
  babel(en: [Just start writing!], zh-status: "need proofread", zh: [直接编写！]),

  [babel, polyglossia],
  babel(
    en: [@text.lang[`text`] function: `[#set text(lang: "zh")]`],
    zh-status: "need proofread",
    zh: [@text.lang[`text`]函数：`[#set text(lang: "zh")]`],
  ),

  [amsmath],
  babel(en: [@math[Math mode]], zh-status: "need proofread", zh: [@math[数学模式]]),

  [amsfonts, amssymb],
  babel(
    en: [@reference:symbols[`sym`] module and @reference:syntax:math[syntax]],
    zh-status: "need proofread",
    zh: [@reference:symbols[`sym`]模块和@reference:syntax:math[syntax]],
  ),

  [geometry, fancyhdr],
  babel(en: [@page function], zh-status: "need proofread", zh: [@page\函数]),

  [xcolor],
  babel(
    en: [@text.fill[`text`] function: `[#set text(fill: rgb("#0178A4"))]`],
    zh-status: "need proofread",
    zh: [@text.fill[`text`]函数：`[#set text(fill: rgb("#0178A4"))]`],
  ),

  [hyperref],
  babel(en: [@link function], zh-status: "need proofread", zh: [@link 函数]),

  [bibtex, biblatex, natbib],
  babel(en: [@cite, @bibliography functions], zh-status: "need proofread", zh: [@cite、@bibliography\函数]),

  [lstlisting, minted],
  babel(en: [@raw function and syntax], zh-status: "need proofread", zh: [@raw\函数和语法]),

  [parskip],
  babel(
    en: [@block.spacing[`block`] and @par.first-line-indent[`par`] functions],
    zh-status: "need proofread",
    zh: [@block.spacing[`block`]和@par.first-line-indent[`par`]函数],
  ),

  [csquotes],
  babel(
    en: [Set the @text.lang[`text`] language and type `["]` or `[']`],
    zh-status: "need proofread",
    zh: [设置@text.lang[`text`]语言，并输入`["]`or`[']`],
  ),

  [caption],
  babel(en: [@figure function], zh-status: "need proofread", zh: [@figure\函数]),

  [enumitem],
  babel(en: [@list, @enum, @terms functions], zh-status: "need proofread", zh: [@list、@enum、@terms\函数]),

  [nicefrac],
  [@math.frac.style[`frac.style`] property],
)

#babel(
  en: [
    Although _many_ things are built-in, not everything can be. That's why Typst has its own #link("https://typst.app/universe")[package ecosystem] where the community share its creations and automations. Let's take, for instance, the _CeTZ_ package: This package allows you to create complex drawings and plots. To use CeTZ in your document, you can just write:
  ],
  zh-status: "need proofread",
  zh: [
    尽管_很多_东西是内置的，但并非所有东西都可以内置。这也是Typst提供一个内置的@link("https://typst.app/universe/")[包管理器]的原因，社区成员可以在其中共享他们的工作和自动化工具。以_CeTZ_包为例，这个包允许你绘制复杂图形和函数图像。要在文档中使用CeTZ，你只需要编写：
  ],
)

```typ
#import "@preview/cetz:0.4.1"
```

#babel(
  en: [
    (The `@preview` is a _namespace_ that is used while the package manager is still in its early and experimental state. It will be replaced in the future.)

    Aside from the official package hub, you might also want to check out the #link("https://github.com/qjcg/awesome-typst")[awesome-typst repository], which compiles a curated list of resources created for Typst.

    If you need to load functions and variables from another file within your project, for example to use a template, you can use the same @reference:scripting:modules[`import`] statement with a file name rather than a package specification. To instead include the textual content of another file, you can use an @reference:scripting:modules[`include`] statement. It will retrieve the content of the specified file and put it in your document.
  ],
  zh-status: "need proofread",
  zh: [
    （`@preview`是一个_namespace_，在包管理器还处于早期和实验状态时使用，它将在将来被替换。）

    除了官方的软件包存储库，您可能还会想看 #link("https://github.com/qjcg/awesome-typst")[Awesome Typst 仓库]，其中集合了为 Typst 创建的资源精选列表。

    如果您需要从项目中的另一个文档加载函数和变量，例如使用模板，则可以使用相同的 @reference:scripting:modules[`{import}`] 语句，其中应该包含文档名，而不是特定的包。  要包含另一个文档的文本内容，您可以使用 @reference:scripting:modules[`{include}`] 语句。它将读取指定文档的内容，并将其直接置入文档中。

  ],
)

= #babel(en: short-or-long[Maths][How do I input maths?], zh-status: "need proofread", zh: [如何输入数学公式？]) <maths>
#babel(
  en: [
    To enter math mode in Typst, just enclose your equation in dollar signs. You can enter display mode by adding spaces or newlines between the equation's contents and its enclosing dollar signs.
  ],
  zh-status: "need proofread",
  zh: [
    在Typst中，把公式包含在`$`记号中即可，在两个`$$`中添加额外的空格/换行符可以创建块状公式。
  ],
)

```example
The sum of the numbers from
$1$ to $n$ is:

$ sum_(k=1)^n k = (n(n+1))/2 $
```

#babel(
  en: [
    @math[Math mode] works differently than regular markup or code mode. Numbers and single characters are displayed verbatim, while multiple consecutive (non-number) characters will be interpreted as Typst variables.

    Typst pre-defines a lot of useful variables in math mode. All Greek (`alpha`, `beta`, ...) and some Hebrew letters (`aleph`, `beth`, ...) are available through their name. Some symbols are additionally available through shorthands, such as `<=`, `>=`, and `->`.

    Refer to the @reference:symbols[symbol pages] for a full list of the symbols. If a symbol is missing, you can also access it through a @reference:syntax:escapes[Unicode escape sequence].

    Alternate and related forms of symbols can often be selected by @symbol[appending a modifier] after a period. For example, `arrow.l.squiggly` inserts a squiggly left-pointing arrow. If you want to insert multiletter text in your expression instead, enclose it in double quotes:
  ],
  zh-status: "need proofread",
  zh: [
    @math[数学模式]的工作方式与普通标记或代码模式不同。数字和单个字符被逐字显示，而多个连续（非数字）字符将被解释为Typst变量。

    Typst在数学模式下预先定义了很多有用的变量。所有希腊字母（`alpha`, `beta`, ...）和一些希伯来字母（`alef`, `bet`, ...）都可以通过它们的名字直接使用。一些符号还可以通过缩写轻松使用，如`<=`、`>=`和`->`。

    符号的完整列表请参考@symbol[符号页面]。如果缺少某些符号，你也可以通过@reference:syntax:escapes[Unicode转义序列]访问它。

    符号的变体通常可以通过在句点后附加一个@symbol[`.`点修饰符]来选择。例如，`arrow.l.squiggly`插入了一个向左倾斜的箭头。如果你想在你的表达式中插入多字母纯文本，可以用双引号将其括起来：
  ],
)

```example
$ delta "if" x <= 5 $
```

#babel(
  en: [
    In Typst, delimiters will scale automatically for their expressions, just as if `\left` and `\right` commands were implicitly inserted in LaTeX. You can customize delimiter behaviour using the @math.lr[`lr` function]. To prevent a pair of delimiters from scaling, you can escape them with backslashes.

    Typst will automatically set terms around a slash `/` as a fraction while honoring operator precedence. All round parentheses not made redundant by the fraction will appear in the output. Fractions are typeset vertically unless customized with @math.frac.style[`frac.style`]. You can also produce a slash as is by escaping it with a backslash (`\/`).
  ],
  zh-status: "need proofread",
  zh: [
    在 Typst 中，定界符将根据内部表达式自动缩放大小，就像在 LaTeX 中自动添加了隐藏的 `\left` 和 `\right` 命令一样。  你可以使用 @math.lr[`lr`] 函数自定义定界符的行为。如果你不需要对定界符进行缩放，你可以用反斜杠转义定界符。

    在不破坏运算优先级的前提下，Typst 会自动将斜线`/`的两端内容识别成分数。所有没必要的括号将不会出现在编译结果中：
  ],
)

```example
$ f(x) = (x + 1) / x $
```

#babel(
  en: [
    @math.attach[Sub- and superscripts] work similarly in Typst and LaTeX. `{$x^2$}` will produce a superscript, `{$x_2$}` yields a subscript. If you want to include more than one value in a sub- or superscript, enclose their contents in parentheses: `{$x_(a -> epsilon)$}`.

    Since variables in math mode do not need to be prepended with a `#` (or a `\` like in LaTeX), you can also call functions without these special characters:
  ],
  zh-status: "need proofread",
  zh: [
    @math.attach[下标和上标] 在 Typst 和 LaTeX 中的作用是相似的。`{$x^2$}` 将产生一个上标，`{$x_2$}` 产生一个下标。  如果你想在下标或上标中包含一个以上的值，请把它们的内容放在括号里：`$x_(a -> epsilon)$`。

    由于数学模式下的变量不需要在前面加上 `#` 或 `/` ，所以你也可以无需额外的井号字符来调用函数：
  ],
)

```example
$ f(x, y) := cases(
  1 "if" (x dot y)/2 <= 0,
  2 "if" x "is even",
  3 "if" x in NN,
  4 "else",
) $
```

#babel(
  en: [
    The above example uses the @math.cases[`cases` function] to describe f. Within the cases function, arguments are delimited using commas and the arguments are also interpreted as math. If you need to interpret arguments as Typst values instead, prefix them with a `#`:
  ],
  zh-status: "need proofread",
  zh: [
    上面的例子用@math.cases[`cases`]函数来表述`f`。在`cases`函数中，参数用逗号来分隔，参数也被解释为数学模式下的内容。如果你需要传递Typst变量，可以用`#`号作为前缀使用：
  ],
)

```example
$ (a + b)^2
  = a^2
  + text(fill: #maroon, 2 a b)
  + b^2 $
```

#babel(
  en: [
    You can use all Typst functions within math mode and insert any content. If you want them to work normally, with code mode in the argument list, you can prefix their call with a `#`. Nobody can stop you from using rectangles or emoji as your variables anymore:
  ],
  zh-status: "need proofread",
  zh: [
    在数学模式下，你可以使用任意的Typst函数或者任何内容，如果你希望他们正常工作，只需要使用`#`前缀，没人可以阻止你把长方体或者emoji表情作为参数传入：
  ],
)

```example
$ sum^10_(🤓=1)
  #rect(width: 4mm, height: 2mm)/🤓
  = 🧠 maltese $
```

#babel(
  en: [
    If you'd like to enter your mathematical symbols directly as Unicode, that is possible, too!

    Math calls can have two-dimensional argument lists using `;` as a delimiter. The most common use for this is the @math.mat[`mat` function] that creates matrices:
  ],
  zh-status: "need proofread",
  zh: [
    如果你希望直接以Unicode形式输入数学符号，也是可以的。

    数学调用可以有二维参数列表，使用`;`作为分隔符。这方面最常见的用途是使用@math.mat[`mat`]函数创建矩阵：
  ],
)

```example
$ mat(
  1, 2, ..., 10;
  2, 2, ..., 10;
  dots.v, dots.v, dots.down, dots.v;
  10, 10, ..., 10;
) $
```

= #babel(
  en: short-or-long[Latex Look][How do I get the "LaTeX look?"],
  zh-status: "need proofread",
  zh: [如何获得 "LaTeX 外观"？],
) <latex-look>
#babel(
  en: [
    Papers set in LaTeX have an unmistakeable look. This is mostly due to their font, Computer Modern, justification, narrow line spacing, and wide margins.

    The example below
    - sets wide @page.margin[margins]
    - enables @par.justify[justification], @par.leading[tighter lines] and @par.first-line-indent[first-line-indent]
    - @text.font[sets the font] to "New Computer Modern", an OpenType derivative of Computer Modern for both text and @raw[code blocks]
    - decreases the @text.weight[font weight] in math mode
    - disables paragraph @block.spacing[spacing]
    - increases @block.spacing[spacing] around @heading[headings]
  ],
  zh-status: "need proofread",
  zh: [
    用LaTeX编写的论文有一种美观且易于识别的外观。这主要是由于它们的字体#link("https://zh.wikipedia.org/wiki/Computer_Modern")[Computer Modern]、对齐方式、窄行距和宽边距。

    下面是一个示例：

    - 设置宽@page.margin[边距]
    - 启用@par.justify[两端对齐],@par.leading[更紧密的行间距]和@par.first-line-indent[首行缩进]
    - 设置@text.font[字体]为"New Computer Modern"，这是一个适用于文本和@raw[代码块]的OpenType变体
    - 禁用段落@block.spacing[间距]
    - 增加@heading[标题]周围的@block.spacing[间距]
  ],
)

```typ
#set page(margin: 1.75in)
#set par(leading: 0.55em, spacing: 0.55em, first-line-indent: 1.8em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show math.equation: set text(weight: "regular")
#show heading: set block(above: 1.4em, below: 1em)
```

#babel(
  en: [
    This should be a good starting point! If you want to go further, why not create a reusable template?
  ],
  zh-status: "need proofread",
  zh: [
    这应该是一个很好的起点！如果你想更进一步，为什么不创建一个可重复使用的模板呢？
  ],
)

= #babel(en: [Bibliographies], zh-status: "need proofread", zh: [参考文献]) <bibliographies>
#babel(
  en: [
    Typst includes a fully-featured bibliography system that is compatible with BibTeX files. You can continue to use your `.bib` literature libraries by loading them with the @bibliography function. Another possibility is to use #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Typst's YAML-based native format].

    Typst uses the Citation Style Language to define and process citation and bibliography styles. You can compare CSL files to BibLaTeX's `.bbx` files. The compiler already includes @bibliography.style[over 80 citation styles], but you can use any CSL-compliant style from the #link("https://github.com/citation-style-language/styles")[CSL repository] or write your own.

    You can cite an entry in your bibliography or reference a label in your document with the same syntax: `[@key]` (this would reference an entry called `key`). Alternatively, you can use the @cite function.

    Alternative forms for your citation, such as year only and citations for natural use in prose (cf. `\citet` and `\textcite`) are available with @cite.form[`[#cite(<key>, form: "prose")]`].

    You can find more information on the documentation page of the @bibliography function.
  ],
  zh-status: "need proofread",
  zh: [
    Typst 的参考文献系统与 BibTeX 文件兼容。你可以通过 @bibliography 函数加载你的 `.bib` 文献库。  也可以使用 #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Typst 原生基于 YAML 的格式].

    Typst 使用引文样式语言（Citation Style Language）来定义和处理引文和参考文献样式。你可以将 CSL 文件与 BibLaTeX 的 `.bbx` 文件进行类比。  编译器已经包含了 @bibliography.style[80 多种引文样式]，但你可以使用 #link("https://github.com/citation-style-language/styles")[CSL 仓库] 中的任何符合 CSL 标准的样式，或者编写自己的样式。

    你可以通过相同的语法 `[@key]` 来引用参考文献中的条目或者引用文档中的标签（这将引用一个名为 `key` 的条目）。  或者，你可以使用 @cite 函数。

    你可以使用 @cite.form[`[#cite(<key>, form: "prose")]`] 来引用你的引文的其他形式，比如仅年份或者用于自然语言的引文（类似于 `\citet` 和 `\textcite`）。

    你可以在 @bibliography 函数的文档页面上找到更多信息。
  ],
)

= #babel(
  en: short-or-long[Limitations][What limitations does Typst currently have compared to LaTeX?],
  zh-status: "need proofread",
  zh: [与LaTeX相比，Typst目前有哪些不足？],
) <limitations>
#babel(
  en: [
    Although Typst can be a LaTeX replacement for many today, there are still features that Typst does not (yet) support. Here is a list of them which, where applicable, contains possible workarounds.

    - *Well-established plotting ecosystem.* LaTeX users often create elaborate charts along with their documents in PGF/TikZ. The Typst ecosystem does not yet offer the same breadth of available options, but the ecosystem around the #link("https://typst.app/universe/package/cetz")[`cetz` package] is catching up quickly.

    - *Change page margins without a pagebreak.* In LaTeX, margins can always be adjusted, even without a pagebreak. To change margins in Typst, you use the @page[`page` function] which will force a page break. If you just want a few paragraphs to stretch into the margins, then reverting to the old margins, you can use the @pad[`pad` function] with negative padding.
  ],
  zh-status: "need update",
  zh: [
    对于大多数人，Typst现在已经是一个很好的LaTeX替代品。然而，如果你是一个重度LaTeX用户，你可能会发现Typst还缺少一些功能：

    - *原生图表和绘图。*LaTeX用户通常会在PGF/TikZ中创建图表。Typst目前还没有包含绘图工具，但社区正在提供解决方案，比如#link("https://github.com/johannes-wolf/typst-canva")[`cetz`]。你可以将这些添加到你的文档中绘制图表。

    - *更改页面边距而不换页。*在LaTeX中，你可以在不换页的前提下，调整页边距。你可以使用@page[`page`函数]，但这将强制换页。如果你只是需要调整几个段落的边距，你可以使用@pad[`pad`函数]来进行负填充。
  ],
)
