#import "/i18n-scope.typ": babel, note
#import "/components/index.typ": docs-chapter, docs-figure, info, kbd, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Writing in Typst",
    zh-status: "proofread",
    zh: "使用Typst写作",
  ),
  route: "/tutorial/writing-in-typst",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
)

#babel(
  en: [
    Let's get started! Suppose you got assigned to write a technical report for university. It will contain prose, maths, headings, and figures. To get started, you create a new project on the Typst app. You'll be taken to the editor where you see two panels: A source panel where you compose your document and a preview panel where you see the rendered document.
  ],
  zh-status: "proofread",
  zh: [
    让我们开始吧！假设您要为大学写一份技术报告，包含正文、数学公式、标题和图表。如果您选择使用Typst在线应用，那么请创建一个新项目。创建后会转到编辑器，您会看到两个面板：左边是撰写文档用的编辑面板，右边是查看渲染所得文档的预览面板。

    #note[
      【译注】如果您选择本地使用，那么请参考中文社区导航站「#link("https://typst-doc-cn.github.io/guide/quick-start.html#本地使用")[快速开始]」，安装VS Code和Tinymist Typst插件，创建后缀为`.typ`的文件，再单击右上角预览按钮。VS Code整体界面与Typst在线应用类似。
    ]
  ],
)

#docs-figure(
  "1-writing-app.png",
  alt: "Typst app screenshot",
  shadow: false,
)

#babel(
  en: [
    You already have a good angle for your report in mind. So let's start by writing the introduction. Enter some text in the editor panel. You'll notice that the text immediately appears on the previewed page.
  ],
  zh-status: "proofread",
  zh: [
    您在心中已对报告有了不错想法，那么从报告的引言写起吧。在编辑面板中输入一些文本，您会发现它们立即显示到预览的页面上。

    #note[
      【译注】建议您本章先尝试英文。Typst支持中文，但需要设置字体，而设置方法到下一章才会讲到；设置字体后，本章的内容也适用于中文。
    ]
  ],
)

```example
In this report, we will explore the
various factors that influence fluid
dynamics in glaciers and how they
contribute to the formation and
behaviour of these natural structures.
```

#babel(
  en: [
    _Throughout this tutorial, we'll show code examples like this one. Just like in the app, the first panel contains markup and the second panel shows a preview. We shrunk the page to fit the examples so you can see what's going on._
  ],
  zh-status: "proofread",
  zh: [
    _在本教程中，我们将展示像上面这样的代码示例。和应用中一样，第一个面板包含标记文本，第二个面板展示文档预览。页面会被缩小到示例的大小，以便您看得更清楚。_
  ],
)

#babel(
  en: [
    The next step is to add a heading and emphasize some text. Typst uses simple markup for the most common formatting tasks. To add a heading, enter the `=` character and to emphasize some text with italics, enclose it in `[_underscores_]`.
  ],
  zh-status: "proofread",
  zh: [
    下一步是添加章节标题并强调某些文本。Typst使用简单标记设置最常见的格式。要添加章节标题，请输入`=`字符；要用斜体强调，请在文本两侧添加`[_下划线_]`。

    #note[
      【译注】中文基本没有斜体的习惯，一般用`[*星号*]`加粗强调。您也可参考中文社区导航站把`[_下划线_]`的效果#link("https://typst-doc-cn.github.io/guide/FAQ/chinese-skew.html")[改成切换字体或添加下划线]，不过相关知识等到@tutorial:advanced-styling:title-and-abstract[教程第三章]才会讲到。
    ]
  ],
)

```example
= Introduction
In this report, we will explore the
various factors that influence _fluid
dynamics_ in glaciers and how they
contribute to the formation and
behaviour of these natural structures.
```

#babel(
  en: [
    That was easy! To add a new paragraph, just add a blank line in between two lines of text. If that paragraph needs a subheading, produce it by typing `==` instead of `=`. The number of `=` characters determines the nesting level of the heading.

    Now we want to list a few of the circumstances that influence glacier dynamics. To do that, we use a numbered list. For each item of the list, we type a `+` character at the beginning of the line. Typst will automatically number the items.
  ],
  zh-status: "proofread",
  zh: [
    这很简单！要添加新段落，只需在两行文本间加一个空行。如果该段落需要子标题，请输入`==`而非`=`。`=`#sym.wj;字符的数量代表标题的嵌套级别。

    现在我们想列出一些影响冰川动力学的因素。为此，我们使用编号列表。我们在列表每项的行首输入`+`字符，让Typst对项目自动编号。
  ],
)

