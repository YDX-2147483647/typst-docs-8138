#import "/i18n-scope.typ": babel, note
#import "/components/index.typ": checked-list, docs-chapter, docs-figure, example, folding-details, info, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Advanced Styling",
    zh-status: "proofread",
    zh: "高级样式",
  ),
  route: "/tutorial/advanced-styling",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
)

#babel(
  en: [
    In the previous two chapters of this tutorial, you have learned how to write a document in Typst and how to change its formatting. The report you wrote throughout the last two chapters got a straight A and your supervisor wants to base a conference paper on it! The report will of course have to comply with the conference's style guide. Let's see how we can achieve that.

    Before we start, let's create a team, invite your supervisor and add them to the team. You can do this by going back to the app dashboard with the back icon in the top left corner of the editor. Then, choose the plus icon in the left toolbar and create a team. Finally, click on the new team and go to its settings by clicking 'manage team' next to the team name. Now you can invite your supervisor by email.
  ],
  zh-status: "proofread",
  zh: [
    在本教程的前两章，您学习了如何在Typst中撰写文档并调整格式。您在前两章写的报告大受好评，导师想以此为基础写一篇会议论文！当然，这篇报告必须遵循会议的论文样式规范。让我们看看应该如何实现这一目标。

    开始之前，我们先创建一个团队，并邀请您的导师加入。具体来说，单击编辑器左上角的返回图标，回到在线应用首页；然后找到左侧工具栏，单击加号创建团队；最后，单击新团队，再单击团队名称下方的 Manage team 设置按钮。在打开的新界面中，您就可以通过电子邮件邀请导师了。
  ],
)

#docs-figure(
  "3-advanced-team-settings.png",
  alt: "The team settings",
  shadow: false,
)

#babel(
  en: [
    Next, move your project into the team: Open it, going to its settings by choosing the gear icon in the left toolbar and selecting your new team from the owners dropdown. Don't forget to save your changes!

    Now, your supervisor can also edit the project and you can both see the changes in real time. You can join our #link("https://discord.gg/2uDybryKPe")[Discord server] to find other users and try teams with them!
  ],
  zh-status: "proofread",
  zh: [
    接下来把项目移入团队：打开项目，单击左侧工具栏的齿轮图标进入设置，并从Location下拉菜单中选择您刚刚创建的团队。别忘了保存更改！

    现在，您的导师也能编辑项目了，并且您和导师都能实时看到更改。您可以加入我们的#link("https://discord.gg/2uDybryKPe")[Discord服务器]，找其他用户一起尝试团队功能！

    #note[
      【译注】访问Discord服务器需要科学上网。
    ]
  ],
)

= #babel(
  en: short-or-long[Guidelines][The conference guidelines],
  zh-status: "proofread",
  zh: [会议规范],
) <guidelines>
#babel(
  en: [
    The layout guidelines are available on the conference website. Let's take a look at them:

    - The font should be an 11pt serif font
    - The title should be in 17pt and bold
    - The paper contains a single-column abstract and two-column main text
    - The abstract should be centered
    - The main text should be justified
    - First level section headings should be 13pt, centered, and rendered in small capitals
    - Second level headings are run-ins, italicized and have the same size as the body text
    - Finally, the pages should be US letter sized, numbered in the center of the footer and the top right corner of each page should contain the title of the paper

    We already know how to do many of these things, but for some of them, we'll need to learn some new tricks.
  ],
  zh-status: "proofread",
  zh: [
    会议的版式规范可在会议网站上找到。让我们来看一下：

    - 字体应为11pt，采用衬线字体
    - 标题应为17pt，加粗
    - 论文应含摘要与正文，摘要单栏而正文双栏
    - 摘要应居中，但不必两端对齐
    - 正文应两端对齐
    - 一级标题应居中，采用13pt的小型大写字母
    - 二级标题应与正文开头同行，采用与正文相同字号的斜体
    - 页面尺寸应为US letter，页脚正中写页码，每页右上角写论文标题

    大部分要求我们已经知道应该如何实现了，但还有几条要求我们学习一些新技巧。

    #note[
      【译注】以上有些概念是西文特色，中文读者或许会感到陌生。这些概念在后文用到时译注会逐一介绍，读者亦可自行查阅 #link("https://wiki.wordsoftype.com/?language=zh")[Words of Type]（多语言）、#link("https://practicaltypography.com/")[Practical Typography]（英语，需科学上网）等其它资料。
    ]
  ],
)

= #babel(
  en: short-or-long[Set Rules][Writing the right set rules],
  zh-status: "proofread",
  zh: short-or-long[set规则][编写所需set规则],
) <set-rules>
#babel(
  en: [
    Let's start by writing some set rules for the document.
  ],
  zh-status: "proofread",
  zh: [
    我们先为文档写几条set规则。
  ],
)

```example
#set page(
>>> margin: auto,
  paper: "us-letter",
  header: align(right)[
    A Fluid Dynamic Model for
    Glacier Flow
  ],
  numbering: "1",
)
#set par(justify: true)
#set text(
  font: "Libertinus Serif",
  size: 11pt,
)

#lorem(600)
```

