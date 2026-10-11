#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Module": (
    10,
    [
      #babel(
        en: [
          A collection of variables and functions that are commonly related to a
          single theme.

          A module can
          - be built-in
          - stem from a @reference:scripting:modules[file import]
          - stem from a @reference:scripting:packages[package import] (and thus
            indirectly its entrypoint file)
          - result from a call to the @plugin[plugin] function

          You can access definitions from the module using
          @reference:scripting:fields[field access notation] and interact with it
          using the @reference:scripting:modules[import and include syntaxes].
        ],
      )

      ```example
      <<< #import "utils.typ"
      <<< #utils.add(2, 5)

      <<< #import utils: sub
      <<< #sub(1, 4)
      >>> #7
      >>>
      >>> #(-3)
      ```

      #babel(
        en: [
          You can check whether a definition is present in a module using the `{in}`
          operator, with a string on the left-hand side. This can be useful to
          @std:conditional-access[conditionally access] definitions in a module.
        ],
      )

      ```example
      #("table" in std) \
      #("nope" in std)
      ```

      #babel(
        en: [
          Alternatively, it is possible to convert a module to a dictionary, and
          therefore access its contents dynamically, using the
          @dictionary.constructor[dictionary constructor].
        ],
      )
    ],
  ),
))