```example
+ The climate
+ The topography
+ The geology
```

#babel(
  en: [
    If we wanted to add a bulleted list, we would use the `-` character instead of the `+` character. We can also nest lists: For example, we can add a sub-list to the first item of the list above by indenting it.
  ],
  zh-status: "proofread",
  zh: [
    如果我们想添加不编号的项目符号列表，就把`+`字符改成`-`字符。我们还可以嵌套列表：例如，要往编号列表的第一项添加一个不编号的子列表，可以把项目符号列表整体缩进，放进外层列表第一项中。
  ],
)

```example
+ The climate
  - Temperature
  - Precipitation
+ The topography
+ The geology
```

= #babel(en: short-or-long[Figure][Adding a figure], zh-status: "proofread", zh: [插入图片]) <figure>
#babel(
  en: [
    You think that your report would benefit from a figure. Let's add one. Typst supports images in the formats PNG, JPEG, GIF, SVG, PDF, and WebP. To add an image file to your project, first open the _file panel_ by clicking the box icon in the left sidebar. Here, you can see a list of all files in your project. Currently, there is only one: The main Typst file you are writing in. To upload another file, click the button with the arrow in the top-right corner. This opens the upload dialog, in which you can pick files to upload from your computer. Select an image file for your report.
  ],
  zh-status: "proofread",
  zh: [
    您认为报告配上图片会更好，那我们就来插入一张。Typst支持PNG、JPEG、GIF、SVG、PDF和WebP格式的图片。要将图片文件添加到项目中，请先单击左边栏的箱子图标以打开_文件面板_。这里列出了项目中的所有文件。目前只有一个文件：您正在编辑的Typst主文件。要上传另一个文件，请单击右上角带有箭头的按钮。这会打开上传对话框，您可以在其中选择要从计算机上传的文件。请为您的报告选择一个图片文件。
  ],
)

#docs-figure(
  "1-writing-upload.png",
  alt: "Upload dialog",
  shadow: false,
)

#babel(
  en: [
    We have seen before that specific symbols (called _markup_) have specific meaning in Typst. We can use `=`, `-`, `+`, and `_` to create headings, lists and emphasized text, respectively. However, having a special symbol for everything we want to insert into our document would soon become cryptic and unwieldy. For this reason, Typst reserves markup symbols only for the most common things. Everything else is inserted with _functions._ For our image to show up on the page, we use Typst's @image function.
  ],
  zh-status: "proofread",
  zh: [
    我们之前已经看到，特定的符号（称作_标记_）在Typst中具有特定的含义。我们分别可以使用`=`、`-`、`+`和`_`来创建标题、两种列表和强调文本。然而，假如为每种要插入文档的内容都设置一种特殊符号，那么语法很快就会怪异且笨拙。为此，Typst只给最常见的内容设计标记符号，而其它所有内容都用_函数_插入。为在页面上显示图片，我们使用Typst的@image\函数。
  ],
)

```example
#image("glacier.jpg")
```

#babel(
  en: [
    In general, a function produces some output for a set of _arguments_. When you _call_ a function within markup, you provide the arguments and Typst inserts the result (the function's _return value_) into the document. In our case, the `image` function takes one argument: The path to the image file. To call a function in markup, we first need to type the `#` character, immediately followed by the name of the function. Then, we enclose the arguments in parentheses. Typst recognizes many different data types within argument lists. Our file path is a short @str[string of text], so we need to enclose it in double quotes.

    The inserted image uses the whole width of the page. To change that, pass the `width` argument to the `image` function. This is a _named_ argument and therefore specified as a `name: value` pair. If there are multiple arguments, they are separated by commas, so we first need to put a comma behind the path.
  ],
  zh-status: "proofread",
  zh: [
    一般来说，函数接收一组_参数_，生成一些输出。在标记模式中_调用_函数时，您将参数传给Typst，而Typst将结果（函数的_返回值_）插到文档中。对于此例，`image`函数接收一个参数：图片文件的路径。要在标记模式中调用函数，请先键入`#`字符，再紧跟函数名称，然后在圆括号中写上参数。Typst会识别参数列表中的多种数据类型，而这里的文件路径是一个较短的@str[文本字符串]，所以要用双引号括起来。

    所插图片默认占满页面宽度。要更改宽度，需给`image`函数传入`width`参数。这是一个_命名_参数，需像`name: value`这样带名称传入。如有多个参数，需用逗号分隔，所以我们要先在路径后面加个逗号。
  ],
)

