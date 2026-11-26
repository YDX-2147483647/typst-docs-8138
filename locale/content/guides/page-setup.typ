#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, example, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Page Setup Guide",
    zh-status: "proofread",
    zh: "页面设置指南",
  ),
  route: "/guides/page-setup",
  description: babel(
    en: "An in-depth guide to setting page dimensions, margins, and page numbers in Typst. Learn how to create appealing and clear layouts and get there quickly.",
    zh-status: "need proofread",
    zh: "在Typst中设置页面尺寸、边距和页码的深入指南。了解如何创建吸引人且清晰的布局并快速实现目标。",
  ),
)

#babel(
  en: [
    Your page setup is a big part of the first impression your document gives. Line lengths, margins, and columns influence #link("https://practicaltypography.com/page-margins.html")[appearance] and #link("https://designregression.com/article/line-length-revisited-following-the-research")[legibility] while the right headers and footers will help your reader easily navigate your document. This guide will help you to customize pages, margins, headers, footers, and page numbers so that they are the right fit for your content and you can get started with writing.

    In Typst, each page has a width, a height, and margins on all four sides. The top and bottom margins may contain a header and footer. The set rule of the @page[`{page}`] element is where you control all of the page setup. If you make changes with this set rule, Typst will ensure that there is a new and conforming empty page afterward, so it may insert a page break. Therefore, it is best to specify your @page[`{page}`] set rule at the start of your document or in your template.
  ],
  zh-status: "need proofread",
  zh: [
    你的页面设置在文档的第一印象中起着重要作用。行长度、页边距和栏目布局影响着文档的#link("https://practicaltypography.com/page-margins.html")[外观]和#link("https://designregression.com/article/line-length-revisited-following-the-research")[易读性]，而合适的页眉、页脚可以帮助读者轻松地导航文档。本指南将帮助您自定义页面、页边距、页眉、页脚和页码，使其与你的内容完美匹配，让你能够开始写作。

    在Typst中，每个页面都有宽度、高度以及四个方向上的页边距。顶部和底部的页边距可以包含页眉和页脚。页面元素的设置规则是你控制页面设置的地方。如果你在这个设置规则中进行了更改，Typst会确保在之后插入一个新的符合规范的空白页面，因此可能会插入分页符。因此，最好在文档开始或模板中指定你的@page[`{page}`]设置规则。
  ],
)

```example
#set rect(
  width: 100%,
  height: 100%,
  inset: 4pt,
)
>>> #set text(6pt)
>>> #set page(margin: auto)

#set page(
  paper: "iso-b7",
  header: rect(fill: aqua)[Header],
  footer: rect(fill: aqua)[Footer],
  number-align: center,
)

#rect(fill: aqua.lighten(40%))
```

#babel(
  en: [
    This example visualizes the dimensions for page content, headers, and footers. The page content is the page size (ISO B7) minus each side's default margin. In the top and the bottom margin, there are stroked rectangles visualizing the header and footer. They do not touch the main content, instead, they are offset by 30% of the respective margin. You can control this offset by specifying the @page.header-ascent[`header-ascent`] and @page.footer-descent[`footer-descent`] arguments.

    Below, the guide will go more into detail on how to accomplish common page setup requirements with examples.
  ],
  zh-status: "need proofread",
  zh: [
    这个示例可视化了页面内容、页眉和页脚的尺寸。页面内容是页面尺寸（ISO B7）减去每个边的默认页边距。在顶部和底部边距中，用绘制的矩形来可视化页眉和页脚。它们不接触主要内容，而是通过各自边距的30%偏移。你可以通过指定@page.header-ascent[`header-ascent`]和@page.footer-descent[`footer-descent`]参数来控制这个偏移量。

    接下来，本指南将更详细地介绍如何通过示例来满足常见的页面设置要求。
  ],
)

= #babel(
  en: short-or-long[Customize Margins][Customize page size and margins],
  zh-status: "need proofread",
  zh: [自定义页面尺寸和页边距],
) <customize-margins>
#babel(
  en: [
    Typst's default page size is A4 paper. Depending on your region and your use case, you will want to change this. You can do this by using the @page[`{page}`] set rule and passing it a string argument to use a common page size. Options include the complete ISO 216 series (e.g. `"a4"` and `"iso-c2"`), customary US formats like `"us-legal"` or `"us-letter"`, and more. Check out the reference for the @page.paper[page's paper argument] to learn about all available options.
  ],
  zh-status: "need proofread",
  zh: [
    Typst的默认页面大小是A4纸张。根据你所在的地区和使用情况，你可能希望进行更改。你可以通过使用@page[`{page}`]设置规则，并传递一个字符串参数来使用常见的页面大小来实现这一点。选项包括完整的ISO 216系列（例如`"iso-a4"`、`"iso-c2"`）、美国习惯格式如`"us-legal"`或`"us-letter"`，以及其他选项。查阅有关@page.paper[page的paper参数]的参考文档，了解所有可用选项。
  ],
)

