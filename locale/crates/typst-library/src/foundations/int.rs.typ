#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "i64": (
    14,
    [
      #babel(
        en: [
          An integer: a positive whole number, a negative whole number, or zero.
        ],
      )

      #let wiki(name, body) = link("https://en.wikipedia.org/wiki/" + name, body)

      #babel(
        en: [
          Typst stores signed integers with the #wiki("Two%27s_complement")[two's
            complement] representation in 64 bits. This allows storing numbers up to
          $2^63-1$ (@int.max), and down to $-2^63$ (@int.min).

          Integers can also be specified as hexadecimal, octal, or binary by starting
          with the prefixes: `0x`, `0o`, or `0b`.

          You can convert a value to an integer with this type's constructor.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #(1 + 2) \
      #(2 - 5) \
      #(3 + 4 < 8)

      #0xff \
      #0o10 \
      #0b1001

      #(int(3.8) + int("26"))

      / Max: #int.max
      / Min: #int.min
      ```

      = #babel(en: [Syntax]) <syntax>
      #babel(
        en: [
          Typst integers can be entered in code mode using the decimal digits 0--9. In
          addition, if a lone digit 0 is followed by `x`, `o`, or `b` (`0x`, `0o`,
          `0b`), Typst will treat following digits as a
          #wiki("Hexadecimal")[hexadecimal] (base 16), #wiki("Octal")[octal] (base 8),
          or #wiki("Binary_number")[binary] (base 2) number.

          Hexadecimal numbers use the letters a--f or A--F for the values 10--15.

          Typst will error if an integer is written that is larger than @int.max. If
          this happens, you may want to use a @float[floating point number] instead by
          appending a period to the end of the number.

          Typst differs from some other programming languages by not treating negative
          integers as individual tokens in its syntax. Instead, input like `{-6}` is
          treated as the negation operator applied to the positive integer `6`. This
          may cause an issue when trying to write the minimum negative integer
          `{-9223372036854775808}`, as `{9223372036854775808}` is larger than
          @int.max. To write the minimum negative integer, use @int.min instead.

          This also means that if you want to embed a negative integer in markup, you
          will need to use parentheses to group the negation operator: `[#(-6)]`.
        ],
      )
    ],
  ),
  "i64::MAX": (
    56,
    [
      #babel(
        en: [
          The maximum value that can be represented as a Typst integer: $2^63-1$.
        ],
      )

      ```example
      #int.max \
      // In hexadecimal:
      #0x7FFFFFFFFFFFFFFF
      ```
    ],
  ),
  "i64::MIN": (
    10,
    [
      #babel(
        en: [
          The minimum value that can be represented as a Typst integer: $-2^63$.

          Trying to write this integer explicitly as `{-9223372036854775808}`
          instead of using `{int.min}` will result in an error. For more
          information, read the @int:syntax section.
        ],
      )

      ```example
      #int.min
      ```
    ],
  ),
  "i64::construct": (
    12,
    [
      #babel(
        en: [
          Converts a value to an integer. Raises an error if there is an attempt
          to parse an invalid string or produce an integer that doesn't fit into a
          64-bit signed integer.

          - Booleans are converted to `0` or `1`.
          - Floats and decimals are rounded to the next 64-bit integer towards
            zero.
          - Strings are parsed in base 10 by default.
        ],
      )

      ```example
      #int(false) \
      #int(true) \
      #int(2.7) \
      #int(decimal("3.8")) \
      #(int("27") + int("4")) \
      #int("beef", base: 16)
      ```
    ],
  ),
  "i64::construct::value": (
    19,
    babel(
      en: [
        The value that should be converted to an integer.
      ],
    ),
  ),
  "i64::construct::base": (
    2,
    babel(
      en: [
        The base (radix) for parsing strings, between 2 and 36.

        Above base 10, Typst accepts the letters a--z or A--Z for the values
        10--35.
      ],
    ),
  ),
  "i64::signum": (
    46,
    [
      #babel(
        en: [
          Calculates the sign of an integer.

          - If the number is positive, returns `{1}`.
          - If the number is negative, returns `{-1}`.
          - If the number is zero, returns `{0}`.
        ],
      )

      ```example
      #(5).signum() \
      #(-5).signum() \
      #(0).signum()
      ```
    ],
  ),
  "i64::bit_not": (
    16,
    [
      #babel(
        en: [
          Calculates the bitwise NOT of an integer.

          For the purposes of this function, the operand is treated as a signed
          integer of 64 bits.
        ],
      )

      ```example
      #4.bit-not() \
      #(-1).bit-not()
      ```
    ],
  ),
  "i64::bit_and": (
    14,
    [
      #babel(
        en: [
          Calculates the bitwise AND between two integers.

          For the purposes of this function, the operands are treated as signed
          integers of 64 bits.
        ],
      )

      ```example
      #128.bit-and(192)
      ```
    ],
  ),
  "i64::bit_and::rhs": (
    11,
    babel(
      en: [
        The right-hand operand of the bitwise AND.
      ],
    ),
  ),
  "i64::bit_or": (
    6,
    [
      #babel(
        en: [
          Calculates the bitwise OR between two integers.

          For the purposes of this function, the operands are treated as signed
          integers of 64 bits.
        ],
      )

      ```example
      #64.bit-or(32)
      ```
    ],
  ),
  "i64::bit_or::rhs": (
    11,
    babel(
      en: [
        The right-hand operand of the bitwise OR.
      ],
    ),
  ),
  "i64::bit_xor": (
    6,
    [
      #babel(
        en: [
          Calculates the bitwise XOR between two integers.

          For the purposes of this function, the operands are treated as signed
          integers of 64 bits.
        ],
      )

      ```example
      #64.bit-xor(96)
      ```
    ],
  ),
  "i64::bit_xor::rhs": (
    11,
    babel(
      en: [
        The right-hand operand of the bitwise XOR.
      ],
    ),
  ),
  "i64::bit_lshift": (
    6,
    [
      #babel(
        en: [
          Shifts the operand's bits to the left by the specified amount.

          For the purposes of this function, the operand is treated as a signed
          integer of 64 bits. An error will occur if the result is too large to
          fit in a 64-bit integer.
        ],
      )

      ```example
      #33.bit-lshift(2) \
      #(-1).bit-lshift(3)
      ```
    ],
  ),
  "i64::bit_lshift::shift": (
    13,
    babel(
      en: [
        The amount of bits to shift. Must not be negative.
      ],
    ),
  ),
  "i64::bit_rshift": (
    6,
    [
      #babel(
        en: [
          Shifts the operand's bits to the right by the specified amount. Performs
          an arithmetic shift by default (extends the sign bit to the left, such
          that negative numbers stay negative), but that can be changed by the
          `logical` parameter.

          For the purposes of this function, the operand is treated as a signed
          integer of 64 bits.
        ],
      )

      ```example
      #64.bit-rshift(2) \
      #(-8).bit-rshift(2) \
      #(-8).bit-rshift(2, logical: true)
      ```
    ],
  ),
  "i64::bit_rshift::shift": (
    16,
    babel(
      en: [
        The amount of bits to shift. Must not be negative.

        Shifts larger than 63 are allowed and will cause the return value to
        saturate. For non-negative numbers, the return value saturates at
        `{0}`, while, for negative numbers, it saturates at `{-1}` if
        `logical` is set to `{false}`, or `{0}` if it is `{true}`. This
        behavior is consistent with just applying this operation multiple
        times. Therefore, the shift will always succeed.
      ],
    ),
  ),
  "i64::bit_rshift::logical": (
    9,
    babel(
      en: [
        Toggles whether a logical (unsigned) right shift should be performed
        instead of arithmetic right shift. If this is `{true}`, negative
        operands will not preserve their sign bit, and bits which appear to
        the left after the shift will be `{0}`. This parameter has no effect
        on non-negative operands.
      ],
    ),
  ),
  "i64::from_bytes": (
    36,
    [
      #babel(
        en: [
          Converts bytes to an integer.
        ],
      )

      ```example
      #int.from-bytes(bytes((0, 0, 0, 0, 0, 0, 0, 1))) \
      #int.from-bytes(bytes((1, 0, 0, 0, 0, 0, 0, 0)), endian: "big")
      ```
    ],
  ),
  "i64::from_bytes::bytes": (
    8,
    babel(
      en: [
        The bytes that should be converted to an integer.

        Must be of length at most 8 so that the result fits into a 64-bit
        signed integer.
      ],
    ),
  ),
  "i64::from_bytes::endian": (
    5,
    babel(
      en: [
        The endianness of the conversion.
      ],
    ),
  ),
  "i64::from_bytes::signed": (
    4,
    babel(
      en: [
        Whether the bytes should be treated as a signed integer. If this is
        `{true}` and the most significant bit is set, the resulting number
        will negative.
      ],
    ),
  ),
  "i64::to_bytes": (
    49,
    [
      #babel(
        en: [
          Converts an integer to bytes.
        ],
      )

      ```example
      #array(10000.to-bytes(endian: "big")) \
      #array(10000.to-bytes(size: 4))
      ```
    ],
  ),
  "i64::to_bytes::endian": (
    9,
    babel(
      en: [
        The endianness of the conversion.
      ],
    ),
  ),
  "i64::to_bytes::size": (
    4,
    babel(
      en: [
        The size in bytes of the resulting bytes (must be at least zero). If
        the integer is too large to fit in the specified size, the
        conversion will truncate the remaining bytes based on the
        endianness. To keep the same resulting value, if the endianness is
        big-endian, the truncation will happen at the rightmost bytes.
        Otherwise, if the endianness is little-endian, the truncation will
        happen at the leftmost bytes.

        Be aware that if the integer is negative and the size is not enough
        to make the number fit, when passing the resulting bytes to
        `int.from-bytes`, the resulting number might be positive, as the
        most significant bit might not be set to 1.
      ],
    ),
  ),
))