```example
#image("glacier.jpg", width: 70%)
```

#babel(
  en: [
    The `width` argument is a @relative[relative length]. In our case, we specified a percentage, determining that the image shall take up `{70%}` of the page's width. We also could have specified an absolute value like `{1cm}` or `{0.7in}`.

    Just like text, the image is now aligned at the left side of the page by default. It's also lacking a caption. Let's fix that by using the @figure[figure] function. This function takes the figure's contents as a positional argument and an optional caption as a named argument.

    Within the argument list of the `figure` function, Typst is already in code mode. This means, you now have to remove the hash before the image function call. The hash is only needed directly in markup (to disambiguate text from function calls).

    The caption consists of arbitrary markup. To give markup to a function, we enclose it in square brackets. This construct is called a _content block._
  ],
  zh-status: "proofread",
  zh: [
    `width`参数接收@relative[相对长度]。在此例中，我们填了一个百分比，表示图片应占页面宽度的`{70%}`。我们也可以填绝对值，如`{1cm}`或`{0.7in}`。

    和文本一样，图片默认对齐到页面左边缘；而且这张图还缺少题注。让我们用@figure[figure]函数解决这两个问题。该函数将图表的内容作为位置参数，将可选的题注作为命名参数`caption`。

    在`figure`函数的参数列表里，Typst处于脚本模式，这意味着`image`函数调用前面的井号应当删除——只有标记模式才用得到井号（用于区分普通文本和函数调用）。

    题注的内容是任意标记文本。为了给函数传入标记文本，我们将内容括在方括号中。这种结构称作_内容块_。
  ],
)

```example
#figure(
  image("glacier.jpg", width: 70%),
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
)
```

#babel(
  en: [
    You continue to write your report and now want to reference the figure. To do that, first attach a label to figure. A label uniquely identifies an element in your document. Add one after the figure by enclosing some name in angle brackets. You can then reference the figure in your text by writing an `[@]` symbol followed by that name. Headings and equations can also be labelled to make them referenceable.
  ],
  zh-status: "proofread",
  zh: [
    您继续编写报告，现在想要交叉引用该图表。为此，首先给图表贴上标签。标签用于唯一标识文档中的元素。其添加方法是将标签名称括在尖括号中，放在图表之后。添加标签后，您在正文中键入`[@]`符号，紧跟标签名称，就能引用相应图表了。章节标题和数学公式也可贴标签，以便被引用。
  ],
)

```example
Glaciers as the one shown in
@glaciers will cease to exist if
we don't take action soon!

#figure(
  image("glacier.jpg", width: 70%),
  caption: [
    _Glaciers_ form an important part
    of the earth's climate system.
  ],
) <glaciers>
```

#info[
  #babel(
    en: [
      So far, we've passed content blocks (markup in square brackets) and strings (text in double quotes) to our functions. Both seem to contain text. What's the difference?

      A content block can contain text, but also any other kind of markup, function calls, and more, whereas a string is really just a _sequence of characters_ and nothing else.

      For example, the image function expects a path to an image file. It would not make sense to pass, e.g., a paragraph of text or another image as the image's path parameter. That's why only strings are allowed here. In contrast, strings work wherever content is expected because text is a valid kind of content.
    ],
    zh-status: "proofread",
    zh: [
      目前我们已向函数传入了内容块（方括号中的标记文本）和字符串（双引号中的文本）。二者似乎都包含文本，有什么区别呢？

      内容块可以包含文本，也可以包含任何其它标记、函数调用等；而字符串切切实实只是_字符构成的串_，无法包含其它内容。

      例如，`image`函数需要图片文件的路径，而往路径参数传入一段文本或另一张图片并没有意义，所以此处只能填入字符串。相比之下，任何需要内容块的地方都能填入字符串，因为文本也是合法的内容块。
    ],
  )
]

