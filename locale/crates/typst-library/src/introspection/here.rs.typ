#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "here": (
    7,
    [
      #babel(
        en: [
          Provides the current location in the document.

          You can think of `here` as a low-level building block that directly extracts
          the current location from the active @reference:context[context]. Some other
          functions use it internally: For instance, `{counter.get()}` is equivalent
          to `{counter.at(here())}`.

          Within show rules on @location:locatable[locatable] elements, `{here()}`
          will match the location of the shown element.

          If you want to display the current page number, refer to the documentation
          of the @counter type. While `here` can be used to determine the physical
          page number, typically you want the logical page number that may, for
          instance, have been reset after a preface.
        ],
      )

      = #babel(en: [Examples]) <examples>
      #babel(
        en: [
          Determining the current position in the document in combination with the
          @location.position[`position`] method:
        ],
      )

      ```example
      #context [
        I am located at
        #here().position()
      ]
      ```

      #babel(
        en: [
          Running a @query[query] for elements before the current position:
        ],
      )

      ```example
      = Introduction
      = Background

      There are
      #context query(
        selector(heading).before(here())
      ).len()
      headings before me.

      = Conclusion
      ```

      #babel(
        en: [
          Refer to the @selector type for more details on before/after selectors.
        ],
      )
    ],
  ),
))
