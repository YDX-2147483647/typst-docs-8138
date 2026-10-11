#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "BibliographyElem": (
    46,
    [
      #babel(
        en: [
          A bibliography / reference listing.

          You can create a new bibliography by calling this function with a path to a
          bibliography file in either one of two formats:

          - A Hayagriva `.yaml`/`.yml` file. Hayagriva is a new bibliography file
            format designed for use with Typst. Visit its
            #link("https://github.com/typst/hayagriva/blob/main/docs/file-format.md")[documentation]
            for more details.
          - A BibLaTeX `.bib` file.

          As soon as you add a bibliography somewhere in your document, you can start
          citing things with reference syntax (`[@key]`) or explicit calls to the
          @cite[citation] function (`[#cite(<key>)]`). The bibliography will only show
          entries for works that were referenced in the document.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      This was already noted by
      pirates long ago. @arrgh

      Multiple sources say ...
      @arrgh @netwok.

      #bibliography("works.bib")
      ```

      = #babel(en: [Styles]) <styles>
      #babel(
        en: [
          Typst offers a wide selection of built-in
          @bibliography.style[citation and bibliography styles]. Beyond those, you can
          add and use custom #link("https://citationstyles.org/")[CSL] (Citation Style
          Language) files. Wondering which style to use? Here are some good defaults
          based on what discipline you're working in:
        ],
      )

      #docs-table(
        table.header[Fields][Typical Styles],

        [Engineering, IT],
        [`{"ieee"}`],

        [Psychology, Life Sciences],
        [`{"apa"}`],

        [Social sciences],
        [`{"chicago-author-date"}`],

        [Humanities],
        [`{"mla"}`, `{"chicago-notes"}`, `{"harvard-cite-them-right"}`],

        [Economics],
        [`{"harvard-cite-them-right"}`],

        [Physics],
        [`{"american-physics-society"}`],
      )

      = #babel(en: [Multiple bibliographies]) <multiple-bibliographies>
      #babel(
        en: [
          When a Typst document contains multiple bibliographies, each citation is
          assigned to one of them. By default, Typst will automatically pick a
          suitable bibliography (typically, the closest following one that contains
          the referenced citation key). This covers common cases like by-chapter or
          thematic bibliographies. For more fine-grained control, citations can be
          explicitly targeted by a bibliography through a
          @bibliography.target[`target`] selector.
        ],
      )
    ],
  ),
  "BibliographyElem::sources": (
    66,
    babel(
      en: [
        One or multiple paths to or raw bytes for Hayagriva `.yaml` and/or
        BibLaTeX `.bib` files.

        This can be a:
        - A path string or @path to load a bibliography file from.
        - Raw bytes from which the bibliography should be decoded.
        - An array where each item is one of the above.
      ],
    ),
  ),
  "BibliographyElem::title": (
    14,
    babel(
      en: [
        The title of the bibliography.

        - When set to `{auto}`, an appropriate title for the
          @text.lang[text language] will be used. This is the default.
        - When set to `{none}`, the bibliography will not have a title.
        - A custom title can be set by passing content.

        The bibliography's heading will not be numbered by default, but you can
        force it to be with a show-set rule:
        `{show bibliography: set heading(numbering: "1.")}`
      ],
    ),
  ),
  "BibliographyElem::full": (
    12,
    babel(
      en: [
        Whether to include all works from the given bibliography files, even
        those that weren't cited in the document.

        To selectively add individual cited works without showing them, you can
        also use the `cite` function with @cite.form[`form`] set to `{none}`.
      ],
    ),
  ),
  "BibliographyElem::style": (
    8,
    babel(
      en: [
        The bibliography style.

        This can be:
        - A string with the name of one of the built-in styles (see below). Some
          of the styles listed below appear twice, once with their full name and
          once with a short alias.
        - A path string or @path to a
          #link("https://citationstyles.org/")[CSL file].
        - Raw bytes from which a CSL style should be decoded.
      ],
    ),
  ),
  "BibliographyElem::target": (
    19,
    [
      #babel(
        en: [
          Defines which citations to include in the bibliography.

          Typst will automatically assign each citation in the document to a
          bibliography. Concretely, a citation will be assigned to (in order of
          precedence)
          + the first bibliography that includes it in its `target` selector; or
            if no such bibliography exists
          + the closest _following_ bibliography with `{target: auto}` that
            contains its key; or if no such bibliography follows
          + the closest _preceding_ bibliography with `{target: auto}` that
            contains its key.
        ],
      )

      #example(
        title: [Local bibliography],
        ```
        #let info(body) = block(
          stroke: (left: 1.5pt + blue),
          fill: aqua.lighten(50%),
          inset: 1em,
          context {
            body
            show divider: set block(spacing: 1.2em)
            divider()
            bibliography(
              "works.bib",
              title: none,
              target: selector(cite).within(here()),
              style: "mla",
            )
          }
        )

        = On the matter of dumplings
        In recent years, we can observe an uptick in
        dumpling consumption across the board. @netwok

        #info[
          Dumplings are particularly enjoyed
          among pirates. @arrgh
        ]

        #bibliography("works.bib")
        ```,
      )
    ],
  ),
  "BibliographyElem::group": (
    46,
    [
      #babel(
        en: [
          Conceptually groups this bibliography with other bibliographies for
          numbering purposes. Bibliographies in the same group will assign
          consecutive citation numbers.

          This can be:
          - `{none}`: The bibliography will be numbered in isolation.
          - `{auto}`: The bibliography will be consecutively numbered with all
            other bibliographies in the `{auto}` group.
          - A @str[string]: The bibliography will be consecutively numbered with
            all other bibliographies with the same `group` value.

          The `{auto}` group works just like any string group, but it is the
          canonical default group.
        ],
      )

      #example(
        title: [Consecutive citation numbers],
        ```
        #show bibliography: set heading(
          offset: 1,
        )

        = First part
        Starts at one: @netwok @arrgh
        #bibliography(
          "works.bib",
          style: "ieee",
        )

        = Second part
        Continues with three: @distress
        #bibliography(
          "works.bib",
          style: "nlm-citation-sequence",
        )
        ```,
      )

      #example(
        title: [Separate citation numbers],
        ```
        #show bibliography: set heading(
          offset: 1,
        )
        #set bibliography(group: none)

        = First part
        Starts at one: @netwok @arrgh
        #bibliography(
          "works.bib",
          style: "ieee",
        )

        = Second part
        Resets to one: @distress
        #bibliography(
          "works.bib",
          style: "nlm-citation-sequence",
        )
        ```,
      )
    ],
  ),
))