#babel(
  en: [
    You are already familiar with most of what is going on here. We set the text size to `{11pt}` and the font to Libertinus Serif. We also enable paragraph justification and set the page size to US letter.

    The `header` argument is new: With it, we can provide content to fill the top margin of every page. In the header, we specify our paper's title as requested by the conference style guide. We use the `align` function to align the text to the right.

    Last but not least is the `numbering` argument. Here, we can provide a @numbering[numbering pattern] that defines how to number the pages. By setting it to `{"1"}`, Typst only displays the bare page number. Setting it to `{"(1/1)"}` would have displayed the current page and total number of pages surrounded by parentheses. And we could even have provided a completely custom function here to format things to our liking.
  ],
  zh-status: "proofread",
  zh: [
    这里大部分内容您应该已经熟悉了。我们把字号设为`{11pt}`，把字体设为Libertinus Serif，让段落两端对齐，并把页面尺寸设为US letter。

    `header`参数是新出现的，我们利用它向每页的天头填充页眉内容。按会议样式规范，我们在此填写论文标题，并用`align`函数右对齐。

    最后还有`numbering`参数。我们可在此填写@numbering[编号模式]，定义如何对页面编号。设为`{"1"}`，则Typst就单纯显示页码；设为`{"(1/1)"}`，则显示当前页码和总页数，并用圆括号括起来。我们甚至还能完全定制一个函数填到这里，实现我们想要的任何编号规则。

    #note[
      【译注】#link("https://wiki.wordsoftype.com/zh/entry/chenxian")[衬线]即serif，是字母笔画的一种风格特征，类似于宋体汉字横画末端的装饰；前文要求的衬线字体是一类字体，这里设的Libertinus Serif就是其一。US letter是一种纸张尺寸，与A4十分接近，主要在美国、加拿大和菲律宾常用。
    ]
  ],
)

= #babel(
  en: short-or-long[Title And Abstract][Creating a title and abstract],
  zh-status: "proofread",
  zh: short-or-long[全文标题、摘要][添加全文标题与摘要],
) <title-and-abstract>
#babel(
  en: [
    Now, let's add a title and an abstract. We'll start with the title. Typst comes with a @title function. Let's start by providing our title as an argument:
  ],
  zh-status: "proofread",
  zh: [
    现在添加全文的标题和摘要，先从标题开始。Typst内置了@title\函数，参数是标题内容：
  ],
)

```example
>>> #set page(width: 300pt, margin: 30pt)
>>> #set text(font: "Libertinus Serif", 11pt)
#title[
  A Fluid Dynamic Model
  for Glacier Flow
]
```

#babel(
  en: [
    You can see that the title is already boldfaced and has some space around it. However, it is left-aligned and not exactly 17pt large. Hence, we need to adjust its appearance. The title function does not come with any arguments for font or text size we could set. Instead, these properties are defined on the `text` and `align` functions.
  ],
  zh-status: "proofread",
  zh: [
    可以看到，标题已经加粗，周围也增加了空隙；不过目前字号并非正好17pt，而且还采用左对齐，因此要继续调整外观。这次我们没法直接给title函数用set规则，因为title函数并无参数控制字号与对齐方式——那些属性定义在`text`和`align`函数上。
  ],
)

#info[
  #babel(
    en: [
      What is the difference between what the `title` function inserted and the headings we produced with equals signs?

      Headings, even first-level headings, can appear multiple times in your document whereas a title only appears once, usually at the beginning. Differentiating between the two helps Typst make your document accessible for users of Assistive Technology such as screen readers.
    ],
    zh-status: "proofread",
    zh: [
      `title`函数生成全文标题，等号生成章节标题，二者有什么区别？

      在一篇文档中，章节标题（heading）可以出现多次，即便是一级标题也如此；而全文标题（title）只能出现一次，且往往位于全文开头。在Typst中区分二者，可让导出的文档更容易使用屏幕阅读器等辅助技术阅读。
    ],
  )
]

#babel(
  en: [
    When we want to customize the properties of some element inside of another kind of element, we can use show-set rules. First, we use `show` to select which element we want to customize. We call this a _selector._ Then, we type a colon. Next, we write the set rule that should apply to elements matching the selector. Summarized, the syntax looks like this:

    ```typ
    #show your-selector: set some-element(/* ... */)
    ```
  ],
  zh-status: "proofread",
  zh: [
    我们可用show-set规则定制某种元素内另一元素的属性。首先用`show`选择要定制哪种元素，这称作_选择器_。然后加上冒号，再写一条set规则，该规则会应用于之前那个选择器命中的元素。简而言之，语法如下：

    ```typ
    #show 选择器: set 另一元素(/* ... */)
    ```
  ],
)

