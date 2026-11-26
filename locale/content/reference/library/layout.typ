#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category

#show: docs-category.with(
  title: babel(
    en: "Layout",
    zh-status: "need proofread",
    zh: "布局",
  ),
  description: babel(
    en: "Documentation for layout functionality that enables to precisely define how elements should be arranged on a page.",
    zh-status: "need update",
    zh: "Typst中与布局有关联的函数族的文档",
  ),
  category: "layout",
)

#babel(
  en: [
    Arranging elements on the page in different ways.

    By combining layout functions, you can create complex and automatic layouts.
  ],
  zh-status: "need proofread",
  zh: [
    以不同方式在页面上排列元素。

    通过组合布局函数，您可以创建复杂且自动的布局。
  ],
)
