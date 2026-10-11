#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "OpElem": (
    9,
    [
      #babel(
        en: [
          A text operator in an equation.
        ],
      )

      = #babel(en: [Example]) <example>
      ```example
      $ tan x = (sin x)/(cos x) $
      $ op("custom",
           limits: #true)_(n->oo) n $
      ```

      = #babel(en: short-or-long[Predefined][Predefined Operators]) <predefined>
      #babel(
        en: [
          Typst predefines the operators `arccos`, `arcsin`, `arctan`, `arg`, `cos`,
          `cosh`, `cot`, `coth`, `csc`, `csch`, `ctg`, `deg`, `det`, `dim`, `exp`,
          `gcd`, `lcm`, `hom`, `id`, `im`, `inf`, `ker`, `lg`, `lim`, `liminf`,
          `limsup`, `ln`, `log`, `max`, `min`, `mod`, `Pr`, `sec`, `sech`, `sin`,
          `sinc`, `sinh`, `sup`, `tan`, `tanh`, `tg` and `tr`.
        ],
      )
    ],
  ),
  "OpElem::text": (
    17,
    babel(
      en: [
        The operator's text.
      ],
    ),
  ),
  "OpElem::limits": (
    4,
    babel(
      en: [
        Whether the operator should show attachments as limits in display mode.
      ],
    ),
  ),
))