#babel(
  en: [
    Let's recall: We want to center-align the title and make it 17pt large. Hence, we need two show-set rules:

    - One with the selector `title` and the rule `{set text(size: 17pt)}`
    - One with the selector `title` and the rule `{set align(center)}`

    Our example now looks like this:
  ],
  zh-status: "proofread",
  zh: [
    回顾一下：我们希望标题居中，字号17pt。因此需要两条show-set规则：

    - 一条的选择器是`title`，规则是`{set text(size: 17pt)}`
    - 另一条的选择器仍是`title`，而规则是`{set align(center)}`

    现在我们的示例长这样：
  ],
)

```example
>>> #set page(width: 300pt, margin: 30pt)
>>> #set text(font: "Libertinus Serif", 11pt)
#show title: set text(size: 17pt)
#show title: set align(center)

#title[
  A Fluid Dynamic Model
  for Glacier Flow
]
```

#babel(
  en: [
    This looks right. Let's also add the author list: Since we are writing this paper together with our supervisor, we'll add our own and their name.
  ],
  zh-status: "proofread",
  zh: [
    看起来没问题了。下面我们添加作者名单：我们与导师一起撰写论文，所以我们与导师的名字都要加上。
  ],
)

```example
>>> #set page(width: 300pt, margin: 30pt)
>>> #set text(font: "Libertinus Serif", 11pt)
>>>
>>> #show title: set text(size: 17pt)
>>> #show title: set align(center)
>>>
>>> #title[
>>>   A Fluid Dynamic Model
>>>   for Glacier Flow
>>> ]

#grid(
  columns: (1fr, 1fr),
  align(center)[
    Therese Tungsten \
    Artos Institute \
    #link("mailto:tung@artos.edu")
  ],
  align(center)[
    Dr. John Doe \
    Artos Institute \
    #link("mailto:doe@artos.edu")
  ]
)
```

#babel(
  en: [
    The two author blocks are laid out next to each other. We use the @grid function to create this layout. With a grid, we can control exactly how large each column is and which content goes into which cell. The `columns` argument takes an array of @relative[relative lengths] or @fraction[fractions]. In this case, we passed it two equal fractional sizes, telling it to split the available space into two equal columns. We then passed two content arguments to the grid function. The first with our own details, and the second with our supervisors'. We again use the `align` function to center the content within the column. The grid takes an arbitrary number of content arguments specifying the cells. Rows are added automatically, but they can also be manually sized with the `rows` argument.

    Looking at the authors and the title, they are a bit too close together. You can address this by using another show-set rule to configure the space below the title. The title, the grid, and all other elements that Typst arranges from the top to the bottom of the page (except for paragraphs) are called _blocks._ Each block is controlled by the @block function. It controls behaviors like their distance and whether a block can contain a page break. That means that we can write another show-set rule that selects the title to set the block spacing:
  ],
  zh-status: "proofread",
  zh: [
    两个作者块并排摆放，这种网格布局我们用@grid\函数实现。grid函数能让我们精准控制每列多宽、哪项内容放进哪格。首先是`columns`参数，它接收一个数组，数组中每项是@relative[相对长度]或@fraction[分数占比]。本例我们传入了两个相等的分数（`{1fr}`），表示把可用空间分成等宽的两列。接着，我们把两个内容块参数传给grid函数，内容分别是我们和导师的信息。这里同样使用`align`函数让内容在每列内居中。顺便说下，其实grid函数可接收任意多个内容块参数作为单元格，网格行会随之自动添加，不过也可用`rows`参数手动指定尺寸。

    注意作者名单和标题，它们上下离得有点儿近。要解决这个问题，我们可再加一条show-set规则配置标题下方的间距。title、grid等Typst在每页自上而下排列的元素（段落除外）都称作_块_。块由@block\函数控制，能设置块间距、能否跨页等行为。也就是说，我们再写一条选择标题、设置块间距的show-set规则：
  ],
)

```example
>>> #set page(width: 300pt, margin: 30pt)
>>> #set text(font: "Libertinus Serif", 11pt)
>>>
#show title: set text(size: 17pt)
#show title: set align(center)
#show title: set block(below: 1.2em)

#title[
  A Fluid Dynamic Model
  for Glacier Flow
]

#grid(
<<<   // ...
>>>   columns: (1fr, 1fr),
>>>   align(center)[
>>>     Therese Tungsten \
>>>     Artos Institute \
>>>     #link("mailto:tung@artos.edu")
>>>   ],
>>>   align(center)[
>>>     Dr. John Doe \
>>>     Artos Institute \
>>>     #link("mailto:doe@artos.edu")
>>>   ]
)
```

#babel(
  en: [
    With this show-set rule, we overrode the spacing below the title. We have used the `em` unit: It allows us to express lengths as multiples of the font size. Here, we used it to space the title and the author list exactly 1.2× the font size apart. Now, let's add the abstract. Remember that the conference wants the abstract to be set ragged and centered.
  ],
  zh-status: "proofread",
  zh: [
    这条show-set规则覆盖了标题下方间距的默认值。这里的长度单位`em`表示字号尺寸的倍数，我们用它把标题和作者名单的间距设为1.2×字号尺寸。现在来添加摘要。回忆一下，会议要求摘要居中，且不必两端对齐。

    #note[
      【译注】中文原则上始终#link("https://wiki.wordsoftype.com/zh/entry/duiqi")[两端对齐]，但西文有时会让每行长度随单词组合自然浮动，而不两端对齐。
    ]
  ],
)

