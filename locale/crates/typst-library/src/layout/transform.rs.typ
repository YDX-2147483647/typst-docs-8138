#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "MoveElem": (
    4,
    [
      #babel(
        en: [
          Moves content without affecting layout.

          The `move` function allows you to move content while the layout still 'sees'
          it at the original positions. Containers will still be sized as if the
          content was not moved.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #rect(inset: 0pt, fill: gray, move(
        dx: 4pt, dy: 6pt,
        rect(
          inset: 8pt,
          fill: white,
          stroke: black,
          [Abra cadabra]
        )
      ))
      ```

      = #babel(en: [Accessibility]) <accessibility>
      #babel(
        en: [
          Moving is transparent to Assistive Technology (AT). Your content will be
          read in the order it appears in the source, regardless of any visual
          movement. If you need to hide content from AT altogether in PDF export,
          consider using @pdf.artifact.
        ],
      )
    ],
  ),
  "MoveElem::dx": (
    26,
    babel(
      en: [
        The horizontal displacement of the content.
      ],
    ),
  ),
  "MoveElem::dy": (
    3,
    babel(
      en: [
        The vertical displacement of the content.
      ],
    ),
  ),
  "MoveElem::body": (
    3,
    babel(
      en: [
        The content to move.
      ],
    ),
  ),
  "RotateElem": (
    5,
    [
      #babel(
        en: [
          Rotates content without affecting layout.

          Rotates an element by a given angle. The layout will act as if the element
          was not rotated unless you specify `{reflow: true}`.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #stack(
        dir: ltr,
        spacing: 1fr,
        ..range(16)
          .map(i => rotate(24deg * i)[X]),
      )
      ```
    ],
  ),
  "RotateElem::angle": (
    16,
    [
      #babel(
        en: [
          The amount of rotation.
        ],
      )

      ```example
      #rotate(-1.571rad)[Space!]
      ```
    ],
  ),
  "RotateElem::origin": (
    8,
    [
      #babel(
        en: [
          The origin of the rotation.

          If, for instance, you wanted the bottom left corner of the rotated
          element to stay aligned with the baseline, you would set it to
          `bottom + left` instead.
        ],
      )

      ```example
      #set text(spacing: 8pt)
      #let square = square.with(width: 8pt)

      #box(square())
      #box(rotate(30deg, origin: center, square()))
      #box(rotate(30deg, origin: top + left, square()))
      #box(rotate(30deg, origin: bottom + right, square()))
      ```
    ],
  ),
  "RotateElem::reflow": (
    19,
    [
      #babel(
        en: [
          Whether the rotation impacts the layout.

          If set to `{false}`, the rotated content will retain the bounding box of
          the original content. If set to `{true}`, the bounding box will take the
          rotation of the content into account and adjust the layout accordingly.
        ],
      )

      ```example
      Hello #rotate(90deg, reflow: true)[World]!
      ```
    ],
  ),
  "RotateElem::body": (
    12,
    babel(
      en: [
        The content to rotate.
      ],
    ),
  ),
  "ScaleElem": (
    5,
    [
      #babel(
        en: [
          Scales content without affecting layout.

          Lets you mirror content by specifying a negative scale on a single axis.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #set align(center)
      #scale(x: -100%)[This is mirrored.]
      #scale(x: -100%, reflow: true)[This is mirrored.]
      ```
    ],
  ),
  "ScaleElem::factor": (
    12,
    babel(
      en: [
        The scaling factor for both axes, as a positional argument. This is just
        an optional shorthand notation for setting `x` and `y` to the same
        value.
      ],
    ),
  ),
  "ScaleElem::x": (
    8,
    babel(
      en: [
        The horizontal scaling factor.

        The body will be mirrored horizontally if the parameter is negative.
      ],
    ),
  ),
  "ScaleElem::y": (
    10,
    babel(
      en: [
        The vertical scaling factor.

        The body will be mirrored vertically if the parameter is negative.
      ],
    ),
  ),
  "ScaleElem::origin": (
    7,
    [
      #babel(
        en: [
          The origin of the transformation.
        ],
      )

      ```example
      A#box(scale(75%)[A])A \
      B#box(scale(75%, origin: bottom + left)[B])B
      ```
    ],
  ),
  "ScaleElem::reflow": (
    10,
    [
      #babel(
        en: [
          Whether the scaling impacts the layout.

          If set to `{false}`, the scaled content will be allowed to overlap other
          content. If set to `{true}`, it will compute the new size of the scaled
          content and adjust the layout accordingly.
        ],
      )

      ```example
      Hello #scale(x: 20%, y: 40%, reflow: true)[World]!
      ```
    ],
  ),
  "ScaleElem::body": (
    12,
    babel(
      en: [
        The content to scale.
      ],
    ),
  ),
  "SkewElem": (
    22,
    [
      #babel(
        en: [
          Skews content.

          Skews an element in horizontal and/or vertical direction. The layout will
          act as if the element was not skewed unless you specify `{reflow: true}`.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #skew(ax: -12deg)[
        This is some fake italic text.
      ]
      ```
    ],
  ),
  "SkewElem::ax": (
    13,
    [
      #babel(
        en: [
          The horizontal skewing angle.
        ],
      )

      ```example
      #skew(ax: 30deg)[Skewed]
      ```
    ],
  ),
  "SkewElem::ay": (
    8,
    [
      #babel(
        en: [
          The vertical skewing angle.
        ],
      )

      ```example
      #skew(ay: 30deg)[Skewed]
      ```
    ],
  ),
  "SkewElem::origin": (
    8,
    [
      #babel(
        en: [
          The origin of the skew transformation.

          The origin will stay fixed during the operation.
        ],
      )

      ```example
      X #box(skew(ax: -30deg, origin: center + horizon)[X]) X \
      X #box(skew(ax: -30deg, origin: bottom + left)[X]) X \
      X #box(skew(ax: -30deg, origin: top + right)[X]) X
      ```
    ],
  ),
  "SkewElem::reflow": (
    13,
    [
      #babel(
        en: [
          Whether the skew transformation impacts the layout.

          If set to `{false}`, the skewed content will retain the bounding box of
          the original content. If set to `{true}`, the bounding box will take the
          transformation of the content into account and adjust the layout
          accordingly.
        ],
      )

      ```example
      Hello #skew(ay: 30deg, reflow: true, "World")!
      ```
    ],
  ),
  "SkewElem::body": (
    13,
    babel(
      en: [
        The content to skew.
      ],
    ),
  ),
))
