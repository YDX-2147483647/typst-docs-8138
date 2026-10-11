#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "ImageElem": (
    35,
    [
      #babel(
        en: [
          A raster or vector graphic.

          You can wrap the image in a @figure to give it a number and caption.

          Like most elements, images are _block-level_ by default and thus do not
          integrate themselves into adjacent paragraphs. To force an image to become
          inline, put it into a @box.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #figure(
        image("molecular.jpg", width: 80%),
        caption: [
          A step in the molecular testing
          pipeline of our lab.
        ],
      )
      ```

      = #babel(en: [Clipping]) <clipping>
      #babel(
        en: [
          You can wrap an image in a @block or @box #footnote[A box should only be
            used if the image shall be displayed inline as part of a paragraph.
            Otherwise, a block is preferable.] with negative @block.inset[`inset`] and
          `{clip: true}` to clip it. Note that the clipped parts are only visually
          hidden. The full image data is still embedded in the output (except when
          exporting to PNG). This approach is thus not suitable for redacting parts of
          an image.
        ],
      )

      ```example
      #let lynx = image("lynx.jpg", height: 150pt, fit: "cover")
      #grid(
        columns: 2,
        column-gutter: 1fr,
        // The full image on the left.
        lynx,
        // Two cropped parts on the right: One cropped by 80pt
        // from the bottom and one cropped by 75pt from the top.
        stack(
          spacing: 5pt,
          block(lynx, clip: true, inset: (bottom: -80pt)),
          block(lynx, clip: true, inset: (top: -75pt)),
        )
      )
      ```
    ],
  ),
  "ImageElem::source": (
    46,
    [
      #babel(
        en: [
          A path to an image file or raw bytes making up an image in one of the
          supported @image.format[formats].

          Bytes can be used to specify raw pixel data in a row-major,
          left-to-right, top-to-bottom format.
        ],
      )

      ```example
      #let original = read("diagram.svg")
      #let changed = original.replace(
        "#2B80FF", // blue
        green.to-hex(),
      )

      #image(bytes(original))
      #image(bytes(changed))
      ```
    ],
  ),
  "ImageElem::format": (
    24,
    [
      #babel(
        en: [
          The image's format.

          By default, the format is detected automatically. Typically, you thus
          only need to specify this when providing raw bytes as the
          @image.source[`source`] (even then, Typst will try to figure out the
          format automatically, but that's not always possible).

          Supported formats are `{"png"}`, `{"jpg"}`, `{"gif"}`, `{"svg"}`,
          `{"pdf"}`, `{"webp"}` as well as raw pixel data.

          Note that several restrictions apply when using PDF files as images:

          - When exporting to PDF, any PDF image file used must have a version
            equal to or lower than the
            @pdf.standard:pdf-versions[export target PDF version].
          - PDF files as images are currently not supported when exporting with a
            specific PDF standard, like PDF/A-3 or PDF/UA-1. In these cases, you
            can instead use SVGs to embed vector images.
          - The image file must not be password-protected.
          - Tags in your PDF image will not be preserved. Instead, you must
            provide an @image.alt[alternative description] to make the image
            accessible.

          When providing raw pixel data as the `source`, you must specify a
          dictionary with the following keys as the `format`:
          - `encoding` (@str[str]): The encoding of the pixel data. One of:
            - `{"rgb8"}` (three 8-bit channels: red, green, blue)
            - `{"rgba8"}` (four 8-bit channels: red, green, blue, alpha)
            - `{"luma8"}` (one 8-bit channel)
            - `{"lumaa8"}` (two 8-bit channels: luma and alpha)
          - `width` (@int[int]): The pixel width of the image.
          - `height` (@int[int]): The pixel height of the image.

          The pixel width multiplied by the height multiplied by the channel count
          for the specified encoding must then match the `source` data.
        ],
      )

      ```example
      #image(
        read(
          "tetrahedron.svg",
          encoding: none,
        ),
        format: "svg",
        width: 2cm,
      )

      #image(
        bytes(range(16).map(x => x * 16)),
        format: (
          encoding: "luma8",
          width: 4,
          height: 4,
        ),
        width: 2cm,
      )
      ```
    ],
  ),
  "ImageElem::width": (
    58,
    babel(
      en: [
        The width of the image.
      ],
    ),
  ),
  "ImageElem::height": (
    3,
    babel(
      en: [
        The height of the image.
      ],
    ),
  ),
  "ImageElem::alt": (
    3,
    babel(
      en: [
        An alternative description of the image.

        This text is used by Assistive Technology (AT) like screen readers to
        describe the image to users with visual impairments.

        When the image is wrapped in a @figure, use this parameter rather than
        the @figure.alt[figure's `alt` parameter] to describe the image. The
        only exception to this rule is when the image and the other contents in
        the figure form a single semantic unit. In this case, use the figure's
        `alt` parameter to describe the entire composition and do not use this
        parameter.

        You can learn how to write good alternative descriptions in the
        @guides:accessibility:textual-representations[Accessibility Guide].
      ],
    ),
  ),
  "ImageElem::page": (
    16,
    babel(
      en: [
        The page number that should be embedded as an image. This attribute only
        has an effect for PDF files.
      ],
    ),
  ),
  "ImageElem::fit": (
    5,
    [
      #babel(
        en: [
          How the image should adjust itself to a given area (the area is defined
          by the `width` and `height` fields). Note that `fit` doesn't visually
          change anything if the area's aspect ratio is the same as the image's
          one.
        ],
      )

      ```example
      #set page(width: 300pt, height: 50pt, margin: 10pt)
      #image("tiger.jpg", width: 100%, fit: "cover")
      #image("tiger.jpg", width: 100%, fit: "contain")
      #image("tiger.jpg", width: 100%, fit: "stretch")
      ```
    ],
  ),
  "ImageElem::scaling": (
    14,
    babel(
      en: [
        A hint to viewers how they should scale the image.

        When set to `{auto}`, the default is left up to the viewer. For PNG
        export, Typst will default to smooth scaling, like most PDF and SVG
        viewers.

        _Note:_ The exact look may differ across PDF viewers.
      ],
    ),
  ),
  "ImageElem::icc": (
    9,
    babel(
      en: [
        An ICC profile for the image.

        ICC profiles define how to interpret the colors in an image. When set to
        `{auto}`, Typst will try to extract an ICC profile from the image.
      ],
    ),
  ),
))
