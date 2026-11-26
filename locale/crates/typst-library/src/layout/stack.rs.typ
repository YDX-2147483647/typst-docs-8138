#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "StackElem": (
    6,
    [
      #babel(
        en: [
          Arranges content and spacing horizontally or vertically.

          The stack places a list of items along an axis, with optional spacing
          between each item.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #stack(
        dir: ttb,
        rect(width: 40pt),
        rect(width: 120pt),
        rect(width: 90pt),
      )
      ```

      = #babel(en: [Accessibility]) <accessibility>
      #babel(
        en: [
          Stacks do not carry any special semantics. The contents of the stack are
          read by Assistive Technology (AT) in the order in which they have been
          passed to this function.
        ],
      )
    ],
  ),
  "StackElem::dir": (
    21,
    [
      #babel(
        en: [
          The direction along which the items are stacked.
        ],
      )

      ```example
      #stack(dir: ltr, "A", "B", "C")

      #stack(dir: btt, "A", "B", "C")
      ```
    ],
  ),
  "StackElem::spacing": (
    10,
    [
      #babel(
        en: [
          Spacing to insert between items where no explicit spacing was provided.
        ],
      )

      ```example
      #stack(
        dir: ltr,
        spacing: 1fr,
        [A], [B], [C],
      )
      ```
    ],
  ),
  "StackElem::children": (
    11,
    [
      #babel(
        en: [
          The children to stack along the axis.

          Each child can either be content or explicit spacing that replaces the
          spacing from the `spacing` parameter.

          Note that explicit spacing can also be specified as a @h or @v element
          depending on the stack direction.
        ],
      )

      ```example
      #stack(
        dir: ltr,
        spacing: 10pt,
        [A], [B], 0pt, [C],
      )
      ```
    ],
  ),
))
