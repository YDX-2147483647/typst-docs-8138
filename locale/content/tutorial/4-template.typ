#import "/i18n-scope.typ": babel, note
#import "/components/index.typ": docs-chapter, example, kbd, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Making a Template",
    zh-status: "proofread",
    zh: "制作模板",
  ),
  route: "/tutorial/making-a-template",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
)

#babel(
  en: [
    In the previous three chapters of this tutorial, you have learned how to write a document in Typst, apply basic styles, and customize its appearance in-depth to comply with a publisher's style guide. Because the paper you wrote in the previous chapter was a tremendous success, you have been asked to write a follow-up article for the same conference. This time, you want to take the style you created in the previous chapter and turn it into a reusable template. In this chapter you will learn how to create a template that you and your team can use with just one show rule. Let's get started!
  ],
  zh-status: "proofread",
  zh: [
    在教程前三章，您学习了如何用Typst撰写文档，设置基本格式，并按出版社规范深入定制样式。您在前一章写的论文大获成功，因而受邀为这一会议再写一篇后续文章。这次您打算把前一章实现的样式转成可复用的模板。本章我们将学习如何制作模板，做好后自己和团队只用一条show规则即可使用。让我们开始吧！
  ],
)

= #babel(
  en: short-or-long[Variables][Reusing data with variables],
  zh-status: "proofread",
  zh: short-or-long[使用变量][利用变量复用数据],
) <variables>

#babel(
  en: [
    In the past chapters, most of the content of the document was entered by hand. In the third chapter, we used the `document` element and context to cut down on repetition and only enter the title once. But in practice, there may be many more things that occur multiple times in your document. There are multiple good reasons to just define these repeated values once:

    + It makes changing them later easier
    + It allows you to quickly find all instances where you used something
    + It makes it easy to be consistent throughout
    + For long or hard-to-enter repeated segments, a shorter variable name is often more convenient to type

    If you were using a conventional word processor, you might resort to using a placeholder value that you can later search for. In Typst, however, you can instead use variables to safely store content and reuse it across your whole document through a variable name.

    The technique of using context to reproduce an element's property we have learned earlier is not always the most appropriate for this: Typst's built-in elements focus on semantic properties like the title and description of a document, or things that directly relate to typesetting, like the text size.
  ],
  zh-status: "proofread",
  zh: [
    在前几章中，文档内容大多手动输入；只有全文标题我们在第三章利用`document`元素和上下文避免了重复，只需输入一次。不过实际写作时，标题以外的很多东西也可能在文中多次出现。如果重复内容能只定义一遍，会有很多好处：

    + 日后容易修改
    + 能快速找到它出现的所有地方
    + 便于全文保持一致
    + 对于冗长难输入的重复内容，用短变量名更方便输入

    若用传统文字处理软件，您要先写个占位内容，等写完了再全文查找替换。而用Typst时，您可以用变量安全地存储内容，然后用变量名在文档各处复用。

    我们之前学的那种从上下文获取元素属性的办法，有时并不适合复用一般内容：Typst内置元素关注的主要是文档标题、描述等语义属性，以及字号等直接用于排版的属性。
  ],
)

#babel(
  en: [
    For our example, we want to take a look at Typst's pronunciation. One of the best ways to transcribe pronunciation is the International Phonetic Alphabet (IPA). But because it uses characters not found on common keyboards, typing IPA repeatedly can become cumbersome. So let's instead define a variable that we can reference multiple times.
  ],
  zh-status: "proofread",
  zh: [
    举个例子，假设我们要反复描述Typst的发音。国际音标（International Phonetic Alphabet, IPA）最适合标注发音，但它用的字符很难用普通键盘输入，所以频繁输入音标很麻烦。因此，我们定义一个变量来复用音标。
  ],
)

```typ
#let ipa = [taɪpst]
```

#babel(
  en: [
    Here, we use a new keyword, `{let}`, to indicate a variable definition. Then, we put the name of our variable, in this case, `ipa`. Finally, we type an equals sign and the value of our variable. It is enclosed in square brackets because it is content, mirroring how you would call a function accepting content. In other words, this syntax mirrors the phrase _"Let the variable `ipa` have the value `{[taɪpst]}`."_

    Now, we can use the variable in our document:
  ],
  zh-status: "proofread",
  zh: [
    这里我们用新关键字`{let}`表示定义变量，其后加上变量名，此例中即`ipa`，最后加上等号和变量值。这里变量值是个内容块，所以要用方括号包裹，和给函数传入内容块参数时类似。总而言之，这一语法表示「_令变量`ipa`取值`{[taɪpst]}`_」。

    定义后就可在文中使用变量了：
  ],
)

