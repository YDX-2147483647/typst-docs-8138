#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Dict": (
    35,
    [
      #babel(
        en: [
          A map from string keys to values.

          You can construct a dictionary by enclosing comma-separated `key: value`
          pairs in parentheses. The values do not have to be of the same type. Since
          empty parentheses already yield an empty array, you have to use the special
          `(:)` syntax to create an empty dictionary.

          A dictionary is conceptually similar to an @array[array], but it is indexed
          by strings instead of integers. You can access and create dictionary entries
          with the `.at()` method. If you know the key statically, you can
          alternatively use @reference:scripting:fields[field access notation]
          (`.key`) to access the value. To check whether a key is present in the
          dictionary, use the `in` keyword.

          You can iterate over the pairs in a dictionary using a
          @reference:scripting:loops[for loop]. This will iterate in the order the
          pairs were inserted / declared initially.

          Dictionaries can be added with the `+` operator and
          @reference:scripting:blocks[joined together]. They can also be
          @arguments:spreading[spread] into a function call or another dictionary
          #footnote[When spreading into a dictionary, if all items between the
            parentheses are spread, you have to begin the container with `(:`, as in
            `(: ..dict, ..other_dict)`. Otherwise the container is inferred to be an
            array and an error is raised.]
          with the `..spread` operator. In each case, if a key appears multiple times,
          the last value will override the others.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #let dict = (
        name: "Typst",
        born: 2019,
      )

      #dict.name \
      #(dict.launch = 20)
      #dict.len() \
      #dict.keys() \
      #dict.values() \
      #dict.at("born") \
      #dict.insert("city", "Berlin")
      #("name" in dict)
      ```
    ],
  ),
  "Dict::construct": (
    140,
    [
      #babel(
        en: [
          Converts a value into a dictionary.

          Note that this function is only intended for conversion of a
          dictionary-like value to a dictionary, not for creation of a dictionary
          from individual pairs. Use the dictionary syntax `(key: value)` instead.
          Also see @array.to-dict for converting arrays to dictionaries.
        ],
      )

      ```example
      #dictionary(sys).at("version")
      ```
    ],
  ),
  "Dict::construct::value": (
    13,
    babel(
      en: [
        The value that should be converted to a dictionary.
      ],
    ),
  ),
  "Dict::len": (
    18,
    babel(
      en: [
        The number of pairs in the dictionary.
      ],
    ),
  ),
  "Dict::at": (
    6,
    babel(
      en: [
        Returns the value associated with the specified key in the dictionary.

        May be used on the left-hand side of an assignment if the key is already
        present in the dictionary. Returns the default value if the key is not
        part of the dictionary or fails with an error if no default value was
        specified.

        Values may also be accessed with field syntax (e.g. `{(key: 42).key}`)
        if no default is needed.
      ],
    ),
  ),
  "Dict::at::key": (
    12,
    babel(
      en: [
        The key at which to retrieve the item.
      ],
    ),
  ),
  "Dict::at::default": (
    2,
    babel(
      en: [
        A default value to return if the key is not part of the dictionary.
      ],
    ),
  ),
  "Dict::insert": (
    11,
    babel(
      en: [
        Inserts a new pair into the dictionary. If the dictionary already
        contains this key, the value is updated.

        To insert multiple pairs at once, you can alternatively add another
        dictionary with the `+=` operator.
      ],
    ),
  ),
  "Dict::insert::key": (
    8,
    babel(
      en: [
        The key of the pair that should be inserted.
      ],
    ),
  ),
  "Dict::insert::value": (
    2,
    babel(
      en: [
        The value of the pair that should be inserted.
      ],
    ),
  ),
  "Dict::remove": (
    6,
    babel(
      en: [
        Removes a pair from the dictionary by key and return the value.
      ],
    ),
  ),
  "Dict::remove::key": (
    4,
    babel(
      en: [
        The key of the pair to remove.
      ],
    ),
  ),
  "Dict::remove::default": (
    2,
    babel(
      en: [
        A default value to return if the key does not exist.
      ],
    ),
  ),
  "Dict::keys": (
    10,
    babel(
      en: [
        Returns the keys of the dictionary as an array in insertion order.
      ],
    ),
  ),
  "Dict::values": (
    6,
    babel(
      en: [
        Returns the values of the dictionary as an array in insertion order.
      ],
    ),
  ),
  "Dict::pairs": (
    6,
    babel(
      en: [
        Returns the keys and values of the dictionary as an array of pairs. Each
        pair is represented as an array of length two.
      ],
    ),
  ),
  "Dict::filter": (
    10,
    [
      #babel(
        en: [
          Produces a new dictionary with only the pairs from the original one for
          which the given function returns `{true}`.
        ],
      )

      #example(
        title: "Basic usage",
        ```
        #{
          (a: 0, b: 1, c: 2)
            .filter(v => v > 0)
        }
        ```,
      )

      #example(
        title: "Filtering based on the key instead of the value",
        ```
        #{
          (a: 0, b: 1, c: 2)
            .pairs()
            .filter(((k, v)) => k != "a")
            .to-dict()
        }
        ```,
      )
    ],
  ),
  "Dict::filter::test": (
    29,
    babel(
      en: [
        The function to apply to each value. Must return a boolean.
      ],
    ),
  ),
  "Dict::map": (
    13,
    [
      #babel(
        en: [
          Produces a new dictionary where the keys are the same, but the values
          are transformed with the given function.
        ],
      )

      ```example
      #(a: 0, b: 1, c: 2).map(v => v + 1)
      ```
    ],
  ),
  "Dict::map::mapper": (
    11,
    babel(
      en: [
        The function to apply to each value.
      ],
    ),
  ),
))
