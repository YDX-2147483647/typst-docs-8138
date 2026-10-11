#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Fr": (
    11,
    [
      #babel(
        en: [
          Defines how the remaining space in a layout is distributed.

          Each fractionally sized element gets space based on the ratio of its
          fraction to the sum of all fractions.

          For more details, also see the @h and @v functions and the
          @grid[`grid` function].
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Left #h(1fr) Left-ish #h(2fr) Right
      ```
    ],
  ),
))
