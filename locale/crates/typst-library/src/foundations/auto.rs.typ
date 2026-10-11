#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "AutoValue": (
    12,
    babel(
      en: [
        A value that indicates a smart default.

        The auto type has exactly one value: `{auto}`.

        Parameters that support the `{auto}` value have some smart default or
        contextual behaviour. A good example is the @text.dir[text direction]
        parameter. Setting it to `{auto}` lets Typst automatically determine the
        direction from the @text.lang[text language].
      ],
    ),
  ),
))
