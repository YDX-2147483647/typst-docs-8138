#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "BoxElem": (
    14,
    [
      #babel(
        en: [
          An inline-level container that sizes content.

          All elements except inline math, text, and boxes are block-level and cannot
          occur inside of a @par[paragraph]. The box function can be used to integrate
          such elements into a paragraph. Boxes take the size of their contents by
          default but can also be @box.width[sized] explicitly.

          Similarly to blocks, boxes can be used to @box.clip[clip] content or to give
          it a @box.fill[background] or @box.stroke[border]. However, they should only
          be used for these purposes if the resulting container is used in an
          inline-level context. Otherwise, a @block is preferable.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Refer to the docs
      #box(
        height: 9pt,
        image("docs.svg")
      )
      for more information.
      ```
    ],
  ),
  "BoxElem::width": (
    23,
    [
      #babel(
        en: [
          The width of the box.

          Boxes can have @fraction[fractional] widths, as the example below
          demonstrates.

          _Note:_ Currently, only boxes and only their widths might be
          fractionally sized within paragraphs. Support for fractionally sized
          images, shapes, and more might be added in the future.
        ],
      )

      ```example
      Line in #box(width: 1fr, line(length: 100%)) between.
      ```
    ],
  ),
  "BoxElem::height": (
    14,
    babel(
      en: [
        The height of the box.
      ],
    ),
  ),
  "BoxElem::baseline": (
    3,
    [
      #babel(
        en: [
          The vertical position of the box's baseline. This is used to align the
          box with the text surrounding it in a paragraph, as the baseline is
          meant to go right below text by default.

          By default, the box's baseline will match the baseline of its contents
          (for example, of the text or equation inside it) - this is the `{auto}`
          option. However, the baseline can be adjusted in two ways. The first one
          is to simply pick a vertical @alignment[alignment], such as `{top}`,
          `{horizon}` or `{bottom}`, to place the baseline at that position,
          relative to the total height of the box (including inset).

          The other way to adjust it is to shift the default baseline vertically
          by some amount, specified as a @relative[relative length]. For example,
          a value of `{2pt}` will move it up by that exact length (causing the
          contents to go _down_, as the alignment point moves _up_), whereas
          `{-40%}` will shift the baseline _down_ by 40% of the box's total
          height, including inset (thus causing the contents to move _up_).

          Both options can be specified at the same time through a dictionary with
          the keys `at` and `shift`, respectively. For example, when specifying
          `{(at: bottom, shift: 10pt)}`, the box's baseline will be set to the
          height exactly `{10pt}` above the bottom of its contents.
        ],
      )

      ```example
      Image: #box(baseline: 40%, image("tiger.jpg", width: 2cm)).
      ```
    ],
  ),
  "BoxElem::fill": (
    28,
    babel(
      en: [
        The box's background color. See the
        @rect.fill[rectangle's documentation] for more details.
      ],
    ),
  ),
  "BoxElem::stroke": (
    4,
    babel(
      en: [
        The box's border color. See the @rect.stroke[rectangle's documentation]
        for more details.
      ],
    ),
  ),
  "BoxElem::radius": (
    5,
    babel(
      en: [
        How much to round the box's corners. See the
        @rect.radius[rectangle's documentation] for more details.
      ],
    ),
  ),
  "BoxElem::inset": (
    5,
    [
      #babel(
        en: [
          How much to pad the box's content.

          This can be a single length for all sides or a dictionary of lengths for
          individual sides. When passing a dictionary, it can contain the
          following keys in order of precedence: `top`, `right`, `bottom`, `left`
          (controlling the respective cell sides), `x`, `y` (controlling vertical
          and horizontal insets), and `rest` (covers all insets not styled by
          other dictionary entries). All keys are optional; omitted keys will use
          their previously set value, or the default value if never set.

          @relative[Relative lengths] for this parameter are relative to the box
          size excluding @box.outset[outset]. Note that relative insets and
          outsets are different from relative @box.width[widths] and
          @box.height[heights], which are relative to the container.

          _Note:_ When the box contains text, its exact size depends on the
          current @text.top-edge[text edges].
        ],
      )

      ```example
      #rect(inset: 0pt)[Tight]
      ```
    ],
  ),
  "BoxElem::outset": (
    24,
    [
      #babel(
        en: [
          How much to expand the box's size without affecting the layout.

          This can be a single length for all sides or a dictionary of lengths for
          individual sides. @relative[Relative lengths] for this parameter are
          relative to the box size excluding outset. See the documentation for
          @box.inset[inset] above for further details.

          This is useful to prevent padding from affecting line layout. For a
          generalized version of the example below, see the documentation for the
          @raw.block[raw text's block parameter].
        ],
      )

      ```example
      An inline
      #box(
        fill: luma(235),
        inset: (x: 3pt, y: 0pt),
        outset: (y: 3pt),
        radius: 2pt,
      )[rectangle].
      ```
    ],
  ),
  "BoxElem::clip": (
    23,
    [
      #babel(
        en: [
          Whether to clip the content inside the box.

          Clipping is useful when the box's content is larger than the box itself,
          as any content that exceeds the box's bounds will be hidden.
        ],
      )

      ```example
      #box(
        width: 50pt,
        height: 50pt,
        clip: true,
        image("tiger.jpg", width: 100pt, height: 100pt)
      )
      ```
    ],
  ),
  "BoxElem::body": (
    16,
    babel(
      en: [
        The contents of the box.
      ],
    ),
  ),
  "BlockElem": (
    61,
    [
      #babel(
        en: [
          A block-level container.

          Such a container can be used to separate content, to @block.width[size] or
          @block.clip[clip] it, or to give it a @block.fill[background] or
          @block.stroke[border].

          Blocks are also the primary way to control whether text becomes part of a
          paragraph or not. See
          @par:what-becomes-a-paragraph[the paragraph documentation] for more details.
        ],
      )

      = #babel(en: [Examples]) <examples>
      #babel(
        en: [
          With a block, you can give a background to content while still allowing it
          to break across multiple pages.
        ],
      )

      ```example
      #set page(height: 100pt)
      #block(
        fill: luma(230),
        inset: 8pt,
        radius: 4pt,
        lorem(30),
      )
      ```

      #babel(
        en: [
          Blocks are also useful to force elements that would otherwise be inline to
          become block-level, especially when writing show rules.
        ],
      )

      ```example
      #show heading: it => it.body
      = Blockless
      More text.

      #show heading: it => block(it.body)
      = Blocky
      More text.
      ```
    ],
  ),
  "BlockElem::width": (
    38,
    [
      #babel(
        en: [
          The block's width.
        ],
      )

      ```example
      #set align(center)
      #block(
        width: 60%,
        inset: 8pt,
        fill: silver,
        lorem(10),
      )
      ```
    ],
  ),
  "BlockElem::height": (
    13,
    [
      #babel(
        en: [
          The block's height. When the height is larger than the remaining space
          on a page and @block.breakable[`breakable`] is `{true}`, the block will
          continue on the next page with the remaining height.
        ],
      )

      ```example
      #set page(height: 80pt)
      #set align(center)
      #block(
        width: 80%,
        height: 150%,
        fill: aqua,
      )
      ```
    ],
  ),
  "BlockElem::breakable": (
    15,
    [
      #babel(
        en: [
          Whether the block can be broken and continue on the next page.
        ],
      )

      ```example
      #set page(height: 80pt)
      The following block will
      jump to its own page.
      #block(
        breakable: false,
        lorem(15),
      )
      ```
    ],
  ),
  "BlockElem::fill": (
    14,
    babel(
      en: [
        The block's background color. See the
        @rect.fill[rectangle's documentation] for more details.
      ],
    ),
  ),
  "BlockElem::stroke": (
    4,
    babel(
      en: [
        The block's border color. See the
        @rect.stroke[rectangle's documentation] for more details.
      ],
    ),
  ),
  "BlockElem::radius": (
    5,
    babel(
      en: [
        How much to round the block's corners. See the
        @rect.radius[rectangle's documentation] for more details.
      ],
    ),
  ),
  "BlockElem::inset": (
    5,
    babel(
      en: [
        How much to pad the block's content. See the
        @box.inset[box's documentation] for more details.
      ],
    ),
  ),
  "BlockElem::outset": (
    5,
    babel(
      en: [
        How much to expand the block's size without affecting the layout. See
        the @box.outset[box's documentation] for more details.
      ],
    ),
  ),
  "BlockElem::spacing": (
    5,
    [
      #babel(
        en: [
          The spacing around the block. When `{auto}`, inherits the paragraph
          @par.spacing[`spacing`].

          For two adjacent blocks, the larger of the first block's `below` and the
          second block's `above` spacing wins. Moreover, block spacing takes
          precedence over paragraph @par.spacing[`spacing`].

          Note that this is only a shorthand to set `above` and `below` to the
          same value. Since the values for `above` and `below` might differ, a
          @reference:context[context] block only provides access to
          `{block.above}` and `{block.below}`, not to `{block.spacing}` directly.

          This property can be used in combination with a show rule to adjust the
          spacing around arbitrary block-level elements.
        ],
      )

      ```example
      #set align(center)
      #show math.equation: set block(above: 8pt, below: 16pt)

      This sum of $x$ and $y$:
      $ x + y = z $
      A second paragraph.
      ```
    ],
  ),
  "BlockElem::above": (
    27,
    babel(
      en: [
        The spacing between this block and its predecessor.
      ],
    ),
  ),
  "BlockElem::below": (
    7,
    babel(
      en: [
        The spacing between this block and its successor.
      ],
    ),
  ),
  "BlockElem::clip": (
    4,
    [
      #babel(
        en: [
          Whether to clip the content inside the block.

          Clipping is useful when the block's content is larger than the block
          itself, as any content that exceeds the block's bounds will be hidden.
        ],
      )

      ```example
      #block(
        width: 50pt,
        height: 50pt,
        clip: true,
        image("tiger.jpg", width: 100pt, height: 100pt)
      )
      ```
    ],
  ),
  "BlockElem::sticky": (
    16,
    [
      #babel(
        en: [
          Whether this block must stick to the following one, with no break in
          between.

          This is, by default, set on heading blocks to prevent orphaned headings
          at the bottom of the page.
        ],
      )

      ```example
      >>> #set page(height: 140pt)
      // Disable stickiness of headings.
      #show heading: set block(sticky: false)
      #lorem(20)

      = Chapter
      #lorem(10)
      ```
    ],
  ),
  "BlockElem::body": (
    18,
    babel(
      en: [
        The contents of the block.
      ],
    ),
  ),
))
