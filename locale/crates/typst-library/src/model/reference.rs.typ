#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "RefElem": (
    20,
    [
      #babel(
        en: [
          A reference to a label or bibliography.

          Takes a label and cross-references it. There are two kind of references,
          determined by its @ref.form[`form`]: `{"normal"}` and `{"page"}`.

          The default, a `{"normal"}` reference, produces a textual reference to a
          label. For example, a reference to a heading will yield an appropriate
          string such as "Section 1" for a reference to the first heading. The word
          "Section" depends on the @text.lang[`lang`] setting and is localized
          accordingly. The references are also links to the respective element.
          Reference syntax can also be used to @cite[cite] from a bibliography.

          As the default form requires a supplement and numbering, the label must be
          attached to a _referenceable element_. Referenceable elements include
          @heading[headings], @figure[figures], @math.equation[equations], and
          @footnote[footnotes]. To create a custom referenceable element like a
          theorem, you can create a figure of a custom @figure.kind[`kind`] and write
          a show rule for it. In the future, there might be a more direct way to
          define a custom referenceable element.

          If you just want to link to a labelled element and not get an automatic
          textual reference, consider using the @link function instead.

          A `{"page"}` reference produces a page reference to a label, displaying the
          page number at its location. You can use the
          @page.supplement[page's supplement] to modify the text before the page
          number. Unlike a `{"normal"}` reference, the label can be attached to any
          element as long as the corresponding @page.numbering[page's numbering] is
          set.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #set page(numbering: "1")
      #set heading(numbering: "1.")
      #set math.equation(numbering: "(1)")

      = Introduction <intro>
      Recent developments in
      typesetting software have
      rekindled hope in previously
      frustrated researchers. @distress
      As shown in @results (see
      #ref(<results>, form: "page")),
      we ...

      = Results <results>
      We discuss our approach in
      comparison with others.

      == Performance <perf>
      @slow demonstrates what slow
      software looks like.
      $ T(n) = O(2^n) $ <slow>

      #bibliography("works.bib")
      ```

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          This function also has dedicated syntax: A `{"normal"}` reference to a label
          can be created by typing an `[@]` followed by the name of the label (e.g.
          `[= Introduction <intro>]` can be referenced by typing `[@intro]`).

          To customize the supplement, add content in square brackets after the
          reference: `[@intro[Chapter]]`.
        ],
      )

      = #babel(en: [Customization]) <customization>
      #babel(
        en: [
          When you only ever need to reference pages of a figure/table/heading/etc. in
          a document, the default `form` field value can be changed to `{"page"}` with
          a set rule. If you prefer a short "p." supplement over "page", the
          @page.supplement field can be used for changing this:
        ],
      )

      ```example
      #set page(
        numbering: "1",
        supplement: "p.",
      >>> margin: (bottom: 3em),
      >>> footer-descent: 1.25em,
      )
      #set ref(form: "page")

      #figure(
        stack(
          dir: ltr,
          spacing: 1em,
          circle(),
          square(),
        ),
        caption: [Shapes],
      ) <shapes>

      #pagebreak()

      See @shapes for examples
      of different shapes.
      ```

      #babel(
        en: [
          If you write a show rule for references, you can access the referenced
          element through the `element` field of the reference. The `element` may be
          `{none}` even if it exists if Typst hasn't discovered it yet, so you always
          need to handle that case in your code.
        ],
      )

      ```example
      #set heading(numbering: "1.")
      #set math.equation(numbering: "(1)")

      #show ref: it => {
        let eq = math.equation
        let el = it.element
        // Skip all other references.
        if el == none or el.func() != eq { return it }
        // Override equation references.
        link(el.location(), counter(eq).display(at: el.location()))
      }

      = Beginnings <beginning>
      In @beginning we prove @pythagoras.
      $ a^2 + b^2 = c^2 $ <pythagoras>
      ```
    ],
  ),
  "RefElem::target": (
    120,
    babel(
      en: [
        The target label that should be referenced.

        Can be a label that is defined in the document or, if the
        @ref.form[`form`] is set to `["normal"]`, an entry from the
        @bibliography.
      ],
    ),
  ),
  "RefElem::supplement": (
    8,
    [
      #babel(
        en: [
          A supplement for the reference.

          If the @ref.form[`form`] is set to `{"normal"}`:
          - For references to headings or figures, this is added before the
            referenced number.
          - For citations, this can be used to add a page number.

          If the @ref.form[`form`] is set to `{"page"}`, then this is added before
          the page number of the label referenced.

          If a function is specified, it is passed the referenced element and
          should return content.
        ],
      )

      ```example
      #set heading(numbering: "1.")
      #show ref.where(
        form: "normal"
      ): set ref(supplement: it => {
        if it.func() == heading {
          "Chapter"
        } else {
          "Thing"
        }
      })

      = Introduction <intro>
      In @intro, we see how to turn
      Sections into Chapters. And
      in @intro[Part], it is done
      manually.
      ```
    ],
  ),
  "RefElem::form": (
    33,
    [
      #babel(
        en: [
          The kind of reference to produce.
        ],
      )

      ```example
      #set page(numbering: "1")

      Here <here> we are on
      #ref(<here>, form: "page").
      ```
    ],
  ),
))