= #babel(
  en: short-or-long[Bibliography][Adding a bibliography],
  zh-status: "proofread",
  zh: [添加文献],
) <bibliography>
#babel(
  en: [
    As you write up your report, you need to back up some of your claims. You can add a bibliography to your document with the @bibliography function. This function expects a path to a bibliography file.

    Typst's native bibliography format is #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[Hayagriva], but for compatibility you can also use BibLaTeX files. As your classmate has already done a literature survey and sent you a `.bib` file, you'll use that one. Upload the file through the file panel to access it in Typst.

    Once the document contains a bibliography, you can start citing from it. Citations use the same syntax as references to a label. As soon as you cite a source for the first time, it will appear in the bibliography section of your document. Typst supports different citation and bibliography styles. Consult the @bibliography.style[reference] for more details.
  ],
  zh-status: "proofread",
  zh: [
    撰写报告时，您需要引用文献来论证。您可以使用@bibliography\函数向文档添加文献数据。此函数需要文献数据文件的路径。

    Typst原生的文献数据格式是#link("https://typst-community.github.io/extra-docs/hayagriva/file-format.html")[Hayagriva]，不过考虑到兼容性，也支持BibLaTeX文件。由于您的同学已经调研过文献并向您发送了`.bib`文件，您就直接用它了。请在文件面板中上传该文件，以在Typst应用中访问它。

    #note[
      【译注】此处所用`works.bib`可#link("https://github.com/typst/typst-dev-assets/blob/main/files/bib/works.bib")[从GitHub下载]，尽管这个文件并不重要。
    ]

    向文档添加文献数据后，您就可以从中引用了。引用文献的语法与引用标签相同。首次引用某文献后，该文献就会出现在您文档的文献列表中。Typst支持各种引用和文献列表样式，详情请查阅@bibliography.style[参考手册]。
  ],
)

```example
= Methods
We follow the glacier melting models
established in @glacier-melt.

#bibliography("works.bib")
```

= #babel(en: [Maths], zh-status: "proofread", zh: [数学公式]) <maths>
#babel(
  en: [
    After fleshing out the methods section, you move on to the meat of the document: Your equations. Typst has built-in mathematical typesetting and uses its own math notation. Let's start with a simple equation. We wrap it in `[$]` signs to let Typst know it should expect a mathematical expression:
  ],
  zh-status: "proofread",
  zh: [
    充实完Methods一章后，您继续完成这篇文档的核心内容：数学公式。Typst内置了数学排版引擎，并使用自己的数学记号。让我们从一个简单的等式开始。数学公式用`[$]`符号括住，以让Typst知道正在处理数学公式：
  ],
)

```example
The equation $Q = rho A v + C$
defines the glacial flow rate.
```

#babel(
  en: [
    The equation is typeset inline, on the same line as the surrounding text. If you want to have it on its own line instead, you should insert a single space at its start and end:
  ],
  zh-status: "proofread",
  zh: [
    该公式在行内排版，与周围文本共占一行。如果想让它独占整行，请在开头和结尾插入空格：
  ],
)

```example
The flow rate of a glacier is
defined by the following equation:

$ Q = rho A v + C $
```

#babel(
  en: [
    We can see that Typst displayed the single letters `Q`, `A`, `v`, and `C` as-is, while it translated `rho` into a Greek letter. Math mode will always show single letters verbatim. Multiple letters, however, are interpreted as symbols, variables, or function names. To imply a multiplication between single letters, put spaces between them.

    If you want to have a variable that consists of multiple letters, you can enclose it in quotes:
  ],
  zh-status: "proofread",
  zh: [
    我们可以看到，`Q`、`A`、`v`、`C`等单个字母会原样显示，而`rho`会转换成希腊字母。在数学模式中，单个字母始终原样显示，而一串多个字母会被视作符号、变量或函数名称。要隐式表达这是单个字母之间的乘法，请在字母间加入空格。

    如果想要一个变量包含多个字母，请用引号括起来：
  ],
)

```example
The flow rate of a glacier is given
by the following equation:

$ Q = rho A v + "time offset" $
```

#babel(
  en: [
    You'll also need a sum formula in your paper. We can use the `sum` symbol and then specify the range of the summation in sub- and superscripts:
  ],
  zh-status: "proofread",
  zh: [
    您的报告还需要一个求和公式。我们可以使用`sum`符号，并在上下标中标注求和范围：
  ],
)

