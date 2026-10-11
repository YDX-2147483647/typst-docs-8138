#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "EmphElem": (
    3,
    [
      #babel(
        en: [
          Emphasizes content by toggling italics.

          - If the current @text.style[text style] is `{"normal"}`, this turns it into
            `{"italic"}`.
          - If it is already `{"italic"}` or `{"oblique"}`, it turns it back to
            `{"normal"}`.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      This is _emphasized._ \
      This is #emph[too.]

      #show emph: it => {
        text(blue, it.body)
      }

      This is _emphasized_ differently.
      ```

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          This function also has dedicated syntax: To emphasize content, simply
          enclose it in underscores (`_`). Note that this only works at word
          boundaries. To emphasize part of a word, you have to use the function.
        ],
      )
    ],
  ),
  "EmphElem::body": (
    25,
    babel(
      en: [
        The content to emphasize.
      ],
    ),
  ),
))
