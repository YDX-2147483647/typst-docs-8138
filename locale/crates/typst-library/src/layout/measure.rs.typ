#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "measure": (
    12,
    [
      #babel(
        en: [
          Measures the layouted size of content.

          The `measure` function lets you determine the layouted size of content. By
          default an infinite space is assumed, so the measured dimensions may not
          necessarily match the final dimensions of the content. If you want to
          measure in the current layout dimensions, you can combine `measure` and
          @layout.
        ],
      )

      = #babel(en: [Example]) <example>
      #babel(
        en: [
          The same content can have a different size depending on the
          @reference:context[context] that it is placed into. In the example below,
          the `[#content]` is of course bigger when we increase the font size.
        ],
      )

      ```example
      #let content = [Hello!]
      #content
      #set text(14pt)
      #content
      ```

      #babel(
        en: [
          For this reason, you can only measure when context is available.
        ],
      )

      ```example
      #let thing(body) = context {
        let size = measure(body)
        [Width of "#body" is #size.width]
      }

      #thing[Hey] \
      #thing[Welcome]
      ```

      #babel(
        en: [
          The measure function returns a dictionary with the entries `width`, `height`,
          and `baseline`, all of type @length. The `baseline` entry is the vertical
          position of the content's baseline relative to its top edge, with positive
          values extending downwards.
        ],
      )
    ],
  ),
  "measure::width": (
    41,
    [
      #babel(
        en: [
          The width available to layout the content.

          Setting this to `{auto}` indicates infinite available width.

          Note that using the `width` and `height` parameters of this function is
          different from measuring a sized @block containing the content. In the
          following example, the former will get the dimensions of the inner
          content instead of the dimensions of the block.
        ],
      )

      ```example
      #context measure(lorem(100), width: 400pt)

      #context measure(block(lorem(100), width: 400pt))
      ```
    ],
  ),
  "measure::height": (
    17,
    babel(
      en: [
        The height available to layout the content.

        Setting this to `{auto}` indicates infinite available height.
      ],
    ),
  ),
  "measure::content": (
    6,
    babel(
      en: [
        The content whose size to measure.
      ],
    ),
  ),
))