```example
>>> #set page(margin: auto)
#set page("us-letter")

This page likes freedom.
```

#babel(
  en: [
    If you need to customize your page size to some dimensions, you can specify the named arguments @page.width[`width`] and @page.height[`height`] instead.
  ],
  zh-status: "need proofread",
  zh: [
    如果你需要根据特定尺寸自定义页面大小，可以使用命名参数@page.width[`width`]和@page.height[`height`]进行指定。
  ],
)

```example
>>> #set page(margin: auto)
#set page(width: 12cm, height: 12cm)

This page is a square.
```

== #babel(
  en: short-or-long[Change Margins][Change the page's margins],
  zh-status: "need proofread",
  zh: [更改页边距],
) <change-margins>
#babel(
  en: [
    Margins are a vital ingredient for good typography: #link("https://webtypography.net/2.1.2")[Typographers consider lines that fit between 45 and 75 characters best length for legibility] and your margins and @guides:page-setup:columns[columns] help define line widths. By default, Typst will create margins proportional to the page size of your document. To set custom margins, you will use the @page.margin[`margin`] argument in the @page[`{page}`] set rule.

    The `margin` argument will accept a length if you want to set all margins to the same width. However, you often want to set different margins on each side. To do this, you can pass a dictionary:
  ],
  zh-status: "need proofread",
  zh: [
    边距是一个良好排版的重要组成部分：#link("http://webtypography.net/2.1.2")[排版师认为每行容纳45到75个字符的长度最适合易读性]，而边距和@guides:page-setup:columns[栏目]则有助于定义行宽。默认情况下，Typst将根据文档的页面大小创建比例适当的边距。要设置自定义边距，你可以在@page[`{page}`]设置规则中使用@page.margin[`margin`]参数。

    如果你想将所有边距设置为相同的宽度，`margin`参数接受一个长度值。然而，通常情况下你可能希望在每个边上设置不同的边距。为了实现这一点，你可以传递一个字典：
  ],
)


```example
#set page(margin: (
  top: 3cm,
  bottom: 2cm,
  x: 1.5cm,
))

#lorem(100)
```

#babel(
  en: [
    The page margin dictionary can have keys for each side (`top`, `bottom`, `left`, `right`), but you can also control left and right together by setting the `x` key of the margin dictionary, like in the example. Likewise, the top and bottom margins can be adjusted together by setting the `y` key.

    If you do not specify margins for all sides in the margin dictionary, the old margins will remain in effect for the unset sides. To prevent this and set all remaining margins to a common size, you can use the `rest` key. For example, `[#set page(margin: (left: 1.5in, rest: 1in))]` will set the left margin to 1.5 inches and the remaining margins to one inch.
  ],
  zh-status: "need proofread",
  zh: [
    页边距字典可以有每个边的键（`top`、`bottom`、`left`、`right`），但你也可以通过设置页边距字典的`x`键来同时控制左右边距，就像示例中所示。同样地，通过设置`y`键，可以同时调整顶部和底部边距。

    如果在页边距字典中没有为所有边指定边距，那么未设置的边将保持原有的边距设置。为了防止这种情况，并将所有剩余的边距设置为相同的大小，你可以使用`rest`键。例如，`[#set page(margin: (left: 1.5in, rest: 1in))]` 将把左边距设置为1.5英寸，其余边距设置为1英寸。
  ],
)

