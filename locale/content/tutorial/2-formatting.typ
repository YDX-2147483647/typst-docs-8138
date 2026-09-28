#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-figure, info, kbd, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Formatting",
    zh-status: "proofread",
    zh: "基本格式",
  ),
  route: "/tutorial/formatting",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
)

#babel(
  en: [
    So far, you have written a report with some text, a few equations and images. However, it still looks very plain. Your teaching assistant does not yet know that you are using a new typesetting system, and you want your report to fit in with the other student's submissions. In this chapter, we will see how to format your report using Typst's styling system.
  ],
  zh-status: "proofread",
  zh: [
    之前您已经写了一份报告，包含若干文本、公式和图片，但它看起来还很朴素。您的助教还不知道您在使用新的排版系统，而您希望自己的报告与其他学生的提交在外观上一致。本章我们将学习使用Typst的样式系统，并设置报告的格式。
  ],
)

= #babel(en: [Set rules], zh-status: "proofread", zh: [set规则]) <set-rules>
#babel(
  en: [
    As we have seen in the previous chapter, Typst has functions that _insert_ content (e.g. the @image function) and others that _manipulate_ content that they received as arguments (e.g. the @align function). The first impulse you might have when you want, for example, to change the font, could be to look for a function that does that and wrap the complete document in it.
  ],
  zh-status: "proofread",
  zh: [
    如前一章所述，Typst既有函数单纯向文档_插入_内容块（如@image），也有函数从参数接收内容块并_处理_之（如@figure）。想更改字体时，您的第一反应可能是找到相应函数并把整篇文档套进去，像下面这样。
  ],
)

```example
#text(font: "New Computer Modern")[
  = Background
  In the case of glaciers, fluid
  dynamics principles can be used
  to understand how the movement
  and behaviour of the ice is
  influenced by factors such as
  temperature, pressure, and the
  presence of other fluids (such as
  water).
]
```

#babel(
  en: [
    Wait, shouldn't all arguments of a function be specified within parentheses? Why is there a second set of square brackets with content _after_ the parentheses? The answer is that, as passing content to a function is such a common thing to do in Typst, there is special syntax for it: Instead of putting the content inside of the argument list, you can write it in square brackets directly after the normal arguments, saving on punctuation.

    As seen above, that works. With the @text function, we can adjust the font for all text within it. However, wrapping the document in countless functions and applying styles selectively and in-situ can quickly become cumbersome.

    Fortunately, Typst has a more elegant solution. With _set rules,_ you can apply style properties to all occurrences of some kind of content. You write a set rule by entering the `{set}` keyword, followed by the name of the function whose properties you want to set, and a list of arguments in parentheses.
  ],
  zh-status: "proofread",
  zh: [
    等等，函数的参数不应该都填在圆括号中吗？为何圆括号_后面_又有一对方括号包裹的内容块？答案是，由于Typst中经常要将内容块传给函数，因此它有特殊语法：方括号包裹的内容块，可直接放在普通参数后传给函数。与将内容块放在参数列表中相比，这样能少写几个标点符号。

    【译注】这其实只是一个语法糖，即 `{fn(…, [X], [Y], [Z])}` 可简写为 `{fn(…)[X][Y][Z]}`，其中`fn`是任意函数，`{[X], [Y], [Z]}`是内容块参数，其余参数按普通填法填在`…`处。

    如上所示，这种写法确实有效，@text\函数成功修改了里面所有文本的字体。不过这种方法要将文档套在无数函数中，到处重复选用的样式，十分麻烦。

    好在Typst有更优雅的解决方案。利用_set规则_，您可以将样式设置应用于某类内容的所有实例。编写set规则的方法是先输入`{set}`关键字，再跟上要设置的函数的名称，然后在圆括号中填写要设置的参数。

    #info[
      【译注】用Typst写中文一般需要设置中文字体，否则随机选出的中文字体可能非常魔幻，因为Typst内置字体不含汉字。对于简单需求，可如下设置，这会启用中文排版规则并设置字体为思源宋体。

      ```typ
      #set text(lang: "zh", font: "Noto Serif CJK SC")
      ```

      如果遇到问题，或有中英文分设字体等复杂需求，请参考中文社区导航「#link("https://typst-doc-cn.github.io/guide/FAQ/install-fonts.html")[如何设置（中文）字体]」。
    ]
  ],
)