#example(
  zoom: (0pt, 0pt, 612pt, 317.5pt),
  ```
  >>> #set page(
  >>>   "us-letter",
  >>>   margin: auto,
  >>>   header: align(right + horizon)[
  >>>     A Fluid Dynamic Model for
  >>>     Glacier Flow
  >>>   ],
  >>>   numbering: "1",
  >>> )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)
  >>>
  >>> #show title: set text(size: 17pt)
  >>> #show title: set align(center)
  >>> #show title: set block(below: 1.2em)
  >>>
  >>> #title[
  >>>   A Fluid Dynamic Model
  >>>   for Glacier Flow
  >>> ]
  >>>
  >>> #grid(
  >>>   columns: (1fr, 1fr),
  >>>   align(center)[
  >>>     Therese Tungsten \
  >>>     Artos Institute \
  >>>     #link("mailto:tung@artos.edu")
  >>>   ],
  >>>   align(center)[
  >>>     Dr. John Doe \
  >>>     Artos Institute \
  >>>     #link("mailto:doe@artos.edu")
  >>>   ]
  >>> )
  >>>
  <<< ...

  #align(center)[
    #set par(justify: false)
    *Abstract* \
    #lorem(80)
  ]
  >>> #lorem(600)
  ```,
)

#babel(
  en: [
    Well done! One notable thing is that we used a set rule within the content argument of `align` to turn off justification for the abstract. This does not affect the remainder of the document even though it was specified after the first set rule because content blocks _scope_ styling. Anything set within a content block will only affect the content within that block.

    Another tweak could be to remove the duplication between the header and the title element's argument. Since they share the title, it would be convenient to store it in a place designed to hold metadata about the document. We would then need a way to retrieve the title in both places. The `document` element can help us with the former: By using it in a set rule, we can store document metadata like title, description, and keywords.
  ],
  zh-status: "proofread",
  zh: [
    干得漂亮！注意`align`的内容参数，我们在其中新写了一条set规则，给摘要关闭两端对齐。这条规则虽然写在之前第一条set规则之后，但它并不会影响文档后续部分，因为内容块里的样式会被_限制作用域_。内容块中设置的规则只影响它内部的内容。

    下一处调整是避免在`title`元素的参数与页眉间重复全文标题。由于两份标题相同，把标题统一存进文档的元数据会更方便。保存之后，我们还需要某种方法在各处获取标题。保存标题可以用`document`元素：用set规则设置该元素，就能存储标题、描述、关键词等文档元数据。
  ],
)

```typ
#set document(title: [A Fluid Dynamic Model for Glacier Flow])
```

#babel(
  en: [
    When exporting a PDF, the title set here will appear in the title bar of your PDF reader. Your operating system will also use this title to make the file retrievable with search. Last but not least, it contributes to making your document more accessible and is required if you choose to comply with PDF/UA, a PDF standard focused on accessibility.

    Now, we need a way to retrieve the value we set in the main title and the header. Because the `title` function is designed to work together with the `document` element, calling it with no arguments will just print the title. For the header, we will need to be more explicit: Because Typst has no way of knowing that we want to insert the title there, we will need to tell it to do so manually.

    Using _context,_ we can retrieve the contents of any values we have set on elements before. When we use the `{context}` keyword, we can access any property of any element, including the document element's title property. Its use looks like this:
  ],
  zh-status: "proofread",
  zh: [
    导出PDF时，此处设置的全文标题会显示到PDF阅读器的标题栏，操作系统也能用这个标题搜索到文件。设置标题还会让阅读文档的障碍更少。如果你需要符合PDF/UA这种PDF无障碍标准，那么必须设置标题。

    #note[
      【译注】欧盟有相关标准明确要求PDF这类数字资源无障碍，因此Typst比较重视；不过中国在信息无障碍方面，目前相对来说更重视#link("https://www.gov.cn/yaowen/liebiao/202306/content_6888910.htm#UCAP-CONTENT:~:text=语音、大字、盲文、手语")[语音、大字、盲文、手语]。（截至2026年）
    ]

    现在要在大标题和页眉获取我们设置的值。`title`函数设计上就是与`document`元素搭配，所以不带参数调用即可输出标题。页眉则需专门处理：Typst无法预知我们会在页眉放置标题，因此我们要手动告知Typst。

    可从_上下文_获取我们之前在元素上设置的值。利用`{context}`关键字，就能获取任意元素的任意属性，包括document元素的title属性。其用法如下：
  ],
)

