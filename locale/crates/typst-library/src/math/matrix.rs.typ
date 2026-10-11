#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "VecElem": (
    18,
    [
      #babel(
        en: [
          A column vector.

          Content in the vector's elements can be aligned with the
          @math.vec.align[`align`] parameter, or the `&` symbol.

          This function is for typesetting vector components. To typeset a symbol that
          represents a vector, @math.accent[`arrow`] and @math.bold[`bold`] are
          commonly used.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      $ vec(a, b, c) dot vec(1, 2, 3)
          = a + 2b + 3c $
      ```
    ],
  ),
  "VecElem::delim": (
    16,
    [
      #babel(
        en: [
          The delimiter to use.

          Can be a single character specifying the left delimiter, in which case
          the right delimiter is inferred. Otherwise, can be an array containing a
          left and a right delimiter.
        ],
      )

      ```example
      #set math.vec(delim: "[")
      $ vec(1, 2) $
      ```
    ],
  ),
  "VecElem::align": (
    13,
    [
      #babel(
        en: [
          The horizontal alignment that each element should have.
        ],
      )

      ```example
      #set math.vec(align: right)
      $ vec(-1, 1, -1) $
      ```
    ],
  ),
  "VecElem::gap": (
    9,
    [
      #babel(
        en: [
          The gap between elements.
        ],
      )

      ```example
      #set math.vec(gap: 1em)
      $ vec(1, 2) $
      ```
    ],
  ),
  "VecElem::children": (
    9,
    babel(
      en: [
        The elements of the vector.
      ],
    ),
  ),
  "MatElem": (
    5,
    [
      #babel(
        en: [
          A matrix.

          The elements of a row should be separated by commas, while the rows
          themselves should be separated by semicolons. The semicolon syntax merges
          preceding arguments separated by commas into an array. You can also use this
          special syntax of math function calls to define custom functions that take
          2D data.

          Content in cells can be aligned with the @math.mat.align[`align`] parameter,
          or content in cells that are in the same row can be aligned with the `&`
          symbol.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      $ mat(
        1, 2, ..., 10;
        2, 2, ..., 10;
        dots.v, dots.v, dots.down, dots.v;
        10, 10, ..., 10;
      ) $
      ```
    ],
  ),
  "MatElem::delim": (
    23,
    [
      #babel(
        en: [
          The delimiter to use.

          Can be a single character specifying the left delimiter, in which case
          the right delimiter is inferred. Otherwise, can be an array containing a
          left and a right delimiter.
        ],
      )

      ```example
      #set math.mat(delim: "[")
      $ mat(1, 2; 3, 4) $
      ```
    ],
  ),
  "MatElem::align": (
    13,
    [
      #babel(
        en: [
          The horizontal alignment that each cell should have.
        ],
      )

      ```example
      #set math.mat(align: right)
      $ mat(-1, 1, 1; 1, -1, 1; 1, 1, -1) $
      ```
    ],
  ),
  "MatElem::augment": (
    9,
    [
      #babel(
        en: [
          Draws augmentation lines in a matrix.

          - `{none}`: No lines are drawn.
          - A single number: A vertical augmentation line is drawn after the
            specified column number. Negative numbers start from the end.
          - A dictionary: With a dictionary, multiple augmentation lines can be
            drawn both horizontally and vertically. Additionally, the style of the
            lines can be set. The dictionary can contain the following keys:
            - `hline`: The offsets at which horizontal lines should be drawn. For
              example, an offset of `2` would result in a horizontal line being
              drawn after the second row of the matrix. Accepts either an integer
              for a single line, or an array of integers for multiple lines. Like
              for a single number, negative numbers start from the end.
            - `vline`: The offsets at which vertical lines should be drawn. For
              example, an offset of `2` would result in a vertical line being
              drawn after the second column of the matrix. Accepts either an
              integer for a single line, or an array of integers for multiple
              lines. Like for a single number, negative numbers start from the
              end.
            - `stroke`: How to @stroke[stroke] the line. If set to `{auto}`, takes
              on a thickness of 0.05 em and square line caps.
        ],
      )

      #example(
        title: "Basic usage",
        ```
        $ mat(1, 0, 1; 0, 1, 2; augment: #2) $
        // Equivalent to:
        $ mat(1, 0, 1; 0, 1, 2; augment: #(-1)) $
        ```,
      )

      #example(
        title: "Customizing the augmentation line",
        ```
        $ mat(0, 0, 0; 1, 1, 1; augment: #(hline: 1, stroke: 2pt + green)) $
        ```,
      )
    ],
  ),
  "MatElem::gap": (
    40,
    [
      #babel(
        en: [
          The gap between rows and columns.

          This is a shorthand to set `row-gap` and `column-gap` to the same value.
        ],
      )

      ```example
      #set math.mat(gap: 1em)
      $ mat(1, 2; 3, 4) $
      ```
    ],
  ),
  "MatElem::row_gap": (
    11,
    [
      #babel(
        en: [
          The gap between rows.
        ],
      )

      ```example
      #set math.mat(row-gap: 1em)
      $ mat(1, 2; 3, 4) $
      ```
    ],
  ),
  "MatElem::column_gap": (
    13,
    [
      #babel(
        en: [
          The gap between columns.
        ],
      )

      ```example
      #set math.mat(column-gap: 1em)
      $ mat(1, 2; 3, 4) $
      ```
    ],
  ),
  "MatElem::rows": (
    10,
    [
      #babel(
        en: [
          An array of arrays with the rows of the matrix.
        ],
      )

      ```example
      #let data = ((1, 2, 3), (4, 5, 6))
      #let matrix = math.mat(..data)
      $ v := matrix $
      ```
    ],
  ),
  "CasesElem": (
    35,
    [
      #babel(
        en: [
          A case distinction.

          Content across different branches can be aligned with the `&` symbol.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      $ f(x, y) := cases(
        1 "if" (x dot y)/2 <= 0,
        2 "if" x "is even",
        3 "if" x in NN,
        4 "else",
      ) $
      ```
    ],
  ),
  "CasesElem::delim": (
    15,
    [
      #babel(
        en: [
          The delimiter to use.

          Can be a single character specifying the left delimiter, in which case
          the right delimiter is inferred. Otherwise, can be an array containing a
          left and a right delimiter.
        ],
      )

      ```example
      #set math.cases(delim: "[")
      $ x = cases(1, 2) $
      ```
    ],
  ),
  "CasesElem::reverse": (
    13,
    [
      #babel(
        en: [
          Whether the direction of cases should be reversed.
        ],
      )

      ```example
      #set math.cases(reverse: true)
      $ cases(1, 2) = x $
      ```
    ],
  ),
  "CasesElem::gap": (
    9,
    [
      #babel(
        en: [
          The gap between branches.
        ],
      )

      ```example
      #set math.cases(gap: 1em)
      $ x = cases(1, 2) $
      ```
    ],
  ),
  "CasesElem::children": (
    9,
    babel(
      en: [
        The branches of the case distinction.
      ],
    ),
  ),
))
