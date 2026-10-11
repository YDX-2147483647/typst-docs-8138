#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "TitleElem": (
    7,
    [
      #babel(
        en: [
          A document title.

          This should be used to display the main title of the whole document and
          should occur only once per document. In contrast, level 1 @heading[headings]
          are intended to be used for the top-level sections of the document.

          Note that additional frontmatter (like an author list) that should appear
          together with the title does not belong in its body.

          In HTML export, this shows as a `h1` element while level 1 headings show as
          `h2` elements.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #set document(
        title: [Interstellar Mail Delivery]
      )

      #title()

      = Introduction
      In recent years, ...
      ```
    ],
  ),
  "TitleElem::body": (
    25,
    [
      #babel(
        en: [
          The content of the title.

          When omitted (or `{auto}`), this will default to @document.title. In
          this case, a document title must have been previously set with
          `{set document(title: [..])}`.
        ],
      )

      ```example
      #set document(title: [Course ABC, Homework 1])
      #title[Homework 1]

      ...
      ```
    ],
  ),
))