== #babel(
  en: short-or-long[Alternating Margins][Different margins on alternating pages],
  zh-status: "need proofread",
  zh: [在交替的页面上设置不同的边距],
) <alternating-margins>
#babel(
  en: [
    Sometimes, you'll need to alternate horizontal margins for even and odd pages, for example, to have more room towards the spine of a book than on the outsides of its pages. Typst keeps track of whether a page is to the left or right of the binding. You can use this information and set the `inside` or `outside` keys of the margin dictionary. The `inside` margin points towards the spine, and the `outside` margin points towards the edge of the bound book.
  ],
  zh-status: "need proofread",
  zh: [
    有时候，你需要在奇偶页之间交替设置水平边距，例如，在书籍的内侧（靠近书脊）需要更多的空间，而在页面的外侧需要较小的边距。Typst会跟踪每个页面是在书脊的左侧还是右侧。你可以利用这个信息，并设置边距字典的`inside`或`outside`键。`inside`边距是指向书脊的边距，`outside`边距是指向装订书籍边缘的边距。
  ],
)

```typ
#set page(margin: (inside: 2.5cm, outside: 2cm, y: 1.75cm))
```

#babel(
  en: [
    Typst will assume that documents written in Left-to-Right scripts are bound on the left while books written in Right-to-Left scripts are bound on the right. However, you will need to change this in some cases: If your first page is output by a different app, the binding is reversed from Typst's perspective. Also, some books, like English-language Mangas are customarily bound on the right, despite English using Left-to-Right script. To change the binding side and explicitly set where the `inside` and `outside` are, set the @page.binding[`binding`] argument in the @page[`{page}`] set rule.
  ],
  zh-status: "need proofread",
  zh: [
    Typst假设从左到右书写的文档左侧装订，而从右到左书写的书籍右侧装订。然而，在某些情况下，你需要进行更改：如果你的第一页由其他应用程序生成，则从Typst的角度来看，装订方式会相反。此外，一些书籍，如英语漫画，尽管使用从左到右的写作顺序，但习惯上是右侧装订。为了改变装订的一侧并明确设置`inside`和`outside`的位置，你可以在@page[`{page}`]设置规则中使用@page.binding[`binding`]参数。
  ],
)

```typ
// Produce a book bound on the right,
// even though it is set in Spanish.
#set text(lang: "es")
#set page(binding: right)
```

#babel(
  en: [
    If `binding` is `left`, `inside` margins will be on the left on odd pages, and vice versa.
  ],
  zh-status: "need proofread",
  zh: [
    如果`binding`参数设置为`left`,则在奇数页上，`inside`边距将位于左侧，而偶数页上则相反。
  ],
)

= #babel(
  en: short-or-long[Headers And Footers][Add headers and footers],
  zh-status: "need proofread",
  zh: [添加页眉和页脚],
)  <headers-and-footers>
#babel(
  en: [
    Headers and footers are inserted in the top and bottom margins of every page. You can add custom headers and footers or just insert a page number.

    In case you need more than just a page number, the best way to insert a header and a footer are the @page.header[`header`] and @page.footer[`footer`] arguments of the @page[`{page}`] set rule. You can pass any content as their values:
  ],
  zh-status: "need proofread",
  zh: [
    每个页面的顶部和底部边距中都可以插入页眉和页脚。你可以添加自定义的页眉和页脚，或者只插入页码。

    如果你需要更多内容而不仅仅是页码，最好的方法是使用@page[`{page}`]设置规则中的@page.header[`header`]和@page.footer[`footer`]参数来插入页眉和页脚。你可以传递任何内容作为它们的值：
  ],
)

```example
>>> #set page("a5", margin: (x: 2.5cm, y: 3cm))
#set page(header: [
  _Lisa Strassner's Thesis_
  #h(1fr)
  National Academy of Sciences
])

#lorem(150)
```

#babel(
  en: [
    Headers are bottom-aligned by default so that they do not collide with the top edge of the page. You can change this by wrapping your header in the @align[`{align}`] function.
  ],
  zh-status: "need proofread",
  zh: [
    默认情况下，页眉是底部对齐的，以避免与页面顶部边缘发生冲突。如果你想修改对齐方式，可以将页眉内容包裹在@align[`{align}`]函数中。
  ],
)

== #babel(
  en: short-or-long[Specific Pages][Different header and footer on specific pages],
  zh-status: "need proofread",
  zh: [在特定页面上使用不同的页眉和页脚],
) <specific-pages>
#babel(
  en: [
    You'll need different headers and footers on some pages. For example, you may not want a header and footer on the title page. The example below shows how to conditionally remove the header on the first page:
  ],
  zh-status: "need proofread",
  zh: [
    你可能需要在某些页面上使用不同的页眉和页脚。例如，你可能不希望在标题页上显示页眉和页脚。下面的示例展示了如何根据条件在第一页上移除页眉：
  ],
)

