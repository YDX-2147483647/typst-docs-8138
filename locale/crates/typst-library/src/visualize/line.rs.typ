#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "LineElem": (
    5,
    [
      #babel(
        en: [
          A line from one point to another.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #set page(height: 100pt)

      #line(length: 100%)
      #line(end: (50%, 50%))
      #line(
        length: 4cm,
        stroke: 2pt + maroon,
      )
      ```
    ],
  ),
  "LineElem::start": (
    15,
    babel(
      en: [
        The start point of the line.

        Must be an array of exactly two relative lengths.
      ],
    ),
  ),
  "LineElem::end": (
    5,
    babel(
      en: [
        The point where the line ends.
      ],
    ),
  ),
  "LineElem::length": (
    3,
    babel(
      en: [
        The line's length. This is only respected if `end` is `{none}`.
      ],
    ),
  ),
  "LineElem::angle": (
    4,
    babel(
      en: [
        The angle at which the line points away from the origin. This is only
        respected if `end` is `{none}`.
      ],
    ),
  ),
  "LineElem::stroke": (
    4,
    [
      #babel(
        en: [
          How to @stroke[stroke] the line.
        ],
      )

      ```example
      #set line(length: 100%)
      #stack(
        spacing: 1em,
        line(stroke: 2pt + red),
        line(stroke: (paint: blue, thickness: 4pt, cap: "round")),
        line(stroke: (paint: blue, thickness: 1pt, dash: "dashed")),
        line(stroke: (paint: blue, thickness: 1pt, dash: ("dot", 2pt, 4pt, 2pt))),
      )
      ```
    ],
  ),
))
