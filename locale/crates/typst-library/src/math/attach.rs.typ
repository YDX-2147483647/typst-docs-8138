#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "AttachElem": (
    8,
    [
      #babel(
        en: [
          A base with optional attachments.
        ],
      )

      ```example
      $ attach(
        Pi, t: alpha, b: beta,
        tl: 1, tr: 2+3, bl: 4+5, br: 6,
      ) $
      ```

      #babel(
        en: [
          If you want to add accents (hats, tildes, arrows, etc.) instead of scripts
          or corner attachments, use the @math.accent[`accent`] function instead.
        ],
      )
    ],
  ),
  "AttachElem::base": (
    13,
    babel(
      en: [
        The base to which things are attached.
      ],
    ),
  ),
  "AttachElem::t": (
    4,
    babel(
      en: [
        The top attachment, smartly positioned at top-right or above the base.

        You can wrap the base in `{limits()}` or `{scripts()}` to override the
        smart positioning.
      ],
    ),
  ),
  "AttachElem::b": (
    6,
    babel(
      en: [
        The bottom attachment, smartly positioned at the bottom-right or below
        the base.

        You can wrap the base in `{limits()}` or `{scripts()}` to override the
        smart positioning.
      ],
    ),
  ),
  "AttachElem::tl": (
    7,
    babel(
      en: [
        The top-left attachment (before the base).
      ],
    ),
  ),
  "AttachElem::bl": (
    3,
    babel(
      en: [
        The bottom-left attachment (before base).
      ],
    ),
  ),
  "AttachElem::tr": (
    3,
    babel(
      en: [
        The top-right attachment (after the base).
      ],
    ),
  ),
  "AttachElem::br": (
    3,
    babel(
      en: [
        The bottom-right attachment (after the base).
      ],
    ),
  ),
  "PrimesElem": (
    4,
    [
      #babel(
        en: [
          Grouped primes.
        ],
      )

      ```example
      $ a'''_b = a^'''_b $
      ```

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          This function has dedicated syntax: use apostrophes instead of primes. They
          will automatically attach to the previous element, moving superscripts to
          the next level.
        ],
      )
    ],
  ),
  "PrimesElem::count": (
    12,
    babel(
      en: [
        The number of grouped primes.
      ],
    ),
  ),
  "ScriptsElem": (
    5,
    [
      #babel(
        en: [
          Forces a base to display attachments as scripts.
        ],
      )

      ```example
      $ scripts(sum)_1^2 != sum_1^2 $
      ```
    ],
  ),
  "ScriptsElem::body": (
    7,
    babel(
      en: [
        The base to attach the scripts to.
      ],
    ),
  ),
  "LimitsElem": (
    5,
    [
      #babel(
        en: [
          Forces a base to display attachments as limits.
        ],
      )

      ```example
      $ limits(A)_1^2 != A_1^2 $
      ```
    ],
  ),
  "LimitsElem::body": (
    7,
    babel(
      en: [
        The base to attach the limits to.
      ],
    ),
  ),
  "LimitsElem::inline": (
    4,
    babel(
      en: [
        Whether to also force limits in inline equations.

        When applying limits globally (e.g., through a show rule), it is
        typically a good idea to disable this.
      ],
    ),
  ),
  "StretchElem": (
    8,
    [
      #babel(
        en: [
          Stretches a glyph.

          This function can also be used to automatically stretch the base of an
          attachment, so that it fits the top and bottom attachments.

          Note that only some glyphs can be stretched, and which ones can depend on
          the math font being used. However, most math fonts are the same in this
          regard.
        ],
      )

      ```example
      $ H stretch(=)^"define" U + p V $
      $ f : X stretch(->>, size: #150%)_"surjective" Y $
      $ x stretch(harpoons.ltrb, size: #3em) y
          stretch(\[, size: #150%) z $
      ```
    ],
  ),
  "StretchElem::body": (
    17,
    babel(
      en: [
        The glyph to stretch.
      ],
    ),
  ),
  "StretchElem::size": (
    4,
    [
      #babel(
        en: [
          The size to stretch to, relative to the maximum size of the glyph and
          its attachments.

          Note that the resulting glyph may not have the exact desired size. A
          stretched glyph may be either a pre-defined glyph, or a glyph assembled
          from building blocks provided by the font. The possible sizes may not
          cover the entire span. In the example below, when the `size` parameter
          is increased from `{101%}` to `{200%}`, the selected glyph remains the
          same, so the actual size does not change.
        ],
      )

      #example(
        title: "Size of ∫ growing discontinuously",
        ```
        >>> #set align(center)
        #for size in (
          100%, // short
          101%, 200%, // tall
          201%, 300%, 400%, 500%, 600%, // taller
        ) {
          $stretch(integral, size: #size)$
        }
        ```,
      )
    ],
  ),
))
