#import "/i18n-scope.typ": babel
#import "/i18n-translation.typ": Translation
#import "/components/index.typ": docs-chapter, info, modifier-list, paged-heading-offset, ty-pill

#docs-chapter(
  title: babel(
    en: "Reference",
    zh-status: "proofread",
    zh: "参考手册",
  ),
  route: "/reference",
  description: babel(
    en: "The Typst reference is a systematic and comprehensive guide to the Typst typesetting language.",
    zh-status: "need proofread",
    zh: "Typst参考手册是关于Typst排版语言的详细文档。",
  ),
  introduction: true,
  class: "reference-index",
)[
  #babel(
    en: [
      This reference documentation is a comprehensive guide to all of Typst's syntax, concepts, functions, types, and other definitions. Use the reference to answer specific questions about Typst and to broaden your understanding of the available features.

      If you are completely new to Typst, we recommend starting with the @tutorial[tutorial] and then coming back to the reference to learn more about Typst's features as you need them.
    ],
    zh-status: "need update",
    zh: [
      本参考索引是一个综合指南文档，包括Typst的语法，概念，类型和函数。如果你初识Typst，建议从@tutorial[学习指南]开始，然后再按需回来学习更多的Typst特性。
    ],
  )

  = #babel(en: [Language], zh-status: "proofread", zh: [语言]) <language>
  #babel(
    en: [
      The reference starts by covering fundamentals of the Typst language. First, we give an overview of @reference:syntax[Typst's syntax.] The following sections cover core concepts central to the Typst language such as @reference:styling[styling documents,] using @reference:scripting[Typst's scripting capabilities,] and @reference:context[reasoning about the contents of your document.]
    ],
    zh-status: "need proofread",
    zh: [
      本参考索引第一部分粗略介绍@reference:syntax[Typst语法]，包括@reference:styling[文档样式]概念，以及@reference:scripting[Typst脚本功能]详细文档。
    ],
  )

  = Library <library>
  #babel(
    en: [
      #context if target() == "paged" [
        // The PDF outline does not contain the part labels, so we have to tell the reader where each section starts.
        Starting with @reference:foundations, the reference includes sections
      ] else [
        The second part includes sections
      ] on all functions, types, and other definitions provided by the _standard library_ of the Typst language.

      The definition sections are grouped by topic. For example, if you would like to explore all tools Typst provides to adjust where elements land on the page, you should start in the @reference:layout section. If instead you'd rather learn more about what formats Typst can export to, you should peruse the @format[Formats] section.
    ],
    zh-status: "need update",
    zh: [
      第二部分引入所有能用到的函数，有插入文档内容的，有设置文档内容样式的，有文档内容变换的，有布局文档内容的。每一个函数均已同样的形式表述，有些是表述函数基本功能，有些列举函数参数，有些举例如何使用函数。

      参考索引最后一部分描述的Typst代码模式内的函数，用来操作及转换数据的。和第二部分一样，每一个函数均已同样的形式表述，有些是表述函数基本功能，有些列举函数参数，有些举例如何使用函数。

      #info[
        *进阶*

        译者注：这部分官方文档没有，是译者自主添加的。

        除了参考，还可以考虑阅读#link("https://sitandr.github.io/typst-examples-book/book/")[typst-examples-book]，里面包含了一些Typst的高级知识、简单示例，以及一些最佳实践。

        例如简单地实现类似Markdown中的引用文本样式：

        ```example
        + #lorem(10) \
          #rect(fill: luma(240), stroke: (left: 0.25em))[
            *Solution:* #lorem(10)

            $ a_(n+1)x^n = 2... $
          ]
        ```
      ]
    ],
  )

  = Reading the reference <reading-the-reference>
  This reference uses a few graphical conventions and labels to let you quickly scan its sections.

  / #ty-pill(str, linked: false):
    #babel(
      en: [
        These pills indicate that a value is of a particular type. Each type's chapter uses the respective pill as its title. Similar types share a color. For example, all numeric types have the same color.
      ],
    )

  / #modifier-list(Translation.elementFunction):
    #babel(
      en: [
        Some functions are labelled as elements. This means that they can be used with set and show rules. Some elements can be @locate[located] and used with the @query function. Elements generally produce visible output in the document. You may be using elements even if you are not calling functions, as there is dedicated markup for some elements.
      ],
    )

  / #modifier-list(Translation.contextFunction):
    #babel(
      en: [
        These functions can reason about the contents of your document. They can only be used when _context_ is available, for example through a context block. Refer to the @reference:context section for more information.
      ],
    )

  / #modifier-list(Translation.required):
    #babel(
      en: [
        Appears on a function parameter if calling the function without that parameter would result in an error.
      ],
    )

  / #modifier-list(Translation.positional):
    #babel(
      en: [
        Appears on a function parameter that is specified without a parameter name and colon. Instead, Typst will use the parameter order to determine which argument is which. Parameters not marked as positional are _named_ parameters.
      ],
    )

  / #modifier-list(Translation.variadic):
    #babel(
      en: [
        Appears on function parameters that can be specified multiple times.
      ],
    )

  / #modifier-list(Translation.settable):
    #babel(
      en: [
        Appears on function parameters of element functions that can be customized with a set rule.
      ],
    )
]

#show: paged-heading-offset.with(1)
#include "language/index.typ"
#include "library/index.typ"