// TODO: This example has a comment that needs to be translated.
// At present, it is complicated to use `babel` within an `example`, because joining strings and constructing a raw element will trigger an error in `stdx.compile_example` at `root.synthesize_mapped(file_id, &mapper)`:
//   error: text length (…) is greater than mapper length (0)
// We should translate that comment when we eliminate that limitation.
#example(
  single: true,
  ```
  #set document(title: [
    A Fluid Dynamic Model
    for Glacier Flow
  ])

  <<< ...

  #set page(
  >>> "us-letter",
  >>> margin: auto,
    header: align(
      right + horizon,
      // Retrieve the document
      // element's title property.
      context document.title,
    ),
  <<<   ...
  >>> numbering: "1",
  )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)

  >>> #show title: set text(size: 17pt)
  >>>
  >>> #show title: set align(center)
  >>> #show title: set block(below: 1.2em)
  #title()

  <<< ...

  >>> #grid(
  >>>   columns: (1fr, 1fr),
  >>>   align(center)[
  >>>     Therese Tungsten \
  >>>     Artos Institute \
  >>>     #link("mailto:tung@artos.edu")
  >>>   ],
  >>>   align(center)[
  >>>     Dr. John Doe \
  >>>     Artos Institute \
  >>>     #link("mailto:doe@artos.edu")
  >>>   ]
  >>> )
  >>>
  >>> #align(center)[
  >>>   #set par(justify: false)
  >>>   *Abstract* \
  >>>   #lorem(80)
  >>> ]
  >>>
  >>> #lorem(600)
  ```,
)

#babel(
  en: [
    First, notice how we called the title function with empty, round parentheses. Because no argument was passed, it defaulted to what we set for the document element above. The distinction between empty round and empty square brackets is important: While empty round brackets show that you are passing nothing, empty square brackets mean that you are passing one argument: an empty content block. If called that way, the title would have no visible content.

    Next, take a look at the header. Instead of the title in square parentheses, we used the context keyword to access the document title. This inserted exactly what we set above. The role of context is not limited to accessing properties: With it, you can check if some elements are present in the document, measure the physical dimensions of others, and more. Using context, you can build powerful templates that react to the preferences of the end-user.
  ],
  zh-status: "proofread",
  zh: [
    首先，注意我们用空的圆括号调用了title函数。由于未传递参数，它就默认使用我们直接给document元素设置的值。注意区分空圆括号与空方括号：空圆括号表示不传递任何参数，而空方括号表示传递一个参数，即一个空的内容块。若用空方括号调用，则title不会输出任何可见内容。

    接着，请关注header参数。之前我们在方括号中抄录标题，而这次改成了用context关键字获取标题，其效果与之前完全相同。其实上下文的作用并不限于获取属性：它还能用来检查文档是否存在某元素，测量其它元素的物理尺寸，等等。利用上下文，可以开发能响应最终作者设置的强大模板。
  ],
)

#info[
  #folding-details(
    title: babel(
      en: [Why is the context keyword required to access element properties?],
      zh-status: "proofread",
      zh: [为何需要context关键字才能获取元素属性？],
    ),
    babel(
      en: [
        Normally, when we access a variable, we know exactly what its value is going to be:

        - The variable could be a constant built into Typst, like `[#sym.pi]`
        - The variable could be defined by an argument
        - The variable could be defined or overwritten in the current scope

        However, sometimes, that's not enough. In this chapter of the tutorial, we have inserted a page header with the title. Even though we pass only one piece of content for the header, we may want different pages to have different headers. For example, we may want to print the chapter name or use the page number. When we use context, we can write a single context block that tells Typst to take a look at where it's inserted, look for the last heading, the current page number, or anything else, and go from there. That means that the same context block, inserted on different pages, can produce different output.

        For more information, read up on context @reference:context[in its docs] after completing this tutorial.
      ],
      zh-status: "proofread",
      zh: [
        普通情况下，获取变量时能确切知道变量值的来源：

        - 可能是Typst内置的常量，如`[#sym.pi]`
        - 可能是参数定义出的变量
        - 可能在当前作用域被定义或覆盖过

        然而有时这并不够。本章教程中，我们的页眉是全文标题；但尽管只能给header参数传入一段内容，有时我们却希望不同页面在页眉显示不同内容，比如各章的标题或各页的页码。利用context关键字，我们写单个上下文块，就能告诉Typst要根据该块出现的位置做出相应处理，比如查找此前最后一章的标题、此处页码等。也就是说，同一个上下文块，出现在不同页面，可以输出不同结果。

        欲知更多，请在完成教程后阅读@reference:context[关于上下文的专门文档]。
      ],
    ),
  )
]

