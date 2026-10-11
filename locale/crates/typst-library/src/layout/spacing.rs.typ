#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "HElem": (
    6,
    [
      #babel(
        en: [
          Inserts horizontal spacing into a paragraph.

          The spacing can be absolute, relative, or fractional. In the last case, the
          remaining space on the line is distributed among all fractional spacings
          according to their relative fractions.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      First #h(1cm) Second \
      First #h(30%) Second
      ```

      = #babel(en: [Fractional spacing]) <fractional-spacing>
      #babel(
        en: [
          With fractional spacing, you can align things within a line without forcing
          a paragraph break (like @align would). Each fractionally sized element gets
          space based on the ratio of its fraction to the sum of all fractions.
        ],
      )

      ```example
      First #h(1fr) Second \
      First #h(1fr) Second #h(1fr) Third \
      First #h(2fr) Second #h(1fr) Third
      ```

      = #babel(en: short-or-long[Math Spacing][Mathematical Spacing]) <math-spacing>
      #babel(
        en: [
          In @math[mathematical formulas], you can additionally use these constants to
          add spacing between elements: `thin` (1/6 em), `med` (2/9 em), `thick`
          (5/18 em), `quad` (1 em), `wide` (2 em).
        ],
      )
    ],
  ),
  "HElem::amount": (
    29,
    babel(
      en: [
        How much spacing to insert.
      ],
    ),
  ),
  "HElem::weak": (
    4,
    [
      #babel(
        en: [
          If `{true}`, the spacing collapses at the start or end of a paragraph.
          Moreover, from multiple adjacent weak spacings all but the largest one
          collapse.

          Weak spacing in markup also causes all adjacent markup spaces to be
          removed, regardless of the amount of spacing inserted. To force a space
          next to weak spacing, you can explicitly write `[#" "]` (for a normal
          space) or `[~]` (for a non-breaking space). The latter can be useful to
          create a construct that always attaches to the preceding word with one
          non-breaking space, independently of whether a markup space existed in
          front or not.
        ],
      )

      ```example
      #h(1cm, weak: true)
      We identified a group of _weak_
      specimens that fail to manifest
      in most cases. However, when
      #h(8pt, weak: true) supported
      #h(8pt, weak: true) on both sides,
      they do show up.

      Further #h(0pt, weak: true) more,
      even the smallest of them swallow
      adjacent markup spaces.
      ```
    ],
  ),
  "VElem": (
    36,
    [
      #babel(
        en: [
          Inserts vertical spacing into a flow of blocks.

          The spacing can be absolute, relative, or fractional. In the last case, the
          remaining space on the page is distributed among all fractional spacings
          according to their relative fractions.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #grid(
        rows: 3cm,
        columns: 6,
        gutter: 1fr,
        [A #parbreak() B],
        [A #v(0pt) B],
        [A #v(10pt) B],
        [A #v(0pt, weak: true) B],
        [A #v(40%, weak: true) B],
        [A #v(1fr) B],
      )
      ```
    ],
  ),
  "VElem::amount": (
    22,
    babel(
      en: [
        How much spacing to insert.
      ],
    ),
  ),
  "VElem::weak": (
    4,
    [
      #babel(
        en: [
          If `{true}`, the spacing collapses at the start or end of a flow.
          Moreover, from multiple adjacent weak spacings all but the largest one
          collapse. Weak spacings will always collapse adjacent paragraph spacing,
          even if the paragraph spacing is larger.
        ],
      )

      ```example
      The following theorem is
      foundational to the field:
      #v(4pt, weak: true)
      $ x^2 + y^2 = r^2 $
      #v(4pt, weak: true)
      The proof is simple:
      ```
    ],
  ),
))
