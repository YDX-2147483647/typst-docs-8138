#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "csv": (
    9,
    [
      #babel(
        en: [
          Reads structured data from a CSV file.

          The CSV file will be read and parsed into a 2-dimensional array of strings:
          Each row in the CSV file will be represented as an array of strings, and all
          rows will be collected into a single array. Header rows will not be
          stripped.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #let results = csv("example.csv")

      #table(
        columns: 2,
        [*Condition*], [*Result*],
        ..results.flatten(),
      )
      ```
    ],
  ),
  "csv::source": (
    20,
    babel(
      en: [
        A path to a CSV file or raw CSV bytes.
      ],
    ),
  ),
  "csv::delimiter": (
    2,
    babel(
      en: [
        The delimiter that separates columns in the CSV file. Must be a single
        ASCII character.
      ],
    ),
  ),
  "csv::row_type": (
    5,
    babel(
      en: [
        How to represent the file's rows.

        - If set to `array`, each row is represented as a plain array of
          strings.
        - If set to `dictionary`, each row is represented as a dictionary
          mapping from header keys to strings. This option only makes sense when
          a header row is present in the CSV file.
      ],
    ),
  ),
))
