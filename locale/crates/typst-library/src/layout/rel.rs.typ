#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Rel": (
    11,
    [
      #babel(
        en: [
          A length in relation to some known length.

          This type is a combination of a @length[length] with a @ratio[ratio]. It
          results from addition and subtraction of a length and a ratio. Wherever a
          relative length is expected, you can also use a bare length or ratio.
        ],
      )

      = #babel(en: [Relative to the page]) <relative-to-the-page>
      #babel(
        en: [
          A common use case is setting the width or height of a layout element (e.g.,
          @block[block], @rect[rect], etc.) as a certain percentage of the width of
          the page. Here, the rectangle's width is set to `{25%}`, so it takes up one
          fourth of the page's _inner_ width (the width minus margins).
        ],
      )

      ```example
      #rect(width: 25%)
      ```

      #babel(
        en: [
          Bare lengths or ratios are always valid where relative lengths are expected,
          but the two can also be freely mixed:
        ],
      )

      ```example
      #rect(width: 25% + 1cm)
      ```

      #babel(
        en: [
          For contents in the page @page.background[`background`] and
          @page.foreground[`foreground`], relative lengths are resolved against the
          page size including @page.bleed[`bleed`]. This choice is made for
          convenience, as creating a proper bleed-aware background inherently requires
          extending it into the bleed area.

          If you're trying to size an element so that it takes up the page's _full_
          width, you have a few options (this highly depends on your exact use case):

          + Set page margins to `{0pt}` (`[#set page(margin: 0pt)]`)
          + Multiply the ratio by the known full page width (`{21cm * 69%}`)
          + Use padding which will negate the margins (`[#pad(x: -2.5cm, ...)]`)
          + Use the page @page.background[`background`] or
            @page.foreground[`foreground`] field as those don't take margins into
            account (note that it will render the content outside of the document
            flow, see @place to control the content position)
        ],
      )

      = #babel(en: [Relative to a container]) <relative-to-a-container>
      #babel(
        en: [
          When a layout element (e.g. a @rect[rect]) is nested in another layout
          container (e.g. a @block[block]) instead of being a direct descendant of the
          page, relative widths become relative to the container:
        ],
      )

      ```example
      #block(
        width: 100pt,
        fill: aqua,
        rect(width: 50%),
      )
      ```

      = #babel(en: [Scripting]) <scripting>
      #babel(
        en: [
          You can multiply relative lengths by @ratio[ratios], @int[integers], and
          @float[floats].

          A relative length has the following fields:
          - `length`: Its @length[length] component.
          - `ratio`: Its @ratio[ratio] component.
        ],
      )

      ```example
      #(100% - 50pt).length \
      #(100% - 50pt).ratio
      ```
    ],
  ),
))
