#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "AlignElem": (
    13,
    [
      #babel(
        en: [
          Aligns content horizontally and vertically.
        ],
      )

      = #babel(en: [Example]) <example>
      #babel(
        en: [
          Let's start with centering our content horizontally:
        ],
      )

      ```example
      #set page(height: 120pt)
      #set align(center)

      Centered text, a sight to see \
      In perfect balance, visually \
      Not left nor right, it stands alone \
      A work of art, a visual throne
      ```

      #babel(
        en: [
          To center something vertically, use _horizon_ alignment:
        ],
      )

      ```example
      #set page(height: 120pt)
      #set align(horizon)

      Vertically centered, \
      the stage had entered, \
      a new paragraph.
      ```

      = #babel(en: [Combining alignments]) <combining-alignments>
      #babel(
        en: [
          You can combine two alignments with the `+` operator. Let's also only apply
          this to one piece of content by using the function form instead of a set
          rule:
        ],
      )

      ```example
      #set page(height: 120pt)
      Though left in the beginning ...

      #align(right + bottom)[
        ... they were right in the end, \
        and with addition had gotten, \
        the paragraph to the bottom!
      ]
      ```

      = #babel(en: [Nested alignment]) <nested-alignment>
      #babel(
        en: [
          You can use varying alignments for layout containers and the elements within
          them. This way, you can create intricate layouts:
        ],
      )

      ```example
      #align(center, block[
        #set align(left)
        Though centered together \
        alone \
        we \
        are \
        left.
      ])
      ```

      = #babel(en: [Alignment within the same line]) <alignment-within-the-same-line>
      #babel(
        en: [
          The `align` function performs block-level alignment and thus always
          interrupts the current paragraph. To have different alignment for parts of
          the same line, you should use @h[fractional spacing] instead:
        ],
      )

      ```example
      Start #h(1fr) End
      ```
    ],
  ),
  "AlignElem::alignment": (
    67,
    [
      #babel(
        en: [
          The @alignment[alignment] along both axes.
        ],
      )

      ```example
      #set page(height: 6cm)
      #set text(lang: "ar")

      مثال
      #align(
        end + horizon,
        rect(inset: 12pt)[ركن]
      )
      ```
    ],
  ),
  "AlignElem::body": (
    17,
    babel(
      en: [
        The content to align.
      ],
    ),
  ),
  "Alignment": (
    5,
    [
      #babel(
        en: [
          Where to align something along an axis.

          Possible values are:
          - Horizontal alignments: @alignment.start[`start`], @alignment.end[`end`],
            @alignment.left[`left`], @alignment.center[`center`], and
            @alignment.right[`right`].
          - Vertical alignments: @alignment.top[`top`], @alignment.horizon[`horizon`],
            and @alignment.bottom[`bottom`].
          - @alignment:2d-alignments[2D alignments], like `{center + horizon}`.

          These values are available globally and also in the alignment type's scope,
          so you can write either of the following two:
        ],
      )

      ```example
      #align(center)[Hi]
      #align(alignment.center)[Hi]
      ```

      = #babel(en: [2D alignments]) <2d-alignments>
      #babel(
        en: [
          To align along both axes at the same time, add the two alignments using the
          `+` operator. For example, `{top + right}` aligns the content to the top
          right corner.
        ],
      )

      ```example
      #set page(height: 3cm)
      #align(center + bottom)[Hi]
      ```

      = #babel(en: [Fields]) <fields>
      #babel(
        en: [
          The `x` and `y` fields hold the alignment's horizontal and vertical
          components, respectively (as yet another `alignment`). They may be `{none}`.
        ],
      )

      ```example
      #(top + right).x \
      #left.x \
      #left.y (none)
      ```
    ],
  ),
  "Alignment::START": (
    73,
    [
      #babel(
        en: [
          Horizontal alignment to the @direction.start[start] of the
          @text.dir[text direction].
        ],
      )

      ```example
      #set text(dir: ltr)
      #align(start, emoji.arrow.r)

      #set text(dir: rtl)
      #align(start, emoji.arrow.l)
      ```
    ],
  ),
  "Alignment::END": (
    13,
    [
      #babel(
        en: [
          Horizontal alignment to the @direction.end[end] of the
          @text.dir[text direction].
        ],
      )

      ```example
      #set text(dir: ltr)
      #align(end, emoji.arrow.r)

      #set text(dir: rtl)
      #align(end, emoji.arrow.l)
      ```
    ],
  ),
  "Alignment::LEFT": (
    13,
    [
      #babel(
        en: [
          Left horizontal alignment.
        ],
      )

      ```example
      #align(left)[Left]
      ```
    ],
  ),
  "Alignment::CENTER": (
    8,
    [
      #babel(
        en: [
          Center horizontal alignment.
        ],
      )

      ```example
      #align(center)[Center]
      ```
    ],
  ),
  "Alignment::RIGHT": (
    8,
    [
      #babel(
        en: [
          Right horizontal alignment.
        ],
      )

      ```example
      #align(right)[Right]
      ```
    ],
  ),
  "Alignment::TOP": (
    8,
    [
      #babel(
        en: [
          Top vertical alignment.
        ],
      )

      ```example
      #set page(height: 3cm)
      #align(top)[Top]
      ```
    ],
  ),
  "Alignment::HORIZON": (
    9,
    [
      #babel(
        en: [
          Middle vertical alignment.
        ],
      )

      ```example
      #set page(height: 3cm)
      #align(horizon)[Horizon]
      ```
    ],
  ),
  "Alignment::BOTTOM": (
    9,
    [
      #babel(
        en: [
          Bottom vertical alignment.
        ],
      )

      ```example
      #set page(height: 3cm)
      #align(bottom)[Bottom]
      ```
    ],
  ),
  "Alignment::axis": (
    9,
    [
      #babel(
        en: [
          The axis this alignment belongs to.
          - `{"horizontal"}` for `start`, `left`, `center`, `right`, and `end`
          - `{"vertical"}` for `top`, `horizon`, and `bottom`
          - `{none}` for 2-dimensional alignments
        ],
      )

      ```example
      #left.axis() \
      #bottom.axis()
      ```
    ],
  ),
  "Alignment::inv": (
    18,
    [
      #babel(
        en: [
          The inverse alignment.
        ],
      )

      ```example
      #top.inv() \
      #left.inv() \
      #center.inv() \
      #(left + bottom).inv()
      ```
    ],
  ),
))