```example
Total displaced soil by glacial flow:

$ 7.32 beta +
  sum_(i=0)^nabla Q_i / 2 $
```

#babel(
  en: [
    To add a subscript to a symbol or variable, type a `_` character and then the subscript. Similarly, use the `^` character for a superscript. If your sub- or superscript consists of multiple things, you must enclose them in round parentheses.

    The above example also showed us how to insert fractions: Simply put a `/` character between the numerator and the denominator and Typst will automatically turn it into a fraction. Parentheses are smartly resolved, so you can enter your expression as you would into a calculator and Typst will replace parenthesized sub-expressions with the appropriate notation.
  ],
  zh-status: "proofread",
  zh: [
    要给符号或变量添加下标，请输入`_`字符，然后输入下标。类似地，上标请用`^`字符。若上下标由多部分组成，则必须将它们括在圆括号中。

    上例还展示了如何插入分数：只需在分子分母间放置`/`字符，Typst就会自动将其转为分数。括号会被智能解析，因此您可像使用计算器那样输入数学公式，而Typst会把括号中的子式替换成合适记号。
  ],
)

```example
Total displaced soil by glacial flow:

$ 7.32 beta +
  sum_(i=0)^nabla
    (Q_i (a_i - epsilon)) / 2 $
```

#babel(
  en: [
    Not all math constructs have special syntax. Instead, we use functions, just like the `image` function we have seen before. For example, to insert a column vector, we can use the @math.vec[`vec`] function. Within math mode, function calls don't need to start with the `#` character.
  ],
  zh-status: "proofread",
  zh: [
    并非所有数学结构都有特殊语法。作为替代，我们会使用函数，就像我们之前看到的`image`函数一样。例如，要插入列向量，我们可以使用@math.vec[`vec`]函数。在数学模式下，函数调用不需要以`#`字符开头。
  ],
)

```example
$ v := vec(x_1, x_2, x_3) $
```

#babel(
  en: [
    Some functions are only available within math mode. For example, the @math.cal[`cal`] function is used to typeset calligraphic letters commonly used for sets. The @math[math section of the reference] provides a complete list of all functions that math mode makes available.

    One more thing: Many symbols, such as the arrow, have a lot of variants. You can select among these variants by appending a dot and a modifier name to a symbol's name:
  ],
  zh-status: "proofread",
  zh: [
    有些函数仅能用于数学模式。例如，@math.cal[`cal`]函数用于排版通常用于集合论的花体字母。@math[参考手册的数学部分]完整列出了数学模式可用的函数。

    还有一点：箭头等符号有若干变体。选择变体请在符号名称后加点和修饰名称：
  ],
)

```example
$ a arrow.squiggly b $
```

#babel(
  en: [
    This notation is also available in markup mode, but the symbol name must be preceded with `#sym.` there. See the @sym[symbols section] for a list of all available symbols.
  ],
  zh-status: "proofread",
  zh: [
    在标记模式下这种记号也可用，但符号名称前必须带`#sym.`。全部可用符号的列表请参阅@sym[符号一章]。
  ],
)

= #babel(en: [Review], zh-status: "proofread", zh: [小结]) <review>
#babel(
  en: [
    You have now seen how to write a basic document in Typst. You learned how to emphasize text, write lists, insert images, align content, and typeset mathematical expressions. You also learned about Typst's functions. There are many more kinds of content that Typst lets you insert into your document, such as @table[tables], @reference:visualize[shapes], and @raw[code blocks]. You can peruse the @reference[reference] to learn more about these and other features.

    For the moment, you have completed writing your report. You have already saved a PDF by clicking on the download button in the top right corner. However, you think the report could look a bit less plain. In the next section, we'll learn how to customize the look of our document.
  ],
  zh-status: "proofread",
  zh: [
    现在您已经了解了如何在Typst中编写基本文档，包括如何强调文本、编写列表、插入图片、对齐内容和排版数学公式。您还了解了Typst的函数机制。其实Typst还允许您往文档插入许多种内容，例如@table[表格]、@reference:visualize[图形]和@raw[代码段]。您可查阅@reference[参考手册]进一步了解各种功能。

    目前您已写完报告，并单击右上角的下载按钮保存了PDF。不过，您可能认为报告看起来不该那么朴素。下一章我们将学习如何定制文档的外观格式。
  ],
)
