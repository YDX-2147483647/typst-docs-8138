#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Gradient": (
    19,
    [
      #babel(
        en: [
          A color gradient.

          Typst supports linear gradients through the
          @gradient.linear[`gradient.linear` function], radial gradients through the
          @gradient.radial[`gradient.radial` function], and conic gradients through
          the @gradient.conic[`gradient.conic` function].

          A gradient can be used for the following purposes:
          - As a fill to paint the interior of a shape:
            `{rect(fill: gradient.linear(..))}`
          - As a stroke to paint the outline of a shape:
            `{rect(stroke: 1pt + gradient.linear(..))}`
          - As the fill of text: `{set text(fill: gradient.linear(..))}`
          - As a color map you can @gradient.sample[sample] from:
            `{gradient.linear(..).sample(50%)}`
        ],
      )

      = #babel(en: [Examples]) <examples>
      ```example
      >>> #set square(size: 50pt)
      #stack(
        dir: ltr,
        spacing: 1fr,
        square(fill: gradient.linear(..color.map.rainbow)),
        square(fill: gradient.radial(..color.map.rainbow)),
        square(fill: gradient.conic(..color.map.rainbow)),
      )
      ```

      #babel(
        en: [
          Gradients are also supported on text, but only when setting the
          @gradient.relative[relativeness] to either `{auto}` (the default value) or
          `{"parent"}`. To create word-by-word or glyph-by-glyph gradients, you can
          wrap the words or characters of your text in @box[boxes] manually or through
          a @reference:styling:show-rules[show rule].
        ],
      )

      ```example
      >>> #set page(width: auto, height: auto, margin: 12pt)
      >>> #set text(size: 12pt)
      #set text(fill: gradient.linear(red, blue))
      #let rainbow(content) = {
        set text(fill: gradient.linear(..color.map.rainbow))
        box(content)
      }

      This is a gradient on text, but with a #rainbow[twist]!
      ```

      = #babel(en: [Stops]) <stops>
      #babel(
        en: [
          A gradient is composed of a series of stops. Each of these stops has a color
          and an offset. The offset is a @ratio[ratio] between `{0%}` and `{100%}` or
          an angle between `{0deg}` and `{360deg}`. The offset is a relative position
          that determines how far along the gradient the stop is located. The stop's
          color defines the color the gradient should have at that position.

          Each stop is passed as a positional argument and can take one of two forms:
          - Just a color, like `{red}`, to let Typst place the stop automatically.
          - An array of a color and its offset, like `{(red, 30%)}`, to place the stop
            yourself.

          You can choose to omit the offsets when defining a gradient. In this case,
          Typst will space all stops evenly. Otherwise, offsets must be provided for
          _every_ stop. They must not decrease from one stop to the next, the first
          must be `{0%}`, and the last must be `{100%}`.
        ],
      )

      ```example
      #rect(
        width: 100%,
        fill: gradient.linear(
          (green, 0%),
          (red, 30%),
          (blue, 100%),
        ),
      )
      ```

      #babel(
        en: [
          Giving two stops the same offset creates a hard edge instead of a smooth
          transition:
        ],
      )

      ```example
      #rect(
        width: 100%,
        fill: gradient.linear(
          (orange, 0%),
          (orange, 50%),
          (blue, 50%),
          (blue, 100%),
        ),
      )
      ```

      #babel(
        en: [
          Typst provides the @gradient.sharp[`sharp`] method on gradients to
          automatically turn a smooth gradient into one with hard edges. The
          example above can equivalently be written as:
        ],
      )

      ```example
      #rect(
        width: 100%,
        fill: gradient.linear(orange, blue)
          .sharp(2),
      )
      ```

      #babel(
        en: [
          Typst predefines color maps that you can use as stops in @color.map.
        ],
      )

      = #babel(en: [Relativeness]) <relativeness>
      #babel(
        en: [
          The location of the `{0%}` and `{100%}` stops depends on the dimensions of a
          container. This container can either be the shape that it is being painted
          on, or the closest surrounding container. This is controlled by the
          `relative` argument of a gradient constructor. By default, gradients are
          relative to the shape they are being painted on, unless the gradient is
          applied on text, in which case they are relative to the closest ancestor
          container.

          Typst determines the ancestor container as follows:
          - For shapes that are placed at the root/top level of the document, the
            closest ancestor is the page itself.
          - For other shapes, the ancestor is the innermost @block or @box that
            contains the shape.
        ],
      )

      = #babel(en: [Color spaces and interpolation]) <color-spaces-and-interpolation>
      #babel(
        en: [
          Gradients can be interpolated in any color space. By default, gradients are
          interpolated in the @color.oklab[Oklab] color space, which is a
          #link(
            "https://programmingdesignsystems.com/color/perceptually-uniform-color-spaces/index.html",
          )[perceptually uniform]
          color space. This means that the gradient will be perceived as having a
          smooth progression of colors. This is particularly useful for data
          visualization.

          However, you can choose to interpolate the gradient in any supported color
          space you want, but beware that some color spaces are not suitable for
          perceptually interpolating between colors. Consult the table below when
          choosing an interpolation space.
        ],
      )

      #docs-table(
        table.header[Color space][Perceptually uniform?],

        [@color.oklab[Oklab]],
        [_Yes_],

        [@color.oklch[Oklch]],
        [_Yes_],

        [@color.rgb[sRGB]],
        [_No_],

        [@color.linear-rgb[linear-RGB]],
        [_Yes_],

        [@color.cmyk[CMYK]],
        [_No_],

        [@color.luma[Grayscale]],
        [_Yes_],

        [@color.hsl[HSL]],
        [_No_],

        [@color.hsv[HSV]],
        [_No_],
      )

      ```preview
      >>> #set text(fill: white, font: "IBM Plex Sans", 8pt)
      >>> #set block(spacing: 0pt)
      #let spaces = (
        ("Oklab", color.oklab),
        ("Oklch", color.oklch),
        ("sRGB", color.rgb),
        ("linear-RGB", color.linear-rgb),
        ("CMYK", color.cmyk),
        ("Grayscale", color.luma),
        ("HSL", color.hsl),
        ("HSV", color.hsv),
      )

      #for (name, space) in spaces {
        block(
          width: 100%,
          inset: 4pt,
          fill: gradient.linear(
            red,
            blue,
            space: space,
          ),
          strong(upper(name)),
        )
      }
      ```

      = #babel(en: [Direction]) <direction>
      #babel(
        en: [
          Some gradients are sensitive to direction. For example, a linear gradient
          has an angle that determines its direction. Typst uses a clockwise angle,
          with 0° being from left to right, 90° from top to bottom, 180° from right to
          left, and 270° from bottom to top.
        ],
      )

      ```example
      >>> #set square(size: 50pt)
      #stack(
        dir: ltr,
        spacing: 1fr,
        square(fill: gradient.linear(red, blue, angle: 0deg)),
        square(fill: gradient.linear(red, blue, angle: 90deg)),
        square(fill: gradient.linear(red, blue, angle: 180deg)),
        square(fill: gradient.linear(red, blue, angle: 270deg)),
      )
      ```

      = #babel(en: [Note on file sizes]) <note-on-file-sizes>
      #babel(
        en: [
          Gradients can be quite large, especially if they have many stops. This is
          because gradients are stored as a list of colors and offsets, which can take
          up a lot of space. In SVG export, gradients are stored as a list of
          @color.rgb colors replicating the original color space with an optimized
          number of extra stops in between. In PDF export, the same applies to
          gradients in the @color.oklab, @color.oklch, @color.hsv, @color.hsl, and
          @color.linear-rgb color spaces. This avoids needing to encode these color
          spaces in your PDF file, but it does add extra stops to your gradient, which
          can increase the file size.
        ],
      )
    ],
  ),
  "Gradient::linear": (
    226,
    [
      #babel(
        en: [
          Creates a new linear gradient, in which colors transition along a
          straight line.
        ],
      )

      ```example
      #rect(
        width: 100%,
        height: 20pt,
        fill: gradient.linear(
          ..color.map.viridis,
        ),
      )
      ```
    ],
  ),
  "Gradient::linear::stops": (
    16,
    babel(
      en: [
        The color @gradient:stops[stops] of the gradient.

        Each stop is given as a separate positional argument. It can either
        be a color, like `{red}`, or an array of a color and its offset,
        like `{(red, 30%)}`. If offsets are given, they must be provided for
        all stops, not decrease from one stop to the next, start at `{0%}`,
        and end at `{100%}`.

        When using a predefined color map from the `color.map` module, the
        @arguments:spreading[spreading operator] `..` is used to pass each
        stop as a separate argument.
      ],
    ),
  ),
  "Gradient::linear::space": (
    13,
    babel(
      en: [
        The color space in which to interpolate the gradient.

        Defaults to a perceptually uniform color space called
        @color.oklab[Oklab].
      ],
    ),
  ),
  "Gradient::linear::relative": (
    7,
    babel(
      en: [
        The @gradient:relativeness[relative placement] of the gradient.

        The parent of an element is the innermost @box or @block that
        contains the element, or, if there is none, the page itself.
      ],
    ),
  ),
  "Gradient::linear::dir": (
    7,
    babel(
      en: [
        The direction of the gradient.
      ],
    ),
  ),
  "Gradient::linear::angle": (
    4,
    babel(
      en: [
        The angle of the gradient.
      ],
    ),
  ),
  "Gradient::radial": (
    35,
    [
      #babel(
        en: [
          Creates a new radial gradient, in which colors radiate away from an
          origin.

          The gradient is defined by two circles: the focal circle and the end
          circle. The focal circle is a circle with center `focal-center` and
          radius `focal-radius`, that defines the points at which the gradient
          starts and has the color of the first stop. The end circle is a circle
          with center `center` and radius `radius`, that defines the points at
          which the gradient ends and has the color of the last stop. The gradient
          is then interpolated between these two circles.

          Using these four values, also called the focal point for the starting
          circle and the center and radius for the end circle, we can define a
          gradient with more interesting properties than a basic radial gradient.
        ],
      )

      ```example
      >>> #set circle(radius: 30pt)
      #stack(
        dir: ltr,
        spacing: 1fr,
        circle(fill: gradient.radial(
          ..color.map.viridis,
        )),
        circle(fill: gradient.radial(
          ..color.map.viridis,
          focal-center: (10%, 40%),
          focal-radius: 5%,
        )),
      )
      ```
    ],
  ),
  "Gradient::radial::stops": (
    33,
    babel(
      en: [
        The color @gradient:stops[stops] of the gradient.

        Also see the @gradient.linear.stops[linear gradient's documentation]
        for more details.
      ],
    ),
  ),
  "Gradient::radial::space": (
    6,
    babel(
      en: [
        The color space in which to interpolate the gradient.

        Defaults to a perceptually uniform color space called
        @color.oklab[Oklab].
      ],
    ),
  ),
  "Gradient::radial::relative": (
    7,
    babel(
      en: [
        The @gradient:relativeness[relative placement] of the gradient.

        The parent of an element is the innermost @box or @block that
        contains the element, or, if there is none, the page itself.
      ],
    ),
  ),
  "Gradient::radial::center": (
    7,
    babel(
      en: [
        The center of the end circle of the gradient.

        A value of `{(50%, 50%)}` means that the end circle is centered
        inside of its container.
      ],
    ),
  ),
  "Gradient::radial::radius": (
    7,
    babel(
      en: [
        The radius of the end circle of the gradient.

        By default, it is set to `{50%}`. The ending radius must be bigger
        than the focal radius.
      ],
    ),
  ),
  "Gradient::radial::focal_center": (
    7,
    babel(
      en: [
        The center of the focal circle of the gradient.

        The focal center must be inside of the end circle.

        A value of `{(50%, 50%)}` means that the focal circle is centered
        inside of its container.

        By default it is set to the same as the center of the last circle.
      ],
    ),
  ),
  "Gradient::radial::focal_radius": (
    11,
    babel(
      en: [
        The radius of the focal circle of the gradient.

        The focal center must be inside of the end circle.

        By default, it is set to `{0%}`. The focal radius must be smaller
        than the ending radius.
      ],
    ),
  ),
  "Gradient::conic": (
    52,
    [
      #babel(
        en: [
          Creates a new conic gradient, in which colors change radially around a
          center point.

          You can control the center point of the gradient by using the `center`
          argument. By default, the center point is the center of the shape.
        ],
      )

      ```example
      >>> #set circle(radius: 30pt)
      #stack(
        dir: ltr,
        spacing: 1fr,
        circle(fill: gradient.conic(
          ..color.map.viridis,
        )),
        circle(fill: gradient.conic(
          ..color.map.viridis,
          center: (20%, 30%),
        )),
      )
      ```
    ],
  ),
  "Gradient::conic::stops": (
    23,
    babel(
      en: [
        The color @gradient:stops[stops] of the gradient.

        Also see the @gradient.linear.stops[linear gradient's documentation]
        for more details.
      ],
    ),
  ),
  "Gradient::conic::angle": (
    6,
    babel(
      en: [
        The angle of the gradient.
      ],
    ),
  ),
  "Gradient::conic::space": (
    4,
    babel(
      en: [
        The color space in which to interpolate the gradient.

        Defaults to a perceptually uniform color space called
        @color.oklab[Oklab].
      ],
    ),
  ),
  "Gradient::conic::relative": (
    7,
    babel(
      en: [
        The @gradient:relativeness[relative placement] of the gradient.

        The parent of an element is the innermost @box or @block that
        contains the element, or, if there is none, the page itself.
      ],
    ),
  ),
  "Gradient::conic::center": (
    7,
    babel(
      en: [
        The center of the circle of the gradient.

        A value of `{(50%, 50%)}` means that the circle is centered inside
        of its container.
      ],
    ),
  ),
  "Gradient::sharp": (
    27,
    [
      #babel(
        en: [
          Creates a sharp version of this gradient.

          Sharp gradients have discrete jumps between colors, instead of a smooth
          transition. They are particularly useful for creating color lists for a
          preset gradient.
        ],
      )

      ```example
      #set rect(width: 100%, height: 20pt)
      #let grad = gradient.linear(..color.map.rainbow)
      #rect(fill: grad)
      #rect(fill: grad.sharp(5))
      #rect(fill: grad.sharp(5, smoothness: 20%))
      ```
    ],
  ),
  "Gradient::sharp::steps": (
    16,
    babel(
      en: [
        The number of stops in the gradient.
      ],
    ),
  ),
  "Gradient::sharp::smoothness": (
    2,
    babel(
      en: [
        How much to smooth the gradient.
      ],
    ),
  ),
  "Gradient::repeat": (
    79,
    [
      #babel(
        en: [
          Repeats this gradient a given number of times, optionally mirroring it
          at every second repetition.
        ],
      )

      ```example
      #circle(
        radius: 40pt,
        fill: gradient
          .radial(aqua, white)
          .repeat(4),
      )
      ```
    ],
  ),
  "Gradient::repeat::repetitions": (
    14,
    babel(
      en: [
        The number of times to repeat the gradient.
      ],
    ),
  ),
  "Gradient::repeat::mirror": (
    2,
    [
      #babel(
        en: [
          Whether to mirror the gradient at every second repetition, i.e., the
          first instance (and all odd ones) stays unchanged.
        ],
      )

      ```example
      #circle(
        radius: 40pt,
        fill: gradient
          .conic(green, black)
          .repeat(2, mirror: true)
      )
      ```
    ],
  ),
  "Gradient::kind": (
    74,
    babel(
      en: [
        Returns the kind of this gradient.
      ],
    ),
  ),
  "Gradient::stops": (
    10,
    babel(
      en: [
        Returns the stops of this gradient.
      ],
    ),
  ),
  "Gradient::space": (
    31,
    babel(
      en: [
        Returns the mixing space of this gradient.
      ],
    ),
  ),
  "Gradient::relative": (
    10,
    babel(
      en: [
        Returns the relative placement of this gradient.
      ],
    ),
  ),
  "Gradient::angle": (
    10,
    babel(
      en: [
        Returns the angle of this gradient.

        Returns `{none}` if the gradient is neither linear nor conic.
      ],
    ),
  ),
  "Gradient::center": (
    12,
    babel(
      en: [
        Returns the center of this gradient.

        Returns `{none}` if the gradient is neither radial nor conic.
      ],
    ),
  ),
  "Gradient::radius": (
    12,
    babel(
      en: [
        Returns the radius of this gradient.

        Returns `{none}` if the gradient is not radial.
      ],
    ),
  ),
  "Gradient::focal_center": (
    12,
    babel(
      en: [
        Returns the focal-center of this gradient.

        Returns `{none}` if the gradient is not radial.
      ],
    ),
  ),
  "Gradient::focal_radius": (
    12,
    babel(
      en: [
        Returns the focal-radius of this gradient.

        Returns `{none}` if the gradient is not radial.
      ],
    ),
  ),
  "Gradient::sample": (
    12,
    babel(
      en: [
        Sample the gradient at a given position.

        The position is either a position along the gradient (a @ratio[ratio]
        between `{0%}` and `{100%}`) or an @angle[angle]. Any value outside of
        this range will be clamped.
      ],
    ),
  ),
  "Gradient::sample::t": (
    8,
    babel(
      en: [
        The position at which to sample the gradient.
      ],
    ),
  ),
  "Gradient::samples": (
    16,
    babel(
      en: [
        Samples the gradient at multiple positions at once and returns the
        results as an array.
      ],
    ),
  ),
  "Gradient::samples::ts": (
    5,
    babel(
      en: [
        The positions at which to sample the gradient.
      ],
    ),
  ),
))
