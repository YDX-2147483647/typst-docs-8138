#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "TermsElem": (
    7,
    [
      #babel(
        en: [
          A list of terms and their descriptions.

          Displays a sequence of terms and their descriptions vertically. When the
          descriptions span over multiple lines, they use hanging indent to
          communicate the visual hierarchy.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      / Ligature: A merged glyph.
      / Kerning: A spacing adjustment
        between two adjacent letters.
      ```

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          This function also has dedicated syntax: Starting a line with a slash,
          followed by a term, a colon and a description creates a term list item.
        ],
      )
    ],
  ),
  "TermsElem::tight": (
    18,
    [
      #babel(
        en: [
          Defines the default @terms.spacing[spacing] of the term list. If it is
          `{false}`, the items are spaced apart with
          @par.spacing[paragraph spacing]. If it is `{true}`, they use
          @par.leading[paragraph leading] instead. This makes the list more
          compact, which can look better if the items are short.

          In markup mode, the value of this parameter is determined based on
          whether items are separated with a blank line. If items directly follow
          each other, this is set to `{true}`; if items are separated by a blank
          line, this is set to `{false}`. The markup-defined tightness cannot be
          overridden with set rules.
        ],
      )

      ```example
      / Fact: If a term list has a lot
        of text, and maybe other inline
        content, it should not be tight
        anymore.

      / Tip: To make it wide, simply
        insert a blank line between the
        items.
      ```
    ],
  ),
  "TermsElem::separator": (
    25,
    [
      #babel(
        en: [
          The separator between the item and the description.

          If you want to just separate them with a certain amount of space, use
          `{h(2cm, weak: true)}` as the separator and replace `{2cm}` with your
          desired amount of space.
        ],
      )

      ```example
      #set terms(separator: [: ])

      / Colon: A nice separator symbol.
      ```
    ],
  ),
  "TermsElem::indent": (
    14,
    babel(
      en: [
        The indentation of each item.
      ],
    ),
  ),
  "TermsElem::hanging_indent": (
    3,
    [
      #babel(
        en: [
          The hanging indent of the description.

          This is in addition to the whole item's `indent`.
        ],
      )

      ```example
      #set terms(hanging-indent: 0pt)
      / Term: This term list does not
        make use of hanging indents.
      ```
    ],
  ),
  "TermsElem::spacing": (
    12,
    babel(
      en: [
        The spacing between the items of the term list.

        If set to `{auto}`, uses paragraph @par.leading[`leading`] for tight
        term lists and paragraph @par.spacing[`spacing`] for wide (non-tight)
        term lists.
      ],
    ),
  ),
  "TermsElem::children": (
    7,
    [
      #babel(
        en: [
          The term list's children.

          When using the term list syntax, adjacent items are automatically
          collected into term lists, even through constructs like for loops.
        ],
      )

      ```example
      #for (year, product) in (
        "1978": "TeX",
        "1984": "LaTeX",
        "2019": "Typst",
      ) [/ #product: Born in #year.]
      ```
    ],
  ),
  "TermItem": (
    27,
    babel(
      en: [
        A term list item.
      ],
    ),
  ),
  "TermItem::term": (
    3,
    babel(
      en: [
        The term described by the list item.
      ],
    ),
  ),
  "TermItem::description": (
    4,
    babel(
      en: [
        The description of the term.
      ],
    ),
  ),
))