```example
#set text(
  font: "New Computer Modern"
)

= Background
In the case of glaciers, fluid
dynamics principles can be used
to understand how the movement
and behaviour of the ice is
influenced by factors such as
temperature, pressure, and the
presence of other fluids (such as
water).
```

#info[
  #babel(
    en: [
      Want to know in more technical terms what is happening here?

      Set rules can be conceptualized as setting default values for some of the parameters of a function for all future uses of that function.
    ],
    zh-status: "proofread",
    zh: [
      用更技术的方式来说：

      set规则给函数的参数设置默认值。此后再调用这一函数时，参数默认取set规则设置的值。
    ],
  )
]

= #babel(
  en: short-or-long[Autocomplete][The autocomplete panel],
  zh-status: "proofread",
  zh: short-or-long[自动补全][自动补全面板],
) <autocomplete>
#babel(
  en: [
    If you followed along and tried a few things in the app, you might have noticed that always after you enter a `#` character, a panel pops up to show you the available functions, and, within an argument list, the available parameters. That's the autocomplete panel. It can be very useful while you are writing your document: You can apply its suggestions by hitting the Return key or navigate to the desired completion with the arrow keys. The panel can be dismissed by hitting the Escape key and opened again by typing `#` or hitting #kbd("Ctrl") + #kbd("Space"). Use the autocomplete panel to discover the right arguments for functions. Most suggestions come with a small description of what they do.
  ],
  zh-status: "proofread",
  zh: [
    如果您跟着在应用里操作了，那么可能已经注意到，输入`#`字符会弹出一个面板展示可用函数，该面板在参数列表中还会显示可用参数。这就是自动补全面板。它在写作时非常有用：按回车键应用补全建议，按方向键切换要应用的补全。按 #kbd("Esc") 键关闭面板，关闭后可再输入`#`或按 #kbd("Ctrl") + #kbd("Space") 打开。善用自动补全面板查找要用的函数参数。大多数补全建议还附有简短的功能说明。
  ],
)

#docs-figure(
  "2-formatting-autocomplete.png",
  alt: "Autocomplete panel",
  shadow: false,
)

= #babel(
  en: short-or-long[Page Setup][Set up the page],
  zh-status: "proofread",
  zh: short-or-long[页面版式][设置页面版式],
) <page-setup>
#babel(
  en: [
    Back to set rules: When writing a rule, you choose the function depending on what type of element you want to style. Here is a list of some functions that are commonly used in set rules:

    - @text to set font family, size, color, and other properties of text
    - @page to set the page size, margins, headers, enable columns, and footers
    - @par to justify paragraphs, set line spacing, and more
    - @heading to set the appearance of headings and enable numbering
    - @document to set the metadata contained in the PDF output, such as title and author

    Not all function parameters can be set. In general, only parameters that tell a function _how_ to do something can be set, not those that tell it _what_ to do it with. The function reference pages indicate which parameters are settable.

    Let's add a few more styles to our document. We want larger margins and a serif font. For the purposes of the example, we'll also set another page size.
  ],
  zh-status: "proofread",
  zh: [
    回到set规则：规则用什么函数取决于要给什么元素设置样式。以下列出了set规则常用的函数：

    - @text——设置文本的字体、字号、颜色等属性
    - @page——设置页面尺寸、边距、页眉页脚、分栏数量
    - @par——启用两端对齐、设置行距等
    - @heading——设置章节标题样式、启用编号
    - @document——设置PDF输出包含的元数据，例如全文标题和作者

    并非所有函数参数都能用set规则。通常，决定函数_怎样做_某事的参数可用set规则，而决定函数_做什么_的参数用不了set规则。在参考手册中，各函数页面会标注哪些参数可用set规则。

    让我们向文档添加更多样式。我们想要加大边距并使用衬线字体。出于示例的目的，我们还将设置另一种页面尺寸。
  ],
)

