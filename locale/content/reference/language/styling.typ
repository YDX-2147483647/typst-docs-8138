#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter

#show: docs-chapter.with(
  title: babel(
    en: "Styling",
    zh-status: "proofread",
    zh: "样式",
  ),
  route: "/reference/styling",
  description: babel(
    en: "All concepts needed to style your document with Typst.",
    zh-status: "need proofread",
    zh: "Typst中所有有关文档样式设置概念。",
  ),
)

#babel(
  en: [
    Typst includes a flexible styling system that automatically applies styling of your choice to your document. With _set rules,_ you can configure basic properties of elements. This way, you create most common styles. However, there might not be a built-in property for everything you wish to do. For this reason, Typst further supports _show rules_ that can completely redefine the appearance of elements.
  ],
  zh-status: "need proofread",
  zh: [
    Typst有一个自由的样式设置系统，可以按需自动格式化文档。_set规则_可以配置文档元素的基本属性，用来设置大多常用文档样式，但是有些样式设置并没有属性可设，因此Typst引入_show规则_，进而可以彻底的重设文档元素外观。
  ],
)

= #babel(en: [Set rules], zh-status: "proofread", zh: [set规则]) <set-rules>
#babel(
  en: [
    With set rules, you can customize the appearance of elements. They are written as a @function[function call] to an @function:element-functions[element function] preceded by the `{set}` keyword (or `[#set]` in markup). Only optional parameters of that function can be provided to the set rule. Refer to each function's documentation to see which parameters are optional. In the example below, we use two set rules to change the @text.font[font family] and @heading.numbering[heading numbering].
  ],
  zh-status: "need proofread",
  zh: [
    使用set规则，可以自定义文档元素的外观，这些规则以`{set}`关键字作为开始标记（在标记模式下使用`[#set]`），紧随一个文档元素的@function[函数调用]，set函数调用时，仅有特定参数可被允许使用，可以参考该函数文档查看有那些参数可以用于set规则。下面示例，使用了两个set规则来改变@text.font[文档字体]和@heading.numbering[标题数字]。
  ],
)

```example
#set heading(numbering: "I.")
#set text(
  font: "New Computer Modern"
)

= Introduction
With set rules, you can style
your document.
```

#babel(
  en: [
    A top level set rule stays in effect until the end of the file. When nested inside of a code or content block, it is only in effect until the end of that block. With a block, you can thus restrict the effect of a rule to a particular segment of your document. Below, we use a content block to scope the list styling to one particular list.
  ],
  zh-status: "need proofread",
  zh: [
    顶层set规则一直作用到文件结束，当在块内使用时，只作用到块结束。这样使用块，可以限制set规则只总用于文档的特定片段。下面示例使用了文档内容块来限制列表样式设置只作用于特定列表。
  ],
)

```example
This list is affected: #[
  #set list(marker: [--])
  - Dash
]

This one is not:
- Bullet
```

#babel(
  en: [
    Sometimes, you'll want to apply a set rule conditionally. For this, you can use a _set-if_ rule.
  ],
  zh-status: "need proofread",
  zh: [
    有时，想要实现特定条件下set规则才有效，可以使用_set-if_规则。
  ],
)

```example
#let task(body, critical: false) = {
  set text(red) if critical
  [- #body]
}

#task(critical: true)[Food today?]
#task(critical: false)[Work deadline]
```

= #babel(en: [Show rules], zh-status: "proofread", zh: [show规则]) <show-rules>
#babel(
  en: [
    With show rules, you can deeply customize the look of a type of element. The most basic form of show rule is a _show-set rule._ Such a rule is written as the `{show}` keyword followed by a @selector[selector], a colon and then a set rule. The most basic form of selector is an @function:element-functions[element function]. This lets the set rule only apply to the selected element. In the example below, headings become dark blue while all other text stays black.
  ],
  zh-status: "need proofread",
  zh: [
    使用show规则可以深度定制特定类型文档元素的外观，最常用的基本形式是_show-set规则_，以`{show}`关键字作为开始标记，紧随一个@selector[选择器]，一个冒号，最后是一个set规则。最常见的选择器是一个@function:element-functions[文档元素函数名]，是set规则用来选择相关文档元素的。下面示例中，标题变为深蓝色，其他文本保持黑色。
  ],
)

```example
#show heading: set text(navy)

= This is navy-blue
But this stays black.
```

