#import "i18n-inputs.typ": mode

/// Load the `babelize` function
#let get-babelize() = if mode == "export-i18n" {
  let babelize(markup) = str(plugin("babelize.wasm").babelize_bytes(bytes(markup)))
  babelize
} else {
  panic(
    "`get-babelize` is called, but the current mode is import-l10n; to make contributing easier, this project should work without `babelize.wasm` in the import-l10n mode",
  )
}

/// Results of `stdx.live-item-data` to be exported for i18n.
#let _export-live = state("i18n--export-live", (:))

/// Export `line` and `markup` of `live.at(def-site.key)` to `export.at(def-site.path).at(def-site.key)`.
///
/// Only `live.at(key)` is exported, not the entire `live`, because `live` contains all docs in a file, but not all of them need internationalization (e.g., `CslIndentElem` in `bibliography.rs`).
///
/// The `ranges` field of `live.at(key)` is dropped, because `stdx.eval-mapped` assumes that the total length of `ranges` equals the length of `markup`, which cannot be guaranteed after internationalization.
#let export-live(path, key, live) = {
  assert.eq(type(path), std.path)
  assert.eq(type(key), str)
  assert.eq(type(live), dictionary)
  assert(key in live)

  _export-live.update(export => {
    let path = stdx.str-from-path(path)
    if path not in export {
      export.insert(path, (:))
    }

    assert(key not in export.at(path))
    let (line, markup, _ranges) = live.at(key)
    export.at(path).insert(key, (line, markup))

    export
  })
}

/// Load a previously saved `(line, markup)`.
#let import-live(path, key) = {
  import "/locale/" + stdx.str-from-path(path) + ".typ": live-item-data
  live-item-data.at(key)
}

#let asset-live() = {
  let babelize = get-babelize()

  for (path, live) in _export-live.get().pairs() {
    assert(path.starts-with("/crates/")) // Ensure it does not conflict with content/ and static.typ.
    asset(
      "/i18n-export/" + path + ".typ",
      {
        ```typst
        #import "/i18n-scope.typ": *
        ```.text
        "\n"

        "#let live-item-data = resolve-lines(("
        let last-line = 0
        for (key, (line, markup)) in live.pairs().sorted(key: ((key, (line, markup))) => line) {
          assert(("{key}", "{line}", "{markup}").all(magic => magic not in markup))
          // `key` must be quoted, because some `key`s contain colons.
          // `markup` must be babelized, because the leading section might be complex. Note that we don't have to consider the indentations, because typstyle will handle it properly.
          ```typst
          "{key}": (
            {line-delta},
            {markup},
          ),
          ```
            .text
            .replace("{key}", key)
            .replace("{line-delta}", str(line - last-line))
            .replace("{markup}", babelize(markup))
          last-line = line
        }
        "))"
      },
    )
  }
}

/// Export `markup` that has no `def-site`.
///
/// Such `markup` is computed programmatically and baked into the typst-docs executable (rather than live-loaded from Rust sources), so its `def-site` is `none`.
///
/// To support internationalization, `components/category.typ` must be edited to pass `i18n--extra`, providing information other than `def-site` to construct the key.
#let export-static(i18n--extra, markup) = {
  assert.eq(type(markup), str)
  assert.eq(type(i18n--extra), dictionary)
  assert("key" in i18n--extra or i18n--extra.muted)

  // Skip the typed HTML API. Readers can refer to other projects such as MDN (developer.mozilla.org).
  if not i18n--extra.muted {
    // There are too many static markups to use `_export-live.update(… => …)`, which would consume tens of GB of memory.
    [#metadata((i18n--extra.key, markup))<i18n--export-static>]
  }
}

/// Load a previously saved `markup`.
///
/// Returns `none` if it was skipped earlier.
#let import-static(i18n--extra) = {
  assert.eq(type(i18n--extra), dictionary)
  assert("key" in i18n--extra or i18n--extra.muted)

  if not i18n--extra.muted {
    import "/locale/static.typ": static-item-data
    static-item-data.at(i18n--extra.key)
  }
}

#let asset-static() = asset(
  "/i18n-export/static.typ",
  {
    let babelize = get-babelize()

    ```typst
    #import "/i18n-scope.typ": babel
    ```.text
    "\n"
    // No need to import other items in `i18n-scope`, because no static content currently uses them.

    "#let static-item-data = ("
    for (key, markup) in query(<i18n--export-static>).map(meta => meta.value).sorted(key: array.first) {
      assert(("{key}", "{markup}").all(magic => magic not in markup))
      // `key` must be quoted, because it always contains periods.
      // `markup` must be babelized, because some of them contain examples. Note that we don't have to consider the indentations, because typstyle will handle it properly.
      ```typst
      "{key}": {markup},
      ```
        .text
        .replace("{key}", key)
        .replace("{markup}", babelize(markup))
    }
    ")"
  },
)
