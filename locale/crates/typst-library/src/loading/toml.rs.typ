#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "toml": (
    9,
    [
      #babel(
        en: [
          Reads structured data from a TOML file.

          The file must contain a valid TOML table. The TOML values will be converted
          into corresponding Typst values as listed in the
          @toml:conversion[table below].

          The function returns a dictionary representing the TOML table.

          The TOML file in the example consists of a table with the keys `title`,
          `version`, and `authors`.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #let details = toml("details.toml")

      Title: #details.title \
      Version: #details.version \
      Authors: #(details.authors
        .join(", ", last: " and "))
      ```

      = #babel(en: short-or-long[Conversion][Conversion details]) <conversion>
      #babel(
        en: [
          First of all, TOML documents are tables. Other values must be put in a table
          to be encoded or decoded.
        ],
      )

      #docs-table(
        table.header[TOML value][Converted into Typst],

        [string],
        [@str],

        [integer],
        [@int],

        [float],
        [@float],

        [boolean],
        [@bool],

        [datetime],
        [@datetime],

        [array],
        [@array],

        [table],
        [@dictionary],
      )

      #docs-table(
        table.header[Typst value][Converted into TOML],

        [types that can be converted from TOML],
        [corresponding TOML value],

        [`{none}`],
        [ignored],

        [@bytes],
        [string via @repr],

        [@symbol],
        [string],

        [@content],
        [a table describing the content],

        [other types (@length, etc.)],
        [string via @repr],
      )

      == #babel(en: [Notes]) <notes>
      #babel(
        en: [
          - Be aware that TOML integers larger than 2#super[63]-1 or smaller
            than -2#super[63] cannot be represented losslessly in Typst, and an error
            will be thrown according to the
            #link("https://toml.io/en/v1.0.0#integer")[specification].

          - Bytes are not encoded as TOML arrays for performance and readability
            reasons. Consider using @cbor.encode for binary data.

          - The `repr` function is @repr:debugging-only[for debugging purposes only],
            and its output is not guaranteed to be stable across Typst versions.
        ],
      )
    ],
  ),
  "toml::source": (
    86,
    babel(
      en: [
        A path to a TOML file or raw TOML bytes.
      ],
    ),
  ),
  "toml::encode": (
    10,
    babel(
      en: [
        Encodes structured data into a TOML string.
      ],
    ),
  ),
  "toml::encode::value": (
    3,
    babel(
      en: [
        Value to be encoded.

        TOML documents are tables. Therefore, only dictionaries are
        suitable.
      ],
    ),
  ),
  "toml::encode::pretty": (
    5,
    babel(
      en: [
        Whether to pretty-print the resulting TOML.
      ],
    ),
  ),
))
