/// The definitions that are available in Rust doc comments.
///
/// This converts the `scope` dictionary in `components/live.typ` to a `module`, to circumvent the limitations of Typst.
#import "/components/index.typ": (
  category-settings, docs-figure, docs-table, example, folding-details, info, insertion, short-or-long,
)

#import "i18n-babel.typ": babel

// Displays an explanatory note added during localization.
#let note(body) = context if target() == "paged" {
  show: block.with(
    stroke: (left: rgb("f06292") + 0.1em), // var(--c-theme) in CSS.
    radius: 0.5em,
    outset: (left: 1em, y: 0.5em),
  )
  // TODO: typst-docs does not yet support `$TYPST_FONT_PATHS` or `--font-path`.
  // set text(font: "Zhuque Fangsong (technical preview)")
  body
} else {
  // Wrapping with `par` makes it easier for `docs.extra.css` to control the styling.
  html.aside(class: "i18n--note", par(body))
}

/// Convert from line deltas to absolute line numbers.
///
/// The line numbers will be used to generate links to the corresponding Rust sources.
/// They are stored as line deltas to simplify git diffs when updating the typst docs.
#let resolve-lines(live-item-data-delta) = {
  let line = 0
  for (key, (line-delta, markup)) in live-item-data-delta {
    line += line-delta
    ((key): (line, markup))
  }
}
