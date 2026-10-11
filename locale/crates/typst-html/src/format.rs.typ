#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "HtmlFormat": (
    16,
    [
      #babel(
        en: [
          Typst's HTML export format (experimental).

          #info[
            Typst's HTML export is currently under active development. The feature is
            still very incomplete and only available for experimentation behind a
            feature flag. Do not use this feature for production use cases. In the
            CLI, you can experiment with HTML export by passing `--features html` or
            setting the `TYPST_FEATURES` environment variable to `html`. In the web
            app, you can likewise enable it as an experimental feature. Visit the
            #link("https://github.com/typst/typst/issues/5512")[tracking issue] to
            follow progress on HTML export and learn more about planned features.
          ]

          HTML files describe a document structurally. The aim of Typst's HTML export
          is to capture the structure of an input document and produce semantically
          rich HTML that retains this structure. The resulting HTML should be
          accessible, human-readable, and editable by hand and downstream tools.

          PDF, PNG, and SVG export, in contrast, all produce _visual_ representations
          of a fully-laid out document. This divergence in the formats' intents means
          that Typst cannot simply produce perfect HTML for your existing Typst
          documents. It cannot always know what the best semantic HTML representation
          of your content is.

          Instead, it gives _you_ full control: You can check the current export
          format through the @target function and when it is set to HTML, generate
          @html.elem[raw HTML elements]. The primary intended use of these elements is
          in templates and show rules. This way, the document's contents can be fully
          agnostic to the export target and content can be shared between PDF and HTML
          export.

          In the `html` export format, Typst will output a single HTML file. You can
          also use Typst to create a website comprising multiple HTML documents and
          additional assets. Typst calls such a collection a _bundle_ and supports
          this use case with the dedicated @format.bundle[`bundle` target]. Refer to
          its documentation to learn more. Note that both in the `html` and the
          `bundle` target, Typst will currently always emit a standalone HTML file.
          Support for emitting fragments that can be integrated into other HTML
          documents is planned for the future.

          Typst currently does not output CSS style sheets, instead focussing on
          emitting semantic markup. You can of course write your own CSS styles and
          still benefit from sharing your _content_ between PDF and HTML. For the
          future, we plan to give you the option of automatically emitting CSS, taking
          more of your existing set rules into account.
        ],
      )

      = #babel(en: [Exporting as HTML]) <exporting-as-html>
      == #babel(en: [Command Line]) <command-line>
      #babel(
        en: [
          Pass `--format html` to the `compile` or `watch` subcommand or provide an
          output file name that ends with `.html`. Note that you must also pass
          `--features html` or set `TYPST_FEATURES=html` to enable this experimental
          export target.

          When using `typst watch`, Typst will launch a live-reloading HTTP server.
          You can configure it as follows:

          - Pass `--port` to change the port. (Defaults to the first free port in the
            range 3000-3005.)
          - Pass `--no-reload` to disable injection of a live reload script. (The HTML
            that is written to disk isn't affected either way.)
          - Pass `--no-serve` to disable the server altogether.
        ],
      )

      == #babel(en: [Web App]) <web-app>
      #babel(
        en: [
          HTML export can be enabled as an experimental feature in the web app.
        ],
      )
      #insertion("html-web-app")

      = #babel(en: [HTML-specific functionality]) <html-specific-functionality>
      #babel(
        en: [
          Typst exposes HTML-specific functionality in the global `html` element. See
          below for the definitions and options it contains.
        ],
      )

      #category-settings(groups: (
        (
          name: "typed",
          title: "Typed HTML",
          definitions: dictionary(stdx.describe(html).scope).filter(val => "typed-html" in stdx.describe(val).keywords),
          description: "Documentation for the typed HTML API.",
          docs: [
            A typed layer over raw HTML elements.

            The `html` module provides a typed layer over the raw @html.elem
            function that allows you to conveniently create HTML elements. HTML
            attributes are exposed as function parameters that accept Typst
            types and automatically take care of converting those into the
            appropriate HTML.

            Some parameters are common to all typed HTML functions. These are
            listed at the bottom in the
            @html:typed:global-attributes[Global Attributes] section instead of
            explicitly on each element for readability.

            = Example <example>
            ```typ
            #html.video(
              controls: true,
              width: 1280,
              height: 720,
              src: "sunrise.mp4",
            )[
              Your browser does not support the video tag.
            ]
            ```
          ],
          epilogue: [
            = Global Attributes <global-attributes>
            These parameters are common to all typed HTML functions. They are
            listed here once instead of explicitly on each element for
            readability.
          ],
        ),
      ))
    ],
  ),
  "HtmlFormat::pretty": (
    113,
    babel(
      en: [
        Whether to pretty-print the produced HTML document.

        This formats the output in a more human-readable, but less
        space-efficient way.
      ],
    ),
  ),
  "HtmlElem": (
    54,
    [
      #babel(
        en: [
          An HTML element that can contain Typst content.

          Typst's HTML export automatically generates the appropriate tags for most
          elements. However, sometimes, it is desirable to retain more control. For
          example, when using Typst to generate your blog, you could use this function
          to wrap each article in an `<article>` tag.

          Typst is aware of what is valid HTML. A tag and its attributes must form
          syntactically valid HTML. Some tags, like `meta` do not accept content.
          Hence, you must not provide a body for them. We may add more checks in the
          future, so be sure that you are generating valid HTML when using this
          function.

          Normally, Typst will generate `html`, `head`, and `body` tags for you. If
          you instead create them with this function, Typst will omit its own tags.
        ],
      )

      ```typ
      #html.elem("div", attrs: (style: "background: aqua"))[
        A div with _Typst content_ inside!
      ]
      ```
    ],
  ),
  "HtmlElem::tag": (
    23,
    babel(
      en: [
        The element's tag.
      ],
    ),
  ),
  "HtmlElem::attrs": (
    4,
    babel(
      en: [
        The element's HTML attributes.
      ],
    ),
  ),
  "HtmlElem::body": (
    9,
    babel(
      en: [
        The contents of the HTML element.

        The body can be arbitrary Typst content.
      ],
    ),
  ),
  "FrameElem": (
    47,
    babel(
      en: [
        An element that lays out its content as an inline SVG.

        Sometimes, converting Typst content to HTML is not desirable. This can be
        the case for plots and other content that relies on positioning and styling
        to convey its message.

        This function allows you to use the Typst layout engine that would also be
        used for PDF, SVG, and PNG export to render a part of your document exactly
        how it would appear when exported in one of these formats. It embeds the
        content as an inline SVG.
      ],
    ),
  ),
  "FrameElem::body": (
    12,
    babel(
      en: [
        The content that shall be laid out.
      ],
    ),
  ),
))