= #babel(
  en: short-or-long[Columns And Headings][Adding columns and headings],
  zh-status: "proofread",
  zh: short-or-long[分栏、章节标题][设置分栏与章节标题],
) <columns-and-headings>
#babel(
  en: [
    The paper above unfortunately looks like a wall of lead. To fix that, let's add some headings and switch our paper to a two-column layout. Fortunately, that's easy to do: We just need to amend our `page` set rule with the `columns` argument.

    By adding `{columns: 2}` to the argument list, we have wrapped the whole document in two columns. However, that would also affect the title and authors overview. To keep them spanning the whole page, we can wrap them in a function call to @place[`{place}`]. Place expects an alignment and the content it should place as positional arguments. Using the named `{scope}` argument, we can decide if the items should be placed relative to the current column or its parent (the page). There is one more thing to configure: If no other arguments are provided, `{place}` takes its content out of the flow of the document and positions it over the other content without affecting the layout of other content in its container:
  ],
  zh-status: "proofread",
  zh: [
    然而上面的论文每行字太多，又没分节，密密麻麻读起来很费劲。为此，我们将版式改为两栏，并添加章节标题。设置分栏很容易：只需向`page`的set规则添加`columns`参数。

    添加`{columns: 2}`参数后，整篇文档就被排成了两栏；不过这也影响了全文标题和作者名单。为让它们跨越两栏，我们套上@place[`{place}`]函数。`place`接收两个位置参数，分别是对齐方式和要放置的内容；另有一个命名参数`{scope}`，用于选择放置于一栏还是其父级（即整页跨栏）。还有一点要配置：若不提供其它参数，则`{place}`会把内容移出文档流，叠在其它内容之上，并且其它内容排布时不会考虑其影响：
  ],
)

```example
#place(
  top + center,
  rect(fill: black),
)
#lorem(30)
```

#babel(
  en: [
    If we hadn't used `{place}` here, the square would be in its own line, but here it overlaps the few lines of text following it. Likewise, that text acts as if there was no square. To change this behavior, we can pass the argument `{float: true}` to ensure that the space taken up by the placed item at the top or bottom of the page is not occupied by any other content.
  ],
  zh-status: "proofread",
  zh: [
    若上例未用`{place}`，则方块会独占整行；但上例用了`{place}`，于是方块重叠在其后几行文字上，而文字排布得好像方块不存在一样。我们不希望这种效果，于是传入`{float: true}`参数，保证place内容在页面顶部或底部占的空间不再被其它内容重复占据。
  ],
)

#example(
  single: true,
  ```
  >>> #set document(title: [
  >>>   A Fluid Dynamic Model
  >>>   for Glacier Flow
  >>> ])
  >>>
  #set page(
  >>> margin: auto,
    paper: "us-letter",
    header: align(
      right + horizon,
      context document.title,
    ),
    numbering: "1",
    columns: 2,
  )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)

  #place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
  )[
  >>> #show title: set text(size: 17pt)
  >>> #show title: set align(center)
  >>> #show title: set block(below: 1.2em)
  >>>
  >>> #title()
  >>>
  >>> #grid(
  >>>   columns: (1fr, 1fr),
  >>>   [
  >>>     Therese Tungsten \
  >>>     Artos Institute \
  >>>     #link("mailto:tung@artos.edu")
  >>>   ],
  >>>   [
  >>>     Dr. John Doe \
  >>>     Artos Institute \
  >>>     #link("mailto:doe@artos.edu")
  >>>   ]
  >>> )
  <<<   ...

    #par(justify: false)[
      *Abstract* \
      #lorem(80)
    ]
  ]

  = Introduction
  #lorem(300)

  = Related Work
  #lorem(200)
  ```,
)

#babel(
  en: [
    In this example, we also used the `clearance` argument of the `{place}` function to provide the space between it and the body instead of using the @v[`{v}`] function. We can also remove the explicit `{align(center, ..)}` calls around the various parts since they inherit the center alignment from the placement.

    Now there is only one thing left to do: Style our headings. We need to make them centered and use small capitals. These properties are not available on the `heading` function, so we will need to write a few show-set rules and a show rule:

    - A show-set rule to make headings center-aligned
    - A show-set rule to make headings 13pt large and use the regular weight
    - A show rule to wrap the headings in a call to the `smallcaps` function
  ],
  zh-status: "proofread",
  zh: [
    上例我们还用了`{place}`函数的`clearance`参数来控制它到正文的距离，而没再用@v[`{v}`]函数。同时，我们删除了各部分套着的`{align(center, ..)}`，因为它们会继承place函数中center设置的居中对齐。

    现在只剩最后一步：设置章节标题的样式。我们需让标题居中并采用小型大写字母。`heading`函数没有提供这些属性，所以我们要自己编写几条show-set和show规则：

    - 用show-set规则让标题居中
    - 用另一条show-set规则将标题的字号设为13pt，字重设为regular
    - 用show规则将标题套在`smallcaps`函数中

    #note[
      【译注】#link("https://wiki.wordsoftype.com/zh/entry/xiaoxing-daxie-zimu")[小型大写字母]是拉丁字母的一种写法，字形结构按照大写字母，但尺寸更小。具体可参考下图。
    ]
  ],
)

