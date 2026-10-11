#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "StrongElem": (
    3,
    [
      #babel(
        en: [
          Strongly emphasizes content by increasing the font weight.

          Increases the current font weight by a given `delta`.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      This is *strong.* \
      This is #strong[too.] \

      #show strong: set text(red)
      And this is *evermore.*
      ```

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          This function also has dedicated syntax: To strongly emphasize content,
          simply enclose it in stars/asterisks (`*`). Note that this only works at
          word boundaries. To strongly emphasize part of a word, you have to use the
          function.
        ],
      )
    ],
  ),
  "StrongElem::delta": (
    20,
    [
      #babel(
        en: [
          The delta to apply on the font weight.
        ],
      )

      ```example
      #set strong(delta: 0)
      No *effect!*
      ```
    ],
  ),
  "StrongElem::body": (
    9,
    babel(
      en: [
        The content to strongly emphasize.
      ],
    ),
  ),
))
