#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "NoneValue": (
    11,
    [
      #babel(
        en: [
          A value that indicates the absence of any other value.

          The none type has exactly one value: `{none}`.

          When inserted into the document, it is not visible. This is also the value
          that is produced by empty code blocks. It can be
          @reference:scripting:blocks[joined] with any value, yielding the other
          value.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Not visible: #none
      ```
    ],
  ),
))
