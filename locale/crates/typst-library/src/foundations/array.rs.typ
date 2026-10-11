#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Array": (
    42,
    [
      #babel(
        en: [
          A sequence of values.

          You can construct an array by enclosing a comma-separated sequence of values
          in parentheses. The values do not have to be of the same type.

          You can access and update array items with the `.at()` method. Indices are
          zero-based and negative indices wrap around to the end of the array. You can
          iterate over an array using a @reference:scripting:loops[for loop]. Arrays
          can be added together with the `+` operator,
          @reference:scripting:blocks[joined together] and multiplied with integers.

          *Note:* An array of length one needs a trailing comma, as in `{(1,)}`. This
          is to disambiguate from a simple parenthesized expressions like
          `{(1 + 2) * 3}`. An empty array is written as `{()}`.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #let values = (1, 7, 4, -3, 2)

      #values.at(0) \
      #(values.at(0) = 3)
      #values.at(-1) \
      #values.find(calc.even) \
      #values.filter(calc.odd) \
      #values.map(calc.abs) \
      #values.rev() \
      #(1, (2, 3)).flatten() \
      #(("A", "B", "C")
          .join(", ", last: " and "))
      ```
    ],
  ),
  "Array::construct": (
    110,
    [
      #babel(
        en: [
          Converts a value to an array.

          Note that this function is only intended for conversion of a
          collection-like value to an array, not for creation of an array from
          individual items. Use the array syntax `(1, 2, 3)` (or `(1,)` for a
          single-element array) instead.
        ],
      )

      ```example
      #let hi = "Hello 😃"
      #array(bytes(hi))
      ```
    ],
  ),
  "Array::construct::value": (
    13,
    babel(
      en: [
        The value that should be converted to an array.
      ],
    ),
  ),
  "Array::len": (
    6,
    babel(
      en: [
        The number of values in the array.
      ],
    ),
  ),
  "Array::first": (
    6,
    babel(
      en: [
        Returns the first item in the array. May be used on the left-hand side of
        an assignment. Returns the default value if the array is empty or fails
        with an error if no default value was specified.
      ],
    ),
  ),
  "Array::first::default": (
    6,
    babel(
      en: [
        A default value to return if the array is empty.
      ],
    ),
  ),
  "Array::last": (
    7,
    babel(
      en: [
        Returns the last item in the array. May be used on the left-hand side of
        an assignment. Returns the default value if the array is empty or fails
        with an error if no default value was specified.
      ],
    ),
  ),
  "Array::last::default": (
    6,
    babel(
      en: [
        A default value to return if the array is empty.
      ],
    ),
  ),
  "Array::at": (
    7,
    babel(
      en: [
        Returns the item at the specified index in the array. May be used on the
        left-hand side of an assignment. Returns the default value if the index
        is out of bounds or fails with an error if no default value was
        specified.
      ],
    ),
  ),
  "Array::at::index": (
    7,
    babel(
      en: [
        The index at which to retrieve the item. If negative, indexes from
        the back.
      ],
    ),
  ),
  "Array::at::default": (
    3,
    babel(
      en: [
        A default value to return if the index is out of bounds.
      ],
    ),
  ),
  "Array::push": (
    10,
    babel(
      en: [
        Adds a value to the end of the array.
      ],
    ),
  ),
  "Array::push::value": (
    4,
    babel(
      en: [
        The value to insert at the end of the array.
      ],
    ),
  ),
  "Array::pop": (
    6,
    babel(
      en: [
        Removes the last item from the array and returns it. Fails with an error
        if the array is empty.
      ],
    ),
  ),
  "Array::insert": (
    7,
    babel(
      en: [
        Inserts a value into the array at the specified index, shifting all
        subsequent elements to the right. Fails with an error if the index is
        out of bounds.

        To replace an element of an array, use @array.at[`at`].
      ],
    ),
  ),
  "Array::insert::index": (
    8,
    babel(
      en: [
        The index at which to insert the item. If negative, indexes from the
        back.
      ],
    ),
  ),
  "Array::insert::value": (
    3,
    babel(
      en: [
        The value to insert into the array.
      ],
    ),
  ),
  "Array::remove": (
    8,
    babel(
      en: [
        Removes the value at the specified index from the array and return it.
      ],
    ),
  ),
  "Array::remove::index": (
    4,
    babel(
      en: [
        The index at which to remove the item. If negative, indexes from the
        back.
      ],
    ),
  ),
  "Array::remove::default": (
    3,
    babel(
      en: [
        A default value to return if the index is out of bounds.
      ],
    ),
  ),
  "Array::slice": (
    10,
    babel(
      en: [
        Extracts a subslice of the array. Fails with an error if the start or
        end index is out of bounds.
      ],
    ),
  ),
  "Array::slice::start": (
    5,
    babel(
      en: [
        The start index (inclusive). If negative, indexes from the back.
      ],
    ),
  ),
  "Array::slice::end": (
    2,
    babel(
      en: [
        The end index (exclusive). If omitted, the whole slice until the end
        of the array is extracted. If negative, indexes from the back.
      ],
    ),
  ),
  "Array::slice::count": (
    4,
    babel(
      en: [
        The number of items to extract. This is equivalent to passing
        `start + count` as the `end` position. Mutually exclusive with
        `end`.
      ],
    ),
  ),
  "Array::contains": (
    15,
    babel(
      en: [
        Whether the array contains the specified value.

        This method also has dedicated syntax: You can write `{2 in (1, 2, 3)}`
        instead of `{(1, 2, 3).contains(2)}`.
      ],
    ),
  ),
  "Array::contains::value": (
    7,
    babel(
      en: [
        The value to search for.
      ],
    ),
  ),
  "Array::find": (
    6,
    babel(
      en: [
        Searches for an item for which the given function returns `{true}` and
        returns the first match or `{none}` if there is no match.
      ],
    ),
  ),
  "Array::find::searcher": (
    7,
    babel(
      en: [
        The function to apply to each item. Must return a boolean.
      ],
    ),
  ),
  "Array::position": (
    15,
    babel(
      en: [
        Searches for an item for which the given function returns `{true}` and
        returns the index of the first match or `{none}` if there is no match.
      ],
    ),
  ),
  "Array::position::searcher": (
    7,
    [
      #babel(
        en: [
          The function to apply to each item. Must return a boolean.
        ],
      )

      ```example
      #let values = (1, 7, 4, 6, 9)
      #values.position(x => calc.even(x)) \
      // Or equivalently:
      #values.position(calc.even)
      ```
    ],
  ),
  "Array::range": (
    23,
    [
      #babel(
        en: [
          Create an array consisting of a sequence of numbers.

          If you pass just one positional parameter, it is interpreted as the
          `end` of the range. If you pass two, they describe the `start` and `end`
          of the range.

          This function is available both in the array function's scope and
          globally.
        ],
      )

      ```example
      #range(5) \
      #range(2, 5) \
      #range(20, step: 4) \
      #range(21, step: 4) \
      #range(5, 2, step: -1)
      ```
    ],
  ),
  "Array::range::start": (
    19,
    babel(
      en: [
        The start of the range (inclusive).
      ],
    ),
  ),
  "Array::range::end": (
    4,
    babel(
      en: [
        The end of the range.
      ],
    ),
  ),
  "Array::range::inclusive": (
    3,
    [
      #babel(
        en: [
          Whether `end` is inclusive.
        ],
      )

      ```example
      #range(0, inclusive: true) \
      #range(7, 10, inclusive: true) \
      #range(-8, -4, inclusive: true) \
      #range(-6, step: -2, inclusive: true)
      ```
    ],
  ),
  "Array::range::step": (
    11,
    babel(
      en: [
        The distance between the generated numbers.
      ],
    ),
  ),
  "Array::filter": (
    41,
    babel(
      en: [
        Produces a new array with only the items from the original one for which
        the given function returns `{true}`.
      ],
    ),
  ),
  "Array::filter::test": (
    7,
    babel(
      en: [
        The function to apply to each item. Must return a boolean.
      ],
    ),
  ),
  "Array::map": (
    16,
    babel(
      en: [
        Produces a new array in which all items from the original one were
        transformed with the given function.
      ],
    ),
  ),
  "Array::map::mapper": (
    7,
    babel(
      en: [
        The function to apply to each item.
      ],
    ),
  ),
  "Array::enumerate": (
    8,
    [
      #babel(
        en: [
          Returns a new array with the values alongside their indices.

          The returned array consists of `(index, value)` pairs in the form of
          length-2 arrays. These can be
          @reference:scripting:bindings[destructured] with a let binding or for
          loop.
        ],
      )

      ```example
      #for (i, value) in ("A", "B", "C").enumerate() {
        [#i: #value \ ]
      }

      #("A", "B", "C").enumerate(start: 1)
      ```
    ],
  ),
  "Array::enumerate::start": (
    17,
    babel(
      en: [
        The index returned for the first pair of the returned list.
      ],
    ),
  ),
  "Array::zip": (
    19,
    babel(
      en: [
        Zips the array with other arrays.

        Returns an array of arrays, where the `i`th inner array contains all the
        `i`th elements from each original array.

        If the arrays to be zipped have different lengths, they are zipped up to
        the last element of the shortest array and all remaining elements are
        ignored.

        This function is variadic, meaning that you can zip multiple arrays
        together at once: `{(1, 2).zip(("A", "B"), (10, 20))}` yields
        `{((1, "A", 10), (2, "B", 20))}`.
      ],
    ),
  ),
  "Array::zip::exact": (
    16,
    babel(
      en: [
        Whether all arrays have to have the same length. For example,
        `{(1, 2).zip((1, 2, 3), exact: true)}` produces an error.
      ],
    ),
  ),
  "Array::zip::others": (
    5,
    babel(
      en: [
        The arrays to zip with.
      ],
    ),
  ),
  "Array::fold": (
    75,
    [
      #babel(
        en: [
          Folds all items into a single value using an accumulator function.
        ],
      )

      ```example
      #let array = (1, 2, 3, 4)
      #array.fold(0, (acc, x) => acc + x)
      ```
    ],
  ),
  "Array::fold::init": (
    11,
    babel(
      en: [
        The initial value to start with.
      ],
    ),
  ),
  "Array::fold::folder": (
    2,
    babel(
      en: [
        The folding function. Must have two parameters: One for the
        accumulated value and one for an item.
      ],
    ),
  ),
  "Array::sum": (
    11,
    babel(
      en: [
        Sums all items (works for all types that can be added).
      ],
    ),
  ),
  "Array::sum::default": (
    4,
    babel(
      en: [
        What to return if the array is empty. Must be set if the array can
        be empty.
      ],
    ),
  ),
  "Array::product": (
    16,
    babel(
      en: [
        Calculates the product of all items (works for all types that can be
        multiplied).
      ],
    ),
  ),
  "Array::product::default": (
    5,
    babel(
      en: [
        What to return if the array is empty. Must be set if the array can
        be empty.
      ],
    ),
  ),
  "Array::any": (
    16,
    babel(
      en: [
        Whether the given function returns `{true}` for any item in the array.
      ],
    ),
  ),
  "Array::any::test": (
    6,
    babel(
      en: [
        The function to apply to each item. Must return a boolean.
      ],
    ),
  ),
  "Array::all": (
    12,
    babel(
      en: [
        Whether the given function returns `{true}` for all items in the array.
      ],
    ),
  ),
  "Array::all::test": (
    6,
    babel(
      en: [
        The function to apply to each item. Must return a boolean.
      ],
    ),
  ),
  "Array::flatten": (
    12,
    babel(
      en: [
        Combine all nested arrays into a single flat one.
      ],
    ),
  ),
  "Array::rev": (
    14,
    babel(
      en: [
        Return a new array with the same items, but in reverse order.
      ],
    ),
  ),
  "Array::split": (
    6,
    [
      #babel(
        en: [
          Split the array at occurrences of the specified value.
        ],
      )

      ```example
      #(1, 1, 2, 3, 2, 4, 5).split(2)
      ```
    ],
  ),
  "Array::split::at": (
    8,
    babel(
      en: [
        The value to split at.
      ],
    ),
  ),
  "Array::join": (
    9,
    babel(
      en: [
        Combine all items in the array into one.
      ],
    ),
  ),
  "Array::join::separator": (
    4,
    babel(
      en: [
        A value to insert between each item of the array.
      ],
    ),
  ),
  "Array::join::last": (
    3,
    babel(
      en: [
        An alternative separator between the last two items.
      ],
    ),
  ),
  "Array::join::default": (
    3,
    babel(
      en: [
        What to return if the array is empty.
      ],
    ),
  ),
  "Array::intersperse": (
    32,
    [
      #babel(
        en: [
          Returns an array with a copy of the separator value placed between
          adjacent elements.
        ],
      )

      ```example
      #("A", "B", "C").intersperse("-")
      ```
    ],
  ),
  "Array::intersperse::separator": (
    9,
    babel(
      en: [
        The value that will be placed between each adjacent element.
      ],
    ),
  ),
  "Array::chunks": (
    24,
    [
      #babel(
        en: [
          Splits an array into non-overlapping chunks, starting at the beginning,
          ending with a single remainder chunk.

          All chunks but the last have `chunk-size` elements. If `exact` is set to
          `{true}`, the remainder is dropped if it contains less than `chunk-size`
          elements.
        ],
      )

      ```example
      #let array = (1, 2, 3, 4, 5, 6, 7, 8)
      #array.chunks(3) \
      #array.chunks(3, exact: true)
      ```
    ],
  ),
  "Array::chunks::chunk_size": (
    15,
    babel(
      en: [
        How many elements each chunk may at most contain.
      ],
    ),
  ),
  "Array::chunks::exact": (
    2,
    babel(
      en: [
        Whether to discard the remainder if its size is less than
        `chunk-size`.
      ],
    ),
  ),
  "Array::windows": (
    14,
    [
      #babel(
        en: [
          Returns sliding windows of `window-size` elements over an array.

          If the array length is less than `window-size`, this will return an
          empty array.
        ],
      )

      ```example
      #let array = (1, 2, 3, 4, 5, 6, 7, 8)
      #array.windows(5)
      ```
    ],
  ),
  "Array::windows::window_size": (
    12,
    babel(
      en: [
        How many elements each window will contain.
      ],
    ),
  ),
  "Array::sorted": (
    9,
    [
      #babel(
        en: [
          Return a sorted version of this array, optionally by a given key
          function. The sorting algorithm used is stable.

          Returns an error if a pair of values selected for comparison could not
          be compared, or if the key or comparison function (if given) yield an
          error.

          To sort according to multiple criteria at once, e.g. in case of equality
          between some criteria, the key function can return an array. The results
          are in lexicographic order.
        ],
      )

      ```example
      #let array = (
        (a: 2, b: 4),
        (a: 1, b: 5),
        (a: 2, b: 3),
      )
      #array.sorted(key: it => (it.a, it.b))
      ```
    ],
  ),
  "Array::sorted::key": (
    25,
    babel(
      en: [
        If given, applies this function to each element in the array to
        determine the keys to sort by.
      ],
    ),
  ),
  "Array::sorted::by": (
    4,
    [
      #babel(
        en: [
          If given, uses this function to compare every two elements in the
          array.

          The function will receive two elements in the array for comparison,
          and should return a boolean indicating their order: `{true}`
          indicates that the elements are in order, while `{false}` indicates
          that they should be swapped. To keep the sort stable, if the two
          elements are equal, the function should return `{true}`.

          If this function does not order the elements properly (e.g., by
          returning `{false}` for both `{(x, y)}` and `{(y, x)}`, or for
          `{(x, x)}`), the resulting array will be in unspecified order.

          When used together with `key`, `by` will be passed the keys instead
          of the elements.
        ],
      )

      ```example
      #(
        "sorted",
        "by",
        "decreasing",
        "length",
      ).sorted(
        key: s => s.len(),
        by: (l, r) => l >= r,
      )
      ```
    ],
  ),
  "Array::dedup": (
    144,
    [
      #babel(
        en: [
          Deduplicates all items in the array.

          Returns a new array with all duplicate items removed. Only the first
          element of each duplicate is kept.
        ],
      )

      ```example
      #(3, 3, 1, 2, 3).dedup()
      ```
    ],
  ),
  "Array::dedup::key": (
    13,
    [
      #babel(
        en: [
          If given, applies this function to each element in the array to
          determine the keys to deduplicate by.
        ],
      )

      ```example
      #("apple", "banana", " apple ").dedup(key: s => s.trim())
      ```
    ],
  ),
  "Array::to_dict": (
    39,
    [
      #babel(
        en: [
          Converts an array of pairs into a dictionary. The first value of each
          pair is the key, the second the value.

          If the same key occurs multiple times, the last value is selected.
        ],
      )

      ```example
      #(
        ("apples", 2),
        ("peaches", 3),
        ("apples", 5),
      ).to-dict()
      ```
    ],
  ),
  "Array::reduce": (
    32,
    [
      #babel(
        en: [
          Reduces the elements to a single one, by repeatedly applying a reducing
          operation.

          If the array is empty, returns `{none}`, otherwise, returns the result
          of the reduction.

          The reducing function is a closure with two arguments: an "accumulator",
          and an element.

          For arrays with at least one element, this is the same as @array.fold
          with the first element of the array as the initial accumulator value,
          folding every subsequent element into it.
        ],
      )

      ```example
      #let array = (2, 1, 4, 3)
      #array.reduce((acc, x) => calc.max(acc, x))
      ```
    ],
  ),
  "Array::reduce::reducer": (
    22,
    babel(
      en: [
        The reducing function. Must have two parameters: One for the
        accumulated value and one for an item.
      ],
    ),
  ),
))
