#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "PageElem": (
    21,
    [
      #babel(
        en: [
          Layouts its child onto one or multiple pages.

          Although this function is primarily used in set rules to affect page
          properties, it can also be used to explicitly render its argument onto a set
          of pages of its own.

          Pages can be set to use `{auto}` as their width or height. In this case, the
          pages will grow to fit their content on the respective axis.

          The @guides:page-setup[Guide for Page Setup] explains how to use this and
          related functions to set up a document with many examples.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      >>> #set page(margin: auto)
      #set page("us-letter")

      There you go, US friends!
      ```

      = #babel(en: [Accessibility]) <accessibility>
      #babel(
        en: [
          The contents of the page's header, footer, foreground, and background are
          invisible to Assistive Technology (AT) like screen readers. Only the body of
          the page is read by AT. Do not include vital information not included
          elsewhere in the document in these areas.
        ],
      )

      = #babel(en: [Styling]) <styling>
      #babel(
        en: [
          Note that the @page element cannot be targeted by show rules; writing
          `{show page: ..}` has no effect. To repeat content on every page, you can
          instead configure the @page.header[`header`], @page.footer[`footer`],
          @page.background[`background`], and @page.foreground[`foreground`]
          properties with a set rule.
        ],
      )
    ],
  ),
  "PageElem::paper": (
    34,
    babel(
      en: [
        A standard paper size to set width and height.

        This is just a shorthand for setting `width` and `height` and, as such,
        cannot be retrieved in a context expression.
      ],
    ),
  ),
  "PageElem::width": (
    8,
    [
      #babel(
        en: [
          The width of the final page, after any trims have been applied.

          In professional printing setups, this may be smaller than the sheet size
          fed into the printer.

          See the @page.bleed[`bleed`] parameter for details on how to set a trim
          or bleed area.
        ],
      )

      ```example
      #set page(
        width: 3cm,
        margin: (x: 0cm),
      )

      #for i in range(3) {
        box(square(width: 1cm))
      }
      ```
    ],
  ),
  "PageElem::height": (
    27,
    babel(
      en: [
        The height of the final page area, after any trims have been applied.

        If this is set to `{auto}`, page breaks can only be triggered manually
        by inserting a @pagebreak[page break] or by adding another non-empty
        page set rule. Most examples throughout this documentation use `{auto}`
        for the height of the page to dynamically grow and shrink to fit their
        content.
      ],
    ),
  ),
  "PageElem::flipped": (
    15,
    [
      #babel(
        en: [
          Whether the page is flipped into landscape orientation.
        ],
      )

      ```example
      #set page(
        "us-business-card",
        flipped: true,
        fill: rgb("f2e5dd"),
      )

      #set align(bottom + end)
      #text(14pt)[*Sam H. Richards*] \
      _Procurement Manager_

      #set text(10pt)
      23 W 23rd Street \
      New York, NY 10010 \
      +1 (212) 555-0155
      ```
    ],
  ),
  "PageElem::margin": (
    22,
    [
      #babel(
        en: [
          The page's margins.

          - `{auto}`: The margins are set automatically to 2.5/21 times the
            smaller dimension of the page. This results in 2.5 cm margins for an
            A4 page.
          - A single length: The same margin on all sides.
          - A dictionary: With a dictionary, the margins can be set individually.
            The dictionary can contain the following keys in order of precedence:
            - `top`: The top margin.
            - `right`: The right margin.
            - `bottom`: The bottom margin.
            - `left`: The left margin.
            - `inside`: The margin at the inner side of the page (where the
              @page.binding[binding] is).
            - `outside`: The margin at the outer side of the page (opposite to the
              @page.binding[binding]).
            - `x`: The horizontal margins.
            - `y`: The vertical margins.
            - `rest`: The margins on all sides except those for which the
              dictionary explicitly sets a size.

          All keys are optional; omitted keys will use their previously set value,
          or the default margin if never set. In addition, the values for `left`
          and `right` are mutually exclusive with the values for `inside` and
          `outside`. The values should be relative lengths or `{auto}`.
        ],
      )

      ```example
      #set page(
       width: 3cm,
       height: 4cm,
       margin: (x: 8pt, y: 4pt),
      )

      #rect(
        width: 100%,
        height: 100%,
        fill: aqua,
      )
      ```
    ],
  ),
  "PageElem::bleed": (
    43,
    [
      #babel(
        en: [
          The page's bleed margin.

          The bleed is the area of content that extends beyond the final trimmed
          size of the page. It ensures that no unprinted edges appear in the final
          product, even if minor trimming misalignments occur.

          Accepted values:

          - A single length: The same bleed on all sides.
          - A dictionary: With a dictionary, the bleed margins can be set
            individually. The dictionary may include the following keys, listed in
            order of precedence:
            - `top`: The top bleed margin.
            - `right`: The right bleed margin.
            - `bottom`: The bottom bleed margin.
            - `left`: The left bleed margin.
            - `inside`: The bleed margin at the inner side of the page (where the
              @page.binding[binding] is).
            - `outside`: The bleed margin at the outer side of the page (opposite
              to the @page.binding[binding]).
            - `x`: The horizontal bleed margins.
            - `y`: The vertical bleed margins.
            - `rest`: The bleed margins on all sides except those for which the
              dictionary explicitly sets a size.

          All keys are optional; omitted keys will use their previously set value,
          or `{0pt}` if never set. In addition, the values for `left` and `right`
          are mutually exclusive with the values for `inside` and `outside`. The
          values should be relative lengths.

          In PDF export, if the bleed is non-zero, a `TrimBox` is defined for the
          page.
        ],
      )

      ```example
      #set page(
        width: 8cm,
        height: 5cm,
        margin: 1cm,
        // The bleed is not visible in the preview;
        // it exceeds beyond the page.
        bleed: 0.5cm,
        // Fills the entire bleed area, so there will
        // be no white strips after printing and trimming.
        background: rect(width: 100%, height: 100%, fill: aqua),
      )

      #rect(width: 100%, height: 100%, fill: white)
      ```
    ],
  ),
  "PageElem::binding": (
    51,
    babel(
      en: [
        On which side the pages will be bound.

        - `{auto}`: Equivalent to `left` if the @text.dir[text direction] is
          left-to-right and `right` if it is right-to-left.
        - `left`: Bound on the left side.
        - `right`: Bound on the right side.

        This affects the meaning of the `inside` and `outside` options for
        margins.
      ],
    ),
  ),
  "PageElem::columns": (
    12,
    [
      #babel(
        en: [
          How many columns the page has.

          If you need to insert columns into a page or other container, you can
          also use the @columns[`columns` function].
        ],
      )

      #example(
        single: true,
        ```
        #set page(columns: 2, height: 4.8cm)
        Climate change is one of the most
        pressing issues of our time, with
        the potential to devastate
        communities, ecosystems, and
        economies around the world. It's
        clear that we need to take urgent
        action to reduce our carbon
        emissions and mitigate the impacts
        of a rapidly changing climate.
        ```,
      )
    ],
  ),
  "PageElem::fill": (
    24,
    [
      #babel(
        en: [
          The page's background fill.

          Setting this to something non-transparent instructs the printer to color
          the complete page. If you are considering larger production runs, it may
          be more environmentally friendly and cost-effective to source pre-dyed
          pages and not set this property.

          When set to `{none}`, the background becomes transparent. Note that PDF
          pages will still appear with a (usually white) background in viewers,
          but they are actually transparent. (If you print them, no color is used
          for the background.)

          The default of `{auto}` results in `{none}` for PDF output, and
          `{white}` for PNG and SVG.
        ],
      )

      ```example
      #set page(fill: rgb("444352"))
      #set text(fill: rgb("fdfdfd"))
      *Dark mode enabled.*
      ```
    ],
  ),
  "PageElem::numbering": (
    23,
    [
      #babel(
        en: [
          How to number the pages. You can refer to the Page Setup Guide for
          @guides:page-setup:page-numbers[customizing page numbers].

          Accepts a @numbering[numbering pattern or function] taking one or two
          numbers:
          + The first number is the current page number.
          + The second number is the total number of pages. In a numbering
            pattern, the second number can be omitted. If a function is passed, it
            will receive one argument in the context of links or references, and
            two arguments when producing the visible page numbers.

          These are logical numbers controlled by the page counter, and may thus
          not match the physical numbers. Specifically, they are the
          @counter.get[current] and the @counter.final[final] value of
          `{counter(page)}`. See the @counter:page-counter[`counter`]
          documentation for more details.

          If an explicit @page.footer[`footer`] (or @page.header[`header`] for
          @page.number-align[top-aligned] numbering) is given, the numbering is
          ignored.
        ],
      )

      ```example
      #set page(
        height: 100pt,
        margin: (top: 16pt, bottom: 24pt),
        numbering: "1 / 1",
      )

      #lorem(48)
      ```
    ],
  ),
  "PageElem::supplement": (
    33,
    [
      #babel(
        en: [
          A supplement for the pages.

          For page references, this is added before the page number.
        ],
      )

      ```example
      #set page(numbering: "1.", supplement: [p.])

      = Introduction <intro>
      We are on #ref(<intro>, form: "page")!
      ```
    ],
  ),
  "PageElem::number_align": (
    13,
    [
      #babel(
        en: [
          The alignment of the page numbering.

          If the vertical component is `top`, the numbering is placed into the
          header and if it is `bottom`, it is placed in the footer. Horizon
          alignment is forbidden. If an explicit matching `header` or `footer` is
          given, the numbering is ignored.
        ],
      )

      ```example
      #set page(
        margin: (top: 16pt, bottom: 24pt),
        numbering: "1",
        number-align: right,
      )

      #lorem(30)
      ```
    ],
  ),
  "PageElem::header": (
    20,
    [
      #babel(
        en: [
          The page's header. Fills the top margin of each page.

          - Content: Shows the content as the header.
          - `{auto}`: Shows the page number if a @page.numbering[`numbering`] is
            set and @page.number-align[`number-align`] is `top`.
          - `{none}`: Suppresses the header.
        ],
      )

      ```example
      #set par(justify: true)
      #set page(
        margin: (top: 32pt, bottom: 20pt),
        header: [
          #set text(8pt)
          #smallcaps[Typst Academy]
          #h(1fr) _Exercise Sheet 3_
        ],
      )

      #lorem(19)
      ```
    ],
  ),
  "PageElem::header_ascent": (
    23,
    babel(
      en: [
        The amount the header is raised into the top margin. Ratios are relative
        to the height of the top margin.
      ],
    ),
  ),
  "PageElem::footer": (
    6,
    [
      #babel(
        en: [
          The page's footer. Fills the bottom margin of each page.

          - Content: Shows the content as the footer.
          - `{auto}`: Shows the page number if a @page.numbering[`numbering`] is
            set and @page.number-align[`number-align`] is `bottom`.
          - `{none}`: Suppresses the footer.

          For just a page number, the `numbering` property typically suffices. If
          you want to create a custom footer but still display the page number,
          you can directly access the @counter[page counter].
        ],
      )

      ```example
      #set par(justify: true)
      #set page(
        height: 100pt,
        margin: 20pt,
        footer: context [
          #set align(right)
          #set text(8pt)
          #counter(page).display(
            "1 of I",
            both: true,
          )
        ]
      )

      #lorem(48)
      ```
    ],
  ),
  "PageElem::footer_descent": (
    31,
    [
      #babel(
        en: [
          The amount the footer is lowered into the bottom margin. Ratios are
          relative to the height of the bottom margin.
        ],
      )

      ```preview
      #set page(
        height: 126pt,
        width: 240pt,
        margin: (top: 0pt, x: 20pt, bottom: 50pt),
        numbering: (..nums) => box(
          outset: (x: 50%),
          fill: orange.lighten(50%),
        )[6 / 8],
        footer-descent: 47%,
        foreground: place(bottom, {
          let arrow(height) = math.stretch(
            text(1.4em, sym.arrow.t.b),
            size: height,
          )
          set text(
            1.2em,
            purple.darken(10%),
            bottom-edge: "bounds",
            top-edge: "bounds",
          )
          set par(leading: 0.5em)
          import grid: cell
          context grid(
            align: center + horizon,
            columns: (37%, 10%, 6%, 47%),
            cell(rowspan: 2, align: right)[bottom\ margin],
            cell(rowspan: 2, align: left, arrow(page.margin.bottom)),
            arrow(page.margin.bottom * page.footer-descent.ratio),
            cell(align: left)[footer descent],
          )
        }),
      )
      #block(width: 100%, height: 100%, fill: green.lighten(75%), {
        set par(justify: true)
        set text(luma(25%))
        place(bottom, lorem(42))
      })
      ```
    ],
  ),
  "PageElem::background": (
    46,
    [
      #babel(
        en: [
          Content in the page's background.

          This content will be placed behind the page's body. It can be used to
          place a background image or a watermark.

          For convenience, @relative[relative lengths] are resolved against the
          page size including the @page.bleed[page `bleed`] when used in
          background content. For example, on a page that is `{100mm}` wide with a
          `{5mm}` bleed, a width of `{100%}` is computed as `{5mm + 100mm + 5mm}`.
        ],
      )

      ```example
      #set page(background: rotate(24deg,
        text(18pt, fill: rgb("FFCBC4"))[
          *CONFIDENTIAL*
        ]
      ))

      = Typst's secret plans
      In the year 2023, we plan to take
      over the world (of typesetting).
      ```
    ],
  ),
  "PageElem::foreground": (
    24,
    [
      #babel(
        en: [
          Content in the page's foreground.

          This content will overlay the page's body.

          Relative lengths are resolved against the page size including
          @page.bleed[`bleed`], following the same behavior as
          @page.background[`background`].
        ],
      )

      ```example
      #set page(foreground: text(24pt)[🤓])

      Reviewer 2 has marked our paper
      "Weak Reject" because they did
      not understand our approach...
      ```
    ],
  ),
  "PageElem::body": (
    18,
    babel(
      en: [
        The contents of the page(s).

        Multiple pages will be created if the content does not fit on a single
        page. A new page with the page properties prior to the function
        invocation will be created after the body has been typeset.
      ],
    ),
  ),
  "PagebreakElem": (
    36,
    [
      #babel(
        en: [
          A manual page break.

          Must not be used inside any containers.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      The next page contains
      more details on compound theory.
      #pagebreak()

      == Compound Theory
      In 1984, the first ...
      ```

      #babel(
        en: [
          Even without manual page breaks, content will be automatically paginated
          based on the configured page size. You can set @page.height[the page height]
          to `{auto}` to let the page grow dynamically until a manual page break
          occurs.

          Pagination tries to avoid single lines of text at the top or bottom of a
          page (these are called _widows_ and _orphans_). You can adjust the
          @text.costs parameter to disable this behavior.
        ],
      )
    ],
  ),
  "PagebreakElem::weak": (
    24,
    babel(
      en: [
        If `{true}`, the page break is skipped if the current page is already
        empty.
      ],
    ),
  ),
  "PagebreakElem::to": (
    5,
    [
      #babel(
        en: [
          If given, ensures that the next page will be an even/odd page, with an
          empty page in between if necessary.
        ],
      )

      ```example
      #set page(height: 30pt)

      First.
      #pagebreak(to: "odd")
      Third.
      ```
    ],
  ),
))
