#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "target": (
    93,
    [
      #babel(
        en: [
          Returns the current export target.

          This function returns
          - `{"paged"}` in @pdf[PDF], @format.png[PNG], and
            @format.svg[SVG] export, or within an @html.frame[HTML frame]
          - `{"html"}` in @html[HTML] export
          - `{"bundle"}` in @format.bundle[Bundle] export
        ],
      )

      = #babel(en: [When to use it]) <when-to-use-it>
      #babel(
        en: [
          This function allows you to format your document properly across the paged,
          HTML, and multi file export targets. It should primarily be used in
          templates and show rules, rather than directly in content. This way, the
          document's contents can be fully agnostic to the export target and content
          can be shared between different export targets.
        ],
      )

      = #babel(en: [Varying targets]) <varying-targets>
      #babel(
        en: [
          This function is @reference:context[contextual] as the target can vary
          within a single compilation: When exporting to HTML, the target will be
          `{"paged"}` while within an @html.frame.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #let kbd(it) = context {
        if target() == "html" {
          html.elem("kbd", it)
        } else {
          set text(fill: rgb("#1f2328"))
          let r = 3pt
          box(
            fill: rgb("#f6f8fa"),
            stroke: rgb("#d1d9e0b3"),
            outset: (y: r),
            inset: (x: r),
            radius: r,
            raw(it)
          )
        }
      }

      Press #kbd("F1") for help.
      ```
    ],
  ),
))
