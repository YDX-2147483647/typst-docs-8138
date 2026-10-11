#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "UnderlineElem": (
    6,
    [
      #babel(
        en: [
          Underlines text.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      This is #underline[important].
      ```
    ],
  ),
  "UnderlineElem::stroke": (
    8,
    [
      #babel(
        en: [
          How to @stroke[stroke] the line.

          If set to `{auto}`, takes on the text's color and a thickness defined in
          the current font.
        ],
      )

      ```example
      Take #underline(
        stroke: 1.5pt + red,
        offset: 2pt,
        [care],
      )
      ```
    ],
  ),
  "UnderlineElem::offset": (
    15,
    [
      #babel(
        en: [
          The position of the line relative to the baseline, read from the font
          tables if `{auto}`.
        ],
      )

      ```example
      #underline(offset: 5pt)[
        The Tale Of A Faraway Line I
      ]
      ```
    ],
  ),
  "UnderlineElem::extent": (
    10,
    [
      #babel(
        en: [
          The amount by which to extend the line beyond (or within if negative)
          the content.
        ],
      )

      ```example
      #align(center,
        underline(extent: 2pt)[Chapter 1]
      )
      ```
    ],
  ),
  "UnderlineElem::evade": (
    10,
    [
      #babel(
        en: [
          Whether the line skips sections in which it would collide with the
          glyphs.
        ],
      )

      ```example
      This #underline(evade: true)[is great].
      This #underline(evade: false)[is less great].
      ```
    ],
  ),
  "UnderlineElem::background": (
    10,
    [
      #babel(
        en: [
          Whether the line is placed behind the content it underlines.
        ],
      )

      ```example
      #set underline(stroke: aqua + 5pt, evade: false)
      #underline(background: true)[Fully visible.] \
      #underline(background: false)[Partially hidden.]
      ```
    ],
  ),
  "UnderlineElem::body": (
    10,
    babel(
      en: [
        The content to underline.
      ],
    ),
  ),
  "OverlineElem": (
    5,
    [
      #babel(
        en: [
          Adds a line over text.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #overline[A line over text.]
      ```
    ],
  ),
  "OverlineElem::stroke": (
    8,
    [
      #babel(
        en: [
          How to @stroke[stroke] the line.

          If set to `{auto}`, takes on the text's color and a thickness defined in
          the current font.
        ],
      )

      ```example
      #set text(fill: olive)
      #overline(
        stroke: green.darken(20%),
        offset: -12pt,
        [The Forest Theme],
      )
      ```
    ],
  ),
  "OverlineElem::offset": (
    16,
    [
      #babel(
        en: [
          The position of the line relative to the baseline. Read from the font
          tables if `{auto}`.
        ],
      )

      ```example
      #overline(offset: -1.2em)[
        The Tale Of A Faraway Line II
      ]
      ```
    ],
  ),
  "OverlineElem::extent": (
    10,
    [
      #babel(
        en: [
          The amount by which to extend the line beyond (or within if negative)
          the content.
        ],
      )

      ```example
      #set overline(extent: 4pt)
      #set underline(extent: 4pt)
      #overline(underline[Typography Today])
      ```
    ],
  ),
  "OverlineElem::evade": (
    10,
    [
      #babel(
        en: [
          Whether the line skips sections in which it would collide with the
          glyphs.
        ],
      )

      ```example
      #overline(
        evade: false,
        offset: -7.5pt,
        stroke: 1pt,
        extent: 3pt,
        [Temple],
      )
      ```
    ],
  ),
  "OverlineElem::background": (
    15,
    [
      #babel(
        en: [
          Whether the line is placed behind the content it overlines.
        ],
      )

      ```example
      #set overline(stroke: aqua + 5pt)
      #overline(background: true)[Fully visible.] \
      #overline(background: false)[Partially hidden.]
      ```
    ],
  ),
  "OverlineElem::body": (
    10,
    babel(
      en: [
        The content to add a line over.
      ],
    ),
  ),
  "StrikeElem": (
    5,
    [
      #babel(
        en: [
          Strikes through text.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      This is #strike[not] relevant.
      ```
    ],
  ),
  "StrikeElem::stroke": (
    8,
    [
      #babel(
        en: [
          How to @stroke[stroke] the line.

          If set to `{auto}`, takes on the text's color and a thickness defined in
          the current font.

          _Note:_ Please don't use this for real redaction as you can still copy
          paste the text.
        ],
      )

      ```example
      This is #strike(stroke: 1.5pt + red)[very stricken through]. \
      This is #strike(stroke: 10pt)[redacted].
      ```
    ],
  ),
  "StrikeElem::offset": (
    15,
    [
      #babel(
        en: [
          The position of the line relative to the baseline. Read from the font
          tables if `{auto}`.

          This is useful if you are unhappy with the offset your font provides.
        ],
      )

      ```example
      #set text(font: "Inria Serif")
      This is #strike(offset: auto)[low-ish]. \
      This is #strike(offset: -3.5pt)[on-top].
      ```
    ],
  ),
  "StrikeElem::extent": (
    12,
    [
      #babel(
        en: [
          The amount by which to extend the line beyond (or within if negative)
          the content.
        ],
      )

      ```example
      This #strike(extent: -2pt)[skips] parts of the word.
      This #strike(extent: 2pt)[extends] beyond the word.
      ```
    ],
  ),
  "StrikeElem::background": (
    9,
    [
      #babel(
        en: [
          Whether the line is placed behind the content.
        ],
      )

      ```example
      #set strike(stroke: red + 2pt)
      #strike(background: true)[This is behind.] \
      #strike(background: false)[This is in front.]
      ```
    ],
  ),
  "StrikeElem::body": (
    10,
    babel(
      en: [
        The content to strike through.
      ],
    ),
  ),
  "HighlightElem": (
    5,
    [
      #babel(
        en: [
          Highlights text with a background color.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      This is #highlight[important].
      ```
    ],
  ),
  "HighlightElem::fill": (
    8,
    [
      #babel(
        en: [
          The color to highlight the text with.
        ],
      )

      ```example
      This is #highlight(
        fill: blue
      )[highlighted with blue].
      ```
    ],
  ),
  "HighlightElem::stroke": (
    10,
    [
      #babel(
        en: [
          The highlight's border color. See the
          @rect.stroke[rectangle's documentation] for more details.
        ],
      )

      ```example
      This is a #highlight(
        stroke: fuchsia
      )[stroked highlighting].
      ```
    ],
  ),
  "HighlightElem::top_edge": (
    11,
    [
      #babel(
        en: [
          The top end of the background rectangle.
        ],
      )

      ```example
      #set highlight(top-edge: "ascender")
      #highlight[a] #highlight[aib]

      #set highlight(top-edge: "x-height")
      #highlight[a] #highlight[aib]
      ```
    ],
  ),
  "HighlightElem::bottom_edge": (
    12,
    [
      #babel(
        en: [
          The bottom end of the background rectangle.
        ],
      )

      ```example
      #set highlight(bottom-edge: "descender")
      #highlight[a] #highlight[ap]

      #set highlight(bottom-edge: "baseline")
      #highlight[a] #highlight[ap]
      ```
    ],
  ),
  "HighlightElem::extent": (
    12,
    [
      #babel(
        en: [
          The amount by which to extend the background to the sides beyond (or
          within if negative) the content.
        ],
      )

      ```example
      A long #highlight(extent: 4pt)[background].
      ```
    ],
  ),
  "HighlightElem::radius": (
    8,
    [
      #babel(
        en: [
          How much to round the highlight's corners. See the
          @rect.radius[rectangle's documentation] for more details.
        ],
      )

      ```example
      Listen #highlight(
        radius: 5pt, extent: 2pt
      )[carefully], it will be on the test.
      ```
    ],
  ),
  "HighlightElem::body": (
    11,
    babel(
      en: [
        The content that should be highlighted.
      ],
    ),
  ),
))
