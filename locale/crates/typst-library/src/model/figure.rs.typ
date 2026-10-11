#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "FigureElem": (
    23,
    [
      #babel(
        en: [
          A figure with an optional caption.

          Automatically detects its kind to select the correct counting track. For
          example, figures containing images will be numbered separately from figures
          containing tables.
        ],
      )

      = #babel(en: [Examples]) <examples>
      #babel(
        en: [
          The example below shows a basic figure with an image:
        ],
      )

      ```example
      @glacier shows a glacier. Glaciers
      are complex systems.

      #figure(
        image("glacier.jpg", width: 80%),
        caption: [A curious figure.],
      ) <glacier>
      ```

      #babel(
        en: [
          You can also insert @table[tables] into figures to give them a caption. The
          figure will detect this and automatically use a separate counter.
        ],
      )

      ```example
      #figure(
        table(
          columns: 4,
          [t], [1], [2], [3],
          [y], [0.3s], [0.4s], [0.8s],
        ),
        caption: [Timing results],
      )
      ```

      #babel(
        en: [
          This behaviour can be overridden by explicitly specifying the figure's
          `kind`. All figures of the same kind share a common counter.
        ],
      )

      = #babel(en: [Figure behaviour]) <figure-behaviour>
      #babel(
        en: [
          By default, figures are placed within the flow of content. To make them
          float to the top or bottom of the page, you can use the
          @figure.placement[`placement`] argument.

          If your figure is too large and its contents are breakable across pages
          (e.g. if it contains a large table), then you can make the figure itself
          breakable across pages as well with this show rule:
        ],
      )

      ```typ
      #show figure: set block(breakable: true)
      ```

      #babel(
        en: [
          See the @block.breakable[block] documentation for more information about
          breakable and non-breakable blocks.
        ],
      )

      = #babel(en: [Caption customization]) <caption-customization>
      #babel(
        en: [
          You can modify the appearance of the figure's caption with its associated
          @figure.caption[`caption`] function. In the example below, we emphasize all
          captions:
        ],
      )

      ```example
      #show figure.caption: emph

      #figure(
        rect[Hello],
        caption: [I am emphasized!],
      )
      ```

      #babel(
        en: [
          By using a @function.where[`where`] selector, we can scope such rules to
          specific kinds of figures. For example, to position the caption above
          tables, but keep it below for all other kinds of figures, we could write the
          following show-set rule:
        ],
      )

      ```example
      #show figure.where(
        kind: table
      ): set figure.caption(position: top)

      #figure(
        table(columns: 2)[A][B][C][D],
        caption: [I'm up here],
      )
      ```

      = #babel(en: [Accessibility]) <accessibility>
      #babel(
        en: [
          You can use the @figure.alt[`alt`] parameter to provide an
          @guides:accessibility:textual-representations[alternative description] of
          the figure for screen readers and other Assistive Technology (AT). Refer to
          @figure.alt[its documentation] to learn more.

          You can use figures to add alternative descriptions to paths, shapes, or
          visualizations that do not have their own `alt` parameter. If your graphic
          is purely decorative and does not have a semantic meaning, consider wrapping
          it in @pdf.artifact instead, which will hide it from AT when exporting to
          PDF.

          AT will always read the figure at the point where it appears in the
          document, regardless of its @figure.placement[`placement`]. Put its markup
          where it would make the most sense in the reading order.
        ],
      )
    ],
  ),
  "FigureElem::body": (
    109,
    babel(
      en: [
        The content of the figure. Often, an @image[image].
      ],
    ),
  ),
  "FigureElem::alt": (
    4,
    babel(
      en: [
        An alternative description of the figure.

        When you add an alternative description, AT will read both it and the
        caption (if any). However, the content of the figure itself will be
        skipped.

        When the body of your figure is an @image[image] with its own `alt` text
        set, this parameter should not be used on the figure element. Likewise,
        do not use this parameter when the figure contains a table, code, or
        other content that is already accessible. In such cases, the content of
        the figure will be read by AT, and adding an alternative description
        would lead to a loss of information.

        You can learn how to write good alternative descriptions in the
        @guides:accessibility:textual-representations[Accessibility Guide].
      ],
    ),
  ),
  "FigureElem::placement": (
    17,
    [
      #babel(
        en: [
          The figure's placement on the page.

          - `{none}`: The figure stays in-flow exactly where it was specified like
            other content.
          - `{auto}`: The figure picks `{top}` or `{bottom}` depending on which is
            closer.
          - `{top}`: The figure floats to the top of the page.
          - `{bottom}`: The figure floats to the bottom of the page.

          The gap between the main flow content and the floating figure is
          controlled by the @place.clearance[`clearance`] argument on the `place`
          function.
        ],
      )

      ```example
      #set page(height: 200pt)
      #show figure: set place(
        clearance: 1em,
      )

      = Introduction
      #figure(
        placement: bottom,
        caption: [A glacier],
        image("glacier.jpg", width: 60%),
      )
      #lorem(60)
      ```
    ],
  ),
  "FigureElem::scope": (
    29,
    [
      #babel(
        en: [
          Relative to which containing scope the figure is placed.

          Set this to `{"parent"}` to create a full-width figure in a two-column
          document.

          Has no effect if `placement` is `{none}`.
        ],
      )

      ```example
      #set page(height: 250pt, columns: 2)

      = Introduction
      #figure(
        placement: bottom,
        scope: "parent",
        caption: [A glacier],
        image("glacier.jpg", width: 60%),
      )
      #lorem(60)
      ```
    ],
  ),
  "FigureElem::caption": (
    21,
    babel(
      en: [
        The figure's caption.
      ],
    ),
  ),
  "FigureElem::kind": (
    3,
    [
      #babel(
        en: [
          The kind of figure this is.

          All figures of the same kind share a common counter.

          If set to `{auto}`, the figure will try to automatically determine its
          kind based on the type of its body. Automatically detected kinds are
          @table[tables] and @raw[code]. In other cases, the inferred kind is that
          of an @image[image].

          Setting this to something other than `{auto}` will override the
          automatic detection. This can be useful if
          - you wish to create a custom figure type that is not an @image[image],
            a @table[table] or @raw[code],
          - you want to force the figure to use a specific counter regardless of
            its content.

          You can set the kind to be an element function or a string. If you set
          it to an element function other than @table, @raw, or @image, you will
          need to manually specify the figure's supplement.
        ],
      )

      #example(
        title: "Customizing the figure kind",
        ```
        #figure(
          circle(radius: 10pt),
          caption: [A curious atom.],
          kind: "atom",
          supplement: [Atom],
        )
        ```,
      )

      #babel(
        en: [
          If you want to modify a counter to skip a number or reset the counter,
          you can access the @counter[counter] of each kind of figure with a
          @function.where[`where`] selector:

          - For @table[tables]: `{counter(figure.where(kind: table))}`
          - For @image[images]: `{counter(figure.where(kind: image))}`
          - For a custom kind: `{counter(figure.where(kind: kind))}`
        ],
      )

      #example(
        title: "Modifying the figure counter for specific kinds",
        ```
        #figure(
          table(columns: 2, $n$, $1$),
          caption: [The first table.],
        )

        #counter(
          figure.where(kind: table)
        ).update(41)

        #figure(
          table(columns: 2, $n$, $42$),
          caption: [The 42nd table],
        )

        #figure(
          rect[Image],
          caption: [Does not affect images],
        )
        ```,
      )

      #babel(
        en: [
          To conveniently use the correct counter in a show rule, you can access
          the `counter` field. There is an example of this in the documentation
          @figure.caption.body[of the `figure.caption` element's `body` field].
        ],
      )
    ],
  ),
  "FigureElem::supplement": (
    69,
    [
      #babel(
        en: [
          The figure's supplement.

          If set to `{auto}`, the figure will try to automatically determine the
          correct supplement based on the `kind` and the active
          @text.lang[text language]. If you are using a custom figure type, you
          will need to manually specify the supplement.

          If a function is specified, it is passed the first descendant of the
          specified `kind` (typically, the figure's body) and should return
          content.
        ],
      )

      ```example
      #figure(
        [The contents of my figure!],
        caption: [My custom figure],
        supplement: [Bar],
        kind: "foo",
      )
      ```
    ],
  ),
  "FigureElem::numbering": (
    21,
    babel(
      en: [
        How to number the figure. Accepts a
        @numbering[numbering pattern or function] taking a single number.
      ],
    ),
  ),
  "FigureElem::gap": (
    5,
    babel(
      en: [
        The vertical gap between the body and caption.
      ],
    ),
  ),
  "FigureElem::outlined": (
    4,
    babel(
      en: [
        Whether the figure should appear in an @outline of figures.
      ],
    ),
  ),
  "FigureCaption": (
    188,
    [
      #babel(
        en: [
          The caption of a figure. This element can be used in set and show rules to
          customize the appearance of captions for all figures or figures of a
          specific kind.

          In addition to its `position` and `body`, the `caption` also provides the
          figure's `kind`, `supplement`, `counter`, and `numbering` as fields. These
          parts can be used in @function.where[`where`] selectors and show rules to
          build a completely custom caption.
        ],
      )

      ```example
      #show figure.caption: emph

      #figure(
        rect[Hello],
        caption: [A rectangle],
      )
      ```
    ],
  ),
  "FigureCaption::position": (
    19,
    [
      #babel(
        en: [
          The caption's position in the figure. Either `{top}` or `{bottom}`.
        ],
      )

      ```example
      #show figure.where(
        kind: table
      ): set figure.caption(position: top)

      #figure(
        table(columns: 2)[A][B],
        caption: [I'm up here],
      )

      #figure(
        rect[Hi],
        caption: [I'm down here],
      )

      #figure(
        table(columns: 2)[A][B],
        caption: figure.caption(
          position: bottom,
          [I'm down here too!]
        )
      )
      ```
    ],
  ),
  "FigureCaption::separator": (
    28,
    [
      #babel(
        en: [
          The separator which will appear between the number and body.

          If set to `{auto}`, the separator will be adapted to the current
          @text.lang[language] and @text.region[region].
        ],
      )

      ```example
      #set figure.caption(separator: [ --- ])

      #figure(
        rect[Hello],
        caption: [A rectangle],
      )
      ```
    ],
  ),
  "FigureCaption::body": (
    15,
    [
      #babel(
        en: [
          The caption's body.

          Can be used alongside `kind`, `supplement`, `counter`, `numbering`, and
          `location` to completely customize the caption.
        ],
      )

      ```example
      #show figure.caption: it => [
        #underline(it.body) |
        #it.supplement
        #context it.counter.display(it.numbering)
      ]

      #figure(
        rect[Hello],
        caption: [A rectangle],
      )
      ```
    ],
  ),
))
