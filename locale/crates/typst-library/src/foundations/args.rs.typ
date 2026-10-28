#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Args": (
    18,
    [
      #babel(
        en: [
          Captured arguments to a function.

          Arguments are either _positional_ or _named,_ and can be accessed through
          the @arguments.pos[`pos`], @arguments.named[`named`], and
          @arguments.at[`at`] methods.

          Additionally, named arguments can be accessed with @arguments.at[field
            syntax] similar to @dictionary[dictionaries].
        ],
      )

      = #babel(en: [Argument Sinks]) <argument-sinks>
      #babel(
        en: [
          Like built-in functions, custom functions can also take a variable number of
          arguments. You can specify an _argument sink_ which collects all excess
          arguments as `{..sink}`. The resulting `sink` value is of the `arguments`
          type. It exposes methods to access the positional and named arguments.
        ],
      )

      ```example
      #let format(title, ..authors) = {
        let by = authors
          .pos()
          .join(", ", last: " and ")

        [= #title]
        text(style: "italic")[By #by]
      }

      #format("ArtosFlow", "Jane", "Joe")
      ```

      = #babel(en: [Spreading]) <spreading>
      #babel(
        en: [
          Inversely to an argument sink, you can _spread_ arguments, arrays and
          dictionaries into a function call with the `{..spread}` operator.
        ],
      )

      ```example
      #let array = (2, 3, 5)
      #calc.min(..array)
      #let dict = (fill: blue)
      #text(..dict)[Hello]
      ```
    ],
  ),
  "Args::construct": (
    308,
    [
      #babel(
        en: [
          Constructs spreadable arguments in place.

          This function behaves like `{let arguments(..args) = args}`.
        ],
      )

      ```example
      #let args = arguments(
        stroke: red,
        inset: 1em,
        [Body],
      )
      #box(..args)
      ```
    ],
  ),
  "Args::construct::args_": (
    15,
    babel(
      en: [
        The arguments to construct.
      ],
    ),
  ),
  "Args::len": (
    8,
    [
      #babel(
        en: [
          Returns the number of arguments, positional or named.
        ],
      )

      ```example
      #arguments(a: "b", none, 1).len()
      ```
    ],
  ),
  "Args::at": (
    10,
    [
      #babel(
        en: [
          Returns the positional argument at the specified index, or the named
          argument with the specified name.

          If the key is an @int, this is equivalent to first calling
          @arguments.pos[`pos`] and then @array.at. If it is a @str, this is
          equivalent to first calling @arguments.named[`named`] and then
          @dictionary.at.

          Named arguments can also be accessed with field syntax (e.g.
          `{arguments(key: 42).key}`) if no default is needed. Unlike
          @dictionary[dictionaries], fields on arguments cannot be modified.
        ],
      )

      ```example
      #let args = arguments(1, x: 2, 3)
      #args.at(1) \
      #args.at("x") \
      #args.x
      ```
    ],
  ),
  "Args::at::key": (
    21,
    babel(
      en: [
        The index or name of the argument to get.
      ],
    ),
  ),
  "Args::at::default": (
    2,
    [
      #babel(
        en: [
          A default value to return if the key is invalid.
        ],
      )

      ```example
      #let args = arguments("hello")
      #args.at(0, default: "missing") \
      #args.at(1, default: "missing") \
      #args.at("a", default: "missing")
      ```
    ],
  ),
  "Args::to_pos": (
    17,
    [
      #babel(
        en: [
          Returns the positional arguments as an array.
        ],
      )

      ```example
      #arguments(1, a: 2, "foo").pos()
      ```
    ],
  ),
  "Args::to_named": (
    14,
    [
      #babel(
        en: [
          Returns the named arguments as a dictionary.
        ],
      )

      ```example
      #arguments(1, a: 2, "foo").named()
      ```
    ],
  ),
  "Args::filter": (
    13,
    [
      #babel(
        en: [
          Produces a new `arguments` with only the arguments for which the value
          passes the test.
        ],
      )

      ```example
      #{
        arguments(-1, a: 0, b: 1, 2)
          .filter(v => v > 0)
      }
      ```
    ],
  ),
  "Args::filter::test": (
    14,
    babel(
      en: [
        The function to apply to each value. Must return a boolean.
      ],
    ),
  ),
  "Args::map": (
    11,
    [
      #babel(
        en: [
          Produces a new `arguments` by transforming each argument value with the
          passed function.
        ],
      )

      ```example
      #{
        arguments(0, a: 1, 2)
          .map(v => v + 1)
      }
      ```
    ],
  ),
  "Args::map::mapper": (
    14,
    babel(
      en: [
        The function to apply to each value.
      ],
    ),
  ),
))
