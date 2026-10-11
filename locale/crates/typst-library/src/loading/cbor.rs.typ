#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "cbor": (
    10,
    [
      #babel(
        en: [
          Reads structured data from a CBOR file.

          The file must contain a valid CBOR serialization. The CBOR values will be
          converted into corresponding Typst values as listed in the
          @cbor:conversion[table below].

          The function returns a dictionary, an array or, depending on the CBOR file,
          another CBOR data type.
        ],
      )

      = #babel(en: short-or-long[Conversion][Conversion details]) <conversion>
      #docs-table(
        table.header[CBOR value][Converted into Typst],

        [integer],
        [@int (or @float)],

        [bytes],
        [@bytes],

        [float],
        [@float],

        [text],
        [@str],

        [bool],
        [@bool],

        [null],
        [`{none}`],

        [array],
        [@array],

        [map],
        [@dictionary],
      )

      #docs-table(
        table.header[Typst value][Converted into CBOR],

        [types that can be converted from CBOR],
        [corresponding CBOR value],

        [@symbol],
        [text],

        [@content],
        [a map describing the content],

        [other types (@length, etc.)],
        [text via @repr],
      )

      == #babel(en: [Notes]) <notes>
      #babel(
        en: [
          - Be aware that CBOR integers larger than 2#super[63]-1 or smaller
            than -2#super[63] will be converted to floating point numbers, which may
            result in an approximative value.

          - CBOR tags are not supported, and an error will be thrown.

          - The `repr` function is @repr:debugging-only[for debugging purposes only],
            and its output is not guaranteed to be stable across Typst versions.
        ],
      )
    ],
  ),
  "cbor::source": (
    66,
    babel(
      en: [
        A path to a CBOR file or raw CBOR bytes.
      ],
    ),
  ),
  "cbor::encode": (
    26,
    babel(
      en: [
        Encode structured data into CBOR bytes.
      ],
    ),
  ),
  "cbor::encode::value": (
    3,
    babel(
      en: [
        Value to be encoded.
      ],
    ),
  ),
))
