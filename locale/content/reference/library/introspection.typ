#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category

#show: docs-category.with(
  title: babel(
    en: "Introspection",
    zh-status: "need proofread",
    zh: "内省",
  ),
  description: babel(
    en: "Documentation for functionality that enables interactions between different parts of a document.",
    zh-status: "need update",
    zh: "Typst中与内省有关联的函数族的文档",
  ),
  category: "introspection",
)

#babel(
  en: [
    Interactions between document parts.

    This category is home to Typst's introspection capabilities: With the `counter` function, you can access and manipulate page, section, figure, and equation counters or create custom ones. Meanwhile, the `query` function lets you search for elements in the document to construct things like a list of figures or headers which show the current chapter title.
  ],
  zh-status: "need proofread",
  zh: [
    文档部分之间的交互。

    这个类别是Typst的内省能力的所在：通过`counter`函数，您可以访问和操作页面、节、图表和方程计数器，或创建自定义计数器。与此同时，`query`函数允许您在文档中搜索元素，以构建诸如图表列表或显示当前章节标题的标题等内容。
  ],
)

Most of the functions are _contextual._ It is recommended to read the chapter on @reference:context[context] before continuing here.
