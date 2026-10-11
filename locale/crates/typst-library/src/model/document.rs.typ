#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "DocumentElem": (
    12,
    [
      #babel(
        en: [
          Manages metadata and is used to add a document file to a bundle.
        ],
      )

      = #babel(en: [Metadata]) <metadata>
      #babel(
        en: [
          The document element is the single source of truth for document metadata.
          With it, you can specify the document's title, authors, date, etc. in one
          place. Typically, the element is used with a
          @reference:styling:set-rules[set rule] like this:
        ],
      )

      ```example
      #set document(title: [My doc])

      Title is _not_ rendered, but
      embedded in PDF metadata.
      ```

      #babel(
        en: [
          By default, the metadata is embedded into the output, but not visibly
          rendered in the document. However, it becomes
          @reference:context[contextually available] to the full document and can be
          used by elements and templates. For instance, the built-in @title element
          automatically picks up the configured document title:
        ],
      )

      ```example
      #set document(title: [My doc])

      #title()
      Title is now rendered _and_
      embedded in PDF metadata.
      ```

      #babel(
        en: [
          In a similar fashion to the `title` element, you can also access metadata
          yourself using a @reference:context[context expression].
        ],
      )

      ```example
      // In the document.
      #set document(
        keywords: ("Typst", "Metadata")
      )

      // Somewhere in your template.
      _Keywords:_
      #context document.keywords.join(", ")
      ```

      #babel(
        en: [
          In single-document export formats, this function is only used with
          @reference:styling:set-rules[set rules]. Such set rules must only occur at
          the top level, not inside of any layout container. You can also explicitly
          create a `document` element, but
          @document:documents-in-bundle-export[this is only relevant in bundle export].
        ],
      )

      == #babel(en: [Format-specific considerations]) <format-specific-considerations>
      #babel(
        en: [
          Metadata is embedded into the output to varying extents:

          - PDF export supports the full range of metadata and emits it into the PDF
            _document information dictionary_ as well as XMP metadata.

          - HTML export only supports the `title`, `description`, `author`, and
            `keywords` properties. The `date` property is not supported as the HTML
            standard has no provision for it.

          - SVG and PNG export do not have any metadata support at all.
        ],
      )

      = #babel(en: [Documents in bundle export]) <documents-in-bundle-export>
      #babel(
        en: [
          In @format.bundle[bundle export], a document element represents a single
          file in the bundle output, in one of Typst's other export formats. When
          creating a document, you must provide an output path and some content. Typst
          will compile and export the provided content with the appropriate format. By
          default, the format is inferred from the file extension of the path you
          specified, but you can also configure the @document.format[`format`]
          explicitly.
        ],
      )

      ```typ
      #document("index.html", title: [Home])[
        #title()
        View #link(<list>)[my famous list].
      ]

      #document("list.html", title: [My Famous List])[
        #title()
        - My
        - Famous
        - List
      ] <list>
      ```

      == #babel(en: [Metadata]) <metadata>
      #babel(
        en: [
          Document elements pick up metadata from top-level `{set document}` rules
          within them. This means that documents written for single-document export
          can be used with explicit `document` elements while properly retaining
          metadata.
        ],
      )

      ```typ
      // Will pick up the title defined in `paper.typ`.
      #document("paper.pdf", include "paper.typ")
      ```

      ```typ
      // paper.typ
      #set document(title: [My Paper])
      ...
      ```

      #babel(
        en: [
          Note that document set rules within a `document` override explicit arguments
          passed to the `document` element.

          Moreover, properties configured as explicit arguments to `document` are made
          contextually available:
        ],
      )

      ```typ
      #document("index.html", title: [My title])[
        // Both of these will pick up `[My title]`
        #title()
        #context document.title
      ]
      ```

      == #babel(en: [Export settings]) <export-settings>
      #babel(
        en: [
          Just like with document metadata, you can use set rules on @format[format
            elements] to configure export settings for a particular document.
        ],
      )

      ```typ
      // Pretty-print all HTML.
      #set format.html(pretty: true)

      #document("index.html")[
        ...
      ]

      #document("archive.pdf")[
        // And use a specific PDF standard
        // for `archive.pdf`.
        #set pdf(standard: "a-2a")
        ...
      ]
      ```
    ],
  ),
  "DocumentElem::path": (
    136,
    babel(
      en: [
        The path in the bundle at which the exported document will be placed.

        May contain interior slashes, in which case intermediate directories
        will be automatically created.

        This property is only supported in the @format.bundle[bundle] target.
      ],
    ),
  ),
  "DocumentElem::format": (
    9,
    babel(
      en: [
        Which format to export in.

        If `{auto}`, Typst attempts to infer the export format from the
        @document.path[`path`'s] file extension.

        This property is only supported in the @format.bundle[bundle] target.
      ],
    ),
  ),
  "DocumentElem::title": (
    8,
    babel(
      en: [
        The document's title. This is rendered as the title of the PDF viewer
        window or the browser tab of the page.

        By default, the configured title is not visibly rendered in the
        document. You can add the title to the document's contents by using the
        @title element. It will automatically pick up the title configured here.

        Adding a title is important for accessibility, as it makes it easier to
        navigate to your document and identify it among other open documents.
        When exporting to PDF/UA, a title is required.

        While this can be arbitrary content, PDF viewers only support plain text
        titles, so the conversion might be lossy.
      ],
    ),
  ),
  "DocumentElem::author": (
    15,
    babel(
      en: [
        The document's authors.
      ],
    ),
  ),
  "DocumentElem::description": (
    3,
    babel(
      en: [
        The document's description.
      ],
    ),
  ),
  "DocumentElem::keywords": (
    3,
    babel(
      en: [
        The document's keywords.
      ],
    ),
  ),
  "DocumentElem::date": (
    3,
    babel(
      en: [
        The document's creation date.

        If this is `{auto}` (default), Typst uses the current date and time.
        Setting it to `{none}` prevents Typst from embedding any creation date
        into the PDF metadata.

        The year component must be at least zero in order to be embedded into a
        PDF.

        If you want to create byte-by-byte reproducible PDFs, set this to
        something other than `{auto}`.
      ],
    ),
  ),
  "DocumentElem::body": (
    13,
    babel(
      en: [
        The content that makes up the document.

        This property is only supported in the @format.bundle[bundle] target.
      ],
    ),
  ),
))
