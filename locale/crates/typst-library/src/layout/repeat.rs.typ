#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "RepeatElem": (
    4,
    [
      #babel(
        en: [
          Repeats content to the available space.

          This can be useful when implementing a custom index, reference, or outline.

          Space may be inserted between the instances of the body parameter, so be
          sure to adjust the @repeat.justify[`justify`] parameter accordingly.

          Errors if there are no bounds on the available space, as it would create
          infinite content.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Sign on the dotted line:
      #box(width: 1fr, repeat[.])

      #set text(10pt)
      #v(8pt, weak: true)
      #align(right)[
        Berlin, the 22nd of December, 2022
      ]
      ```

      = #babel(en: [Accessibility]) <accessibility>
      #babel(
        en: [
          Repeated content is automatically marked as an @pdf.artifact[artifact] and
          hidden from Assistive Technology (AT). Do not use this function to create
          content that contributes to the meaning of your document.
        ],
      )
    ],
  ),
  "RepeatElem::body": (
    28,
    babel(
      en: [
        The content to repeat.
      ],
    ),
  ),
  "RepeatElem::gap": (
    4,
    babel(
      en: [
        The gap between each instance of the body.
      ],
    ),
  ),
  "RepeatElem::justify": (
    4,
    babel(
      en: [
        Whether to increase the gap between instances to completely fill the
        available space.
      ],
    ),
  ),
))
