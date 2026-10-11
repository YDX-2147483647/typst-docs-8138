#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "PadElem": (
    4,
    [
      #babel(
        en: [
          Adds spacing around content.

          The spacing can be specified for each side individually, or for all sides at
          once by specifying a positional argument.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #set align(center)

      #pad(x: 16pt, image("typing.jpg"))
      _Typing speeds can be
       measured in words per minute._
      ```
    ],
  ),
  "PadElem::left": (
    15,
    babel(
      en: [
        The padding at the left side.
      ],
    ),
  ),
  "PadElem::top": (
    9,
    babel(
      en: [
        The padding at the top side.
      ],
    ),
  ),
  "PadElem::right": (
    4,
    babel(
      en: [
        The padding at the right side.
      ],
    ),
  ),
  "PadElem::bottom": (
    4,
    babel(
      en: [
        The padding at the bottom side.
      ],
    ),
  ),
  "PadElem::x": (
    4,
    babel(
      en: [
        A shorthand to set `left` and `right` to the same value.
      ],
    ),
  ),
  "PadElem::y": (
    4,
    babel(
      en: [
        A shorthand to set `top` and `bottom` to the same value.
      ],
    ),
  ),
  "PadElem::rest": (
    4,
    babel(
      en: [
        A shorthand to set all four sides to the same value.
      ],
    ),
  ),
  "PadElem::body": (
    4,
    babel(
      en: [
        The content to pad at the sides.
      ],
    ),
  ),
))
