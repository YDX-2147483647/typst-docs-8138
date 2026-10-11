#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "bool": (
    5,
    [
      #babel(
        en: [
          A type with two states.

          The boolean type has two values: `{true}` and `{false}`. It denotes whether
          something is active or enabled.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #false \
      #true \
      #(1 < 2)
      ```
    ],
  ),
))
