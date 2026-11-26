#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Version": (
    11,
    [
      #babel(
        en: [
          A version with an arbitrary number of components.

          The first three components have names that can be used as fields: `major`,
          `minor`, `patch`. All following components do not have names.

          The list of components is semantically extended by an infinite list of
          zeros. This means that, for example, `0.8` is the same as `0.8.0`. As a
          special case, the empty version (that has no components at all) is the same
          as `0`, `0.0`, `0.0.0`, and so on.

          The current version of the Typst compiler is available as @sys.version.

          You can convert a version to an array of explicitly given components using
          the @array constructor.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      Current version: #sys.version \
      #sys.version.minor \
      #(sys.version >= version(0, 14, 0)) \
      #(version(3, 2, 0) > version(4, 1, 0))
      ```
    ],
  ),
  "Version::construct": (
    60,
    [
      #babel(
        en: [
          Creates a new version.

          It can have any number of components (even zero).
        ],
      )

      ```example
      #version() \
      #version(1) \
      #version(1, 2, 3, 4) \
      #version((1, 2, 3, 4)) \
      #version((1, 2), 3)
      ```
    ],
  ),
  "Version::construct::components": (
    13,
    babel(
      en: [
        The components of the version (array arguments are flattened)
      ],
    ),
  ),
  "Version::at": (
    18,
    [
      #babel(
        en: [
          Retrieves a component of a version.

          The returned integer is always non-negative. Returns `{0}` if the
          version isn't specified to the necessary length.
        ],
      )

      ```example
      #version(1, 2, 3).at(0) \
      #version(1, 2, 3).at(3) \
      #version(1, 2, 3).at(-1)
      ```
    ],
  ),
  "Version::at::index": (
    13,
    babel(
      en: [
        The index at which to retrieve the component. If negative, indexes
        from the back of the explicitly given components.
      ],
    ),
  ),
))
