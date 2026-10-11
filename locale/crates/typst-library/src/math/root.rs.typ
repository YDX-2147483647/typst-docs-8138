#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "sqrt": (
    6,
    [
      #babel(
        en: [
          A square root.
        ],
      )

      ```example
      $ sqrt(3 - 2 sqrt(2)) = sqrt(2) - 1 $
      ```
    ],
  ),
  "sqrt::radicand": (
    8,
    babel(
      en: [
        The expression to take the square root of.
      ],
    ),
  ),
  "RootElem": (
    6,
    [
      #babel(
        en: [
          A general root.
        ],
      )

      ```example
      $ root(3, x) $
      ```
    ],
  ),
  "RootElem::index": (
    7,
    babel(
      en: [
        Which root of the radicand to take.
      ],
    ),
  ),
  "RootElem::radicand": (
    4,
    babel(
      en: [
        The expression to take the root of.
      ],
    ),
  ),
))
