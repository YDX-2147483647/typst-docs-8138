#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "bold": (
    9,
    [
      #babel(
        en: [
          Bold font style in math.
        ],
      )

      ```example
      $ bold(A) := B^+ $
      ```
    ],
  ),
  "bold::body": (
    7,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "upright": (
    6,
    [
      #babel(
        en: [
          Upright (non-italic) font style in math.
        ],
      )

      ```example
      $ upright(A) != A $
      ```
    ],
  ),
  "upright::body": (
    7,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "italic": (
    6,
    babel(
      en: [
        Italic font style in math.

        For roman letters and greek lowercase letters, this is already the default.
      ],
    ),
  ),
  "italic::body": (
    5,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "serif": (
    6,
    babel(
      en: [
        Serif (roman) font style in math.

        This is already the default.
      ],
    ),
  ),
  "serif::body": (
    5,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "sans": (
    6,
    [
      #babel(
        en: [
          Sans-serif font style in math.
        ],
      )

      ```example
      $ sans(A B C) $
      ```
    ],
  ),
  "sans::body": (
    7,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "cal": (
    6,
    [
      #babel(
        en: [
          Calligraphic (chancery) font style in math.
        ],
      )

      ```example
      Let $cal(P)$ be the set of ...
      ```

      #babel(
        en: [
          This is the default calligraphic/script style for most math fonts. See
          @math.scr[`scr`] for more on how to get the other style (roundhand).
        ],
      )
    ],
  ),
  "cal::body": (
    10,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "scr": (
    6,
    [
      #babel(
        en: [
          Script (roundhand) font style in math.
        ],
      )

      ```example
      $scr(L)$ is not the set of linear
      maps $cal(L)$.
      ```

      #babel(
        en: [
          There are two ways that fonts can support differentiating `cal` and `scr`.
          The first is using Unicode variation sequences. This works out of the box in
          Typst, however only a few math fonts currently support this.

          The other way is using @text.features[font features]. For example, the
          roundhand style might be available in a font through the
          _@text.stylistic-set[stylistic set] 1_ (`ss01`) feature. To use it in Typst,
          you could then define your own version of `scr` like in the example below.
        ],
      )

      #example(
        title: "Recreation using stylistic set 1",
        ```
        #let scr(it) = text(
          stylistic-set: 1,
          $cal(it)$,
        )

        We establish $cal(P) != scr(P)$.
        ```,
      )
    ],
  ),
  "scr::body": (
    29,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "frak": (
    6,
    [
      #babel(
        en: [
          Fraktur font style in math.
        ],
      )

      ```example
      $ frak(P) $
      ```
    ],
  ),
  "frak::body": (
    11,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "mono": (
    6,
    [
      #babel(
        en: [
          Monospace font style in math.
        ],
      )

      ```example
      $ mono(x + y = z) $
      ```
    ],
  ),
  "mono::body": (
    7,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "bb": (
    6,
    [
      #babel(
        en: [
          Blackboard bold (double-struck) font style in math.

          For uppercase latin letters, blackboard bold is additionally available
          through @sym[symbols] of the form `NN` and `RR`.
        ],
      )

      ```example
      $ bb(b) $
      $ bb(N) = NN $
      $ f: NN -> RR $
      ```
    ],
  ),
  "bb::body": (
    12,
    babel(
      en: [
        The content to style.
      ],
    ),
  ),
  "display": (
    6,
    [
      #babel(
        en: [
          Forced display style in math.

          This is the normal size for block equations.
        ],
      )

      ```example
      $sum_i x_i/2 = display(sum_i x_i/2)$
      ```
    ],
  ),
  "display::body": (
    9,
    babel(
      en: [
        The content to size.
      ],
    ),
  ),
  "display::cramped": (
    2,
    babel(
      en: [
        Whether to impose a height restriction for exponents, like regular sub-
        and superscripts do.
      ],
    ),
  ),
  "inline": (
    10,
    [
      #babel(
        en: [
          Forced inline (text) style in math.

          This is the normal size for inline equations.
        ],
      )

      ```example
      $ sum_i x_i/2
          = inline(sum_i x_i/2) $
      ```
    ],
  ),
  "inline::body": (
    10,
    babel(
      en: [
        The content to size.
      ],
    ),
  ),
  "inline::cramped": (
    2,
    babel(
      en: [
        Whether to impose a height restriction for exponents, like regular sub-
        and superscripts do.
      ],
    ),
  ),
  "script": (
    10,
    [
      #babel(
        en: [
          Forced script style in math.

          This is the smaller size used in powers or sub- or superscripts.
        ],
      )

      ```example
      $sum_i x_i/2 = script(sum_i x_i/2)$
      ```
    ],
  ),
  "script::body": (
    9,
    babel(
      en: [
        The content to size.
      ],
    ),
  ),
  "script::cramped": (
    2,
    babel(
      en: [
        Whether to impose a height restriction for exponents, like regular sub-
        and superscripts do.
      ],
    ),
  ),
  "sscript": (
    10,
    [
      #babel(
        en: [
          Forced second script style in math.

          This is the smallest size, used in second-level sub- and superscripts
          (script of the script).
        ],
      )

      ```example
      $sum_i x_i/2 = sscript(sum_i x_i/2)$
      ```
    ],
  ),
  "sscript::body": (
    10,
    babel(
      en: [
        The content to size.
      ],
    ),
  ),
  "sscript::cramped": (
    2,
    babel(
      en: [
        Whether to impose a height restriction for exponents, like regular sub-
        and superscripts do.
      ],
    ),
  ),
))
