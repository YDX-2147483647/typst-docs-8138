#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "EquationElem": (
    20,
    [
      #babel(
        en: [
          A mathematical equation.

          Can be displayed inline with text or as a separate block. An equation
          becomes block-level through the presence of whitespace after the opening
          dollar sign and whitespace before the closing dollar sign.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #set text(font: "New Computer Modern")

      Let $a$, $b$, and $c$ be the side
      lengths of a right-angled triangle.
      Then, we know that:
      $ a^2 + b^2 = c^2 $

      Prove by induction:
      $ sum_(k=1)^n k = (n(n+1)) / 2 $
      ```

      #babel(
        en: [
          By default, block-level equations will not break across pages. This can be
          changed through `{show math.equation: set block(breakable: true)}`.
        ],
      )

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          This function also has dedicated syntax: Write mathematical markup within
          dollar signs to create an equation. Starting and ending the equation with
          whitespace lifts it into a separate block that is centered horizontally. For
          more details about math syntax, see the @math[main math page].
        ],
      )
    ],
  ),
  "EquationElem::block": (
    39,
    babel(
      en: [
        Whether the equation is displayed as a separate block.
      ],
    ),
  ),
  "EquationElem::numbering": (
    4,
    [
      #babel(
        en: [
          How to number block-level equations. Accepts a
          @numbering[numbering pattern or function] taking a single number.
        ],
      )

      ```example
      #set math.equation(numbering: "(1)")

      We define:
      $ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

      With @ratio, we get:
      $ F_n = floor(1 / sqrt(5) phi.alt^n) $
      ```
    ],
  ),
  "EquationElem::number_align": (
    14,
    [
      #babel(
        en: [
          The alignment of the equation numbering.

          By default, the alignment is `{end + horizon}`. For the horizontal
          component, you can use `{right}`, `{left}`, or `{start}` and `{end}` of
          the text direction; for the vertical component, you can use `{top}`,
          `{horizon}`, or `{bottom}`.
        ],
      )

      ```example
      #set math.equation(numbering: "(1)", number-align: bottom)

      We can calculate:
      $ E &= sqrt(m_0^2 + p^2) \
          &approx 125 "GeV" $
      ```
    ],
  ),
  "EquationElem::supplement": (
    17,
    [
      #babel(
        en: [
          A supplement for the equation.

          For references to equations, this is added before the referenced number.

          If a function is specified, it is passed the referenced equation and
          should return content.
        ],
      )

      ```example
      #set math.equation(numbering: "(1)", supplement: [Eq.])

      We define:
      $ phi.alt := (1 + sqrt(5)) / 2 $ <ratio>

      With @ratio, we get:
      $ F_n = floor(1 / sqrt(5) phi.alt^n) $
      ```
    ],
  ),
  "EquationElem::alt": (
    18,
    [
      #babel(
        en: [
          An alternative description of the mathematical equation.

          This should describe the full equation in natural language and will be
          made available to Assistive Technology. You can learn more in the
          @guides:accessibility:textual-representations[Textual Representations
            section of the Accessibility Guide].
        ],
      )

      ```example
      #math.equation(
        alt: "integral from 1 to infinity of a x squared plus b with respect to x",
        block: true,
        $ integral_1^oo a x^2 + b dif x $,
      )
      ```
    ],
  ),
  "EquationElem::body": (
    16,
    babel(
      en: [
        The contents of the equation.
      ],
    ),
  ),
))