```typ
#set page(header: context {
  if counter(page).get().first() > 1 [
    _Lisa Strassner's Thesis_
    #h(1fr)
    National Academy of Sciences
  ]
})

#lorem(150)
```

#babel(
  en: [
    This example may look intimidating, but let's break it down: By using the `{context}` keyword, we are telling Typst that the header depends on where we are in the document. We then ask Typst if the page @counter[counter] is larger than one at our (context-dependent) current position. The page counter starts at one, so we are skipping the header on a single page. Counters may have multiple levels. This feature is used for items like headings, but the page counter will always have a single level, so we can just look at the first one.

    You can, of course, add an `else` to this example to add a different header to the first page instead.
  ],
  zh-status: "need proofread",
  zh: [
    这个示例可能看起来有点复杂，但我们来逐步解释一下：我们告诉Typst页眉取决于当前的@locate[位置]。`loc`值允许其他函数了解我们当前所在页面的位置。然后，我们询问Typst当前位置的页面计数器是否大于1。页面计数器从1开始，所以我们在只有一页的情况下跳过页眉。计数器可以有多个级别。这个功能用于类似标题的项目，但页面计数器始终只有一个级别，所以我们只需要查看第一个级别。

    当然，你可以在这个示例中添加一个`else`语句，以在第一页上添加不同的页眉。
  ],
)

== #babel(
  en: short-or-long[Specific Elements][Adapt headers and footers on pages with specific elements],
  zh-status: "need proofread",
  zh: [根据特定元素在页面上调整页眉和页脚],
) <specific-elements>
#babel(
  en: [
    The technique described in the previous section can be adapted to perform more advanced tasks using Typst's labels. For example, pages with big tables could omit their headers to help keep clutter down. We will mark our tables with a `<big-table>` @label[label] and use the @query[query system] to find out if such a label exists on the current page:
  ],
  zh-status: "need proofread",
  zh: [
    先前指南中描述的一种技术，可以根据Typst的标签执行更高级的任务。例如，具有大型表格的页面可以省略页眉，以减少混乱。我们可以使用`<big-table>`@label[标签]来标记我们的表格，并使用@query[查询系统]来判断当前页面是否存在这样的标签：
  ],
)

```typ
#set page(header: context {
  let matches = query(<big-table>)
  let current = counter(page).get()
  let has-table = matches.any(m =>
    counter(page).at(m.location()) == current
  )

  if not has-table [
    _Lisa Strassner's Thesis_
    #h(1fr)
    National Academy of Sciences
  ]
})

#lorem(100)
#pagebreak()

#table(
  columns: 2 * (1fr,),
  [A], [B],
  [C], [D],
) <big-table>
```

#babel(
  en: [
    Here, we query for all instances of the `<big-table>` label. We then check that none of the tables are on the page at our current position. If so, we print the header. This example also uses variables to be more concise. Just as above, you could add an `else` to add another header instead of deleting it.
  ],
  zh-status: "need proofread",
  zh: [
    在这个示例中，我们查询所有`<big-table>`标签的实例。然后，我们检查当前位置的页面上是否有任何表格。如果没有，则打印页眉。这个示例还使用了变量以使代码更简洁。就像之前一样，你可以添加一个`else`语句来添加另一个页眉，而不是删除它。
  ],
)