```example
#let ipa = [taɪpst]

The canonical way to
pronounce Typst is #ipa.

#table(
  columns: (1fr, 1fr),
  [Name], [Typst],
  [Pronunciation], ipa,
)
```

#babel(
  en: [
    In the example, you can see that the variable can be used both in markup (prefixed with a `#`) and in a function call (by just typing its name). Of course, we can change the value of the variable and all its occurrences will automatically change with it. Let's make it a bit clearer what is IPA and what is normal prose by rendering IPA in italics. We are also using slashes which, by convention, often enclose IPA.
  ],
  zh-status: "proofread",
  zh: [
    从上例可以看出，变量既可用于标记模式（变量名需前缀`#`），也可用于函数调用（只写变量名即可）。变量的值当然可以修改，变量出现的所有地方也会自动随之刷新。下面我们把音标改为斜体以区别于普通正文，同时给音标加上斜线以符合音标习惯。

    #note[
      【译注】其实音标习惯用正体，而斜体可能有特殊含义（有些词典上音标字母用斜体表示发音可被省略）。此处仅作排版示例，切勿用于语音学研究。
    ]
  ],
)

```example
#let ipa = text(
  style: "italic",
<<< )[/taɪpst/]
>>> box[/taɪpst/])

The canonical way to
pronounce Typst is #ipa.

#table(
  columns: (1fr, 1fr),
  [Name], [Typst],
  [Pronunciation], ipa,
)
```

#babel(
  en: [
    Here, we called the text function and assigned its _return value_ to the variable. When you call a function, it processes its arguments and then yields another value (often content). So far in this tutorial, we called most functions directly in markup, like this: `[#text(fill: red)[CRIMSON!]]`. This call to the text function returns the red text as a return value. Because we placed it in markup, its return value just immediately got inserted into the content we wrote. With variables, we can instead store it to use it later or compose it with other values.

    Variables are not limited to storing content: they can store any data type Typst knows about. Throughout this tutorial, you made use of many data types when you passed them to Typst's built-in functions. Here is an example assigning each of them to a variable:

    ```typ
    // Content with markup inside
    #let blind-text = [_Lorem ipsum_ dolor sit amet]

    // Unformatted strings
    #let funny-font = "MS Comic Sans"

    // Absolute lengths (see also pt, in, ...)
    #let mile = 160934cm

    // Lengths relative to the font size
    #let double-space = 2em

    // Ratios
    #let progress = 80%

    // Integer numbers
    #let answer = 42

    // Booleans
    #let truth = false

    // Horizontal and vertical alignment
    #let focus = center
    ```
  ],
  zh-status: "proofread",
  zh: [
    这里我们调用text函数，将其_返回值_赋给变量。调用函数时，函数会接收若干参数，再生成另一个值（通常是个内容块）。目前为止，本教程大多直接在标记模式调用函数，例如：`[#text(fill: red)[CRIMSON!]]`。这样调用text函数生成的红色文字就是这次调用的返回值。由于那是在标记模式，生成的返回值就直接插入我们写的内容了；而有了变量，我们可以先存下返回值，之后再使用，或者与其它值组合使用。

    变量能存储的东西不限于内容块：它可以存储Typst支持的任意数据类型。本教程把参数传给Typst内置函数时，已经涉及了很多数据类型。作为示例，下面把每种都赋给一个变量：

    ```typ
    // 包含标记的内容块
    #let blind-text = [_Lorem ipsum_ dolor sit amet]

    // 不带格式的字符串
    #let funny-font = "MS Comic Sans"

    // 绝对长度；除了厘米cm，还有点pt、英寸in之类的
    #let mile = 160934cm

    // 相对于字号尺寸的长度
    #let double-space = 2em

    // 百分比
    #let progress = 80%

    // 整数
    #let answer = 42

    // 布尔值
    #let truth = false

    // 水平和竖直对齐方式
    #let focus = center
    ```
  ],
)


