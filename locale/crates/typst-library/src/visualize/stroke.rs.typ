#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Stroke": (
    12,
    [
      #babel(
        en: [
          Defines how to draw a line.

          A stroke has a _paint_ (a solid color or gradient), a _thickness,_ a line
          _cap,_ a line _join,_ a _miter limit,_ and a _dash_ pattern. All of these
          values are optional and have sensible defaults.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #set line(length: 100%)
      #stack(
        spacing: 1em,
        line(stroke: 2pt + red),
        line(stroke: (paint: blue, thickness: 4pt, cap: "round")),
        line(stroke: (paint: blue, thickness: 1pt, dash: "dashed")),
        line(stroke: 2pt + gradient.linear(..color.map.rainbow)),
      )
      ```

      = #babel(en: [Simple strokes]) <simple-strokes>
      #babel(
        en: [
          You can create a simple solid stroke from a color, a thickness, or a
          combination of the two. Specifically, wherever a stroke is expected you can
          pass any of the following values:

          - A length specifying the stroke's thickness. The color is inherited,
            defaulting to black.
          - A color to use for the stroke. The thickness is inherited, defaulting to
            `{1pt}`.
          - A stroke combined from color and thickness using the `+` operator as in
            `{2pt + red}`.

          For full control, you can also provide a @dictionary[dictionary] or a
          `{stroke}` object to any function that expects a stroke. The dictionary's
          keys may include any of the parameters for the constructor function, shown
          below.
        ],
      )

      = #babel(en: [Fields]) <fields>
      #babel(
        en: [
          On a stroke object, you can access any of the fields listed in the
          constructor function. For example, `{(2pt + blue).thickness}` is `{2pt}`.
          Meanwhile, `{stroke(red).cap}` is `{auto}` because it's unspecified. Fields
          set to `{auto}` are inherited.
        ],
      )
    ],
  ),
  "Stroke::construct": (
    70,
    [
      #babel(
        en: [
          Converts a value to a stroke or constructs a stroke with the given
          parameters.

          Note that in most cases you do not need to convert values to strokes in
          order to use them, as they will be converted automatically. However,
          this constructor can be useful to ensure a value has all the fields of a
          stroke.
        ],
      )

      ```example
      #let my-func(x) = {
          x = stroke(x) // Convert to a stroke
          [Stroke has thickness #x.thickness.]
      }
      #my-func(3pt) \
      #my-func(red) \
      #my-func(stroke(cap: "round", thickness: 1pt))
      ```
    ],
  ),
  "Stroke::construct::paint": (
    21,
    babel(
      en: [
        The color or gradient to use for the stroke.

        If set to `{auto}`, the value is inherited, defaulting to `{black}`.
      ],
    ),
  ),
  "Stroke::construct::thickness": (
    6,
    babel(
      en: [
        The stroke's thickness.

        If set to `{auto}`, the value is inherited, defaulting to `{1pt}`.
      ],
    ),
  ),
  "Stroke::construct::cap": (
    6,
    babel(
      en: [
        How the ends of the stroke are rendered.

        If set to `{auto}`, the value is inherited, defaulting to
        `{"butt"}`.
      ],
    ),
  ),
  "Stroke::construct::join": (
    7,
    babel(
      en: [
        How sharp turns are rendered.

        If set to `{auto}`, the value is inherited, defaulting to
        `{"miter"}`.
      ],
    ),
  ),
  "Stroke::construct::dash": (
    7,
    [
      #babel(
        en: [
          The dash pattern to use. This can be:

          - One of the predefined patterns listed below.
          - `{none}`, as an equivalent to the predefined pattern `{"solid"}`.
          - An @array[array] with alternating lengths for dashes and gaps. You
            can also use the string `{"dot"}` for a length equal to the line
            thickness.
          - A @dictionary[dictionary] with the keys `array` (same as the array
            above), and `phase` (of type @length[length]), which defines where
            in the pattern to start drawing.

          If set to `{auto}`, the value is inherited, defaulting to `{none}`.
        ],
      )

      #example(
        title: "Usage",
        ```
        #set line(length: 100%, stroke: 2pt)
        #stack(
          spacing: 1em,
          line(stroke: (dash: "dashed")),
          line(stroke: (dash: (10pt, 5pt, "dot", 5pt))),
          line(stroke: (dash: (array: (10pt, 5pt, "dot", 5pt), phase: 10pt))),
        )
        ```,
      )

      #example(
        title: "Predefined patterns",
        ```
        #set page(width: auto, height: auto)

        #let patterns = (
          ("dotted", "dashed", "dash-dotted").map(d => (
            "loosely-" + d,
            d,
            "densely-" + d,
          ))
        ).flatten()


        #let display(dash) = {
          set par(spacing: 0.3em)

          show "loosely": set text(eastern.darken(17%))
          show "densely": set text(purple)

          let derived = dash.starts-with("loosely-") or dash.starts-with("densely-")
          if derived { dash } else { strong(dash) }

          rect(
            line(stroke: (dash: dash), length: 100%),
            stroke: none,
            fill: yellow.transparentize(80%),
          )
        }

        #table(
          columns: 3,
          stroke: none,
          align: (left, center, left),

          table.cell(colspan: 3, align: center, display("solid")),
          ..patterns.map(display),
        )
        ```,
      )
    ],
  ),
  "Stroke::construct::miter_limit": (
    69,
    [
      #babel(
        en: [
          Number at which protruding sharp bends are rendered with a bevel
          instead or a miter join. The higher the number, the sharper an angle
          can be before it is bevelled. Only applicable if `join` is
          `{"miter"}`.

          Specifically, the miter limit is the maximum ratio between the
          corner's protrusion length and the stroke's thickness.

          If set to `{auto}`, the value is inherited, defaulting to `{4.0}`.
        ],
      )

      ```example
      #let items = (
        curve.move((15pt, 0pt)),
        curve.line((0pt, 30pt)),
        curve.line((30pt, 30pt)),
        curve.line((10pt, 20pt)),
      )

      #set curve(stroke: 6pt + blue)
      #stack(
        dir: ltr,
        spacing: 1cm,
        curve(stroke: (miter-limit: 1), ..items),
        curve(stroke: (miter-limit: 4), ..items),
        curve(stroke: (miter-limit: 5), ..items),
      )
      ```
    ],
  ),
))
