#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "repr": (
    11,
    [
      #babel(
        en: [
          Returns the string representation of a value.

          When inserted into content, most values are displayed as this representation
          in monospace with syntax-highlighting. The exceptions are `{none}`,
          integers, floats, strings, content, and functions.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #none vs #repr(none) \
      #"hello" vs #repr("hello") \
      #(1, 2) vs #repr((1, 2)) \
      #[*Hi*] vs #repr([*Hi*])
      ```

      = #babel(en: short-or-long[Debugging Only][For debugging purposes only]) <debugging-only>
      #babel(
        en: [
          This function is for debugging purposes. Its output should not be considered
          stable and may change at any time.

          To be specific, having the same `repr` does not guarantee that values are
          equivalent, and `repr` is not a strict inverse of @eval. In the following
          example, for readability, the @length is rounded to two significant digits
          and the parameter list and body of the @function:unnamed[unnamed `function`]
          are omitted.
        ],
      )

      ```example
      #assert(2pt / 3 < 0.67pt)
      #repr(2pt / 3)

      #repr(x => x + 1)
      ```
    ],
  ),
  "repr::value": (
    32,
    babel(
      en: [
        The value whose string representation to produce.
      ],
    ),
  ),
))
