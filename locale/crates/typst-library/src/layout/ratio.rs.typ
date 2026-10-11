#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Ratio": (
    9,
    [
      #babel(
        en: [
          A ratio of a whole.

          A ratio is written as a number, followed by a percent sign. Ratios most
          often appear as part of a @relative[relative length], to specify the size of
          some layout element relative to the page or some container.
        ],
      )

      ```example
      #rect(width: 25%)
      ```

      #babel(
        en: [
          However, they can also describe any other property that is relative to some
          base, e.g. an amount of @scale.x[horizontal scaling] or the
          @math.lr.size[height of parentheses] relative to the height of the content
          they enclose.
        ],
      )

      = #babel(en: [Scripting]) <scripting>
      #babel(
        en: [
          Within your own code, you can use ratios as you like. You can multiply them
          with various other types as shown below:
        ],
      )

      #docs-table(
        table.header[Multiply by][Example][Result],

        [@ratio],
        [`{27% * 10%}`],
        [`{2.7%}`],

        [@length],
        [`{27% * 100pt}`],
        [`{27pt}`],

        [@relative],
        [`{27% * (10% + 100pt)}`],
        [`{2.7% + 27pt}`],

        [@angle],
        [`{27% * 100deg}`],
        [`{27deg}`],

        [@int],
        [`{27% * 2}`],
        [`{54%}`],

        [@float],
        [`{27% * 0.37037}`],
        [`{10%}`],

        [@fraction],
        [`{27% * 3fr}`],
        [`{0.81fr}`],
      )

      #babel(
        en: [
          When ratios are @repr[displayed] in the document, they are rounded to two
          significant digits for readability.
        ],
      )
    ],
  ),
))
