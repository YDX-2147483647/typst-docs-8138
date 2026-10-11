#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "SmallcapsElem": (
    3,
    [
      #babel(
        en: [
          Displays text in small capitals.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Hello \
      #smallcaps[Hello]
      ```

      = #babel(en: [Smallcaps fonts]) <smallcaps-fonts>
      #babel(
        en: [
          By default, this uses the `smcp` and `c2sc` OpenType features on the font.
          Not all fonts support these features. Sometimes, smallcaps are part of a
          dedicated font. This is, for example, the case for the _Latin Modern_ family
          of fonts. In those cases, you can use a show-set rule to customize the
          appearance of the text in smallcaps:
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
      )

      = #babel(en: [Smallcaps headings]) <smallcaps-headings>
      #babel(
        en: [
          You can use a @reference:styling:show-rules[show rule] to apply smallcaps
          formatting to all your headings. In the example below, we also center-align
          our headings and disable the standard bold font.
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
    ),
  ),
))
