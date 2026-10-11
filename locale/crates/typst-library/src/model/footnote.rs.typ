#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "FootnoteElem": (
    21,
    [
      #babel(
        en: [
          A footnote.

          Includes additional remarks and references on the same page with footnotes.
          A footnote will insert a superscript number that links to the note at the
          bottom of the page. Notes are numbered sequentially throughout your document
          and can break across multiple pages.

          To customize the appearance of the entry in the footnote listing, see
          @footnote.entry. The footnote itself is realized as a normal superscript, so
          you can use a set rule on the @super function to customize it. You can also
          apply a show rule to customize only the footnote marker (superscript number)
          in the running text.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Check the docs for more details.
      #footnote[https://typst.app/docs]
      ```

      #babel(
        en: [
          The footnote automatically attaches itself to the preceding word, even if
          there is a space before it in the markup. To force space, you can use the
          string `[#" "]` or explicit @h[horizontal spacing].

          By giving a label to a footnote, you can have multiple references to it.
        ],
      )

      ```example
      You can edit Typst documents online.
      #footnote[https://typst.app/app] <fn>
      Checkout Typst's website. @fn
      And the online app. #footnote(<fn>)
      ```

      #babel(
        en: [
          _Note:_ Set and show rules in the scope where `footnote` is called may not
          apply to the footnote's content. See
          #link("https://github.com/typst/typst/issues/1467#issuecomment-1588799440")[here]
          for more information.
        ],
      )

      = #babel(en: [Accessibility]) <accessibility>
      #babel(
        en: [
          Footnotes will be read by Assistive Technology (AT) immediately after the
          spot in the text where they are referenced, just like how they appear in
          markup.
        ],
      )
    ],
  ),
  "FootnoteElem::numbering": (
    43,
    [
      #babel(
        en: [
          How to number footnotes. Accepts a
          @numbering[numbering pattern or function] taking a single number.

          By default, the footnote numbering continues throughout your document.
          If you prefer per-page footnote numbering, you can reset the footnote
          @counter[counter] in the page @page.header[header]. In the future, there
          might be a simpler way to achieve this.
        ],
      )

      ```example
      #set footnote(numbering: "*")

      Footnotes:
      #footnote[Star],
      #footnote[Dagger]
      ```
    ],
  ),
  "FootnoteElem::body": (
    18,
    babel(
      en: [
        The content to put into the footnote. Can also be the label of another
        footnote this one should point to.
      ],
    ),
  ),
  "FootnoteEntry": (
    116,
    [
      #babel(
        en: [
          An entry in a footnote list.

          This function is not intended to be called directly. Instead, it is used in
          set and show rules to customize footnote listings.
        ],
      )

      ```example
      #show footnote.entry: set text(red)

      My footnote listing
      #footnote[It's down here]
      has red text!
      ```

      #babel(
        en: [
          _Note:_ Footnote entry properties must be uniform across each page run (a
          page run is a sequence of pages without an explicit pagebreak in between).
          For this reason, set and show rules for footnote entries should be defined
          before any page content, typically at the very start of the document.
        ],
      )
    ],
  ),
  "FootnoteEntry::note": (
    26,
    [
      #babel(
        en: [
          The footnote for this entry. Its location can be used to determine the
          footnote counter state.
        ],
      )

      ```example
      #show footnote.entry: it => {
        let loc = it.note.location()
        counter(footnote).display(at: loc, "1: ")
        it.note.body
      }

      Customized #footnote[Hello]
      listing #footnote[World! 🌏]
      ```
    ],
  ),
  "FootnoteEntry::separator": (
    16,
    [
      #babel(
        en: [
          The separator between the document body and the footnote listing.
        ],
      )

      ```example
      #set footnote.entry(
        separator: repeat[.]
      )

      Testing a different separator.
      #footnote[
        Unconventional, but maybe
        not that bad?
      ]
      ```
    ],
  ),
  "FootnoteEntry::clearance": (
    24,
    [
      #babel(
        en: [
          The amount of clearance between the document body and the separator.
        ],
      )

      ```example
      #set footnote.entry(clearance: 3em)

      Footnotes also need ...
      #footnote[
        ... some space to breathe.
      ]
      ```
    ],
  ),
  "FootnoteEntry::gap": (
    13,
    [
      #babel(
        en: [
          The gap between footnote entries.
        ],
      )

      ```example
      #set footnote.entry(gap: 0.8em)

      Footnotes:
      #footnote[Spaced],
      #footnote[Apart]
      ```
    ],
  ),
  "FootnoteEntry::indent": (
    12,
    [
      #babel(
        en: [
          The indent of each footnote entry.
        ],
      )

      ```example
      #set footnote.entry(indent: 0em)

      Footnotes:
      #footnote[No],
      #footnote[Indent]
      ```
    ],
  ),
))