= #babel(
  en: short-or-long[Page Numbers][Add and customize page numbers],
  zh-status: "need proofread",
  zh: [添加和自定义页码],
) <page-numbers>
#babel(
  en: [
    Page numbers help readers keep track of and reference your document more easily. The simplest way to insert page numbers is the @page.numbering[`numbering`] argument of the @page[`{page}`] set rule. You can pass a @numbering.numbering[_numbering pattern_] string that shows how you want your pages to be numbered.
  ],
  zh-status: "need proofread",
  zh: [
    页码可以帮助读者更轻松地跟踪和引用你的文档。插入脚注的最简单方法是使用@page[`{page}`]设置规则的@page.numbering[`numbering`]参数。你可以传递一个表示页码格式的@numbering.numbering[_编号模式_]字符串。
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(numbering: "1")

This is a numbered page.
```

#babel(
  en: [
    Above, you can check out the simplest conceivable example. It adds a single Arabic page number at the center of the footer. You can specify other characters than `"1"` to get other numerals. For example, `"i"` will yield lowercase Roman numerals. Any character that is not interpreted as a number will be output as-is. For example, put dashes around your page number by typing this:
  ],
  zh-status: "need proofread",
  zh: [
    在上面的示例中，你可以看到最简单的示例。它在页脚的中央添加了一个阿拉伯数字的页码。你可以指定除了`"1"`之外的其他字符来获取其他数字形式。例如，使用`"i"`将生成小写的罗马数字。任何不被解释为数字的字符都将按原样输出。例如，要在页码周围加上破折号，可以输入以下内容：
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(numbering: "— 1 —")

This is a — numbered — page.
```

#babel(
  en: [
    You can add the total number of pages by entering a second number character in the string.
  ],
  zh-status: "need proofread",
  zh: [
    你可以通过在字符串中添加第二个数字字符来添加总页数。
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(numbering: "1 of 1")

This is one of many numbered pages.
```

#babel(
  en: [
    Go to the @numbering.numbering[`{numbering}` function reference] to learn more about the arguments you can pass here.

    In case you need to right- or left-align the page number, use the @page.number-align[`number-align`] argument of the @page[`{page}`] set rule. Alternating alignment between even and odd pages is not currently supported using this property. To do this, you'll need to specify a custom footer and query the page counter as described in the section on conditionally omitting headers and footers.
  ],
  zh-status: "need proofread",
  zh: [
    要了解可以在此处传递的参数，请查阅@numbering.numbering[`{numbering}`]函数的参考文档。

    如果你需要将页码右对齐或左对齐，可以使用@page[`{page}`]设置规则的@page.number-align[`number-align`]参数。然而，请注意，目前无法使用此属性实现偶数页和奇数页之间的交替对齐。要实现这一点，你需要指定一个自定义的页脚，并按照在有关有条件省略页眉和页脚的部分中描述的方式查询页面计数器。
  ],
)

== #babel(
  en: [Custom footer with page numbers],
  zh-status: "need proofread",
  zh: [自定义带页码的页脚],
) <custom-footer-with-page-numbers>
#babel(
  en: [
    Sometimes, you need to add other content than a page number to your footer. However, once a footer is specified, the @page.numbering[`numbering`] argument of the @page[`{page}`] set rule is ignored. This section shows you how to add a custom footer with page numbers and more.
  ],
  zh-status: "need proofread",
  zh: [
    有时候，你需要在页脚中添加除了页码以外的其他内容。然而，一旦指定了页脚，@page[`{page}`]设置规则的@page.numbering[`numbering`]参数将被忽略。本节将向你展示如何添加带有页码和其他内容的自定义页脚。
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(footer: context [
  *American Society of Proceedings*
  #h(1fr)
  #counter(page).display(
    "1/1",
    both: true,
  )
])

This page has a custom footer.
```

#babel(
  en: [
    First, we add some strongly emphasized text on the left and add free space to fill the line. Then, we call `counter(page)` to retrieve the page counter and use its `display` function to show its current value. We also set `both` to `{true}` so that our numbering pattern applies to the current _and_ final page number.

    We can also get more creative with the page number. For example, let's insert a circle for each page.
  ],
  zh-status: "need proofread",
  zh: [
    首先，我们在左侧添加了一些强调文本，并添加了自由空间来填充行。然后，我们调用`counter(page)`来获取页面计数器，并使用其`display`函数来显示当前值。我们还将`both`设置为`{true}`，以便我们的编号模式适用于当前页码和最终页码。

    我们还可以对页码进行更有创意的处理。例如，让我们为每个页面插入一个圆圈。
  ],
)

```example
>>> #set page("iso-b6", margin: 1.75cm)
#set page(footer: context [
  *Fun Typography Club*
  #h(1fr)
  #let (num,) = counter(page).get()
  #let circles = num * (
    box(circle(
      radius: 2pt,
      fill: navy,
    )),
  )
  #box(
    inset: (bottom: 1pt),
    circles.join(h(1pt))
  )
])

This page has a custom footer.
```

#babel(
  en: [
    In this example, we use the number of pages to create an array of @circle[circles]. The circles are wrapped in a @box[box] so they can all appear on the same line because they are blocks and would otherwise create paragraph breaks. The length of this @array[array] depends on the current page number.

    We then insert the circles at the right side of the footer, with 1pt of space between them. The join method of an array will attempt to @reference:scripting:blocks[_join_] the different values of an array into a single value, interspersed with its argument. In our case, we get a single content value with circles and spaces between them that we can use with the align function. Finally, we use another box to ensure that the text and the circles can share a line and use the @box.inset[`inset` argument] to raise the circles a bit so they line up nicely with the text.
  ],
  zh-status: "need proofread",
  zh: [
    在这个示例中，我们根据页面数量创建了一个包含@circle[圆圈]的数组。圆圈被包装在一个@box[box]中，这样它们就可以出现在同一行上，因为它们是块级元素，否则会创建段落换行。该数组的长度取决于当前页码。

    然后，我们将圆圈插入到页脚的右侧，并在它们之间留出1pt的空间。数组的@reference:scripting:blocks[`join`]方法将尝试将数组的不同值连接成一个单一的值，并以其参数为间隔插入。在我们的示例中，我们获得了一个带有圆圈和它们之间空格的单一内容值，我们可以将其与`align`函数一起使用。最后，我们使用另一个`box`来确保文本和圆圈可以共享一行，并使用@box.inset[`inset`]参数将圆圈稍微提高，以便与文本对齐。
  ],
)

