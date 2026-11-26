#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "SmallcapsElem": (
    3,
    [
      #babel(
        en: [
          Displays text in small capitals.
        ],
        zh-status: "proofread",
        zh: [
          以小型大写字母显示文本。
        ],
      )

      = #babel(en: [Example], zh-status: "proofread", zh: [示例]) <example>
      ```example
      Hello \
      #smallcaps[Hello]
      ```

      = #babel(en: [Smallcaps fonts], zh-status: "need proofread", zh: [小型大写字体]) <smallcaps-fonts>
      #babel(
        en: [
          By default, this uses the `smcp` and `c2sc` OpenType features on the font.
          Not all fonts support these features. Sometimes, smallcaps are part of a
          dedicated font. This is, for example, the case for the _Latin Modern_ family
          of fonts. In those cases, you can use a show-set rule to customize the
          appearance of the text in smallcaps:
        ],
        zh-status: "need proofread",
        zh: [
          默认情况下，这使用字体上的`smcp`和`c2sc`OpenType 功能。并非所有字体都支持这些功能。有时，小写大写字母是专门字体的一部分。例如，_Latin Modern_ 字体系列就是这种情况。在这些情况下，您可以使用show-set规则来自定义小写大写字母文本的外观：
        ],
      )

      ```typ
      #show smallcaps: set text(font: "Latin Modern Roman Caps")
      ```

      #babel(
        en: [
          In the future, this function will support synthesizing smallcaps from normal
          letters, but this is not yet implemented.
        ],
        zh-status: "need proofread",
        zh: [
          在将来，这个函数将支持从普通字母合成小写大写字母，但目前尚未实现。
        ],
      )

      = #babel(en: [Smallcaps headings], zh-status: "need proofread", zh: [小型大写字母标题]) <smallcaps-headings>
      #babel(
        en: [
          You can use a @reference:styling:show-rules[show rule] to apply smallcaps
          formatting to all your headings. In the example below, we also center-align
          our headings and disable the standard bold font.
        ],
        zh-status: "need proofread",
        zh: [
          您可以使用@reference:styling:show-rules[show规则]将小型大写字母格式应用于所有标题。在下面的示例中，我们还居中对齐标题并禁用标准粗体字体。
        ],
      )

      ```example
      #set par(justify: true)
      #set heading(numbering: "I.")

      #show heading: smallcaps
      #show heading: set align(center)
      #show heading: set text(
        weight: "regular"
      )

      = Introduction
      #lorem(40)
      ```
    ],
  ),
  "SmallcapsElem::all": (
    42,
    [
      #babel(
        en: [
          Whether to turn uppercase letters into small capitals as well.

          Unless overridden by a show rule, this enables the `c2sc` OpenType
          feature.
        ],
        zh-status: "need proofread",
        zh: [
          是否也将大写字母转换为小写大写字母。

          除非被show规则覆盖，否则这会启用OpenType特性`c2sc`。
        ],
      )

      ```example
      #smallcaps(all: true)[UNICEF] is an
      agency of #smallcaps(all: true)[UN].
      ```
    ],
  ),
  "SmallcapsElem::body": (
    11,
    babel(
      en: [
        The content to display in small capitals.
      ],
      zh-status: "need proofread",
      zh: [
        要显示的小写大写字母内容。
      ],
    ),
  ),
))