#babel(
  en: [
    In this chapter of the tutorial, you will leverage variables and your own functions to build templates that can be reused across multiple documents.
  ],
  zh-status: "proofread",
  zh: [
    本章教程中，您将使用变量并自己定义函数，最终制作出可被多篇文档复用的模板。
  ],
)

= #babel(en: short-or-long[Toy Template][A toy template], zh-status: "proofread", zh: [玩具模板]) <toy-template>
#babel(
  en: [
    In Typst, templates are functions in which you can wrap your whole document. To learn how to do that, let's first review how to write your very own functions. They can do anything you want them to, so why not go a bit crazy?
  ],
  zh-status: "proofread",
  zh: [
    在Typst中，模板就是能把整篇文档套进去的函数。要学习制作模板，首先要回顾如何自己定义函数。函数可以做任何事情，这次我们何不疯狂一些？
  ],
)

```example
#let amazed(term) = box[✨ #term ✨]

You are #amazed[beautiful]!
```

#babel(
  en: [
    Comparing this against the previous section, you may have noticed that this looks a lot like a variable definition using `{let}`. This instinct is correct: Functions are just another data type. Here, we are defining the variable `amazed`, assigning it a function that takes a single argument, `term`, and returns content with the `term` surrounded by sparkles. We also put the whole thing in a @box so that the term we are amazed by cannot be separated from its sparkles by a line break. The special function definition syntax makes the definition shorter and more readable, but you can also use the regular variable definition syntax (see @reference:scripting:bindings[the scripting reference] for details). After its definition, we are able to call the function just like all built-in functions.

    Many functions that come with Typst have optional named parameters. Our functions can also have them. Let's add a parameter to our function that lets us choose the color of the text. We need to provide a default color in case the parameter isn't given.
  ],
  zh-status: "proofread",
  zh: [
    对比前一节，您大约会注意到这很像用`{let}`定义变量。确实如此：函数不过是又一种数据类型罢了。这里我们定义了变量`amazed`，该变量是个函数，它接收单个参数`term`，在`term`两边加上小火花，然后作为内容块返回出来。我们还把这一整段套在@box\里，避免`term`与小火花被断成两行。定义函数的这种特殊语法更简短易读，不过您也可用定义一般变量的语法定义函数（具体请参考@reference:scripting:bindings[脚本]）。定义函数后就能调用它了，方法和调用内置函数一样。

    Typst内置的许多函数都有可选的命名参数，我们的函数也可以有。下面给我们的函数加个参数，用于选择文本颜色。我们需要提供默认颜色，以防调用时未传入该参数。
  ],
)

```example
#let amazed(term, color: blue) = {
  text(color, box[✨ #term ✨])
}

You are #amazed[beautiful]!
I am #amazed(color: purple)[amazed]!
```

#babel(
  en: [
    Templates now work by wrapping our whole document in a custom function like `amazed`. But wrapping a whole document in a giant function call would be cumbersome! Instead, we can use an "everything" show rule to achieve the same with cleaner code. To write such a show rule, put a colon directly after the show keyword and then provide a function. This function is given the rest of the document as a parameter. The function can then do anything with this content. Since the `amazed` function can be called with a single content argument, we can just pass it by name to the show rule. Let's try it:
  ],
  zh-status: "proofread",
  zh: [
    模板的用法是将整篇文档套进`amazed`这样的自定义函数。然而把整篇文档写成一个巨大的函数调用会十分麻烦！作为替代，我们写一条应用于「全部内容」的show规则（以下简称「show-全部规则」），更简洁地实现相同效果。要编写这种show规则，请在show关键字后直接写上冒号，然后再放个函数。文档全部剩余内容会作为一个参数传入该函数，而该函数可对这些内容任意操作。由于`amazed`函数可接收单个内容块参数，show规则直接放函数名即可。试一下：
  ],
)

```example
>>> #let amazed(term, color: blue) = {
>>>   text(color, box[✨ #term ✨])
>>> }
#show: amazed
I choose to focus on the good
in my life and let go of any
negative thoughts or beliefs.
In fact, I am amazing!
```

#babel(
  en: [
    Our whole document will now be passed to the `amazed` function, as if we wrapped it around it. Of course, this is not especially useful with this particular function, but when combined with set rules and named arguments, it can be very powerful.
  ],
  zh-status: "proofread",
  zh: [
    现在整篇文档被成功传入`amazed`函数，效果和套进`amazed`函数一样。当然了，模板用目前这个函数没什么用；但若与set规则和命名参数结合使用，模板就可以非常强大。

    #note[
      【译注】一个函数统辖一切，一条规则网罗一切；千头万绪尽纳其中，至尊模板为您服务。
    ]
  ],
)

