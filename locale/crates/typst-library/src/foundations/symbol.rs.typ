#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Symbol": (
    19,
    [
      #babel(
        en: [
          A Unicode symbol.

          Typst defines common symbols so that they can easily be written with
          standard keyboards. The symbols are defined in modules, from which they can
          be accessed using @reference:scripting:fields[field access notation]:

          - General symbols are defined in the @sym[`sym` module] and are accessible
            without the `sym.` prefix in math mode.
          - Emoji are defined in the @emoji[`emoji` module]

          Moreover, you can define custom symbols with this type's constructor
          function.
        ],
      )

      ```example
      #sym.arrow.r \
      #sym.gt.eq.not \
      $gt.eq.not$ \
      #emoji.face.halo
      ```

      #babel(
        en: [
          Many symbols have different variants, which can be selected by appending the
          modifiers with dot notation. The order of the modifiers is not relevant.
          Visit the documentation pages of the symbol modules and click on a symbol to
          see its available variants.
        ],
      )

      ```example
      $arrow.l$ \
      $arrow.r$ \
      $arrow.t.quad$
      ```
    ],
  ),
  "Symbol::construct": (
    182,
    [
      #babel(
        en: [
          Create a custom symbol with modifiers.
        ],
      )

      ```example
      #let envelope = symbol(
        "🖂",
        ("stamped", "🖃"),
        ("stamped.pen", "🖆"),
        ("lightning", "🖄"),
        ("fly", "🖅"),
      )

      #envelope
      #envelope.stamped
      #envelope.stamped.pen
      #envelope.lightning
      #envelope.fly
      ```
    ],
  ),
  "Symbol::construct::variants": (
    20,
    babel(
      en: [
        The variants of the symbol.

        Can be a just a string consisting of a single character for the
        modifierless variant or an array with two strings specifying the
        modifiers and the symbol. Individual modifiers should be separated
        by dots. When displaying a symbol, Typst selects the first from the
        variants that have all attached modifiers and the minimum number of
        other modifiers.
      ],
    ),
  ),
))
