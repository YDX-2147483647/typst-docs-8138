#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "QuoteElem": (
    11,
    [
      #babel(
        en: [
          Displays a quote alongside an optional attribution.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Plato is often misquoted
      as the author of
      #quote[I know that I know nothing.]
      However, this is a derivation from
      his original quote:

      #quote(
        block: true,
        attribution: [Plato],
      )[
        ... ἔοικα γοῦν τούτου γε σμικρῷ
        τινι αὐτῷ τούτῳ σοφώτερος εἶναι,
        ὅτι ἃ μὴ οἶδα οὐδὲ οἴομαι εἰδέναι.
      ]
      ```

      #babel(
        en: [
          By default block quotes are padded left and right by `{1em}`. Alignment and
          padding can be controlled with show-set rules:
        ],
      )

      ```example
      #set quote(block: true)
      #show quote: set align(center)
      #show quote: set pad(x: 5em)

      #quote[
        You cannot pass... I am a servant
        of the Secret Fire, wielder of the
        flame of Anor. You cannot pass.
        The dark fire will not avail you,
        flame of Udûn. Go back to the
        Shadow! You cannot pass.
      ]
      ```
    ],
  ),
  "QuoteElem::block": (
    39,
    [
      #babel(
        en: [
          Whether this is a block quote.
        ],
      )

      #example(
        title: [Inline quote],
        ```
        #quote[Cogito, ergo sum]
        ```,
      )

      #example(
        title: [Block quote],
        ```
        #quote(
          block: true,
          attribution: [John F. Kennedy],
        )[
          Ich bin ein Berliner.
        ]
        ```,
      )
    ],
  ),
  "QuoteElem::quotes": (
    22,
    [
      #babel(
        en: [
          Whether double quotes should be added around this quote.

          The double quotes used are inferred from the `quotes` property on
          @smartquote[smartquote], which is affected by the `lang` property on
          @text[text].

          - `{true}`: Wrap this quote in double quotes.
          - `{false}`: Do not wrap this quote in double quotes.
          - `{auto}`: Infer whether to wrap this quote in double quotes based on
            the `block` property. If `block` is `{false}`, double quotes are
            automatically added.
        ],
      )

      #example(
        title: [Using italics instead of quotation marks],
        ```
        #set quote(quotes: false)
        #show quote: set text(style: "italic")

        The well-known phrase
        #quote[Ich bin ein Berliner]
        from JFK's speech in Berlin
        marked a turning point in
        relations between East and West.
        ```,
      )

      #example(
        title: [Quotes are language-aware],
        ```
        #text(lang: "de")[
          Ein deutschsprachiger Autor
          zitiert unter Umständen Kennedy:
          #quote[Ich bin ein Berliner.]
        ]

        #text(lang: "en")[
          And an English-speaking author
          may translate the quote to:
          #quote[I am a Berliner.]
        ]
        ```,
      )
    ],
  ),
  "QuoteElem::attribution": (
    44,
    [
      #babel(
        en: [
          The attribution of this quote, usually the author or source.

          This can either be arbitrary content or a label pointing to a
          bibliography entry. If the attribution is content, it is displayed only
          for block quotes by default (this can be changed using a show rule). If
          the attribution is a label, it is displayed as a @cite[citation] in
          normal or prose @cite.form[form] for inline and block quotes,
          respectively.
        ],
      )

      #example(
        title: [Cite a bibliography entry as the attribution],
        ```
        Gandalf the Grey appeared in the scene
        #quote(attribution: <tolkien54>)[
          The Bridge of Khazad-dûm
        ].

        #quote(
          block: true,
          attribution: <tolkien54>,
        )[
          You cannot pass... I am a servant
          of the Secret Fire, wielder of the
          flame of Anor. You cannot pass. The
          dark fire will not avail you, flame
          of Udûn. Go back to the Shadow! You
          cannot pass.
        ]

        #bibliography(
          "works.bib",
          style: "apa",
        )
        ```,
      )

      #example(
        title: [Customize the attribution for inline quotes],
        ```example
        // With default show rule.
        #quote(attribution: [René Descartes])[
          Cogito, ergo sum
        ]

        #show quote.where(block: false): it => {
          ["] + h(0pt, weak: true) + it.body + h(0pt, weak: true) + ["]
          if it.attribution != none [ (#it.attribution)]
        }

        // With our custom show rule.
        #quote(attribution: [René Descartes])[
          Cogito, ergo sum
        ]
        ```,
      )
    ],
  ),
  "QuoteElem::body": (
    57,
    babel(
      en: [
        The quote.
      ],
    ),
  ),
))