#babel(
  en: [
    With show-set rules you can mix and match properties from different functions to achieve many different effects. But they still limit you to what is predefined in Typst. For maximum flexibility, you can instead write a _transformational_ show rule that defines how to format an element from scratch. To write such a show rule, replace the set rule after the colon with an arbitrary @function[function]. This function receives the element in question and can return arbitrary content. The function is often defined inline as `{it => ..}` using the @function:unnamed[unnamed function syntax]. The function's parameter is typically named `it` by convention.

    The available @reference:scripting:fields[fields] on the element passed to the function match the parameters of the respective element function. Below, we define a show rule that formats headings for a fantasy encyclopedia.

    The show rule itself adds tilde characters around the title (these must be escaped with a backslash because otherwise they would indicate a non-breaking space), emphasizes the title with italics, and then displays the heading counter after the title.

    For this example, we also wanted center alignment and a different font. While we could've added these set rules into the existing show rule, we instead added them as separate show-set rules. This is good practice because now these rules can still be overridden by later show-set rules in the document, keeping styling composable. In contrast, set rules within a transformational show rule would not be overridable anymore.
  ],
  zh-status: "need update",
  zh: [
    使用show-set规则，可以混搭各种函数属性，来实现各种不同的效果，但这也仍然局限于Typst预定义的功能。为了最大限度的灵活设置，可以使用函数式show规则，用来定义如何从0开始格式化文档元素。使用一个@function[函数]来替换show-set规则中的set规则，这个函数以未知文档元素作为参数，返回任意文档内容，函数的文档元素参数有各种不同的@reference:scripting:fields[属性字段]。下面示例中用一个函数式show规则格式化一个虚构的百科全书标题。
  ],
)

```example
#set heading(numbering: "(I)")
#show heading: set align(center)
#show heading: set text(font: "Inria Serif")
#show heading: it => block[
  \~
  #emph(it.body)
  #counter(heading).display()
  \~
]

= Dragon
With a base health of 15, the dragon is the most
powerful creature.

= Manticore
While less powerful than the dragon, the manticore
gets extra style points.
```

#babel(
  en: [
    Like set rules, show rules are in effect until the end of the current block or file.

    Instead of a function, the right-hand side of a show rule can also take a literal string or content block that should be directly substituted for the element. And apart from a function, the left-hand side of a show rule can also take a number of other _selectors_ that define what to apply the transformation to:

    - *Everything:* `{show: rest => ..}` \
      Transform everything after the show rule. This is useful to apply a more complex layout to your whole document without wrapping everything in a giant function call.

    - *Text:* `{show "Text": ..}` \
      Style, transform or replace text.

    - *Regex:* `{show regex("\w+"): ..}` \
      Select and transform text with a regular expression for even more flexibility. See the documentation of the @regex[`regex` type] for details.

    - *Function with fields:* `{show heading.where(level: 1): ..}` \
      Transform only elements that have the specified fields. For example, you might want to only change the style of level-1 headings.

    - *Label:* `{show <intro>: ..}` \
      Select and transform elements that have the specified label. See the documentation of the @label[`label` type] for more details.
  ],
  zh-status: "need proofread",
  zh: [
    与set规则类似，show规则也一直作用到文档或者当前块的结束。

    show规则的右边部分不仅可以是一个函数，也可以是一个字符串常量或者文档内容块，用来直接替换文档元素。show规则的左边部分也可以是_下面类型的选择器_，用来定义哪些文档元素会被转换：

    - *所有文档：* `{show: rest => ..}` \
      转换 show 规则后的所有文档元素，这样就免于将所有文档元素都包含在一个巨大的函数调用中，来实现更复杂的布局。

    - *特定文本：* `{show "Text": ..}` \
      设置特定文本样式，转变或替换特定文本。

    - *正则表达式：* `{show regex("\w+"): ..}` \
      更自由的选择并转换匹配特定正则表达式的文本，详见于@regex[regex 函数]文档。

    - *字段选择函数：* `{show heading.where(level: 1): ..}` \
      转换具有特定字段的文档元素。比如，可以只设置文档一级标题样式。

    - *标签：* `{show <intro>: ..}` \
      选择并转换具有特定标签的文档元素，详见于@label[标签函数]文档。
  ],
)

```example
#show "Project": smallcaps
#show "badly": "great"

We started Project in 2019
and are still working on it.
Project is progressing badly.
```