== #babel(
  en: short-or-long[Skip Pages][Reset the page number and skip pages],
  zh-status: "need proofread",
  zh: [重置页码或跳过页码],
) <skip-pages>
#babel(
  en: [
    Do you, at some point in your document, need to reset the page number? Maybe you want to start with the first page only after the title page. Or maybe you need to skip a few page numbers because you will insert pages into the final printed product.

    The right way to modify the page number is to manipulate the page @counter[counter]. The simplest manipulation is to set the counter back to 1.
  ],
  zh-status: "need proofread",
  zh: [
    你是否需要在文档中的某个地方重置页码？也许你想在标题页之后开始。或者你需要跳过一些页码，因为你将在最终的打印产品中插入页面。

    正确修改页码的方式是操作页面计数器@counter。最简单的操作是将计数器设置回1。
  ],
)

```typ
#counter(page).update(1)
```

#babel(
  en: [
    This line will reset the page counter back to one. It should be placed at the start of a page because it will otherwise create a page break. You can also update the counter given its previous value by passing a function:
  ],
  zh-status: "need proofread",
  zh: [
    这行代码将页码计数器重置为1。它应该放置在页面的开头，否则会创建一个页面分隔。你也可以通过传递一个函数来更新计数器，给定其先前的值：
  ],
)

```typ
#counter(page).update(n => n + 5)
```

#babel(
  en: [
    In this example, we skip five pages. `n` is the current value of the page counter and `n + 5` is the return value of our function.

    In case you need to retrieve the actual page number instead of the value of the page counter, you can use the @location.page[`page`] method on the return value of the @here function:
  ],
  zh-status: "need proofread",
  zh: [
    在这个示例中，我们跳过了五页。`n`是页面计数器的当前值，`n+5`是我们函数的返回值。

    如果你需要获取实际的页码而不是页面计数器的值，你可以在`locate`闭包的参数上使用@page[`{page}`]方法：
  ],
)

```example
#counter(page).update(n => n + 5)

// This returns one even though the
// page counter was incremented by 5.
#context here().page()
```

#babel(
  en: [
    You can also obtain the page numbering pattern from the location returned by `here` with the @location.page-numbering[`page-numbering`] method.
  ],
  zh-status: "need proofread",
  zh: [
    你还可以通过`locate`闭包参数使用@locate[`page-numbering`]方法获取页码编号模式。
  ],
)

= #babel(en: short-or-long[Columns][Add columns], zh-status: "need proofread", zh: [添加栏]) <columns>
#babel(
  en: [
    Add columns to your document to fit more on a page while maintaining legible line lengths. Columns are vertical blocks of text which are separated by some whitespace. This space is called the gutter.

    To lay out your content in columns, just specify the desired number of columns in a @page.columns[`{page}`] set rule. To adjust the amount of space between the columns, add a set rule on the @columns[`columns` function], specifying the `gutter` parameter.
  ],
  zh-status: "need update",
  zh: [
    要在文档中保持易读行长度的同时适应更多内容，请使用栏。栏是由一些空白分隔的垂直文本块。这个空白区域被称为gutter（装订线）。

    如果你的所有内容都需要以栏的方式布局，你可以在@page.columns[`{page}`]设置规则中指定所需的栏数：
  ],
)

```example
>>> #set page(height: 120pt)
#set page(columns: 2)
#set columns(gutter: 12pt)

#lorem(30)
```

