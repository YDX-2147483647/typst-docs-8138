#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Angle": (
    12,
    [
      #babel(
        en: [
          An angle describing a rotation.

          Typst supports the following angular units:

          - Degrees: `{180deg}`
          - Radians: `{3.14rad}`
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #rotate(10deg)[Hello there!]
      ```
    ],
  ),
  "Angle::to_rad": (
    130,
    babel(
      en: [
        Converts this angle to radians.
      ],
    ),
  ),
  "Angle::to_deg": (
    6,
    babel(
      en: [
        Converts this angle to degrees.
      ],
    ),
  ),
))