= #babel(
  en: short-or-long[Set And Show Rules][Embedding set and show rules],
  zh-status: "proofread",
  zh: short-or-long[set/show规则][将set规则和show规则纳入模板],
) <set-and-show-rules>
#babel(
  en: [
    To apply some set and show rules to our template, we can use `set` and `show` within a content block in our function and then insert the document into that content block.
  ],
  zh-status: "proofread",
  zh: [
    要将set规则和show规则纳入模板，可在函数的内容块内写`set`和`show`，再将文档放到后面。
  ],
)

```example
#let template(doc) = [
  #set text(font: "Inria Serif")
  #show "something cool": [Typst]
  #doc
]

#show: template
I am learning something cool today.
It's going great so far!
```

#babel(
  en: [
    Just like we already discovered in the previous chapter, set rules will apply to everything within their content block. Since the everything show rule passes our whole document to the `template` function, the text set rule and string show rule in our template will apply to the whole document. Let's use this knowledge to create a template that reproduces the body style of the paper we wrote in the previous chapter.
  ],
  zh-status: "proofread",
  zh: [
    正如前一章所述，set规则会应用于所在内容块内的后续内容。由于show-全部规则会把整篇文档传给`template`函数，函数内给`text`的set规则和给字符串的show规则会应用于整篇文档。让我们利用这些知识制作模板，复刻前一章所写论文的正文样式。
  ],
)

```example
#let conf(title, doc) = {
  set page(
    paper: "us-letter",
>>> margin: auto,
    header: align(
      right + horizon,
      title
    ),
>>> numbering: "1",
    columns: 2,
<<<     ...
  )
  set par(justify: true)
  set text(
    font: "Libertinus Serif",
    size: 11pt,
  )

  // Heading show rules.
<<<   ...
>>> show heading.where(level: 1): set align(center)
>>> show heading.where(level: 1): set text(size: 13pt, weight: "regular")
>>> show heading.where(level: 1): smallcaps
>>>
>>> show heading.where(level: 2): set text(
>>>   size: 11pt,
>>>   weight: "regular",
>>>   style: "italic",
>>> )
>>> show heading.where(
>>>   level: 2
>>> ): it => {
>>>   it.body + [.]
>>> }

  doc
}

#show: doc => conf(
  [Paper title],
  doc,
)

= Introduction
<<< ...
>>> #lorem(90)
>>>
>>> == Motivation
>>> #lorem(140)
>>>
>>> == Problem Statement
>>> #lorem(50)
>>>
>>> = Related Work
>>> #lorem(200)
```

#babel(
  en: [
    We copy-pasted most of that code from the previous chapter. The two differences are this:

    + We wrapped everything in the function `conf` using an everything show rule. The function applies a few set and show rules and echoes the content it has been passed at the end.

    + Moreover, we used a curly-braced code block instead of a content block. This way, we don't need to prefix all set rules and function calls with a `#`. In exchange, we cannot write markup directly in the code block anymore.

    Also note where the title comes from: We previously had it inside of a variable. Now, we are receiving it as the first parameter of the template function. To do so, we passed a closure (that's a function without a name that is used right away) to the everything show rule. We did that because the `conf` function expects two positional arguments, the title and the body, but the show rule will only pass the body. Therefore, we add a new function definition that allows us to set a paper title and use the single parameter from the show rule.
  ],
  zh-status: "proofread",
  zh: [
    大部分代码是从前一章复制粘贴，不过有两处区别：

    + 我们用show-全部规则把所有东西放进了`conf`函数。该函数会应用若干set规则和show规则，并在末尾输出传入的内容。

    + 我们还把内容块换成了用大括号包裹的脚本块。采用脚本块，就不用给set规则、函数调用等前缀`#`了；不过脚本块里也无法直接写标记文本。

    此外请注意标题的来源：之前是从一个变量获取，而现在是作为模板函数的第一个参数。为此我们在show-全部规则放了个闭包（即没有名称、就地使用的函数），因为`conf`函数需要标题、正文两个位置参数，而show规则只能传入正文这一个参数。通过在show规则处就地定义一个新函数，我们才能设置论文标题，并同时利用show规则提供的那个参数。

    #note[
      【译注】内容块`{[…]}`与脚本块`{{…}}`还有一点区别：前者的换行可能变成空格，而后者的换行始终消失。

      对于不用空格分词的中文来说，空格去不掉会很要命；开发版Typst已专门针对中文改进，预计Typst 0.16会发布。下图预览开发版Typst的结果；若用Typst 0.15，则「鸡␣鸭」「不可␣少」两处会有空格。

      ```example
      #let join-markup(x, y) = [
        #x
        #y
      ]
      #let join-code(x, y) = {
        x
        y
      }

      #join-markup[every][thing] \
      #join-code[every][where] \
      all at
      once

      >>> #set text(lang: "zh", font: "Noto Serif CJK SC", top-edge: "ascender", bottom-edge: "descender")
      #join-markup[无鸡][鸭也可] \
      #join-code[无鱼][肉也可] \
      青菜豆腐 不可
      少不得半文钱
      ```

      更多情况可参考#link("https://typst-doc-cn.github.io/clreq/#ignore-linebreak")[中文社区差距分析文档]中的链接。
    ]
  ],
)

