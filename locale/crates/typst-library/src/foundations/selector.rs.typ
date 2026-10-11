#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Selector": (
    40,
    [
      #babel(
        en: [
          A filter for selecting elements within the document.

          To construct a selector you can:
          - use an @function:element-functions[element function]
          - filter for an element function with @function.where[specific fields]
          - use a @str[string] or @regex[regular expression]
          - use a @label[`{<label>}`]
          - use a @location
          - call the @selector constructor to convert any of the above types into a
            selector value and use the methods below to refine it

          Selectors are used to @reference:styling:show-rules[apply styling rules] to
          elements. You can also use selectors to @query[query] the document for
          certain types of elements.

          Furthermore, you can pass a selector to several of Typst's built-in
          functions to configure their behaviour. One such example is the
          @outline[outline] where it can be used to change which elements are listed
          within the outline.

          Multiple selectors can be combined using the methods shown below. However,
          not all kinds of selectors are supported in all places, at the moment.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #context query(
        heading.where(level: 1)
          .or(heading.where(level: 2))
      )

      = This will be found
      == So will this
      === But this will not.
      ```
    ],
  ),
  "Selector::construct": (
    120,
    babel(
      en: [
        Turns a value into a selector. The following values are accepted:
        - An element function like a `heading` or `figure`.
        - A @str[string] or @regex[regular expression].
        - A `{<label>}`.
        - A @location.
        - A more complex selector like `{heading.where(level: 1)}`.
      ],
    ),
  ),
  "Selector::construct::target": (
    8,
    babel(
      en: [
        Can be an element function like a `heading` or `figure`, a
        `{<label>}` or a more complex selector like
        `{heading.where(level: 1)}`.
      ],
    ),
  ),
  "Selector::or": (
    8,
    babel(
      en: [
        Selects all elements that match this or any of the other selectors.
      ],
    ),
  ),
  "Selector::or::others": (
    4,
    babel(
      en: [
        The other selectors to match on.
      ],
    ),
  ),
  "Selector::and": (
    7,
    babel(
      en: [
        Selects all elements that match this and all of the other selectors.
      ],
    ),
  ),
  "Selector::and::others": (
    4,
    babel(
      en: [
        The other selectors to match on.
      ],
    ),
  ),
  "Selector::before": (
    7,
    babel(
      en: [
        Returns a modified selector that will only match elements that occur
        before the first match of `end`.

        _Note:_ This selector is currently only supported with introspection
        functions, not in show rules.
      ],
    ),
  ),
  "Selector::before::end": (
    8,
    babel(
      en: [
        The original selection will end at the first match of `end`.
      ],
    ),
  ),
  "Selector::before::inclusive": (
    2,
    babel(
      en: [
        Whether `end` itself should match or not. This is only relevant if
        both selectors match the same type of element. Defaults to `{true}`.
      ],
    ),
  ),
  "Selector::after": (
    13,
    babel(
      en: [
        Returns a modified selector that will only match elements that occur
        after the first match of `start`.

        _Note:_ This selector is currently only supported with introspection
        functions, not in show rules.
      ],
    ),
  ),
  "Selector::after::start": (
    8,
    babel(
      en: [
        The original selection will start at the first match of `start`.
      ],
    ),
  ),
  "Selector::after::inclusive": (
    2,
    babel(
      en: [
        Whether `start` itself should match or not. This is only relevant if
        both selectors match the same type of element. Defaults to `{true}`.
      ],
    ),
  ),
  "Selector::within": (
    13,
    [
      #babel(
        en: [
          Returns a modified selector that will only match elements that are
          contained within any elements matching the `ancestor` selector.
        ],
      )

      #example(
        title: "Finding strong elements in lists",
        ```
        *Strong emphasis* that does not count.

        - An *important* word
        - Another *key* word

        Strong elements in lists:
        #context {
          query(selector(strong).within(list))
            .map(it => it.body)
            .join[, ]
        }
        ```,
      )

      #babel(
        en: [
          This can also be used in combination with @here to find all matches of a
          selector within a @reference:context[context] expression. This can be
          quite useful to have an introspection return results local to some
          component you are building.
        ],
      )

      #example(
        title: "Counting elements locally in a context block",
        ```
        #let count(sel, body) = context {
          let n = query(selector(sel).within(here())).len()
          [#body (#n matches)]
        }

        - #count(emph)[Has _two_ matching _elements_]
        - #count(strong)[Has *one* matching element]
        ```,
      )

      #babel(
        en: [
          _Note:_ This selector is currently only supported with introspection
          functions, not in show rules.
        ],
      )
    ],
  ),
  "Selector::within::ancestor": (
    43,
    babel(
      en: [
        Only matches of `self` that are descendants of any element matching
        this selector will be included in the output.

        An element is not considered its own ancestor.
      ],
    ),
  ),
))
