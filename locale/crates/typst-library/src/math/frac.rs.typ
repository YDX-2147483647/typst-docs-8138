#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "FracElem": (
    11,
    [
      #babel(
        en: [
          A mathematical fraction.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      $ 1/2 < (x+1)/2 $
      $ ((x+1)) / 2 = frac(a, b) $
      ```

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          This function also has dedicated syntax: Use a slash to turn neighbouring
          expressions into a fraction. Multiple atoms can be grouped into a single
          expression using round grouping parentheses. Such parentheses are removed
          from the output, but you can nest multiple to force them.
        ],
      )
    ],
  ),
  "FracElem::num": (
    15,
    babel(
      en: [
        The fraction's numerator.
      ],
    ),
  ),
  "FracElem::denom": (
    4,
    babel(
      en: [
        The fraction's denominator.
      ],
    ),
  ),
  "FracElem::style": (
    4,
    [
      #babel(
        en: [
          How the fraction should be laid out.
        ],
      )

      #example(
        title: "Styles",
        ```
        $ frac(x, y, style: "vertical") $
        $ frac(x, y, style: "skewed") $
        $ frac(x, y, style: "horizontal") $
        ```,
      )

      #example(
        title: "Setting the default",
        ```
        #set math.frac(style: "skewed")
        $ a / b $
        ```,
      )

      #example(
        title: "Handling of grouping parentheses",
        ```
        // Grouping parentheses are removed.
        #set math.frac(style: "vertical")
        $ (a + b) / b $

        // Grouping parentheses are removed.
        #set math.frac(style: "skewed")
        $ (a + b) / b $

        // Grouping parentheses are retained.
        #set math.frac(style: "horizontal")
        $ (a + b) / b $
        ```,
      )

      #example(
        title: "Different styles in inline vs block equations",
        ```
        // This changes the style for inline equations only.
        #show math.equation.where(block: false): set math.frac(style: "horizontal")

        This $(x-y)/z = 3$ is inline math, and this is block math:
        $ (x-y)/z = 3 $
        ```,
      )

      #example(
        title: "Use LaTeX-like convention",
        ```
        // Change the default style.
        #set math.frac(style: "horizontal")
        // Define a shorthand with the original style.
        #let frac = math.frac.with(style: "vertical")

        $ p/q = frac(p, q) $

        // The shadowed definition can still be accessed.
        #assert.eq($p/q$, $std.math.frac(p, q)$)
        ```,
      )
    ],
  ),
  "BinomElem": (
    92,
    [
      #babel(
        en: [
          A binomial expression.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      $ binom(n, k) $
      $ binom(n, k_1, k_2, k_3, ..., k_m) $
      ```
    ],
  ),
  "BinomElem::upper": (
    9,
    babel(
      en: [
        The binomial's upper index.
      ],
    ),
  ),
  "BinomElem::lower": (
    4,
    babel(
      en: [
        The binomial's lower index.
      ],
    ),
  ),
))
