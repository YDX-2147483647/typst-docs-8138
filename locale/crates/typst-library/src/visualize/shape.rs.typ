#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "RectElem": (
    6,
    [
      #babel(
        en: [
          A rectangle with optional content.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      // Without content.
      #rect(width: 35%, height: 30pt)

      // With content.
      #rect[
        Automatically sized \
        to fit the content.
      ]
      ```
    ],
  ),
  "RectElem::width": (
    15,
    babel(
      en: [
        The rectangle's width, relative to its parent container.
      ],
    ),
  ),
  "RectElem::height": (
    3,
    babel(
      en: [
        The rectangle's height, relative to its parent container.
      ],
    ),
  ),
  "RectElem::fill": (
    3,
    [
      #babel(
        en: [
          How to fill the rectangle.

          When setting a fill, the default stroke disappears. To create a
          rectangle with both fill and stroke, you have to configure both.
        ],
      )

      ```example
      #rect(fill: blue)
      ```
    ],
  ),
  "RectElem::stroke": (
    10,
    [
      #babel(
        en: [
          How to stroke the rectangle. This can be:

          - `{none}` to disable stroking

          - `{auto}` for a stroke of `{1pt + black}` if and only if no fill is
            given.

          - Any kind of @stroke[stroke]

          - A dictionary describing the stroke for each side individually. The
            dictionary can contain the following keys in order of precedence:

            - `top`: The top stroke.
            - `right`: The right stroke.
            - `bottom`: The bottom stroke.
            - `left`: The left stroke.
            - `x`: The left and right stroke.
            - `y`: The top and bottom stroke.
            - `rest`: The stroke on all sides except those for which the
              dictionary explicitly sets a size.

            All keys are optional; omitted keys will use their previously set
            value, or the default stroke if never set.
        ],
      )

      ```example
      #stack(
        dir: ltr,
        spacing: 1fr,
        rect(stroke: red),
        rect(stroke: 2pt),
        rect(stroke: 2pt + red),
      )
      ```
    ],
  ),
  "RectElem::radius": (
    36,
    [
      #babel(
        en: [
          How much to round the rectangle's corners, relative to the minimum of
          the width and height divided by two. This can be:

          - A relative length for a uniform corner radius.

          - A dictionary: With a dictionary, the stroke for each side can be set
            individually. The dictionary can contain the following keys in order
            of precedence:
            - `top-left`: The top-left corner radius.
            - `top-right`: The top-right corner radius.
            - `bottom-right`: The bottom-right corner radius.
            - `bottom-left`: The bottom-left corner radius.
            - `left`: The top-left and bottom-left corner radii.
            - `top`: The top-left and top-right corner radii.
            - `right`: The top-right and bottom-right corner radii.
            - `bottom`: The bottom-left and bottom-right corner radii.
            - `rest`: The radii for all corners except those for which the
              dictionary explicitly sets a size.
        ],
      )

      ```example
      #set rect(stroke: 4pt)
      #rect(
        radius: (
          left: 5pt,
          top-right: 20pt,
          bottom-right: 10pt,
        ),
        stroke: (
          left: red,
          top: yellow,
          right: green,
          bottom: blue,
        ),
      )
      ```
    ],
  ),
  "RectElem::inset": (
    38,
    babel(
      en: [
        How much to pad the rectangle's content. See the
        @box.inset[box's documentation] for more details.
      ],
    ),
  ),
  "RectElem::outset": (
    6,
    babel(
      en: [
        How much to expand the rectangle's size without affecting the layout.
        See the @box.outset[box's documentation] for more details.
      ],
    ),
  ),
  "RectElem::body": (
    5,
    babel(
      en: [
        The content to place into the rectangle.

        When this is omitted, the rectangle takes on a default size of at most
        `{45pt}` by `{30pt}`.
      ],
    ),
  ),
  "SquareElem": (
    8,
    [
      #babel(
        en: [
          A square with optional content.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      // Without content.
      #square(size: 40pt)

      // With content.
      #square[
        Automatically \
        sized to fit.
      ]
      ```
    ],
  ),
  "SquareElem::size": (
    15,
    babel(
      en: [
        The square's side length. This is mutually exclusive with `width` and
        `height`.
      ],
    ),
  ),
  "SquareElem::width": (
    5,
    babel(
      en: [
        The square's width. This is mutually exclusive with `size` and `height`.

        In contrast to `size`, this can be relative to the parent container's
        width.
      ],
    ),
  ),
  "SquareElem::height": (
    13,
    babel(
      en: [
        The square's height. This is mutually exclusive with `size` and `width`.

        In contrast to `size`, this can be relative to the parent container's
        height.
      ],
    ),
  ),
  "SquareElem::fill": (
    10,
    babel(
      en: [
        How to fill the square. See the @rect.fill[rectangle's documentation]
        for more details.
      ],
    ),
  ),
  "SquareElem::stroke": (
    4,
    babel(
      en: [
        How to stroke the square. See the
        @rect.stroke[rectangle's documentation] for more details.
      ],
    ),
  ),
  "SquareElem::radius": (
    5,
    babel(
      en: [
        How much to round the square's corners. See the
        @rect.radius[rectangle's documentation] for more details.
      ],
    ),
  ),
  "SquareElem::inset": (
    5,
    babel(
      en: [
        How much to pad the square's content. See the
        @box.inset[box's documentation] for more details.
      ],
    ),
  ),
  "SquareElem::outset": (
    6,
    babel(
      en: [
        How much to expand the square's size without affecting the layout. See
        the @box.outset[box's documentation] for more details.
      ],
    ),
  ),
  "SquareElem::body": (
    5,
    babel(
      en: [
        The content to place into the square. The square expands to fit this
        content, keeping the 1-1 aspect ratio.

        When this is omitted, the square takes on a default size of at most
        `{30pt}`.
      ],
    ),
  ),
  "EllipseElem": (
    9,
    [
      #babel(
        en: [
          An ellipse with optional content.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      // Without content.
      #ellipse(width: 35%, height: 30pt)

      // With content.
      #ellipse[
        #set align(center)
        Automatically sized \
        to fit the content.
      ]
      ```
    ],
  ),
  "EllipseElem::width": (
    16,
    babel(
      en: [
        The ellipse's width, relative to its parent container.
      ],
    ),
  ),
  "EllipseElem::height": (
    3,
    babel(
      en: [
        The ellipse's height, relative to its parent container.
      ],
    ),
  ),
  "EllipseElem::fill": (
    3,
    babel(
      en: [
        How to fill the ellipse. See the @rect.fill[rectangle's documentation]
        for more details.
      ],
    ),
  ),
  "EllipseElem::stroke": (
    4,
    babel(
      en: [
        How to stroke the ellipse. See the
        @rect.stroke[rectangle's documentation] for more details.
      ],
    ),
  ),
  "EllipseElem::inset": (
    5,
    babel(
      en: [
        How much to pad the ellipse's content. See the
        @box.inset[box's documentation] for more details.
      ],
    ),
  ),
  "EllipseElem::outset": (
    6,
    babel(
      en: [
        How much to expand the ellipse's size without affecting the layout. See
        the @box.outset[box's documentation] for more details.
      ],
    ),
  ),
  "EllipseElem::body": (
    5,
    babel(
      en: [
        The content to place into the ellipse.

        When this is omitted, the ellipse takes on a default size of at most
        `{45pt}` by `{30pt}`.
      ],
    ),
  ),
  "CircleElem": (
    8,
    [
      #babel(
        en: [
          A circle with optional content.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      // Without content.
      #circle(radius: 25pt)

      // With content.
      #circle[
        #set align(center + horizon)
        Automatically \
        sized to fit.
      ]
      ```
    ],
  ),
  "CircleElem::radius": (
    16,
    babel(
      en: [
        The circle's radius. This is mutually exclusive with `width` and
        `height`.
      ],
    ),
  ),
  "CircleElem::width": (
    5,
    babel(
      en: [
        The circle's width. This is mutually exclusive with `radius` and
        `height`.

        In contrast to `radius`, this can be relative to the parent container's
        width.
      ],
    ),
  ),
  "CircleElem::height": (
    16,
    babel(
      en: [
        The circle's height. This is mutually exclusive with `radius` and
        `width`.

        In contrast to `radius`, this can be relative to the parent container's
        height.
      ],
    ),
  ),
  "CircleElem::fill": (
    11,
    babel(
      en: [
        How to fill the circle. See the @rect.fill[rectangle's documentation]
        for more details.
      ],
    ),
  ),
  "CircleElem::stroke": (
    4,
    babel(
      en: [
        How to stroke the circle. See the
        @rect.stroke[rectangle's documentation] for more details.
      ],
    ),
  ),
  "CircleElem::inset": (
    6,
    babel(
      en: [
        How much to pad the circle's content. See the
        @box.inset[box's documentation] for more details.
      ],
    ),
  ),
  "CircleElem::outset": (
    6,
    babel(
      en: [
        How much to expand the circle's size without affecting the layout. See
        the @box.outset[box's documentation] for more details.
      ],
    ),
  ),
  "CircleElem::body": (
    5,
    babel(
      en: [
        The content to place into the circle. The circle expands to fit this
        content, keeping the 1-1 aspect ratio.
      ],
    ),
  ),
))
