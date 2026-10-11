#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "SubElem": (
    7,
    [
      #babel(
        en: [
          Renders text in subscript.

          The text is rendered smaller and its baseline is lowered.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Revenue#sub[yearly]
      ```
    ],
  ),
  "SubElem::typographic": (
    10,
    [
      #babel(
        en: [
          Whether to use subscript glyphs from the font if available.

          Ideally, subscripts glyphs are provided by the font (using the `subs`
          OpenType feature). Otherwise, Typst is able to synthesize subscripts by
          lowering and scaling down regular glyphs.

          When this is set to `{false}`, synthesized glyphs will be used
          regardless of whether the font provides dedicated subscript glyphs. When
          `{true}`, synthesized glyphs may still be used in case the font does not
          provide the necessary subscript glyphs.
        ],
      )

      ```example
      N#sub(typographic: true)[1]
      N#sub(typographic: false)[1]
      ```
    ],
  ),
  "SubElem::baseline": (
    18,
    babel(
      en: [
        The downward baseline shift for synthesized subscripts.

        This only applies to synthesized subscripts. In other words, this has no
        effect if `typographic` is `{true}` and the font provides the necessary
        subscript glyphs.

        If set to `{auto}`, the baseline is shifted according to the metrics
        provided by the font, with a fallback to `{0.2em}` in case the font does
        not define the necessary metrics.

        When using multiple fonts, it might be necessary to set `baseline` and
        @sub.size[`size`] explicitly. See @super.baseline[`super`] for an
        example.
      ],
    ),
  ),
  "SubElem::size": (
    15,
    babel(
      en: [
        The font size for synthesized subscripts.

        This only applies to synthesized subscripts. In other words, this has no
        effect if `typographic` is `{true}` and the font provides the necessary
        subscript glyphs.

        If set to `{auto}`, the size is scaled according to the metrics provided
        by the font, with a fallback to `{0.6em}` in case the font does not
        define the necessary metrics.
      ],
    ),
  ),
  "SubElem::body": (
    11,
    babel(
      en: [
        The text to display in subscript.
      ],
    ),
  ),
  "SuperElem": (
    5,
    [
      #babel(
        en: [
          Renders text in superscript.

          The text is rendered smaller and its baseline is raised.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      1#super[st] try!
      ```
    ],
  ),
  "SuperElem::typographic": (
    10,
    [
      #babel(
        en: [
          Whether to use superscript glyphs from the font if available.

          Ideally, superscripts glyphs are provided by the font (using the `sups`
          OpenType feature). Otherwise, Typst is able to synthesize superscripts
          by raising and scaling down regular glyphs.

          When this is set to `{false}`, synthesized glyphs will be used
          regardless of whether the font provides dedicated superscript glyphs.
          When `{true}`, synthesized glyphs may still be used in case the font
          does not provide the necessary superscript glyphs.
        ],
      )

      ```example
      N#super(typographic: true)[1]
      N#super(typographic: false)[1]
      ```
    ],
  ),
  "SuperElem::baseline": (
    18,
    [
      #babel(
        en: [
          The downward baseline shift for synthesized superscripts.

          This only applies to synthesized superscripts. In other words, this has
          no effect if `typographic` is `{true}` and the font provides the
          necessary superscript glyphs.

          If set to `{auto}`, the baseline is shifted according to the metrics
          provided by the font, with a fallback to `{-0.5em}` in case the font
          does not define the necessary metrics.

          Note that, since the baseline shift is applied downward, you will need
          to provide a negative value for the content to appear as raised above
          the normal baseline.

          Sometimes it is necessary to set `baseline` and @super.size[`size`]
          explicitly. In the following example, the superscripted text uses
          multiple fonts with incompatible metrics. To avoid misalignment, we
          override the metrics for all fonts.
        ],
      )

      ```example
      #let tz(timezone) = text(
        font: "Roboto",
        smallcaps(timezone, all: true),
      )

      / Per-font metrics:
        14:00#super[#tz[UTC], not #tz[CET]]

      #set super(
        baseline: -0.4em,
        size: 0.6em,
        typographic: false,
      )
      / Unified metrics:
        14:00#super[#tz[UTC], not #tz[CET]]
      ```
    ],
  ),
  "SuperElem::size": (
    38,
    babel(
      en: [
        The font size for synthesized superscripts.

        This only applies to synthesized superscripts. In other words, this has
        no effect if `typographic` is `{true}` and the font provides the
        necessary superscript glyphs.

        If set to `{auto}`, the size is scaled according to the metrics provided
        by the font, with a fallback to `{0.6em}` in case the font does not
        define the necessary metrics.
      ],
    ),
  ),
  "SuperElem::body": (
    11,
    babel(
      en: [
        The text to display in superscript.
      ],
    ),
  ),
))
