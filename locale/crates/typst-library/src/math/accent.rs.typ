#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "AccentElem": (
    20,
    [
      #babel(
        en: [
          Attaches an accent to a base.

          In math mode, common accents are also available as named @symbol[symbols]
          that can be directly called (like @function[functions]) to attach them to
          some content.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      $grave(a) = accent(a, `)$ \
      $arrow(a) = accent(a, arrow)$ \
      $tilde(a) = accent(a, \u{0303})$
      ```
    ],
  ),
  "AccentElem::base": (
    14,
    [
      #babel(
        en: [
          The base to which the accent is applied. May consist of multiple
          letters.
        ],
      )

      ```example
      $arrow(A B C)$
      ```
    ],
  ),
  "AccentElem::accent": (
    9,
    [
      #babel(
        en: [
          The accent to apply to the base.

          Supported accents include:
        ],
      )

      #docs-table(
        table.header[Accent][Name][Codepoint],

        [Grave],
        [`grave`],
        [``` ` ```],

        [Acute],
        [`acute`],
        [`´`],

        [Circumflex],
        [`hat`],
        [`^`],

        [Tilde],
        [`tilde`],
        [`~`],

        [Macron],
        [`macron`],
        [`¯`],

        [Dash],
        [`dash`],
        [`‾`],

        [Breve],
        [`breve`],
        [`˘`],

        [Dot],
        [`dot`],
        [`.`],

        [Double dot, Diaeresis],
        [`dot.double`, `diaer`],
        [`¨`],

        [Triple dot],
        [`dot.triple`],
        raw(lang: "typ", "\\u{20db}"),

        [Quadruple dot],
        [`dot.quad`],
        raw(lang: "typ", "\\u{20dc}"),

        [Circle],
        [`circle`],
        [`∘`],

        [Double acute],
        [`acute.double`],
        [`˝`],

        [Caron],
        [`caron`],
        [`ˇ`],

        [Right arrow],
        [`arrow`, `->`],
        [`→`],

        [Left arrow],
        [`arrow.l`, `<-`],
        [`←`],

        [Left/Right arrow],
        [`arrow.l.r`],
        [`↔`],

        [Right harpoon],
        [`harpoon`],
        [`⇀`],

        [Left harpoon],
        [`harpoon.lt`],
        [`↼`],
      )
    ],
  ),
  "AccentElem::size": (
    86,
    [
      #babel(
        en: [
          The size of the accent, relative to the width of the base.
        ],
      )

      #example(
        title: "Basic usage",
        ```
        $dash(A, size: #150%)$
        ```,
      )

      #babel(
        en: [
          Note that the resulting accent may not have the exact desired size. For
          example, an arrow may be either a pre-defined short glyph, or a long
          glyph assembled from building blocks (arrowhead + line) provided by the
          font. The sizes of the two possibilities may not cover the entire span.
          Consequently, arrows of certain intermediate sizes cannot be
          constructed.
        ],
      )

      #example(
        title: "Size of arrow growing discontinuously",
        ```
        >>> #set par(spacing: 0.3em)
        #for i in range(6) {
          $ arrow(#box(
            width: 0.4em + 0.3em * i,
            fill: aqua,
            height: 0.4em,
          )) $
        }
        ```,
      )
    ],
  ),
  "AccentElem::dotless": (
    32,
    [
      #babel(
        en: [
          Whether to remove the dot on top of lowercase i and j when adding a top
          accent.

          This enables the `dtls` OpenType feature.
        ],
      )

      ```example
      $hat(dotless: #false, i)$
      ```
    ],
  ),
))
