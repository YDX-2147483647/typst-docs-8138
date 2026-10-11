#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Tiling": (
    15,
    [
      #babel(
        en: [
          A repeating tiling fill.

          Typst supports the most common type of tilings, where a pattern is repeated
          in a grid-like fashion, covering the entire area of an element that is
          filled or stroked. The pattern is defined by a tile
          @tiling.constructor.size[`size`] and a body defining the content of each
          cell. You can also add horizontal or vertical
          @tiling.constructor.spacing[`spacing`] between the cells of the tiling.
          The @tiling.constructor.offset[`offset`] and
          @tiling.constructor.angle[`angle`] determine the placement of the tiling.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #let pat = tiling(size: (30pt, 30pt), {
        place(line(start: (0%, 0%), end: (100%, 100%)))
        place(line(start: (0%, 100%), end: (100%, 0%)))
      })

      #rect(fill: pat, width: 100%, height: 60pt, stroke: 1pt)
      ```

      = #babel(en: [Tilings on text]) <tilings-on-text>
      #babel(
        en: [
          Tilings are also supported on text, but only when setting
          @tiling.constructor.relative[`relative`] to either `{auto}` (the default
          value) or `{"parent"}`. To create word-by-word or glyph-by-glyph tilings,
          you can wrap the words or characters of your text in @box[boxes] manually or
          through a @reference:styling:show-rules[show rule].
        ],
      )

      ```example
      #let pat = tiling(
        size: (30pt, 30pt),
        relative: "parent",
        square(
          size: 30pt,
          fill: gradient
            .conic(..color.map.rainbow),
        )
      )

      #set text(fill: pat)
      #lorem(10)
      ```
    ],
  ),
  "Tiling::construct": (
    66,
    [
      #babel(
        en: [
          Construct a new tiling.
        ],
      )

      ```example
      #let pat = tiling(
        size: (20pt, 20pt),
        relative: "parent",
        place(
          dx: 5pt,
          dy: 5pt,
          rotate(45deg, square(
            size: 5pt,
            fill: black,
          )),
        ),
      )

      #rect(width: 100%, height: 60pt, fill: pat)
      ```
    ],
  ),
  "Tiling::construct::size": (
    22,
    babel(
      en: [
        The bounding box of each cell of the tiling, specified as a `(x, y)`
        pair.

        If set to `{auto}`, the tiling takes on the size of the laid-out
        content.
      ],
    ),
  ),
  "Tiling::construct::spacing": (
    8,
    [
      #babel(
        en: [
          The spacing between cells of the tiling, specified as a `(x, y)`
          pair.

          If the spacing is lower than the size of the tiling, the tiling will
          overlap with itself. If it is higher, the tiling will have gaps.
        ],
      )

      ```example
      >>> #set page(width: 5 * 30pt + 4 * 10pt + 2 * 15pt)
      #let pat = tiling(
        size: (30pt, 30pt),
        spacing: (10pt, 20pt),
        square(size: 30pt, fill: gradient.conic(..color.map.rainbow)),
      )

      #rect(
        width: 100%,
        height: 80pt,
        fill: pat,
        stroke: (thickness: 1pt, dash: "dotted"),
      )
      ```
    ],
  ),
  "Tiling::construct::offset": (
    24,
    [
      #babel(
        en: [
          Shifts the entire tile grid without affecting the tile size or
          spacing.

          The offset is specified as a `(x, y)` pair. Positive `x` values move
          the pattern to the right and positive `y` values move it down.
          Relative values are resolved against the tile size plus spacing.

          Note that the displacement caused by the offset affects the tiles
          themselves while displacement of the inner contents (e.g. via
          `{place(dx: .., dy: ..)}`) can cause clipping when the content
          moves outside of the tile's bounding box.
        ],
      )

      ```example
      #set rect(width: 100%, height: 80pt, stroke: 1pt)

      #let pat = tiling(
        size: (20pt, 20pt),
        circle(radius: 10pt, fill: blue),
      )

      #let pat-with-offset = tiling(
        size: (20pt, 20pt),
        offset: (50%, 50%),
        circle(radius: 10pt, fill: blue),
      )

      #grid(
        columns: 2,
        column-gutter: 10pt,
        rect(fill: pat),
        rect(fill: pat-with-offset),
      )
      ```
    ],
  ),
  "Tiling::construct::angle": (
    36,
    [
      #babel(
        en: [
          Rotates the tiles and the grid clockwise about the offset coordinates
          by the specified angle. The rotation is applied after the offset.
        ],
      )

      ```example
      #let pat = tiling(
        size: (20pt, 20pt),
        angle: 45deg,
        line(start: (0%, 50%), end: (100%, 50%)),
      )

      #rect(width: 100%, height: 60pt, fill: pat)
      ```
    ],
  ),
  "Tiling::construct::relative": (
    15,
    [
      #babel(
        en: [
          Determines relative to which element's bounding box the tiling is
          drawn.

          By default, tilings are drawn relative to the shape they are being
          painted on (`{"self"}`), unless the tiling is applied on text, in
          which case they are relative to the closest ancestor container
          (`{"parent"}`).

          The parent of an element is the innermost @box or @block that
          contains the element, or, if there is none, the page itself.
        ],
      )

      ```example
      #let pat = tiling(
        size: (20pt, 20pt),
        spacing: (5pt, 5pt),
        relative: "self",
        circle(radius: 10pt, fill: teal),
      )

      #let pat-with-parent = tiling(
        size: (20pt, 20pt),
        spacing: (5pt, 5pt),
        relative: "parent",
        circle(radius: 10pt, fill: teal),
      )

      #set raw(lang: "typc")
      #table(
        columns: (1fr, 1fr, 1fr),
        rows: (auto, 80pt),
        table.header(`"self"`, `"parent"`, `"parent"`),

        // This one is local to the cell itself.
        table.cell(fill: pat, none),

        // These two are both page-relative, so the
        // pattern is continuous.
        table.cell(fill: pat-with-parent, none),
        table.cell(fill: pat-with-parent, none),
      )
      ```
    ],
  ),
  "Tiling::construct::body": (
    44,
    babel(
      en: [
        The content of each cell of the tiling.
      ],
    ),
  ),
))
