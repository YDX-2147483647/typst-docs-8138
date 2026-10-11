#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Content": (
    39,
    [
      #babel(
        en: [
          A piece of document content.

          This type is at the heart of Typst. All markup you write and most
          @function[functions] you call produce content values. You can create a
          content value by enclosing markup in square brackets. This is also how you
          pass content to functions.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Type of *Hello!* is
      #type([*Hello!*])
      ```

      #babel(
        en: [
          Content can be added with the `+` operator,
          @reference:scripting:blocks[joined together] and multiplied with integers.
          Wherever content is expected, you can also pass a @str[string] or `{none}`.
        ],
      )

      = #babel(en: [Representation]) <representation>
      #babel(
        en: [
          Content consists of elements with fields. When constructing an element with
          its _element function,_ you provide these fields as arguments and when you
          have a content value, you can access its fields with
          @reference:scripting:fields[field access syntax].

          Some fields are required: These must be provided when constructing an
          element and as a consequence, they are always available through field access
          on content of that type. Required fields are marked as such in the
          documentation.

          Most fields are optional: Like required fields, they can be passed to the
          element function to configure them for a single element. However, these can
          also be configured with @reference:styling:set-rules[set rules] to apply
          them to all elements within a scope. Optional fields are only available with
          field access syntax when they were explicitly passed to the element
          function, not when they result from a set rule.

          Each element has a default appearance. However, you can also completely
          customize its appearance with a @reference:styling:show-rules[show rule].
          The show rule is passed the element. It can access the element's field and
          produce arbitrary content from it.

          In the web app, you can hover over a content variable to see exactly which
          elements the content is composed of and what fields they have.
          Alternatively, you can inspect the output of the @repr function.
        ],
      )
    ],
  ),
  "Content::func": (
    489,
    babel(
      en: [
        The content's element function. This function can be used to create the
        element contained in this content. It can be used in set and show rules
        for the element. Can be compared with global functions to check whether
        you have a specific kind of element.
      ],
    ),
  ),
  "Content::has": (
    9,
    babel(
      en: [
        Whether the content has the specified field.
      ],
    ),
  ),
  "Content::has::field": (
    4,
    babel(
      en: [
        The field to look for.
      ],
    ),
  ),
  "Content::at": (
    17,
    babel(
      en: [
        Access the specified field on the content. Returns the default value if
        the field does not exist or fails with an error if no default value was
        specified.
      ],
    ),
  ),
  "Content::at::field": (
    6,
    babel(
      en: [
        The field to access.
      ],
    ),
  ),
  "Content::at::default": (
    2,
    babel(
      en: [
        A default value to return if the field does not exist.
      ],
    ),
  ),
  "Content::fields": (
    9,
    [
      #babel(
        en: [
          Returns the fields of this content.
        ],
      )

      ```example
      #rect(
        width: 10cm,
        height: 10cm,
      ).fields()
      ```
    ],
  ),
  "Content::location": (
    22,
    babel(
      en: [
        The location of the content. This is only available on content returned
        by @query[query] or provided by a
        @reference:styling:show-rules[show rule], for other content it will be
        `{none}`. The resulting location can be used with @counter[counters],
        @state[state] and @query[queries].
      ],
    ),
  ),
))
