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
      #text(rgb("#265f02"))[Green]
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
          either `{color.red}` or just `{red}`.
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
    179,
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
          Creates a grayscale color.

          A grayscale color is represented by a lightness and an alpha component.

          The value of these components can be obtained for an existing luma color
          using the @color.components[`components`] method.
        ],
      )

      ```example
      #for x in range(256, step: 50) {
        box(square(fill: luma(x)))
      }
      ```
    ],
  ),
  "Color::luma::lightness": (
    15,
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
    4,
    [
      #babel(
        en: [
          Alternatively: The color to convert to grayscale.

          If this is given, the individual components should not be given.
        ],
      )

      ```example
      #let colors = (red, green, blue)

      #for c in colors {
        box(square(fill: c))
      }

      #for c in colors {
        box(square(fill: luma(c)))
      }
      ```
    ],
  ),
  "Color::oklab": (
    40,
    [
      #babel(
        en: [
          Creates an #link("https://bottosson.github.io/posts/oklab/")[Oklab]
          color.

          This color space is well suited for the following use cases:
          - Color manipulation such as saturating while keeping perceived hue
          - Creating grayscale images with uniform perceived lightness
          - Creating smooth and uniform color transition and gradients

          A linear Oklab color is represented by four components: lightness ($L$),
          $a$, $b$, and alpha.

          The value of these components can be obtained for an existing Oklab
          color using the @color.components[`components`] method.
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
    22,
    [
      #babel(
        en: [
          The lightness component ($L$).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: oklab,
        oklab(0%, -27%, -32%),
        oklab(100%, -27%, -32%),
      ))
      ```
    ],
  ),
  "Color::oklab::a": (
    12,
    [
      #babel(
        en: [
          The $a$ ("green/red") component.

          Ratios are relative to `{0.4}`, meaning `{50%}` corresponds to
          `{0.2}` and `{-100%}` to `{-0.4}`.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: oklab,
        oklab(50%, -100%, 0%),
        oklab(50%, 100%, 0%),
      ))
      ```
    ],
  ),
  "Color::oklab::b": (
    15,
    [
      #babel(
        en: [
          The $b$ ("blue/yellow") component.

          Ratios are relative to `{0.4}`, meaning `{50%}` corresponds to
          `{0.2}` and `{-100%}` to `{-0.4}`.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: oklab,
        oklab(80%, 0%, -100%),
        oklab(80%, 0%, 100%),
      ))
      ```
    ],
  ),
  "Color::oklab::alpha": (
    15,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::oklab::color": (
    4,
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
          Creates an #link("https://bottosson.github.io/posts/oklab/")[Oklch]
          color.

          This color space is well suited for the following use cases:
          - Color manipulation involving lightness, chroma, and hue
          - Creating grayscale images with uniform perceived lightness
          - Creating smooth and uniform color transition and gradients

          A linear Oklch color is represented by four components: lightness ($L$),
          chroma ($C$), hue ($h$), and alpha.

          The value of these components can be obtained for an existing Oklch
          color using the @color.components[`components`] method.
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
    22,
    [
      #babel(
        en: [
          The lightness component ($L$).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: oklch,
        oklch(0%, 50%, 40deg),
        oklch(100%, 50%, 40deg),
      ))
      ```
    ],
  ),
  "Color::oklch::chroma": (
    12,
    [
      #babel(
        en: [
          The chroma component ($C$).

          Ratios are relative to `{0.4}`, meaning `{50%}` corresponds to
          `{0.2}` and `{-100%}` to `{-0.4}`.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: oklch,
        oklch(50%, -100%, 150deg),
        oklch(50%, 100%, 150deg),
      ))
      ```
    ],
  ),
  "Color::oklch::hue": (
    15,
    [
      #babel(
        en: [
          The hue component ($h$).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: oklch,
        oklch(50%, 70%, 0deg),
        oklch(50%, 70%, 90deg),
        oklch(50%, 70%, 180deg),
        oklch(50%, 70%, 270deg),
        oklch(50%, 70%, 360deg),
      ))
      ```
    ],
  ),
  "Color::oklch::alpha": (
    15,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::oklch::color": (
    4,
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
          Creates an RGB(A) color with linear luma.

          This color space is similar to sRGB, but with the distinction that the
          color component are not gamma corrected. This makes it easier to perform
          color operations such as blending and interpolation. Although, you
          should prefer to use the @color.oklab[`oklab` function] for these.

          A linear RGB(A) color is represented by four components: red, green,
          blue, and alpha.

          The value of these components can be obtained for an existing linear
          RGB(A) color using the @color.components[`components`] method.
        ],
      )

      ```example
      #box(square(fill: color.linear-rgb(
        30%, 50%, 10%,
      )))
      #box(square(fill: color.linear-rgb(
        77, 128, 26,
      )))
      ```
    ],
  ),
  "Color::linear_rgb::red": (
    24,
    [
      #babel(
        en: [
          The red component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.linear-rgb,
        color.linear-rgb(0%, 0%, 0%),
        color.linear-rgb(100%, 0%, 0%),
      ))

      For comparison:
      #rect(fill: gradient.linear(
        space: rgb,
        rgb(0%, 0%, 0%),
        rgb(100%, 0%, 0%),
      ))
      ```
    ],
  ),
  "Color::linear_rgb::green": (
    22,
    [
      #babel(
        en: [
          The green component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.linear-rgb,
        color.linear-rgb(0%, 0%, 0%),
        color.linear-rgb(0%, 100%, 0%),
      ))

      For comparison:
      #rect(fill: gradient.linear(
        space: rgb,
        rgb(0%, 0%, 0%),
        rgb(0%, 100%, 0%),
      ))
      ```
    ],
  ),
  "Color::linear_rgb::blue": (
    22,
    [
      #babel(
        en: [
          The blue component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.linear-rgb,
        color.linear-rgb(0%, 0%, 0%),
        color.linear-rgb(0%, 0%, 100%),
      ))

      For comparison:
      #rect(fill: gradient.linear(
        space: rgb,
        rgb(0%, 0%, 0%),
        rgb(0%, 0%, 100%),
      ))
      ```
    ],
  ),
  "Color::linear_rgb::alpha": (
    22,
    babel(
      en: [
        The alpha component.

        This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
        `{255}`).
      ],
    ),
  ),
  "Color::linear_rgb::color": (
    7,
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
          Creates an RGB(A) color.

          The color is specified in the sRGB color space.

          An RGB(A) color is represented by four components: red, green,
          blue, and alpha.

          The value of these components can be obtained for an existing RGB(A)
          color using the @color.components[`components`] method.
        ],
      )

      ```example
      #box(square(fill: rgb("#b1f2eb")))
      #box(square(fill: rgb(87, 127, 230)))
      #box(square(fill: rgb(25%, 13%, 65%)))
      ```
    ],
  ),
  "Color::rgb::red": (
    18,
    [
      #babel(
        en: [
          The red component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: rgb,
        rgb(0%, 0%, 0%),
        rgb(100%, 0%, 0%),
      ))
      ```
    ],
  ),
  "Color::rgb::green": (
    15,
    [
      #babel(
        en: [
          The green component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: rgb,
        rgb(0%, 0%, 0%),
        rgb(0%, 100%, 0%),
      ))
      ```
    ],
  ),
  "Color::rgb::blue": (
    15,
    [
      #babel(
        en: [
          The blue component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: rgb,
        rgb(0%, 0%, 0%),
        rgb(0%, 0%, 100%),
      ))
      ```
    ],
  ),
  "Color::rgb::alpha": (
    15,
    babel(
      en: [
        The alpha component.

        This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
        `{255}`).
      ],
    ),
  ),
  "Color::rgb::hex": (
    7,
    [
      #babel(
        en: [
          Alternatively: The color in hexadecimal notation.

          Accepts three, four, six or eight hexadecimal digits and optionally
          a leading hash.

          If this is given, the individual components should not be given.

          Note that the hex code for an existing color can be obtained with
          the @color.to-hex[`to-hex`] method.
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
    17,
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
          Creates a CMYK color.

          This is useful if you want to target a specific printer. The conversion
          to RGB for display preview might differ from how your printer reproduces
          the color.

          A CMYK color is represented by four components: cyan, magenta, yellow,
          and key.

          The value of these components can be obtained for an existing CMYK
          color using the @color.components[`components`] method.

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
    23,
    [
      #babel(
        en: [
          The cyan component.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: cmyk,
        cmyk(0%, 0%, 0%, 20%),
        cmyk(100%, 0%, 0%, 20%),
      ))
      ```
    ],
  ),
  "Color::cmyk::magenta": (
    12,
    [
      #babel(
        en: [
          The magenta component.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: cmyk,
        cmyk(0%, 0%, 0%, 20%),
        cmyk(0%, 100%, 0%, 20%),
      ))
      ```
    ],
  ),
  "Color::cmyk::yellow": (
    12,
    [
      #babel(
        en: [
          The yellow component.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: cmyk,
        cmyk(0%, 0%, 0%, 20%),
        cmyk(0%, 0%, 100%, 20%),
      ))
      ```
    ],
  ),
  "Color::cmyk::key": (
    12,
    [
      #babel(
        en: [
          The key component.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: cmyk,
        cmyk(65%, 24%, 43%, 0%),
        cmyk(65%, 24%, 43%, 100%),
      ))
      ```
    ],
  ),
  "Color::cmyk::color": (
    12,
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
          Creates an HSL color.

          This color space is useful for specifying colors by hue, saturation and
          lightness. It is also useful for color manipulation, such as saturating
          while keeping perceived hue.

          An HSL color is represented by four components: hue, saturation,
          lightness, and alpha.

          The value of these components can be obtained for an existing CMYK
          color using the @color.components[`components`] method.
        ],
      )

      ```example
      #box(square(
        fill: color.hsl(30deg, 50%, 60%)
      ))
      #box(square(
        fill: color.hsl(30deg, 128, 153)
      ))
      ```
    ],
  ),
  "Color::hsl::hue": (
    23,
    [
      #babel(
        en: [
          The hue component.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.hsl,
        color.hsl(0deg, 100%, 50%),
        color.hsl(90deg, 100%, 50%),
        color.hsl(180deg, 100%, 50%),
        color.hsl(270deg, 100%, 50%),
        color.hsl(360deg, 100%, 50%),
      ))
      ```
    ],
  ),
  "Color::hsl::saturation": (
    15,
    [
      #babel(
        en: [
          The saturation component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.hsl,
        color.hsl(50deg, 0%, 50%),
        color.hsl(50deg, 100%, 50%),
      ))
      ```
    ],
  ),
  "Color::hsl::lightness": (
    15,
    [
      #babel(
        en: [
          The lightness component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.hsl,
        color.hsl(-30deg, 100%, 0%),
        color.hsl(-30deg, 100%, 100%),
      ))
      ```
    ],
  ),
  "Color::hsl::alpha": (
    15,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::hsl::color": (
    4,
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
          Creates an HSV color.

          This color space is useful for specifying colors by hue, saturation and
          value. It is also useful for color manipulation, such as saturating
          while keeping perceived hue.

          An HSV color is represented by four components: hue, saturation, value,
          and alpha.

          The value of these components can be obtained for an existing CMYK
          color using the @color.components[`components`] method.
        ],
      )

      ```example
      #box(square(
        fill: color.hsv(30deg, 50%, 60%)
      ))
      #box(square(
        fill: color.hsv(30deg, 128, 153)
      ))
      ```
    ],
  ),
  "Color::hsv::hue": (
    23,
    [
      #babel(
        en: [
          The hue component.
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.hsv,
        color.hsv(0deg, 100%, 100%),
        color.hsv(90deg, 100%, 100%),
        color.hsv(180deg, 100%, 100%),
        color.hsv(270deg, 100%, 100%),
        color.hsv(360deg, 100%, 100%),
      ))
      ```
    ],
  ),
  "Color::hsv::saturation": (
    15,
    [
      #babel(
        en: [
          The saturation component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.hsv,
        color.hsv(50deg, 0%, 100%),
        color.hsv(50deg, 100%, 100%),
      ))
      ```
    ],
  ),
  "Color::hsv::value": (
    15,
    [
      #babel(
        en: [
          The value component.

          This should be a value between `{0%}` (or `{0}`) and `{100%}` (or
          `{255}`).
        ],
      )

      ```example
      #set rect(width: 100%)
      #rect(fill: gradient.linear(
        space: color.hsv,
        color.hsv(-30deg, 100%, 0%),
        color.hsv(-30deg, 100%, 100%),
      ))

      In HSL for comparison:
      #rect(fill: gradient.linear(
        space: color.hsl,
        color.hsl(-30deg, 100%, 0%),
        color.hsl(-30deg, 100%, 100%),
      ))
      ```
    ],
  ),
  "Color::hsv::alpha": (
    22,
    babel(
      en: [
        The alpha component.
      ],
    ),
  ),
  "Color::hsv::color": (
    4,
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
          Extracts the components of the color.

          The size and values of this array depends on the color space. You can
          obtain the color space using the @color.space[`space`] method. Below is
          a table of the color spaces and their components.
        ],
      )

      #docs-table(
        table.header[Color space][C0][C1][C2][C3],

        [@color.luma[`luma`]],
        [Lightness],
        [Alpha],
        [],
        [],

        [@color.oklab[`oklab`]],
        [Lightness ($L$)],
        [$a$],
        [$b$],
        [Alpha],

        [@color.oklch[`oklch`]],
        [Lightness ($L$)],
        [Chroma ($C$)],
        [Hue ($h$)],
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
          only included if the `alpha` argument is `{true}` (the default). The
          length of the returned array depends on the number of components and
          whether the alpha component is included.
        ],
      )

      ```example
      #rgb(40%, 60%, 80%).components()
      ```
    ],
  ),
  "Color::components::alpha": (
    76,
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
          Returns the color space this color is defined in.

          The color space is expressed either as one of the color
          constructor functions (@color.luma[`luma`], @color.oklab[`oklab`],
          @color.oklch[`oklch`], @color.linear-rgb[`linear-rgb`],
          @color.rgb[`rgb`], @color.cmyk[`cmyk`], @color.hsl[`hsl`], or
          @color.hsv[`hsv`]) or a @color.spot[spot colorant].
        ],
      )

      ```example
      #let c = cmyk(1%, 2%, 3%, 4%)
      #(c.space() == cmyk)
      ```
    ],
  ),
  "Color::to_hex": (
    20,
    [
      #babel(
        en: [
          Returns the color's RGB(A) hex code.

          The alpha component (last two digits) is omitted if it is equal to
          `{100%}`.
        ],
      )

      ```example
      #rgb("FFAA32").to-hex() \
      #rgb("020304fe").to-hex()
      ```
    ],
  ),
  "Color::lighten": (
    17,
    [
      #babel(
        en: [
          Lightens a color by a given factor.
        ],
      )

      ```example
      #let c = rgb("#4ebf19")
      #box(square(fill: c))
      #box(square(fill: c.lighten(30%)))
      #box(square(fill: c.lighten(60%)))
      #box(square(fill: c.lighten(90%)))
      ```
    ],
  ),
  "Color::lighten::factor": (
    12,
    babel(
      en: [
        The factor to lighten the color by.
      ],
    ),
  ),
  "Color::darken": (
    9,
    [
      #babel(
        en: [
          Darkens a color by a given factor.
        ],
      )

      ```example
      #let c = rgb("#fded0a")
      #box(square(fill: c))
      #box(square(fill: c.darken(30%)))
      #box(square(fill: c.darken(60%)))
      #box(square(fill: c.darken(90%)))
      ```
    ],
  ),
  "Color::darken::factor": (
    12,
    babel(
      en: [
        The factor to darken the color by.
      ],
    ),
  ),
  "Color::saturate": (
    9,
    [
      #babel(
        en: [
          Increases the saturation of a color by a given factor.

          Only process colors can be saturated. If you want to saturate a spot
          color, convert it into a process color first.
        ],
      )

      ```example
      #let c = rgb("#ac9eb4")
      #box(square(fill: c))
      #box(square(fill: c.saturate(30%)))
      #box(square(fill: c.saturate(60%)))
      #box(square(fill: c.saturate(90%)))
      ```
    ],
  ),
  "Color::saturate::factor": (
    16,
    babel(
      en: [
        The factor to saturate the color by.
      ],
    ),
  ),
  "Color::desaturate": (
    13,
    [
      #babel(
        en: [
          Decreases the saturation of a color by a given factor.

          Only process colors can be desaturated. If you want to desaturate a spot
          color, convert it into a process color first.
        ],
      )

      ```example
      #let c = rgb("#17cbd8")
      #box(square(fill: c))
      #box(square(fill: c.desaturate(30%)))
      #box(square(fill: c.desaturate(60%)))
      #box(square(fill: c.desaturate(90%)))
      ```
    ],
  ),
  "Color::desaturate::factor": (
    16,
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
          Produces the complementary color using a provided color space.

          You can think of it as the opposite side on a color wheel.
        ],
      )

      ```example
      #box(square(fill: yellow))
      #box(square(fill: yellow.negate()))
      ```
    ],
  ),
  "Color::negate::space": (
    11,
    [
      #babel(
        en: [
          The color space used for the transformation. By default, a
          perceptual color space is used.
        ],
      )

      ```example
      #let sample(c) = box(square(fill: c))
      #sample(red)
      #sample(red.negate())
      #sample(red.negate(space: rgb))
      ```
    ],
  ),
  "Color::rotate": (
    25,
    [
      #babel(
        en: [
          Rotates the hue of the color by a given angle.
        ],
      )

      ```example
      #let c = rgb("#15e24f")
      #box(square(fill: c))
      #box(square(fill: c.rotate(20deg)))
      #box(square(fill: c.rotate(40deg)))
      #box(square(fill: c.rotate(60deg)))
      ```
    ],
  ),
  "Color::rotate::angle": (
    13,
    babel(
      en: [
        The angle to rotate the hue by.
      ],
    ),
  ),
  "Color::rotate::space": (
    2,
    [
      #babel(
        en: [
          The color space used to rotate. By default, this happens in a
          perceptual color space (@color.oklch[`oklch`]).

          This must be a color space with a well-defined hue component: either
          @color.oklch[`oklch`], @color.hsl, or @color.hsv.
        ],
      )

      ```example
      #set rect(width: 100%)
      #let c = rgb("#117be6")
      Oklch:
      #rect(fill: gradient.linear(
        space: oklch,
        c,
        c.rotate(90deg),
      ))
      HSL:
      #rect(fill: gradient.linear(
        space: color.hsl,
        c,
        c.rotate(90deg, space: color.hsl),
      ))
      ```
    ],
  ),
  "Color::transparentize": (
    51,
    [
      #babel(
        en: [
          Makes a color more transparent by a given factor.
        ],
      )

      ```example
      #let sample(c) = box(square(fill: c))
      #set page(fill: tiling(line(),
        size: (1cm, 0.2cm), angle: -45deg,
      ))
      #sample(red)
      #sample(red.transparentize(50%))
      #sample(red.transparentize(75%))
      ```
    ],
  ),
  "Color::transparentize::scale": (
    14,
    babel(
      en: [
        The factor to change the alpha value by.

        If positive, calculates `{alpha - alpha * scale}`. Negative scales
        behave like `{color.opacify(-scale)}`.
      ],
    ),
  ),
  "Color::opacify": (
    9,
    [
      #babel(
        en: [
          Makes a color more opaque by a given scale.
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
    11,
    babel(
      en: [
        The scale to change the alpha value by.

        If positive, calculates `{alpha + (1 - alpha) * scale}`. Negative
        scales behave like `{color.transparentize(-scale)}`.
      ],
    ),
  ),
  "Color::mix": (
    9,
    [
      #babel(
        en: [
          Creates a color by mixing two or more colors.
        ],
      )

      ```example
      #box(square(fill: red))
      #box(square(fill: red.mix(blue)))
      #box(square(fill: blue))
      ```
    ],
  ),
  "Color::mix::colors": (
    9,
    [
      #babel(
        en: [
          The colors to mix, optionally with weights, specified as a pair
          (array of length two) of color and weight (@float or @ratio).

          The weights do not need to add to `{100%}`, they are relative to the
          sum of all weights.
        ],
      )

      ```example
      #let sample(c) = box(square(fill: c))
      #sample(color.mix(red, blue))
      #sample(color.mix(red, blue, white))
      #sample(color.mix(
        (red, 70%), (blue, 30%),
      ))
      ```
    ],
  ),
  "Color::mix::space": (
    16,
    [
      #babel(
        en: [
          The color space to mix in. By default, this happens in a perceptual
          color space (@color.oklab[`oklab`]) or, if all colors use the same
          spot colorant, using that colorant.

          All colors will be converted into this color space.

          Note that, in color spaces with a hue component (Oklch, HSL, HSV),
          only two colors can be mixed at once. Mixing more than two colors in
          such a space will result in an error!
        ],
      )

      ```example
      #let sample(c) = box(square(fill: c))
      #sample(red.mix(blue, space: oklab))
      #sample(red.mix(blue, space: rgb))
      ```
    ],
  ),
  "SpotColorant": (
    1186,
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
        Creates a new spot colorant.
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
          Creates a spot color at a specific tint of this colorant.

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
