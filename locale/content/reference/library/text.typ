#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category

#show: docs-category.with(
  title: babel(
    en: "Text",
    zh-status: "need proofread",
    zh: "文本",
  ),
  description: babel(
    en: "Documentation for text styling functionality.",
    zh-status: "need update",
    zh: "Typst中与文本有关联的函数族的文档",
  ),
  category: "text",
)

#babel(
  en: [
    Text styling.

    The @text[text function] is of particular interest.
  ],
  zh-status: "need proofread",
  zh: [
    文本样式。

    其中@text[文本函数]尤其有趣。
  ],
)