```example
#set page(
  paper: "a6",
  margin: (x: 1.8cm, y: 1.5cm),
)
#set text(
  font: "New Computer Modern",
  size: 10pt
)
#set par(
  justify: true,
  leading: 0.52em,
)

= Introduction
In this report, we will explore the
various factors that influence fluid
dynamics in glaciers and how they
contribute to the formation and
behaviour of these natural structures.

>>> Glacier displacement is influenced
>>> by a number of factors, including
>>> + The climate
>>> + The topography
>>> + The geology
>>>
>>> This report will present a physical
>>> model of glacier displacement and
>>> dynamics, and will explore the
>>> influence of these factors on the
>>> movement of large bodies of ice.
<<< ...

#align(center + bottom)[
  #image("glacier.jpg", width: 70%)

  *Glaciers form an important
  part of the earth's climate
  system.*
]
```

#babel(
  en: [
    There are a few things of note here.

    First is the @page set rule. It receives two arguments: the page size and margins for the page. The page size is a string. Typst accepts @page.paper[many standard page sizes,] but you can also specify a custom page size. The margins are specified as a @dictionary[dictionary.] Dictionaries are a collection of key-value pairs. In this case, the keys are `x` and `y`, and the values are the horizontal and vertical margins, respectively. We could also have specified separate margins for each side by passing a dictionary with the keys `{left}`, `{right}`, `{top}`, and `{bottom}`.

    Next is the set @text set rule. Here, we set the font size to `{10pt}` and font family to `{"New Computer Modern"}`. The Typst app comes with many fonts that you can try for your document. When you are in the text function's argument list, you can discover the available fonts in the autocomplete panel.

    We have also set the spacing between lines (a.k.a. leading): It is specified as a @length[length] value, and we used the `em` unit to specify the leading relative to the size of the font: `{1em}` is equivalent to the current font size (which defaults to `{11pt}`).

    Finally, we have bottom aligned our image by adding a vertical alignment to our center alignment. Vertical and horizontal alignments can be combined with the `{+}` operator to yield a 2D alignment.
  ],
  zh-status: "proofread",
  zh: [
    这里有几点需要解释。

    首先是@page\的set规则，它接收两个参数：页面尺寸和边距。页面尺寸是个字符串，Typst接受@page.paper[许多标准页面尺寸]，但您也可以自行定制。页边距用@dictionary[字典]指定，字典是键值对的集合。在本例中，键为`x`和`y`，而值分别为水平和竖直边距。我们还可以给每条边单独指定边距，方法是把字典的键改为`{left}`、`{right}`、`{top}`和`{bottom}`。

    其次是@text\的set规则。此处将字号设置为`{10pt}`，将字体设置为`{"New Computer Modern"}`。Typst在线应用附带许多字体，您可在文档中随意尝试。您输入`text`函数的`font`参数时，可利用自动补全面板搜索可用字体。

    接着我们设置了相邻两行的间距（即行距leading）：它按@length[长度]设定，可用`em`单位相对字号指定：`{1em}`相当于当前字号的尺寸（默认为`{11pt}`）。

    最后，我们让图片对齐到底部，方法是把竖直方向的对齐加到水平方向的居中对齐上。竖直和水平对齐可用`{+}`运算符结合使用，表示二维对齐。

    【译注】以上前三点都涉及中文特色，下面倒着补充一下。

    - *行距与`em`：*Typst的行距模型默认按照西文习惯，用于中文会显得较挤；如想更接近中文习惯，可设置 `[#set text(top-edge: "ascender", bottom-edge: "descender")]`。详见中文社区导航「#link("https://typst-doc-cn.github.io/guide/FAQ/par-leading.html")[行距 leading 是什么距离？文字外框的计算方式？]」。此外，`{1em}`相当于一个汉字的宽度。

    - *字号的号数制：*中文习惯用号数制，最常用的五号一般对应`{10.5pt}`，次常用的小四一般对应`{12pt}`。不过各家号数制并不统一，Typst也不支持；需要时请参考#link("https://typst.app/universe/package/pointless-size")[pointless-size]中的表格按`pt`点数指定。

    - *版心宽度与页边距：*中文一般要求每行能排下整数个汉字，所以更习惯设置版心宽度，而间接余出版心左右的边距。这种需求可变通实现，例如 `[#set page(margin: (x: (100% - 42em) / 2))]` 表示每行42字，左右边距等宽#footnote[`{100%}`表示纸张全宽，`{42em}`表示42个汉字的宽度，二者之差的一半即为`page`函数所需水平边距。]。
  ],
)

