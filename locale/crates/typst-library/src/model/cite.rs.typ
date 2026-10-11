#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "CiteElem": (
    12,
    [
      #babel(
        en: [
          Cite a work from the bibliography.

          Before you starting citing, you need to add a @bibliography[bibliography]
          somewhere in your document.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      This was already noted by
      pirates long ago. @arrgh

      Multiple sources say ...
      @arrgh @netwok.

      You can also call `cite`
      explicitly. #cite(<arrgh>)

      #bibliography("works.bib")
      ```

      #babel(
        en: [
          If your source name contains certain characters such as slashes, which are
          not recognized by the `<>` syntax, you can explicitly call `label` instead.
        ],
      )

      ```typ
      Computer Modern is an example of a modernist serif typeface.
      #cite(label("DBLP:books/lib/Knuth86a")).
      ```

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          This function indirectly has dedicated syntax. @ref[References] can be used
          to cite works from the bibliography. The label then corresponds to the
          citation key.
        ],
      )
    ],
  ),
  "CiteElem::key": (
    33,
    [
      #babel(
        en: [
          The citation key that identifies the entry in the bibliography that
          shall be cited, as a label.
        ],
      )

      ```example
      // All the same
      @netwok \
      #cite(<netwok>) \
      #cite(label("netwok"))
      >>> #set text(0pt)
      >>> #bibliography("works.bib", style: "apa")
      ```
    ],
  ),
  "CiteElem::supplement": (
    14,
    [
      #babel(
        en: [
          A supplement for the citation such as page or chapter number.

          In reference syntax, the supplement can be added in square brackets:
        ],
      )

      ```example
      This has been proven. @distress[p.~7]

      #bibliography("works.bib")
      ```
    ],
  ),
  "CiteElem::form": (
    11,
    [
      #babel(
        en: [
          The kind of citation to produce. Different forms are useful in different
          scenarios: A normal citation is useful as a source at the end of a
          sentence, while a "prose" citation is more suitable for inclusion in the
          flow of text.

          If set to `{none}`, the cited work is included in the bibliography, but
          nothing will be displayed.
        ],
      )

      ```example
      #cite(<netwok>, form: "prose")
      show the outsized effects of
      pirate life on the human psyche.
      >>> #set text(0pt)
      >>> #bibliography("works.bib", style: "apa")
      ```
    ],
  ),
  "CiteElem::style": (
    18,
    babel(
      en: [
        The citation style.

        This can be:
        - `{auto}` to automatically use the
          @bibliography.style[bibliography's style] for citations.
        - A string with the name of one of the built-in styles (see below). Some
          of the styles listed below appear twice, once with their full name and
          once with a short alias.
        - A path string or @path to a
          #link("https://citationstyles.org/")[CSL file].
        - Raw bytes from which a CSL style should be decoded.
      ],
    ),
  ),
))
