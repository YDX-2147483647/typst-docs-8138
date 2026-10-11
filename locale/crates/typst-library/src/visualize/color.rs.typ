#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Color": (
    58,
    [
      #babel(
        en: [
          A color in a specific color space.

          Typst supports:
          - sRGB through the @color.rgb[`rgb` function]
          - Device CMYK through the @color.cmyk[`cmyk` function]
          - D65 Gray through the @color.luma[`luma` function]
          - Oklab through the @color.oklab[`oklab` function]
          - Oklch through the @color.oklch[`oklch` function]
          - Linear RGB through the @color.linear-rgb[`color.linear-rgb` function]
          - HSL through the @color.hsl[`color.hsl` function]
          - HSV through the @color.hsv[`color.hsv` function]
          - Color spaces described by spot colorants through the
            @color.spot[`color.spot` type]

          All color spaces except for CMYK and spot colorants have alpha channels.

          Throughout the documentation, we use the term _process color_ for colors
          that can be blended with each other (currently all colors other than spot
          colors). In this term, _process_ signifies that the shade is being created
          throughout the printing process instead of ahead of time.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #rect(fill: aqua)
      ```

      = #babel(en: [Predefined colors]) <predefined-colors>
      #babel(
        en: [
          Typst defines the following built-in colors:
        ],
      )

      #docs-table(
        table.header[Color][Definition],

        [`black`],
        [`{luma(0)}`],

        [`gray`],
        [`{luma(170)}`],

        [`silver`],
        [`{luma(221)}`],

        [`white`],
        [`{luma(255)}`],

        [`navy`],
        [`{rgb("#001f3f")}`],

        [`blue`],
        [`{rgb("#0074d9")}`],

        [`aqua`],
        [`{rgb("#7fdbff")}`],

        [`teal`],
        [`{rgb("#39cccc")}`],

        [`eastern`],
        [`{rgb("#239dad")}`],

        [`purple`],
        [`{rgb("#b10dc9")}`],

        [`fuchsia`],
        [`{rgb("#f012be")}`],

        [`maroon`],
        [`{rgb("#85144b")}`],

        [`red`],
        [`{rgb("#ff4136")}`],

        [`orange`],
        [`{rgb("#ff851b")}`],

        [`yellow`],
        [`{rgb("#ffdc00")}`],

        [`olive`],
        [`{rgb("#3d9970")}`],

        [`green`],
        [`{rgb("#2ecc40")}`],

        [`lime`],
        [`{rgb("#01ff70")}`],
      )

      #babel(
        en: [
          The predefined colors and the most important color constructors are
          available globally and also in the color type's scope, so you can write
          either `color.red` or just `red`.
        ],
      )

      ```preview
      #let colors = (
        "black", "gray", "silver", "white",
        "navy", "blue", "aqua", "teal",
        "eastern", "purple", "fuchsia",
        "maroon", "red", "orange", "yellow",
        "olive", "green", "lime",
      )

      #set text(font: "PT Sans")
      #set page(width: auto)
      #grid(
        columns: 9,
        gutter: 10pt,
        ..colors.map(name => {
            let col = eval(name)
            let luminance = luma(col).components().first()
            set text(fill: white) if luminance < 50%
            set square(stroke: black) if col == white
            set align(center + horizon)
            square(size: 50pt,  fill: col, name)
        })
      )
      ```
    ],
  ),
  "Color::MAP": (
    178,
    [
      #babel(
        en: [
          A collection of preset color maps that can be used for
          @gradient:stops[gradients]. These are simply arrays of colors.
        ],
      )

      ```example
      #circle(fill: gradient.linear(..color.map.crest))
      ```

      #docs-table(
        table.header[Map][Details],

        [`turbo`],
        [
          A perceptually uniform rainbow-like color map. Read
          #link("https://ai.googleblog.com/2019/08/turbo-improved-rainbow-colormap-for.html")[this blog post]
          for more details.
        ],

        [`cividis`],
        [
          A blue to gray to yellow color map. See
          #link("https://bids.github.io/colormap/")[this blog post] for more
          details.
        ],

        [`rainbow`],
        [
          Cycles through the full color spectrum. This color map is best used
          by setting the interpolation color space to @color.hsl[HSL]. The
          rainbow gradient is *not suitable* for data visualization because it
          is not perceptually uniform, so the differences between values
          become unclear to your readers. It should only be used for
          decorative purposes.
        ],

        [`spectral`],
        [Red to yellow to blue color map.],

        [`viridis`],
        [A purple to teal to yellow color map.],

        [`inferno`],
        [A black to red to yellow color map.],

        [`magma`],
        [A black to purple to yellow color map.],

        [`plasma`],
        [A purple to pink to yellow color map.],

        [`rocket`],
        [A black to red to white color map.],

        [`mako`],
        [A black to teal to white color map.],

        [`coolwarm`],
        [A blue to white to red color map with smooth transitions.],

        [`vlag`],
        [A light blue to white to red color map.],

        [`icefire`],
        [A light teal to black to orange color map.],

        [`flare`],
        [A orange to purple color map that is perceptually uniform.],

        [`crest`],
        [A light green to blue color map.],
      )

      #babel(
        en: [
          Some popular presets are not included because they are not available
          under a free licence. Others, like
          #link("https://jakevdp.github.io/blog/2014/10/16/how-bad-is-your-colormap/")[Jet],
          are not included because they are not color blind friendly. Feel free to
          use or create a package with other presets that are useful to you!
        ],
      )

      ```preview
      #set page(width: auto, height: auto)
      #set text(font: "PT Sans", size: 8pt)

      #let maps = (
        "turbo", "cividis", "rainbow", "spectral",
        "viridis", "inferno", "magma", "plasma",
        "rocket", "mako", "coolwarm", "vlag",
        "icefire", "flare", "crest",
      )

      #stack(dir: ltr, spacing: 3pt, ..maps.map((name) => {
        let map = eval("color.map." + name)
        stack(
          dir: ttb,
          block(
            width: 15pt,
            height: 100pt,
            fill: gradient.linear(..map, angle: 90deg),
          ),
          block(
            width: 15pt,
            height: 32pt,
            move(dy: 8pt, rotate(90deg, name)),
          ),
        )
      }))
      ```
    ],
  ),
  "Color::luma": (
    108,
    [
      #babel(
        en: [
          Create a grayscale color.

          A grayscale color is represented by `lightness` (@ratio) and `alpha`
          (@ratio) components.

          These components are also available using the
          @color.components[`components`] method.
        ],
      )

      ```example
      #for x in range(250, step: 50) {
        box(square(fill: luma(x)))
      }
      ```
    ],
  ),
  "Color::luma::lightness": (
    16,
    babel(
      en: [
        The lightness component.
      ],
    ),
  ),
  "Color::luma::alpha": (
    3,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::luma::color": (
    3,
    babel(
      en: [
        Alternatively: The color to convert to grayscale.

        If this is given, the individual components should not be given.
      ],
    ),
  ),
  "Color::oklab": (
    28,
    [
      #babel(
        en: [
          Create an #link("https://bottosson.github.io/posts/oklab/")[Oklab]
          color.

          This color space is well suited for the following use cases:
          - Color manipulation such as saturating while keeping perceived hue
          - Creating grayscale images with uniform perceived lightness
          - Creating smooth and uniform color transition and gradients

          A linear Oklab color is represented internally by an array of four
          components:
          - lightness (@ratio)
          - a (@float or @ratio. Ratios are relative to `{0.4}`; meaning `{50%}`
            is equal to `{0.2}`)
          - b (@float or @ratio. Ratios are relative to `{0.4}`; meaning `{50%}`
            is equal to `{0.2}`)
          - alpha (@ratio)

          These components are also available using the
          @color.components[`components`] method.
        ],
      )

      ```example
      #square(
        fill: oklab(27%, 20%, -3%, 50%)
      )
      ```
    ],
  ),
  "Color::oklab::lightness": (
    28,
    babel(
      en: [
        The lightness component.
      ],
    ),
  ),
  "Color::oklab::a": (
    3,
    babel(
      en: [
        The a ("green/red") component.
      ],
    ),
  ),
  "Color::oklab::b": (
    3,
    babel(
      en: [
        The b ("blue/yellow") component.
      ],
    ),
  ),
  "Color::oklab::alpha": (
    3,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::oklab::color": (
    3,
    babel(
      en: [
        Alternatively: The color to convert to Oklab.

        If this is given, the individual components should not be given.
      ],
    ),
  ),
  "Color::oklch": (
    20,
    [
      #babel(
        en: [
          Create an #link("https://bottosson.github.io/posts/oklab/")[Oklch]
          color.

          This color space is well suited for the following use cases:
          - Color manipulation involving lightness, chroma, and hue
          - Creating grayscale images with uniform perceived lightness
          - Creating smooth and uniform color transition and gradients

          A linear Oklch color is represented internally by an array of four
          components:
          - lightness (@ratio)
          - chroma (@float or @ratio. Ratios are relative to `{0.4}`; meaning
            `{50%}` is equal to `{0.2}`)
          - hue (@angle)
          - alpha (@ratio)

          These components are also available using the
          @color.components[`components`] method.
        ],
      )

      ```example
      #square(
        fill: oklch(40%, 0.2, 160deg, 50%)
      )
      ```
    ],
  ),
  "Color::oklch::lightness": (
    27,
    babel(
      en: [
        The lightness component.
      ],
    ),
  ),
  "Color::oklch::chroma": (
    3,
    babel(
      en: [
        The chroma component.
      ],
    ),
  ),
  "Color::oklch::hue": (
    3,
    babel(
      en: [
        The hue component.
      ],
    ),
  ),
  "Color::oklch::alpha": (
    3,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::oklch::color": (
    3,
    babel(
      en: [
        Alternatively: The color to convert to Oklch.

        If this is given, the individual components should not be given.
      ],
    ),
  ),
  "Color::linear_rgb": (
    25,
    [
      #babel(
        en: [
          Create an RGB(A) color with linear luma.

          This color space is similar to sRGB, but with the distinction that the
          color component are not gamma corrected. This makes it easier to perform
          color operations such as blending and interpolation. Although, you
          should prefer to use the @color.oklab[`oklab` function] for these.

          A linear RGB(A) color is represented internally by an array of four
          components:
          - red (@ratio)
          - green (@ratio)
          - blue (@ratio)
          - alpha (@ratio)

          These components are also available using the
          @color.components[`components`] method.
        ],
      )

      ```example
      #square(fill: color.linear-rgb(
        30%, 50%, 10%,
      ))
      ```
    ],
  ),
  "Color::linear_rgb::red": (
    25,
    babel(
      en: [
        The red component.
      ],
    ),
  ),
  "Color::linear_rgb::green": (
    3,
    babel(
      en: [
        The green component.
      ],
    ),
  ),
  "Color::linear_rgb::blue": (
    3,
    babel(
      en: [
        The blue component.
      ],
    ),
  ),
  "Color::linear_rgb::alpha": (
    3,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::linear_rgb::color": (
    3,
    babel(
      en: [
        Alternatively: The color to convert to linear RGB(A).

        If this is given, the individual components should not be given.
      ],
    ),
  ),
  "Color::rgb": (
    24,
    [
      #babel(
        en: [
          Create an RGB(A) color.

          The color is specified in the sRGB color space.

          An RGB(A) color is represented internally by an array of four
          components:
          - red (@ratio)
          - green (@ratio)
          - blue (@ratio)
          - alpha (@ratio)

          These components are also available using the
          @color.components[`components`] method.
        ],
      )

      ```example
      #square(fill: rgb("#b1f2eb"))
      #square(fill: rgb(87, 127, 230))
      #square(fill: rgb(25%, 13%, 65%))
      ```
    ],
  ),
  "Color::rgb::red": (
    22,
    babel(
      en: [
        The red component.
      ],
    ),
  ),
  "Color::rgb::green": (
    3,
    babel(
      en: [
        The green component.
      ],
    ),
  ),
  "Color::rgb::blue": (
    3,
    babel(
      en: [
        The blue component.
      ],
    ),
  ),
  "Color::rgb::alpha": (
    3,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::rgb::hex": (
    3,
    [
      #babel(
        en: [
          Alternatively: The color in hexadecimal notation.

          Accepts three, four, six or eight hexadecimal digits and optionally
          a leading hash.

          If this is given, the individual components should not be given.
        ],
      )

      ```example
      #text(16pt, rgb("#239dad"))[
        *Typst*
      ]
      ```
    ],
  ),
  "Color::rgb::color": (
    14,
    babel(
      en: [
        Alternatively: The color to convert to RGB(a).

        If this is given, the individual components should not be given.
      ],
    ),
  ),
  "Color::cmyk": (
    24,
    [
      #babel(
        en: [
          Create a CMYK color.

          This is useful if you want to target a specific printer. The conversion
          to RGB for display preview might differ from how your printer reproduces
          the color.

          A CMYK color is represented internally by an array of four components:
          - cyan (@ratio)
          - magenta (@ratio)
          - yellow (@ratio)
          - key (@ratio)

          These components are also available using the
          @color.components[`components`] method.

          Note that CMYK colors are not currently supported when PDF/A output is
          enabled.
        ],
      )

      ```example
      #square(
        fill: cmyk(27%, 0%, 3%, 5%)
      )
      ```
    ],
  ),
  "Color::cmyk::cyan": (
    26,
    babel(
      en: [
        The cyan component.
      ],
    ),
  ),
  "Color::cmyk::magenta": (
    3,
    babel(
      en: [
        The magenta component.
      ],
    ),
  ),
  "Color::cmyk::yellow": (
    3,
    babel(
      en: [
        The yellow component.
      ],
    ),
  ),
  "Color::cmyk::key": (
    3,
    babel(
      en: [
        The key component.
      ],
    ),
  ),
  "Color::cmyk::color": (
    3,
    babel(
      en: [
        Alternatively: The color to convert to CMYK.

        If this is given, the individual components should not be given.
      ],
    ),
  ),
  "Color::hsl": (
    19,
    [
      #babel(
        en: [
          Create an HSL color.

          This color space is useful for specifying colors by hue, saturation and
          lightness. It is also useful for color manipulation, such as saturating
          while keeping perceived hue.

          An HSL color is represented internally by an array of four components:
          - hue (@angle)
          - saturation (@ratio)
          - lightness (@ratio)
          - alpha (@ratio)

          These components are also available using the
          @color.components[`components`] method.
        ],
      )

      ```example
      #square(
        fill: color.hsl(30deg, 50%, 60%)
      )
      ```
    ],
  ),
  "Color::hsl::hue": (
    23,
    babel(
      en: [
        The hue angle.
      ],
    ),
  ),
  "Color::hsl::saturation": (
    3,
    babel(
      en: [
        The saturation component.
      ],
    ),
  ),
  "Color::hsl::lightness": (
    3,
    babel(
      en: [
        The lightness component.
      ],
    ),
  ),
  "Color::hsl::alpha": (
    3,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::hsl::color": (
    3,
    babel(
      en: [
        Alternatively: The color to convert to HSL.

        If this is given, the individual components should not be given.
      ],
    ),
  ),
  "Color::hsv": (
    22,
    [
      #babel(
        en: [
          Create an HSV color.

          This color space is useful for specifying colors by hue, saturation and
          value. It is also useful for color manipulation, such as saturating
          while keeping perceived hue.

          An HSV color is represented internally by an array of four components:
          - hue (@angle)
          - saturation (@ratio)
          - value (@ratio)
          - alpha (@ratio)

          These components are also available using the
          @color.components[`components`] method.
        ],
      )

      ```example
      #square(
        fill: color.hsv(30deg, 50%, 60%)
      )
      ```
    ],
  ),
  "Color::hsv::hue": (
    23,
    babel(
      en: [
        The hue angle.
      ],
    ),
  ),
  "Color::hsv::saturation": (
    3,
    babel(
      en: [
        The saturation component.
      ],
    ),
  ),
  "Color::hsv::value": (
    3,
    babel(
      en: [
        The value component.
      ],
    ),
  ),
  "Color::hsv::alpha": (
    3,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::hsv::color": (
    3,
    babel(
      en: [
        Alternatively: The color to convert to HSL.

        If this is given, the individual components should not be given.
      ],
    ),
  ),
  "Color::components": (
    22,
    [
      #babel(
        en: [
          Extracts the components of this color.

          The size and values of this array depends on the color space. You can
          obtain the color space using @color.space[`space`]. Below is a table of
          the color spaces and their components:
        ],
      )

      #docs-table(
        table.header[Color space][C1][C2][C3][C4],

        [@color.luma[`luma`]],
        [Lightness],
        [],
        [],
        [],

        [@color.oklab[`oklab`]],
        [Lightness],
        [`a`],
        [`b`],
        [Alpha],

        [@color.oklch[`oklch`]],
        [Lightness],
        [Chroma],
        [Hue],
        [Alpha],

        [@color.linear-rgb[`linear-rgb`]],
        [Red],
        [Green],
        [Blue],
        [Alpha],

        [@color.rgb[`rgb`]],
        [Red],
        [Green],
        [Blue],
        [Alpha],

        [@color.cmyk[`cmyk`]],
        [Cyan],
        [Magenta],
        [Yellow],
        [Key],

        [@color.hsl[`hsl`]],
        [Hue],
        [Saturation],
        [Lightness],
        [Alpha],

        [@color.hsv[`hsv`]],
        [Hue],
        [Saturation],
        [Value],
        [Alpha],

        [@color.spot[`spot`]],
        [Tint],
        none,
        none,
        none,
      )

      #babel(
        en: [
          For the meaning and type of each individual value, see the documentation
          of the corresponding color space. The alpha component is optional and
          only included if the `alpha` argument is `true`. The length of the
          returned array depends on the number of components and whether the alpha
          component is included.
        ],
      )

      ```example
      // note that the alpha component is included by default
      #rgb(40%, 60%, 80%).components()
      ```
    ],
  ),
  "Color::components::alpha": (
    77,
    babel(
      en: [
        Whether to include the alpha component.
      ],
    ),
  ),
  "Color::space": (
    11,
    [
      #babel(
        en: [
          Returns the constructor function for this color's space.

          Returns one of:
          - @color.luma[`luma`]
          - @color.oklab[`oklab`]
          - @color.oklch[`oklch`]
          - @color.linear-rgb[`linear-rgb`]
          - @color.rgb[`rgb`]
          - @color.cmyk[`cmyk`]
          - @color.hsl[`hsl`]
          - @color.hsv[`hsv`]
        ],
      )

      ```example
      #let color = cmyk(1%, 2%, 3%, 4%)
      #(color.space() == cmyk)
      ```
    ],
  ),
  "Color::to_hex": (
    24,
    babel(
      en: [
        Returns the color's RGB(A) hex representation (such as `#ffaa32` or
        `#020304fe`). The alpha component (last two digits in `#020304fe`) is
        omitted if it is equal to `ff` (255 / 100%).
      ],
    ),
  ),
  "Color::lighten": (
    11,
    babel(
      en: [
        Lightens a color by a given factor.
      ],
    ),
  ),
  "Color::lighten::factor": (
    4,
    babel(
      en: [
        The factor to lighten the color by.
      ],
    ),
  ),
  "Color::darken": (
    9,
    babel(
      en: [
        Darkens a color by a given factor.
      ],
    ),
  ),
  "Color::darken::factor": (
    4,
    babel(
      en: [
        The factor to darken the color by.
      ],
    ),
  ),
  "Color::saturate": (
    9,
    babel(
      en: [
        Increases the saturation of a color by a given factor.

        Only process colors can be saturated. If you want to saturate a spot
        color, convert it into a process color first.
      ],
    ),
  ),
  "Color::saturate::factor": (
    8,
    babel(
      en: [
        The factor to saturate the color by.
      ],
    ),
  ),
  "Color::desaturate": (
    13,
    babel(
      en: [
        Decreases the saturation of a color by a given factor.

        Only process colors can be desaturated. If you want to desaturate a spot
        color, convert it into a process color first.
      ],
    ),
  ),
  "Color::desaturate::factor": (
    8,
    babel(
      en: [
        The factor to desaturate the color by.
      ],
    ),
  ),
  "Color::negate": (
    13,
    [
      #babel(
        en: [
          Produces the complementary color using a provided color space. You can
          think of it as the opposite side on a color wheel.
        ],
      )

      ```example
      #square(fill: yellow)
      #square(fill: yellow.negate())
      #square(fill: yellow.negate(space: rgb))
      ```
    ],
  ),
  "Color::negate::space": (
    11,
    babel(
      en: [
        The color space used for the transformation. By default, a
        perceptual color space is used.
      ],
    ),
  ),
  "Color::rotate": (
    18,
    babel(
      en: [
        Rotates the hue of the color by a given angle.

        This function only works on color models with a well-defined hue
        component, i.e. Oklch, HSL, and HSV.
      ],
    ),
  ),
  "Color::rotate::angle": (
    8,
    babel(
      en: [
        The angle to rotate the hue by.
      ],
    ),
  ),
  "Color::rotate::space": (
    2,
    babel(
      en: [
        The color space used to rotate. By default, this happens in a
        perceptual color space (@color.oklch[`oklch`]).
      ],
    ),
  ),
  "Color::mix": (
    32,
    [
      #babel(
        en: [
          Create a color by mixing two or more colors.

          In color spaces with a hue component (HSL, HSV, Oklch), only two colors
          can be mixed at once. Mixing more than two colors in such a space will
          result in an error!
        ],
      )

      ```example
      #set block(height: 20pt, width: 100%)
      #block(fill: red.mix(blue))
      #block(fill: red.mix(blue, space: rgb))
      #block(fill: color.mix(red, blue, white))
      #block(fill: color.mix((red, 70%), (blue, 30%)))
      ```
    ],
  ),
  "Color::mix::colors": (
    15,
    babel(
      en: [
        The colors, optionally with weights, specified as a pair (array of
        length two) of color and weight (float or ratio).

        The weights do not need to add to `{100%}`, they are relative to the
        sum of all weights.
      ],
    ),
  ),
  "Color::mix::space": (
    7,
    babel(
      en: [
        The color space to mix in. By default, this happens in a perceptual
        color space (@color.oklab[`oklab`]) or, if all colors use the same
        spot colorant, using that colorant.

        All colors will be converted into this color space.
      ],
    ),
  ),
  "Color::transparentize": (
    12,
    [
      #babel(
        en: [
          Makes a color more transparent by a given factor.

          This method is relative to the existing alpha value. If the scale is
          positive, calculates `alpha - alpha * scale`. Negative scales behave
          like `color.opacify(-scale)`.
        ],
      )

      ```example
      #block(fill: red)[opaque]
      #block(fill: red.transparentize(50%))[half red]
      #block(fill: red.transparentize(75%))[quarter red]
      ```
    ],
  ),
  "Color::transparentize::scale": (
    14,
    babel(
      en: [
        The factor to change the alpha value by.
      ],
    ),
  ),
  "Color::opacify": (
    6,
    [
      #babel(
        en: [
          Makes a color more opaque by a given scale.

          This method is relative to the existing alpha value. If the scale is
          positive, calculates `alpha + scale - alpha * scale`. Negative scales
          behave like `color.transparentize(-scale)`.
        ],
      )

      ```example
      #let half-red = red.transparentize(50%)
      #block(fill: half-red.opacify(100%))[opaque]
      #block(fill: half-red.opacify(50%))[three quarters red]
      #block(fill: half-red.opacify(-50%))[one quarter red]
      ```
    ],
  ),
  "Color::opacify::scale": (
    15,
    babel(
      en: [
        The scale to change the alpha value by.
      ],
    ),
  ),
  "SpotColorant": (
    1170,
    babel(
      en: [
        A spot colorant from which spot colors can be created.

        Use spot colors to request a precise pigment in a professional print
        environment. Once you have created a spot colorant, you can create
        colors using its @color.spot.tint[`tint` method].
      ],
    ),
  ),
  "SpotColorant::construct": (
    22,
    babel(
      en: [
        Create a new spot colorant.
      ],
    ),
  ),
  "SpotColorant::construct::name": (
    3,
    babel(
      en: [
        Name of the spot colorant to use.

        In production, this name will be manually checked and matched to a
        colorant, so this value needs to be unambiguous. It's best to
        reference a color from a registry like PANTONE, HKS, RAL, Toyo &
        DIC, etc.

        Values in here may be treated case-sensitively during production:
        `{"PANTONE 2221 C"}` and `{"PANTONE 2221 c"}` may be treated as
        separate colors. Ensure that you are using a consistent naming
        convention, either referencing a registry or through coordination
        with your production printing experts.

        If this value is `{"all"}` and your print will involve multiple
        #link("https://en.wikipedia.org/wiki/Offset_printing#Plates")[color plates],
        use of this colorant will result in the specified tint being applied
        equally to all plates. If you choose `{none}`, no colorant will be
        applied when using this color. This special value is often used to
        indicate cuts or varnishes. Be sure to discuss this with your
        production printer!

        We do not recommend using the names `{"Cyan"}`, `{"Magenta"}`,
        `{"Yellow"}`, `{"Key"}`, `{"Black"}`, or their translations to your
        local language. Depending on your printer, they may or may not be
        interpreted as CMYK process colors.
      ],
    ),
  ),
  "SpotColorant::construct::fallback": (
    26,
    babel(
      en: [
        How to render this color if the specified colorant is not available.

        Many mediums, like on-screen preview and household printers, will not
        have this specific spot colorant available. To display an approximation
        of the intended print, another, available color is used instead.
      ],
    ),
  ),
  "SpotColorant::tint": (
    10,
    [
      #babel(
        en: [
          Create a spot color at a specific tint of this colorant.

          The tint represents what percentage of the colorant is applied. A tint
          of `{100%}` means the colorant is applied at full strength, while `{0%}`
          means no colorant is applied.
        ],
      )

      ```example
      #let pantone = color.spot(
        "PANTONE 2221 C",
        rgb("#239dad")
      )

      #square(fill: pantone.tint(100%))
      #square(fill: pantone.tint(70%))
      #square(fill: pantone.tint(40%))
      ```
    ],
  ),
  "SpotColorant::tint::value": (
    19,
    babel(
      en: [
        The tint percentage, between `{0%}` and `{100%}`.
      ],
    ),
  ),
))