= #babel(
  en: short-or-long[Sophistication][A hint of sophistication],
  zh-status: "proofread",
  zh: [精致一点],
) <sophistication>
#babel(
  en: [
    To structure our document more clearly, we now want to number our headings. We can do this by setting the `numbering` parameter of the @heading function.
  ],
  zh-status: "proofread",
  zh: [
    为了更清楚地组织我们的文档，现在要对章节标题编号，方法是设置@heading\函数的`numbering`参数。
  ],
)

```example
>>> #set text(font: "New Computer Modern")
#set heading(numbering: "1.")

= Introduction
#lorem(10)

== Background
#lorem(12)

== Methods
#lorem(15)
```

#babel(
  en: [
    We specified the string `{"1."}` as the numbering parameter. This tells Typst to number the headings with arabic numerals and to put a dot between the number of each level. We can also use @numbering[letters, roman numerals, and symbols] for our headings:
  ],
  zh-status: "proofread",
  zh: [
    我们向numbering参数填了字符串`{"1."}`，这会让Typst用阿拉伯数字对章节标题编号，并用句点分隔各级编号。我们还可以使用@numbering[字母、罗马数字和符号]作为编号：

    【译注】若用`{"一、"}`编号，可能要参考中文社区导航「#link("https://typst-doc-cn.github.io/guide/FAQ/heading-numbering-space.html")[如何去掉标题的编号后面的空格]」。
  ],
)

```example
>>> #set text(font: "New Computer Modern")
#set heading(numbering: "1.a")

= Introduction
#lorem(10)

== Background
#lorem(12)

== Methods
#lorem(15)
```

#babel(
  en: [
    This example also uses the @lorem function to generate some placeholder text. This function takes a number as an argument and generates that many words of _Lorem Ipsum_ text.

    #info[
      Did you wonder why the headings and text set rules apply to all text and headings, even if they are not produced with the respective functions?

      Typst internally calls the `heading` function every time you write `[= Conclusion]`. In fact, the function call `[#heading[Conclusion]]` is equivalent to the heading markup above. Other markup elements work similarly, they are only _syntax sugar_ for the corresponding function calls.
    ]
  ],
  zh-status: "proofread",
  zh: [
    此示例还使用@lorem\函数生成一些占位文本。此函数接收一个数字作为参数，并从_Lorem Ipsum_乱数假文生成相应数量的单词。

    #info[
      您是否好奇为何heading和text的set规则适用于所有文本和章节标题，尽管它们并不是用相应函数生成的？

      您写`[= Conclusion]`时，Typst会在内部调用`heading`函数。其实函数调用`[#heading[Conclusion]]`等效于上面的章节标题标记。其它标记元素也采用类似机制，它们仅仅是相应函数调用的_语法糖_。
    ]
  ],
)