#babel(
  en: [
    Very commonly, scientific papers have a single-column title and abstract, while the main body is set in two-columns. To achieve this effect, Typst's @place[`place` function] can temporarily escape the two-column layout by specifying `{float: true}` and `{scope: "parent"}`:
  ],
  zh-status: "need update",
  zh: [
    在科学论文中，非常常见的是标题和摘要以单栏形式呈现，而正文以双栏形式呈现。为了实现这种效果，Typst包含了一个独立的@columns[`{columns}`]函数，可以在页面的任何位置插入栏。
  ],
)

#example(
  single: true,
  ```
  >>> #set page(height: 180pt)
  >>> #show heading.where(level: 1): set text(size: 0.9em)
  #set document(
    title: [Impacts of Odobenidae],
  )
  #set page(columns: 2)
  #set par(justify: true)

  #place(
    top + center,
    float: true,
    scope: "parent",
    title(),
  )

  = About seals in the wild
  #lorem(80)
  ```,
)

_Floating placement_ refers to elements being pushed to the top or bottom of the column or page, with the remaining content flowing in between. It is also frequently used for @figure.placement[figures].

== #babel(
  en: short-or-long[Columns Anywhere][Use columns anywhere in your document],
  zh-status: "need proofread",
  zh: [在文档的任何位置使用栏],
) <columns-anywhere>
#babel(
  en: [
    To create columns within a nested layout, e.g. within a rectangle, you can use the @columns[`columns` function] directly. However, it really should only be used within nested layouts. At the page-level, the page set rule is preferable because it has better interactions with things like page-level floats, footnotes, and line numbers.
  ],
  zh-status: "need update",
  zh: [
    `columns` 函数的另一个用法是在类似矩形的容器内创建栏，或者自定义装订线的大小：
  ],
)

```example
#rect(
  width: 6cm,
  height: 3.5cm,
  columns(2, gutter: 12pt)[
    In the dimly lit gas station,
    a solitary taxi stood silently,
    its yellow paint fading with
    time. Its windows were dark,
    its engine idle, and its tires
    rested on the cold concrete.
  ]
)
```

== #babel(en: [Balanced columns], zh-status: "need proofread", zh: [平衡栏的长度])<balanced-columns>
#babel(
  en: [
    If the columns on the last page of a document differ greatly in length, they may create a lopsided and unappealing layout. That's why typographers will often equalize the length of columns on the last page. This effect is called balancing columns. Typst cannot yet balance columns automatically. However, you can balance columns manually by placing @colbreak[`[#colbreak()]`] at an appropriate spot in your markup, creating the desired column break manually.
  ],
  zh-status: "need proofread",
  zh: [
    如果文档的最后一页上的栏长度差异很大，可能会产生不平衡和不吸引人的布局。这就是为什么排版师经常会在最后一页上平衡栏的长度。这种效果称为平衡栏。Typst目前无法自动平衡栏。然而，你可以通过在你的标记中适当的位置放置@colbreak[`[#colbreak()]`]来手动平衡栏，从而手动创建所需的栏分隔。
  ],
)

= #babel(en: [One-off modifications], zh-status: "need proofread", zh: [单次修改]) <one-off-modifications>
#babel(
  en: [
    You do not need to override your page settings if you need to insert a single page with a different setup. For example, you may want to insert a page that's flipped to landscape to insert a big table or change the margin and columns for your title page. In this case, you can call @page[`{page}`] as a function with your content as an argument and the overrides as the other arguments. This will insert enough new pages with your overridden settings to place your content on them. Typst will revert to the page settings from the set rule after the call.
  ],
  zh-status: "need proofread",
  zh: [
    如果你只需要插入一个具有不同设置的单独页面，就无需覆盖整个页面设置。例如，你可能想插入一个横向页面以插入一个大表格，或者为标题页更改边距和列数。在这种情况下，你可以将@page[`{page}`]作为一个带有内容作为参数和其他参数为覆盖设置的函数进行调用。这将插入足够多的新页面，并使用你的覆盖设置来放置你的内容。在调用结束后，Typst将恢复到设置规则中的页面设置。
  ],
)

```example
>>> #set page("a6")
#page(flipped: true)[
  = Multiplication table

  #table(
    columns: 5 * (1fr,),
    ..for x in range(1, 10) {
      for y in range(1, 6) {
        (str(x*y),)
      }
    }
  )
]
```
