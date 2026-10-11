#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Type": (
    17,
    [
      #babel(
        en: [
          Describes a kind of value.

          To style your document, you need to work with values of different kinds:
          Lengths specifying the size of your elements, colors for your text and
          shapes, and more. Typst categorizes these into clearly defined _types_ and
          tells you where it expects which type of value.

          Apart from basic types for numeric values and @int[typical] @float[types]
          @str[known] @array[from] @dictionary[programming] languages, Typst provides
          a special type for @content[_content._] A value of this type can hold
          anything that you can enter into your document: Text, elements like headings
          and shapes, and style information.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #let x = 10
      #if type(x) == int [
        #x is an integer!
      ] else [
        #x is another value...
      ]

      An image is of type
      #type(image("glacier.jpg")).
      ```

      #babel(
        en: [
          The type of `{10}` is `int`. Now, what is the type of `int` or even `type`?
        ],
      )

      ```example
      #type(int) \
      #type(type)
      ```

      #babel(
        en: [
          Unlike other types like `int`, @none[none] and @auto[auto] do not have a
          name representing them. To test if a value is one of these, compare your
          value to them directly, e.g:
        ],
      )

      ```example
      #let val = none
      #if val == none [
        Yep, it's none.
      ]
      ```

      #babel(
        en: [
          Note that `type` will return @content for all document elements. To
          programmatically determine which kind of content you are dealing with, see
          @content.func.
        ],
      )
    ],
  ),
  "Type::construct": (
    123,
    [
      #babel(
        en: [
          Determines a value's type.
        ],
      )

      ```example
      #type(12) \
      #type(14.7) \
      #type("hello") \
      #type(<glacier>) \
      #type([Hi]) \
      #type(x => x + 1) \
      #type(type)
      ```
    ],
  ),
  "Type::construct::value": (
    13,
    babel(
      en: [
        The value whose type's to determine.
      ],
    ),
  ),
))