= #babel(
  en: short-or-long[Named Arguments][Templates with named arguments],
  zh-status: "proofread",
  zh: short-or-long[命名参数][给模板增加命名参数],
) <named-arguments>
#babel(
  en: [
    Our paper in the previous chapter had a title and an author list. We can keep the title as @document metadata, but our template should also accept a list of authors with their affiliations and the paper's abstract. We'll add those as named arguments. In the end, we want it to work like this:
  ],
  zh-status: "proofread",
  zh: [
    前一章的论文除了标题还有作者名单。标题可以再保留为@document\元数据，而模板应接收作者及所属单位，还有论文摘要，我们把这些设计成命名参数。最终用法如下：
  ],
)

```typ
#set document(title: [
  A Fluid Dynamic Model for
  Glacier Flow
])

#show: doc => conf(
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
  doc,
)

...
```

#babel(
  en: [
    Let's build this new template function. The title can be displayed with the @title function and accessed through `document.title`, so the template only needs named `authors` and `abstract` parameters with empty defaults. Next, we copy the code that generates title, abstract and authors from the previous chapter into the template, replacing the fixed details with the parameters.

    The new `authors` parameter expects an @array[array] of @dictionary[dictionaries] with the keys `name`, `affiliation` and `email`. Because we can have an arbitrary number of authors, we dynamically determine if we need one, two or three columns for the author list. First, we determine the number of authors using the @array.len[`.len()`] method on the `authors` array. Then, we set the number of columns as the minimum of this count and three, so that we never create more than three columns. If there are more than three authors, a new row will be inserted instead. For this purpose, we have also added a `row-gutter` parameter to the `grid` function. Otherwise, the rows would be too close together. To extract the details about the authors from the dictionary, we use the @reference:scripting:fields[field access syntax].

    We still have to provide an argument to the grid for each author: Here is where the array's @array.map[`map` method] comes in handy. It takes a function as an argument that gets called with each item of the array. We pass it a function that formats the details for each author and returns a new array containing content values. We've now got one array of values that we'd like to use as multiple arguments for the grid. We can do that by using the @arguments[`spread` operator]. It takes an array and applies each of its items as a separate argument to the function.

    The resulting template function looks like this:
  ],
  zh-status: "proofread",
  zh: [
    让我们构造这个新的模板函数。标题可用@title\函数显示，可用`document.title`获取，所以模板只需`authors`和`abstract`两个命名参数，且默认值均空。接下来，把前一章中生成标题、摘要、作者名单的代码复制进模板，并把其中固定的信息换成参数。

    新的`authors`参数接收一个@array[数组]，数组中每项是个@dictionary[字典]，字典有`name`、`affiliation`、`email`三个键。由于作者数量不定，我们要动态确定作者名单排成一列、两列还是三列。首先，确定作者数量，办法是在`authors`数组上使用@array.len[`.len()`]方法。然后，将列数设为作者数量与三的较小者，保证最多不超过三列；若作者超过三位，会另起一行。为适应多行，我们还向`grid`函数增加了`row-gutter`参数，否则相邻行靠得太近。可以用@reference:scripting:fields[获取字段的语法]从字典中提取作者的信息。

    下一步是把每位作者转成grid的一个参数：数组的@array.map[`map`方法]能在此派上用场。它接收一个函数作为参数，该函数会给数组中每项调用一遍。这里我们把排版作者信息的函数传给该方法，该方法就会生成一个新数组，数组中每项是排版好的内容块。至此我们计算出了grid需要的各个参数；不过目前表达成了数组，还需把数组拆分成grid函数的各个参数。这用@arguments[`..spread`运算符]即可实现。

    最终模板函数如下所示：
  ],
)

