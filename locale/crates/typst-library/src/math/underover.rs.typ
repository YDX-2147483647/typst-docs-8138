#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "UnderlineElem": (
    4,
    [
      #babel(
        en: [
          A horizontal line under content.
        ],
      )

      ```example
      $ underline(1 + 2 + ... + 5) $
      ```
    ],
  ),
  "UnderlineElem::body": (
    7,
    babel(
      en: [
        The content above the line.
      ],
    ),
  ),
  "OverlineElem": (
    5,
    [
      #babel(
        en: [
          A horizontal line over content.
        ],
      )

      ```example
      $ overline(1 + 2 + ... + 5) $
      ```
    ],
  ),
  "OverlineElem::body": (
    7,
    babel(
      en: [
        The content below the line.
      ],
    ),
  ),
  "UnderbraceElem": (
    5,
    [
      #babel(
        en: [
          A horizontal brace under content, with an optional annotation below.
        ],
      )

      ```example
      $ underbrace(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "UnderbraceElem::body": (
    7,
    babel(
      en: [
        The content above the brace.
      ],
    ),
  ),
  "UnderbraceElem::annotation": (
    4,
    babel(
      en: [
        The optional content below the brace.
      ],
    ),
  ),
  "OverbraceElem": (
    5,
    [
      #babel(
        en: [
          A horizontal brace over content, with an optional annotation above.
        ],
      )

      ```example
      $ overbrace(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "OverbraceElem::body": (
    7,
    babel(
      en: [
        The content below the brace.
      ],
    ),
  ),
  "OverbraceElem::annotation": (
    4,
    babel(
      en: [
        The optional content above the brace.
      ],
    ),
  ),
  "UnderbracketElem": (
    5,
    [
      #babel(
        en: [
          A horizontal bracket under content, with an optional annotation below.
        ],
      )

      ```example
      $ underbracket(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "UnderbracketElem::body": (
    7,
    babel(
      en: [
        The content above the bracket.
      ],
    ),
  ),
  "UnderbracketElem::annotation": (
    4,
    babel(
      en: [
        The optional content below the bracket.
      ],
    ),
  ),
  "OverbracketElem": (
    5,
    [
      #babel(
        en: [
          A horizontal bracket over content, with an optional annotation above.
        ],
      )

      ```example
      $ overbracket(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "OverbracketElem::body": (
    7,
    babel(
      en: [
        The content below the bracket.
      ],
    ),
  ),
  "OverbracketElem::annotation": (
    4,
    babel(
      en: [
        The optional content above the bracket.
      ],
    ),
  ),
  "UnderparenElem": (
    5,
    [
      #babel(
        en: [
          A horizontal parenthesis under content, with an optional annotation below.
        ],
      )

      ```example
      $ underparen(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "UnderparenElem::body": (
    7,
    babel(
      en: [
        The content above the parenthesis.
      ],
    ),
  ),
  "UnderparenElem::annotation": (
    4,
    babel(
      en: [
        The optional content below the parenthesis.
      ],
    ),
  ),
  "OverparenElem": (
    5,
    [
      #babel(
        en: [
          A horizontal parenthesis over content, with an optional annotation above.
        ],
      )

      ```example
      $ overparen(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "OverparenElem::body": (
    7,
    babel(
      en: [
        The content below the parenthesis.
      ],
    ),
  ),
  "OverparenElem::annotation": (
    4,
    babel(
      en: [
        The optional content above the parenthesis.
      ],
    ),
  ),
  "UndershellElem": (
    5,
    [
      #babel(
        en: [
          A horizontal tortoise shell bracket under content, with an optional
          annotation below.
        ],
      )

      ```example
      $ undershell(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "UndershellElem::body": (
    8,
    babel(
      en: [
        The content above the tortoise shell bracket.
      ],
    ),
  ),
  "UndershellElem::annotation": (
    4,
    babel(
      en: [
        The optional content below the tortoise shell bracket.
      ],
    ),
  ),
  "OvershellElem": (
    5,
    [
      #babel(
        en: [
          A horizontal tortoise shell bracket over content, with an optional
          annotation above.
        ],
      )

      ```example
      $ overshell(0 + 1 + dots.c + n, n + 1 "numbers") $
      ```
    ],
  ),
  "OvershellElem::body": (
    8,
    babel(
      en: [
        The content below the tortoise shell bracket.
      ],
    ),
  ),
  "OvershellElem::annotation": (
    4,
    babel(
      en: [
        The optional content above the tortoise shell bracket.
      ],
    ),
  ),
))
