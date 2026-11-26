#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category

#show: docs-category.with(
  title: babel(
    en: "Visualize",
    zh-status: "need proofread",
    zh: "可视化",
  ),
  description: babel(
    en: "Documentation for drawing and data visualization functionality.",
    zh-status: "need update",
    zh: "Typst中与可视化有关联的函数族的文档",
  ),
  category: "visualize",
)

#babel(
  en: [
    Drawing and data visualization.

    If you want to create more advanced drawings or plots, also have a look at the #link("https://github.com/johannes-wolf/cetz")[CeTZ] package as well as more specialized #link("https://typst.app/universe")[packages] for your use case.
  ],
  zh-status: "need proofread",
  zh: [
    绘图和数据可视化。

    如果您想创建更高级的绘图或图表，请同时查看#link("https://github.com/johannes-wolf/cetz")[CeTZ]包以及更多针对您用例的专业化#link("https://typst.app/universe")[第三方包]。
  ],
)

= Accessibility <accessibility>
All shapes and paths drawn by Typst are automatically marked as @pdf.artifact[artifacts] to make them invisible to Assistive Technology (AT) during PDF export. However, their contents (if any) remain accessible.

If you are using the functions in this category to create an illustration with semantic meaning, make it accessible by wrapping it in a @figure function call. Use its @figure.alt[`alt` parameter] to provide an @guides:accessibility:textual-representations[alternative description].