#example(
  zoom: (50pt, 250pt, 265pt, 270pt),
  ```
  >>> #set document(title: [
  >>>   A Fluid Dynamic Model
  >>>   for Glacier Flow
  >>> ])
  >>>
  >>> #set page(
  >>>   "us-letter",
  >>>   margin: auto,
  >>>   header: align(
  >>>     right + horizon,
  >>>     context document.title,
  >>>   ),
  >>>   numbering: "1",
  >>>   columns: 2,
  >>> )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)
  #show heading: set align(center)
  #show heading: set text(
    size: 13pt,
    weight: "regular",
  )
  #show heading: smallcaps

  <<< ...
  >>> #place(
  >>>   top + center,
  >>>   float: true,
  >>>   scope: "parent",
  >>>   clearance: 2em,
  >>> )[
  >>>   #show title: set text(size: 17pt)
  >>>   #show title: set align(center)
  >>>   #show title: set block(below: 1.2em)
  >>>
  >>>   #title()
  >>>
  >>>   #grid(
  >>>     columns: (1fr, 1fr),
  >>>     [
  >>>       Therese Tungsten \
  >>>       Artos Institute \
  >>>       #link("mailto:tung@artos.edu")
  >>>     ],
  >>>     [
  >>>       Dr. John Doe \
  >>>       Artos Institute \
  >>>       #link("mailto:doe@artos.edu")
  >>>     ]
  >>>   )
  >>>
  >>>   #par(justify: false)[
  >>>     *Abstract* \
  >>>     #lorem(80)
  >>>   ]
  >>> ]

  = Introduction
  <<< ...
  >>> #lorem(35)

  == Motivation
  <<< ...
  >>> #lorem(45)
  ```,
)

#babel(
  en: [
    This looks great! We used show rules that apply to all headings. In the final show rule, we applied the `smallcaps` function to the complete heading. As we will see in the next example, we can also provide a custom rule to completely override the default look of headings.

    The only remaining problem is that all headings look the same now. The "Motivation" and "Problem Statement" subsections ought to be italic run-in headers, but right now, they look indistinguishable from the section headings. We can fix that by using a `where` selector on our show rule: This is a @reference:scripting:methods[method] we can call on headings (and other elements) that allows us to filter them by their properties. We can use it to differentiate between section and subsection headings:
  ],
  zh-status: "proofread",
  zh: [
    这看起来很棒！show规则成功应用于所有章节标题。在上例最后一条show规则，我们放了`smallcaps`函数，它会应用到整个标题上。下例我们将会看到，show规则还能放自己定义的函数，完全覆盖标题的默认样式。

    现在剩下的问题是，各级标题看起来都一样。“Motivation”和“Problem Statement”等二级标题应与正文开头同行并采用斜体，但它们目前都采用一级标题的样式，无法与之区分。解决办法是在show规则上增加`where`选择器：这是heading（及各种元素）的一个@reference:scripting:methods[方法]，调用后能按属性筛选元素。我们可以用它来区分各级标题：
  ],
)

#example(
  zoom: (50pt, 250pt, 265pt, 245pt),
  ```
  >>> #set document(title: [
  >>>   A Fluid Dynamic Model
  >>>   for Glacier Flow
  >>> ])
  >>>
  >>> #set page(
  >>>   "us-letter",
  >>>   margin: auto,
  >>>   header: align(
  >>>     right + horizon,
  >>>     context document.title,
  >>>   ),
  >>>   numbering: "1",
  >>>   columns: 2,
  >>> )
  >>> #set par(justify: true)
  >>> #set text(font: "Libertinus Serif", 11pt)
  >>>
  #show heading.where(level: 1): set align(center)
  #show heading.where(level: 1): set text(size: 13pt, weight: "regular")
  #show heading.where(level: 1): smallcaps

  #show heading.where(level: 2): set text(
    size: 11pt,
    weight: "regular",
    style: "italic",
  )
  #show heading.where(level: 2): it => {
    it.body + [.]
  }
  >>>
  >>> #place(
  >>>   top + center,
  >>>   float: true,
  >>>   scope: "parent",
  >>>   clearance: 2em,
  >>> )[
  >>>   #show title: set text(size: 17pt)
  >>>   #show title: set align(center)
  >>>   #show title: set block(below: 1.2em)
  >>>
  >>>   #title()
  >>>
  >>>   #grid(
  >>>     columns: (1fr, 1fr),
  >>>     [
  >>>       Therese Tungsten \
  >>>       Artos Institute \
  >>>       #link("mailto:tung@artos.edu")
  >>>     ],
  >>>     [
  >>>       Dr. John Doe \
  >>>       Artos Institute \
  >>>       #link("mailto:doe@artos.edu")
  >>>     ]
  >>>   )
  >>>
  >>>   #par(justify: false)[
  >>>     *Abstract* \
  >>>     #lorem(80)
  >>>   ]
  >>> ]
  >>>
  >>> = Introduction
  >>> #lorem(35)
  >>>
  >>> == Motivation
  >>> #lorem(45)
  ```,
)