```typ
#let conf(
  authors: (),
  abstract: [],
  doc,
) = {
  // Set and show rules from before.
  // ...

  place(
    top + center,
    float: true,
    scope: "parent",
    clearance: 2em,
    {
      title()

      let count = authors.len()
      let ncols = calc.min(count, 3)
      grid(
        columns: (1fr,) * ncols,
        row-gutter: 24pt,
        ..authors.map(author => [
          #author.name \
          #author.affiliation \
          #link("mailto:" + author.email)
        ]),
      )

      par(justify: false)[
        *Abstract* \
        #abstract
      ]

    }
  )

  doc
}
```

= #babel(
  en: short-or-long[Separate File][A separate file],
  zh-status: "proofread",
  zh: short-or-long[单独文件][转成单独的模板文件],
) <separate-file>
#babel(
  en: [
    Most of the time, a template is specified in a different file and then imported into the document. This way, the main file you write in is kept clutter free and your template is easily reused. Create a new text file in the file panel by clicking the plus button and name it `conf.typ`. Move the `conf` function definition inside of that new file. Now you can access it from your main file by adding an import before the show rule. Specify the path of the file between the `{import}` keyword and a colon, then name the function that you want to import.
  ],
  zh-status: "proofread",
  zh: [
    大多数情况下，模板应该写成一份单独文件，再导入到文档中。这样您编写的主文件能保持整洁，您的模板也便于复用。请另建新文件，方法是单击文件面板上方带有文件图标的按钮，然后输入文件名`conf.typ`。将`conf`函数定义移到这个新文件。移动后，就能在主文件的show规则之前导入了。具体来说，先写上`{import}`关键字，再抄上文件路径，加个冒号，然后列出要导入的函数。

    #note[
      【译注】无论在线还是本地，创建文件的方法都是上面这样。不过本地使用VS Code编辑主文件以外的文件时，如果Tinymist无法从编辑行为正确推断出主文件，那么会遇到莫名报错，或者鼠标悬浮在变量上无法查看变量值。

      解决办法：切到主文件，启用预览（单击右上角预览按钮）；若实在不想预览，可切到主文件，按#kbd("F1")，搜索pin main，选择「Typst: 将主文件固定到当前打开的文档」，回车。
    ]
  ],
)

#babel(
  en: [
    Another thing that you can do to make applying templates just a bit more elegant is to use the @function.with[`.with`] method on functions to pre-populate all the named arguments. This way, you can avoid spelling out a closure and appending the content argument at the bottom of your template list. Templates on #link("https://typst.app/universe")[Typst Universe] are designed to work with this style of function call.
  ],
  zh-status: "proofread",
  zh: [
    想让模板用起来更优雅，还可用函数的@function.with[`.with`]方法预填充各个命名参数。这样就不用手写闭包，也不用想着在模板参数列表最后写内容参数了。#link("https://typst.app/universe")[Typst Universe]上的模板都是设计成按这种风格调用。
  ],
)

