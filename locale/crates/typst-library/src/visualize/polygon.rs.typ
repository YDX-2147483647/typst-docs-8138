#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "PolygonElem": (
    9,
    [
      #babel(
        en: [
          A closed polygon.

          The polygon is defined by its corner points and is closed automatically.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      #polygon(
        fill: blue.lighten(80%),
        stroke: blue,
        (20%, 0pt),
        (60%, 0pt),
        (80%, 2cm),
        (0%,  2cm),
      )
      ```
    ],
  ),
  "PolygonElem::fill": (
    17,
    babel(
      en: [
        How to fill the polygon.

        When setting a fill, the default stroke disappears. To create a
        rectangle with both fill and stroke, you have to configure both.
      ],
    ),
  ),
  "PolygonElem::fill_rule": (
    6,
    babel(
      en: [
        The drawing rule used to fill the polygon.

        See the @curve.fill-rule[curve documentation] for an example.
      ],
    ),
  ),
  "PolygonElem::stroke": (
    6,
    babel(
      en: [
        How to @stroke[stroke] the polygon.

        Can be set to `{none}` to disable the stroke or to `{auto}` for a stroke
        of `{1pt}` black if and only if no fill is given.
      ],
    ),
  ),
  "PolygonElem::vertices": (
    7,
    babel(
      en: [
        The vertices of the polygon. Each point is specified as an array of two
        @relative[relative lengths].
      ],
    ),
  ),
  "PolygonElem::regular": (
    8,
    [
      #babel(
        en: [
          A regular polygon, defined by its size and number of vertices.
        ],
      )

      ```example
      #polygon.regular(
        fill: blue.lighten(80%),
        stroke: blue,
        size: 30pt,
        vertices: 3,
      )
      ```
    ],
  ),
  "PolygonElem::regular::fill": (
    14,
    babel(
      en: [
        How to fill the polygon. See the general
        @polygon.fill[polygon's documentation] for more details.
      ],
    ),
  ),
  "PolygonElem::regular::stroke": (
    5,
    babel(
      en: [
        How to stroke the polygon. See the general
        @polygon.stroke[polygon's documentation] for more details.
      ],
    ),
  ),
  "PolygonElem::regular::size": (
    5,
    babel(
      en: [
        The diameter of the
        #link("https://en.wikipedia.org/wiki/Circumcircle")[circumcircle] of
        the regular polygon.
      ],
    ),
  ),
  "PolygonElem::regular::vertices": (
    7,
    babel(
      en: [
        The number of vertices in the polygon.
      ],
    ),
  ),
))