#babel(
  en: [
    In this example, we first scope our previous rules to first-level headings by using `{.where(level: 1)}` to make the selector more specific. Then, we add a show-set rule for the second heading level. Finally, we need a show rule with a custom function: Headings enclose their contents with a block by default. This has the effect that the heading gets its own line. However, we want it to run into the text, so we need to provide our own show rule to get rid of this block.

    We provide the rule with a function that takes the heading as a parameter. This parameter is conventionally called `it`, but can have another name. The parameter can be used as content and will just display the whole default heading. Alternatively, when we want to build our own heading instead, we can use its fields like `body`, `numbering`, and `level` to compose a custom look. Here, we are just printing the body of the heading with a trailing dot and leave out the block that the built-in show rule produces. Note that this heading will no longer react to set rules for heading numbering and similar because we did not explicitly use `it.numbering` in the show rule. If you are writing show rules like this and want the document to remain customizable, you will need to take these fields into account.
  ],
  zh-status: "proofread",
  zh: [
    上例首先向之前规则的选择器增加`{.where(level: 1)}`，把那些规则限定到一级标题。接着给二级标题加了一条show-set规则。最后还有一条带自定义函数的show规则：章节标题的内容默认会放进一个块，从而独占整行；但我们希望二级标题与正文开头同行，所以要用show规则去掉这个块。

    我们给这条规则写一个函数，该函数接收章节标题作为参数。这个参数习惯上命名为`it`，不过也可任意命名。传入的这个参数可以当作内容块直接输出，按默认效果原样显示标题；不过这里我们想覆盖标题样式，所以要利用它的`body`、`numbering`、`level`等字段自行构建标题。此例中，我们只输出标题的body并加上句点，从而去掉内置show规则生成的那个块。注意这种show规则做出的标题不再支持用set规则设置标题编号，因为我们没在show规则中直接用到`it.numbering`；以后编写类似show规则时，若想保持文档可定制，就必须考虑这些字段。
  ],
)

#babel(
  en: [
    This looks great! We wrote show rules that selectively apply to the first and second level headings. We used a `where` selector to filter the headings by their level. We then rendered the subsection headings as run-ins. We also automatically add a period to the end of the subsection headings.

    Let's review the conference's style guide:
    #checked-list[
      - The font should be an 11pt serif font
      - The title should be in 17pt and bold
      - The paper contains a single-column abstract and two-column main text
      - The abstract should be centered
      - The main text should be justified
      - First level section headings should be centered, rendered in small caps and in 13pt
      - Second level headings are run-ins, italicized and have the same size as the body text
      - Finally, the pages should be US letter sized, numbered in the center and the top right corner of each page should contain the title of the paper
    ]

    We are now in compliance with all of these styles and can submit the paper to the conference! The finished paper looks like this:
  ],
  zh-status: "proofread",
  zh: [
    这看起来很棒！我们写了几条show规则，用`where`选择器筛选标题级别，有选择地分别应用于一级和二级标题。我们还让二级标题与正文开头同行，并自动在二级标题后添加句点。

    让我们对照会议样式规范检查检查：
    #checked-list[
      - 字体应为11pt，采用衬线字体
      - 标题应为17pt，加粗
      - 论文应含摘要与正文，摘要单栏而正文双栏
      - 摘要应居中，但不必两端对齐
      - 正文应两端对齐
      - 一级标题应居中，采用13pt的小型大写字母
      - 二级标题应与正文开头同行，采用与正文相同字号的斜体
      - 页面尺寸应为US letter，页脚正中写页码，每页右上角写论文标题
    ]

    现在这些样式我们全都符合了，可以向会议投稿了！完成的论文如下所示：
  ],
)

#docs-figure(
  "3-advanced-paper.png",
  alt: "The finished paper",
  width: 400,
)

= #babel(en: [Review], zh-status: "proofread", zh: [小结]) <review>
#babel(
  en: [
    You have now learned how to create titles, headers, and footers, how to use functions, show-set rules, and scopes to locally override styles, how to create more complex layouts with the @grid function, how to access element properties with context, and how to write show rules for individual functions, and the whole document. You also learned how to use the @reference:styling:show-rules[`where` selector] to filter the headings by their level.

    The paper was a great success! You've met a lot of like-minded researchers at the conference and are planning a project which you hope to publish at the same venue next year. You'll need to write a new paper using the same style guide though, so maybe now you want to create a time-saving template for you and your team?

    In the next section, we will learn how to create templates that can be reused in multiple documents. This is a more advanced topic, so feel free to come back to it later if you don't feel up to it right now.
  ],
  zh-status: "proofread",
  zh: [
    现在您已学习如何创建全文标题与页眉页脚，如何使用函数、show-set规则和样式限制的作用域，如何使用@grid\函数实现复杂布局，如何从上下文获取元素属性，以及如何针对单个函数或整篇文档编写show规则。此外您还学习了如何用@reference:styling:show-rules[`where`选择器]筛选标题级别。

    这篇论文大获成功！您在会议上遇到了很多志同道合的研究者，并计划了一个项目，希望明年在同一会议发表。不过，您需按相同样式规范再写一篇论文，所以也许您现在想为自己和团队建个能节省时间的模板？

    在下一节中，我们将学习如何创建可被多篇文档复用的模板。这个主题更高级，所以如果您觉得现在并没有必要了解，可以之后再回来看。
  ],
)