#example(
  single: true,
  ```
  >>> #let conf(
  >>>   authors: (),
  >>>   abstract: [],
  >>>   doc,
  >>> ) = {
  >>>   set page(
  >>>     "us-letter",
  >>>     margin: auto,
  >>>     header: align(
  >>>       right + horizon,
  >>>       context document.title,
  >>>     ),
  >>>     numbering: "1",
  >>>     columns: 2,
  >>>   )
  >>>   set par(justify: true)
  >>>   set text(font: "Libertinus Serif", 11pt)
  >>>   show title: set text(size: 17pt)
  >>>   show title: set align(center)
  >>>   show title: set block(below: 1.2em)
  >>>
  >>>   show heading.where(level: 1): set align(center)
  >>>   show heading.where(level: 1): set text(size: 13pt, weight: "regular")
  >>>   show heading.where(level: 1): smallcaps
  >>>
  >>>   show heading.where(level: 2): set text(
  >>>     size: 11pt,
  >>>     weight: "regular",
  >>>     style: "italic",
  >>>   )
  >>>   show heading.where(
  >>>     level: 2
  >>>   ): it => {
  >>>     it.body + [.]
  >>>   }
  >>>
  >>>   show heading.where(
  >>>     level: 2
  >>>   ): it => text(
  >>>     size: 11pt,
  >>>     weight: "regular",
  >>>     style: "italic",
  >>>     it.body + [.],
  >>>   )
  >>>
  >>>   place(
  >>>     top + center,
  >>>     float: true,
  >>>     scope: "parent",
  >>>     clearance: 2em,
  >>>     {
  >>>       title()
  >>>
  >>>       let count = authors.len()
  >>>       let ncols = calc.min(count, 3)
  >>>       grid(
  >>>         columns: (1fr,) * ncols,
  >>>         row-gutter: 24pt,
  >>>         ..authors.map(author => [
  >>>           #author.name \
  >>>           #author.affiliation \
  >>>           #link("mailto:" + author.email)
  >>>         ]),
  >>>       )
  >>>
  >>>       par(justify: false)[
  >>>         *Abstract* \
  >>>         #abstract
  >>>       ]
  >>>     }
  >>>   )
  >>>
  >>>   doc
  >>> }
  <<< #import "conf.typ": conf

  #set document(title: [
    A Fluid Dynamic Model for
    Glacier Flow
  ])

  #show: conf.with(
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

  = Introduction
  #lorem(90)

  == Motivation
  #lorem(140)

  == Problem Statement
  #lorem(50)

  = Related Work
  #lorem(200)
  ```,
)

#babel(
  en: [
    We have now converted the conference paper into a reusable template for that conference! Why not share it in the #link("https://forum.typst.app/")[Forum] or on #link("https://discord.gg/2uDybryKPe")[Typst's Discord server] so that others can use it too?
  ],
  zh-status: "proofread",
  zh: [
    至此，我们就成功将会议论文转成可复用的会议模板了！快来#link("https://forum.typst.app/")[Typst论坛]或#link("https://discord.gg/2uDybryKPe")[Typst的Discord服务器]分享它，让大家也来使用吧！

    #note[
      【译注】访问论坛无需科学上网，但访问Discord服务器需要。

      至于如何上传到Typst Universe，可参考中文社区导航站「#link("https://typst-doc-cn.github.io/guide/FAQ/how-to-publish-package.html")[如何发布自己的包以及模板]」（需了解`git push`、GitHub pull request等基础知识）。
    ]
  ],
)

= #babel(en: [Review], zh-status: "proofread", zh: [总结]) <review>
#babel(
  en: [
    Congratulations, you have completed Typst's Tutorial! In this section, you have learned how to define your own functions and how to create and apply templates that define reusable document styles. You've made it far and learned a lot. You can now use Typst to write your own documents and share them with others.

    We are still a super young project and are looking for feedback. If you have any questions, suggestions or you found a bug, please let us know in the #link("https://forum.typst.app/")[Forum], on our #link("https://discord.gg/2uDybryKPe")[Discord server], on #link("https://github.com/typst/typst/")[GitHub], or via the web app's feedback form (always available in the Help menu).

    So what are you waiting for? #link("https://typst.app")[Sign up] and write something!
  ],
  zh-status: "proofread",
  zh: [
    恭喜您完成了Typst教程！本章您学习了如何自己定义函数、如何制作并使用文档样式可复用的模板。您一路走来，收获颇丰，已经可以用Typst撰写自己的文档，并与他人共享了。

    我们仍然是非常年轻的项目，期待您的反馈。如果您有任何问题、建议，或者发现了任何缺陷，欢迎反馈到Typst的#link("https://forum.typst.app/")[论坛]、#link("https://discord.gg/2uDybryKPe")[Discord服务器]、#link("https://github.com/typst/typst/")[GitHub]，或者在线应用的Feedback小窗（在顶栏Help菜单里）。

    那还等什么？快#link("https://typst.app")[注册]在线应用并写些有趣的东西吧！

    #note[
      Typst官方渠道只能用英语反馈。如想用中文交流，可加入#link("https://typst-doc-cn.github.io/guide/#用户社区")[中文社区QQ群]。
    ]
  ],
)