= #babel(en: [Show rules], zh-status: "proofread", zh: [show规则]) <show-rules>
#babel(
  en: [
    You are already pretty happy with how this turned out. But one last thing needs to be fixed: The report you are writing is intended for a larger project and that project's name should always be accompanied by a logo, even in prose.

    You consider your options. You could add an `[#image("logo.svg")]` call before every instance of the logo using search and replace. That sounds very tedious. Instead, you could maybe @function:defining-functions[define a custom function] that always yields the logo with its image. However, there is an even easier way:

    With show rules, you can redefine how Typst displays certain elements. You specify which elements Typst should show differently and how they should look. Show rules can be applied to instances of text, many functions, and even the whole document.
  ],
  zh-status: "proofread",
  zh: [
    您已经很满意这个结果了，但还有件事要改：您写的这份报告会用于一个更大的项目，每次提及其名称时，必须附上项目图标，即使在普通正文中也应如此。

    您在考虑有哪些实现方法。您可以使用查找替换，找到所有提及项目名称之处，并在每一处之前添加`[#image("logo.svg")]`调用——这听起来十分麻烦。换种方法，您也可以@function:defining-functions[自己定义一个函数]，专门生成图标图片。不过其实还有更简单的方法：

    使用show规则，您可以重新定义Typst显示某些元素的方式。您指定哪些元素要修改显示方式，再写明应如何显示。show规则可用于文本实例、各类函数，甚至整个文档。
  ],
)

```example
#show "ArtosFlow": name => box[
  #box(image(
    "logo.svg",
    height: 0.7em,
  ))
  #name
]

This report is embedded in the
ArtosFlow project. ArtosFlow is a
project of the Artos Institute.
```

#babel(
  en: [
    There is a lot of new syntax in this example: We write the `{show}` keyword, followed by a string of text we want to show differently and a colon. Then, we write a function that takes the content that shall be shown as an argument. Here, we called that argument `name`. We can now use the `name` variable in the function's body to print the ArtosFlow name. Our show rule adds the logo image in front of the name and puts the result into a box to prevent linebreaks from occurring between logo and name. The image is also put inside of a box, so that it does not appear in its own paragraph.

    The calls to the first box function and the image function did not require a leading `#` because they were not embedded directly in markup. When Typst expects code instead of markup, the leading `#` is not needed to access functions, keywords, and variables. This can be observed in parameter lists, function definitions, and @reference:scripting[code blocks].
  ],
  zh-status: "proofread",
  zh: [
    这个例子涉及几种新语法：我们写上`{show}`关键字，后面跟一个我们希望以不同方式显示的文本字符串，再跟一个冒号。然后，我们编写一个函数，该函数输入的参数是应显示的内容。此处我们称该参数为`name`，这样在函数体内就能用`name`变量输出项目名称ArtosFlow。我们这条show规则在名称前添加图标图片，并将结果放入box中，以防止在图标和名称之间断行。图片本身也放在box中，以避免它单独成段。

    调用第一个box函数和image函数时，不需要前导`#`，因为它们没有直接写在标记模式中。Typst处于脚本模式而非标记模式时，访问函数、关键字和变量不需要前导`#`。函数参数列表、函数定义和@reference:scripting[脚本块]中也是同样的道理。
  ],
)

= #babel(en: [Review], zh-status: "proofread", zh: [小结]) <review>
#babel(
  en: [
    You now know how to apply basic formatting to your Typst documents. You learned how to set the font, justify your paragraphs, change the page dimensions, and add numbering to your headings with set rules. You also learned how to use a basic show rule to change how text appears throughout your document.

    You have handed in your report. Your supervisor was so happy with it that they want to adapt it into a conference paper! In the next section, we will learn how to format your document as a paper using more advanced show rules and functions.
  ],
  zh-status: "proofread",
  zh: [
    现在您已知道如何设置Typst文档的基本格式。您学习了如何设置字体、两端对齐段落、更改页面尺寸，以及用set规则给章节标题编号。您还学习了如何使用基本的show规则来更改文本在整个文档中的显示方式。

    您提交了报告。您的导师对此非常满意，想将其改编成会议论文！在下一节中，我们将学习如何使用更高级的show规则和函数将文档编排为论文。
  ],
)
