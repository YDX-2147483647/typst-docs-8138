#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "f64": (
    12,
    [
      #babel(
        en: [
          A floating-point number.

          A limited-precision representation of a real number. Typst uses 64 bits to
          store floats. Wherever a float is expected, you can also pass an
          @int[integer].

          You can convert a value to a float with this type's constructor.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #3.14 \
      #1e4 \
      #(10 / 4)
      ```
    ],
  ),
  "f64::INF": (
    19,
    [
      #babel(
        en: [
          Infinity ($+oo$) as a value.

          This value is greater than every real number.

          Negative infinity ($-oo$) can be obtained by negating this:
          `{-float.inf}`.
        ],
      )

      ```example
      #(9999999 < float.inf) \
      #(-float.inf < -9999999)
      ```
    ],
  ),
  "f64::NAN": (
    14,
    babel(
      en: [
        A NaN value, as defined by the
        #link("https://en.wikipedia.org/wiki/IEEE_754")[IEEE 754 standard].
      ],
    ),
  ),
  "f64::construct": (
    5,
    [
      #babel(
        en: [
          Converts a value to a float.

          - Booleans are converted to `0.0` or `1.0`.
          - Integers are converted to the closest 64-bit float. For integers with
            absolute value less than `{calc.pow(2, 53)}`, this conversion is
            exact.
          - Ratios are divided by 100%.
          - Strings are parsed in base 10 to the closest 64-bit float. Exponential
            notation is supported.
        ],
      )

      ```example
      #float(false) \
      #float(true) \
      #float(4) \
      #float(40%) \
      #float("2.7") \
      #float("1e5")
      ```
    ],
  ),
  "f64::construct::value": (
    20,
    babel(
      en: [
        The value that should be converted to a float.
      ],
    ),
  ),
  "f64::is_nan": (
    6,
    [
      #babel(
        en: [
          Checks if a float is not a number.

          In IEEE 754, more than one bit pattern represents a NaN. This function
          returns `{true}` if the float is any of those bit patterns.
        ],
      )

      ```example
      #float.is-nan(0) \
      #float.is-nan(1) \
      #float.is-nan(float.nan)
      ```
    ],
  ),
  "f64::is_infinite": (
    15,
    [
      #babel(
        en: [
          Checks if a float is infinite.

          Floats can represent positive infinity and negative infinity. This
          function returns `{true}` if the float is an infinity.
        ],
      )

      ```example
      #float.is-infinite(0) \
      #float.is-infinite(1) \
      #float.is-infinite(float.inf)
      ```
    ],
  ),
  "f64::signum": (
    15,
    [
      #babel(
        en: [
          Calculates the sign of a floating point number.

          - If the number is positive (including `{+0.0}`), returns `{1.0}`.
          - If the number is negative (including `{-0.0}`), returns `{-1.0}`.
          - If the number is NaN, returns @float.nan.
        ],
      )

      ```example
      #(5.0).signum() \
      #(-5.0).signum() \
      #(0.0).signum() \
      #float.nan.signum()
      ```
    ],
  ),
  "f64::from_bytes": (
    17,
    [
      #babel(
        en: [
          Interprets bytes as a float.
        ],
      )

      ```example
      #float.from-bytes(bytes((0, 0, 0, 0, 0, 0, 240, 63))) \
      #float.from-bytes(bytes((63, 240, 0, 0, 0, 0, 0, 0)), endian: "big")
      ```
    ],
  ),
  "f64::from_bytes::bytes": (
    8,
    babel(
      en: [
        The bytes that should be converted to a float.

        Must have a length of either 4 or 8. The bytes are then interpreted
        in #link("https://en.wikipedia.org/wiki/IEEE_754")[IEEE 754]'s
        binary32 (single-precision) or binary64 (double-precision) format
        depending on the length of the bytes.
      ],
    ),
  ),
  "f64::from_bytes::endian": (
    7,
    babel(
      en: [
        The endianness of the conversion.
      ],
    ),
  ),
  "f64::to_bytes": (
    22,
    [
      #babel(
        en: [
          Converts a float to bytes.
        ],
      )

      ```example
      #array(1.0.to-bytes(endian: "big")) \
      #array(1.0.to-bytes())
      ```
    ],
  ),
  "f64::to_bytes::endian": (
    9,
    babel(
      en: [
        The endianness of the conversion.
      ],
    ),
  ),
  "f64::to_bytes::size": (
    4,
    babel(
      en: [
        The size of the resulting bytes.

        This must be either 4 or 8. The call will return the representation
        of this float in either
        #link("https://en.wikipedia.org/wiki/IEEE_754")[IEEE 754]'s binary32
        (single-precision) or binary64 (double-precision) format depending
        on the provided size.
      ],
    ),
  ),
))
