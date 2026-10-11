#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "CancelElem": (
    6,
    [
      #babel(
        en: [
          Displays a diagonal line over a part of an equation.

          This is commonly used to show the elimination of a term.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      >>> #set page(width: 140pt)
      Here, we can simplify:
      $ (a dot b dot cancel(x)) /
          cancel(x) $
      ```
    ],
  ),
  "CancelElem::body": (
    13,
    babel(
      en: [
        The content over which the line should be placed.
      ],
    ),
  ),
  "CancelElem::length": (
    4,
    [
      #babel(
        en: [
          The length of the line, relative to the length of the diagonal spanning
          the whole element being "cancelled". A value of `{100%}` would then have
          the line span precisely the element's diagonal.
        ],
      )

      ```example
      >>> #set page(width: 140pt)
      $ a + cancel(x, length: #200%)
          - cancel(x, length: #200%) $
      ```
    ],
  ),
  "CancelElem::inverted": (
    12,
    [
      #babel(
        en: [
          Whether the cancel line should be inverted (flipped along the y-axis).
          For the default angle setting, inverted means the cancel line points to
          the top left instead of top right.
        ],
      )

      ```example
      >>> #set page(width: 140pt)
      $ (a cancel((b + c), inverted: #true)) /
          cancel(b + c, inverted: #true) $
      ```
    ],
  ),
  "CancelElem::cross": (
    12,
    [
      #babel(
        en: [
          Whether two opposing cancel lines should be drawn, forming a cross over
          the element. Overrides `inverted`.
        ],
      )

      ```example
      >>> #set page(width: 140pt)
      $ cancel(Pi, cross: #true) $
      ```
    ],
  ),
  "CancelElem::angle": (
    10,
    [
      #babel(
        en: [
          How much to rotate the cancel line.

          - If given an angle, the line is rotated by that angle clockwise with
            respect to the y-axis.
          - If `{auto}`, the line assumes the default angle; that is, along the
            rising diagonal of the content box.
          - If given a function `angle => angle`, the line is rotated, with
            respect to the y-axis, by the angle returned by that function. The
            function receives the default angle as its input.
        ],
      )

      ```example
      >>> #set page(width: 140pt)
      $ cancel(Pi)
        cancel(Pi, angle: #0deg)
        cancel(Pi, angle: #45deg)
        cancel(Pi, angle: #90deg)
        cancel(1/(1+x), angle: #(a => a + 45deg))
        cancel(1/(1+x), angle: #(a => a + 90deg)) $
      ```
    ],
  ),
  "CancelElem::stroke": (
    21,
    [
      #babel(
        en: [
          How to @stroke[stroke] the cancel line.
        ],
      )

      ```example
      >>> #set page(width: 140pt)
      $ cancel(
        sum x,
        stroke: #(
          paint: red,
          thickness: 1.5pt,
          dash: "dashed",
        ),
      ) $
      ```
    ],
  ),
  "CancelElem::background": (
    21,
    [
      #babel(
        en: [
          Whether the line is placed behind the content.
        ],
      )

      ```example
      >>> #set page(width: 140pt)
      #set math.cancel(stroke: red + 2pt)
      $ cancel("behind", background: #true) \
        cancel("in front", background: #false) $
      ```
    ],
  ),
))
