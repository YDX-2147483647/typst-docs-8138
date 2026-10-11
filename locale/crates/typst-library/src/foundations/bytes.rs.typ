#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Bytes": (
    16,
    [
      #babel(
        en: [
          A sequence of bytes.

          This is conceptually similar to an array of @int[integers] between `{0}` and
          `{255}`, but represented much more efficiently. You can iterate over it
          using a @reference:scripting:loops[for loop].

          You can convert
          - a @str[string] or an @array[array] of integers to bytes with the @bytes
            constructor
          - bytes to a string with the @str constructor, with UTF-8 encoding
          - bytes to an array of integers with the @array constructor

          When @read[reading] data from a file, you can decide whether to load it as a
          string or as raw bytes.
        ],
      )

      ```example
      #bytes((123, 160, 22, 0)) \
      #bytes("Hello 😃")

      #let data = read(
        "rhino.png",
        encoding: none,
      )

      // Magic bytes.
      #array(data.slice(0, 4)) \
      #str(data.slice(1, 4))
      ```
    ],
  ),
  "Bytes::construct": (
    214,
    [
      #babel(
        en: [
          Converts a value to bytes.

          - Strings are encoded in UTF-8.
          - Arrays of integers between `{0}` and `{255}` are converted directly.
            The dedicated byte representation is much more efficient than the
            array representation and thus typically used for large byte buffers
            (e.g. image data).
        ],
      )

      ```example
      #bytes("Hello 😃") \
      #bytes((123, 160, 22, 0))
      ```
    ],
  ),
  "Bytes::construct::value": (
    14,
    babel(
      en: [
        The value that should be converted to bytes.
      ],
    ),
  ),
  "Bytes::len": (
    6,
    babel(
      en: [
        The length in bytes.
      ],
    ),
  ),
  "Bytes::at": (
    6,
    babel(
      en: [
        Returns the byte at the specified index. Returns the default value if
        the index is out of bounds or fails with an error if no default value
        was specified.
      ],
    ),
  ),
  "Bytes::at::index": (
    6,
    babel(
      en: [
        The index at which to retrieve the byte.
      ],
    ),
  ),
  "Bytes::at::default": (
    2,
    babel(
      en: [
        A default value to return if the index is out of bounds.
      ],
    ),
  ),
  "Bytes::slice": (
    10,
    babel(
      en: [
        Extracts a subslice of the bytes. Fails with an error if the start or
        end index is out of bounds.
      ],
    ),
  ),
  "Bytes::slice::start": (
    5,
    babel(
      en: [
        The start index (inclusive).
      ],
    ),
  ),
  "Bytes::slice::end": (
    2,
    babel(
      en: [
        The end index (exclusive). If omitted, the whole slice until the end
        is extracted.
      ],
    ),
  ),
  "Bytes::slice::count": (
    4,
    babel(
      en: [
        The number of items to extract. This is equivalent to passing
        `start + count` as the `end` position. Mutually exclusive with
        `end`.
      ],
    ),
  ),
))
