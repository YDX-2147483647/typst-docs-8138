#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category, scope

#let math-definitions = dictionary(math)
#let math-items(..keys) = {
  keys.pos().map(k => (k, math-definitions.at(k))).to-dict()
}

#show: docs-category.with(
  title: babel(
    en: "Math",
    zh-status: "need proofread",
    zh: "数学",
  ),
  description: babel(
    en: "Documentation for math mode and the `math` module, which together enable high-quality math typesetting.",
    zh-status: "need proofread",
    zh: "Typst中与数学有关联的函数族的文档",
  ),
  category: "math",
  scope: scope(std, "math"),
  groups: (
    (
      name: "variants",
      title: babel(
        en: "Variants",
        zh-status: "need proofread",
        zh: "变体",
      ),
      definitions: math-items("serif", "sans", "frak", "mono", "bb", "cal", "scr"),
      description: "Documentation for functions which allow switching to alternative math typefaces.",
      docs: babel(
        en: [
          Alternate typefaces within formulas.

          These functions are distinct from the @text function because math fonts contain multiple variants of each letter.
        ],
        zh-status: "need proofread",
        zh: [
          公式中的备用字体。

          这些函数与@text\函数不同，因为数学字体包含每个字母的多个变体。
        ],
      ),
    ),
    (
      name: "styles",
      title: babel(
        en: "Styles",
        zh-status: "need proofread",
        zh: "样式",
      ),
      definitions: math-items("upright", "italic", "bold"),
      description: "Documentation for functions which allow switching to alternative math letterforms.",
      docs: babel(
        en: [
          Alternate letterforms within formulas.

          These functions are distinct from the @text function because math fonts contain multiple variants of each letter.
        ],
        zh-status: "need proofread",
        zh: [
          公式中的备用字形。

          这些函数与@text\函数不同，因为数学字体包含每个字母的多个变体。
        ],
      ),
    ),
    (
      name: "sizes",
      title: babel(
        en: "Sizes",
        zh-status: "need proofread",
        zh: "大小",
      ),
      definitions: math-items("display", "inline", "script", "sscript"),
      description: "Documentation for functions which allow switching to alternative math text sizes.",
      docs: babel(
        en: [
          Forced size styles for expressions within formulas.

          These functions allow manual configuration of the size of equation elements to make them look as in a display/inline equation or as if used in a root or sub/superscripts.
        ],
        zh-status: "need proofread",
        zh: [
          强制公式中表达式的大小样式。

          这些函数允许手动配置方程元素的大小，使其看起来像在显示/行内方程中使用或像在根或上/下标中使用一样。
        ],
      ),
    ),
    (
      name: "underover",
      title: babel(
        en: "Under/Over",
        zh-status: "need proofread",
        zh: "下方/上方",
      ),
      definitions: math-items(
        "underline",
        "overline",
        "underbrace",
        "overbrace",
        "underbracket",
        "overbracket",
        "underparen",
        "overparen",
        "undershell",
        "overshell",
      ),
      description: "Documentation for functions that add delimiters above or below parts of an equation.",
      docs: babel(
        en: [
          Delimiters above or below parts of an equation.

          The braces and brackets further allow you to add an optional annotation below or above themselves.

          These functions are intended specifically for adding delimiters. If you want to place two arbitrary parts of an equation over or under one another, without delimiters, use the @math.attach[`attach`] function instead.
        ],
        zh-status: "need update",
        zh: [
          方程的部分上方或下方的定界符。

          大括号和方括号还允许在它们自己的下方或上方添加可选的注释。
        ],
      ),
    ),
    (
      name: "roots",
      title: babel(
        en: "Roots",
        zh-status: "need proofread",
        zh: "根",
      ),
      definitions: math-items("root", "sqrt"),
      description: "Documentation for functions that typeset mathematical roots.",
      docs: [
        #babel(
          en: [
            Square and non-square roots.
          ],
          zh-status: "need proofread",
          zh: [
            平方根和非平方根。
          ],
        )

        = #babel(en: [Example], zh-status: "proofread", zh: [示例]) <example>
        ```example
        $ sqrt(3 - 2 sqrt(2)) = sqrt(2) - 1 $
        $ root(3, x) $
        ```
      ],
    ),
    (
      name: "attach",
      title: babel(
        en: "Attach",
        zh-status: "need proofread",
        zh: "附加",
      ),
      definitions: math-items("attach", "scripts", "limits"),
      description: "Documentation for functions that allows to precisely attach sub-, superscripts, and limits to parts of an equation.",
      docs: [
        #babel(
          en: [
            Subscript, superscripts, and limits.

            Attachments can be displayed either as sub/superscripts, or limits. Typst automatically decides which is more suitable depending on the base, but you can also control this manually with the `scripts` and `limits` functions.

            If you want the base to stretch to fit long top and bottom attachments (for example, an arrow with text above it), use the @math.stretch[`stretch`] function.
          ],
          zh-status: "need update",
          zh: [
            下标、上标和限制。

            附件可以显示为上/下标或限制。Typst会根据基数自动决定哪个更适合，但您还可以使用`scripts`和`limits`函数手动控制。
          ],
        )

        = #babel(en: [Example], zh-status: "proofread", zh: [示例]) <example>
        ```example
        $ sum_(i=0)^n a_i = 2^(1+i) $
        ```

        = #babel(en: [Syntax], zh-status: "proofread", zh: [语法]) <syntax>
        #babel(
          en: [
            This function also has dedicated syntax for attachments after the base: Use the underscore (`_`) to indicate a subscript i.e. bottom attachment and the hat (`^`) to indicate a superscript i.e. top attachment.
          ],
          zh-status: "need proofread",
          zh: [
            此函数还具有用于在基数之后附加的专用语法：使用下划线（`_`）表示下标，即底部附件，使用脱帽（`^`）表示上标，即顶部附件。
          ],
        )
      ],
    ),
    (
      name: "lr",
      title: babel(
        en: "Left/Right",
        zh-status: "need proofread",
        zh: "左/右",
      ),
      definitions: math-items("lr", "mid", "abs", "norm", "floor", "ceil", "round"),
      description: "Documentation for functions that enable typesetting of matched, potentially scaled, delimiters.",
      docs: [
        #babel(
          en: [
            Delimiter matching.

            The `lr` function allows you to match two delimiters and scale them with the content they contain. While this also happens automatically for delimiters that match syntactically, `lr` allows you to match two arbitrary delimiters and control their size exactly. Apart from the `lr` function, Typst provides a few more functions that create delimiter pairings for absolute, ceiled, and floored values as well as norms.

            To prevent a delimiter from being matched by Typst, and thus auto-scaled, escape it with a backslash. To instead disable auto-scaling completely, use `{set math.lr(size: 1em)}`.
          ],
          zh-status: "need proofread",
          zh: [
            定界符匹配。

            `lr`函数允许您匹配两个定界符并按其包含的内容缩放它们。虽然在语法上匹配的定界符也会自动进行，但`lr`允许您匹配两个任意的定界符并精确控制它们的大小。除了`lr`函数外，Typst还提供了一些创建绝对值、上取整和下取整值以及范数的定界符配对的其他函数。
          ],
        )

        = #babel(en: [Example], zh-status: "proofread", zh: [示例]) <example>
        ```example
        $ [a, b/2] $
        $ lr(]sum_(x=1)^n], size: #50%) x $
        $ abs((x + y) / 2) $
        $ \{ (x / y) \} $
        #set math.lr(size: 1em)
        $ { (a / b), a, b in (0; 1/2] } $
        ```
      ],
    ),
    (
      name: "spaces",
      title: "Spaces",
      definitions: math-items("thin", "med", "thick", "quad", "wide"),
      description: "Documentation for math spaces.",
      docs: [
        Predefined mathematical spaces of various widths.
      ],
    ),
  ),
)

Typst has special @reference:syntax:math[syntax] and library functions to typeset mathematical formulas. Math formulas can be displayed inline with text or as separate blocks. They will be typeset into their own block if they start and end with at least one space (e.g. `[$ x^2 $]`).

= Variables <variables>
In math, single letters are always displayed as is. Multiple letters, however, are interpreted as variables and functions. To display multiple letters verbatim, you can place them into quotes and to access single letter variables, you can use the @reference:scripting:expressions[hash syntax].

```example
$ A = pi r^2 $
$ "area" = pi dot "radius"^2 $
$ cal(A) :=
    { x in RR | x "is natural" } $
#let x = 5
$ #x < 17 $
```

= Symbols <symbols>
Math mode makes a wide selection of @sym[symbols] like `pi`, `dot`, or `RR` available. Many mathematical symbols are available in different variants. You can select between different variants by applying @symbol[modifiers] to the symbol. Typst further recognizes a number of shorthand sequences like `=>` that approximate a symbol. When such a shorthand exists, the symbol's documentation lists it.

```example
$ x < y => x gt.eq.not y $
```

= Line Breaks <line-breaks>
Formulas can also contain line breaks. Each line can contain one or multiple _alignment points_ (`&`) which are then aligned.

```example
$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $
```

= Function calls <function-calls>
Math mode supports special function calls without the hash prefix. In these "math calls", the argument list works a little differently than in code:

- Within them, Typst is still in "math mode". Thus, you can write math directly into them, but need to use hash syntax to pass code expressions (except for strings, which are available in the math syntax).
- They support positional and named arguments, as well as argument spreading, but don't support trailing content blocks.
- They provide additional syntax for 2-dimensional argument lists. The semicolon (`;`) merges preceding arguments separated by commas into an array argument.

```example
$ frac(a^2, 2) $
$ vec(1, 2, delim: "[") $
$ mat(1, 2; 3, 4) $
$ mat(..#range(1, 5).chunks(2)) $
$ lim_x =
    op("lim", limits: #true)_x $
```

To write a verbatim comma or semicolon in a math call, escape it with a backslash. The colon on the other hand is only recognized in a special way if directly preceded by an identifier, so to display it verbatim in those cases, you can just insert a space before it.

Functions calls preceded by a hash are normal code function calls and not affected by these rules.

= Alignment <alignment>
When equations include multiple _alignment points_ (`&`), this creates blocks of alternatingly right- and left-aligned columns. In the example below, the expression `(3x + y) / 7` is right-aligned and `= 9` is left-aligned. The word "given" is also left-aligned because `&&` creates two alignment points in a row, alternating the alignment twice. `& &` and `&&` behave exactly the same way. Meanwhile, "multiply by 7" is right-aligned because just one `&` precedes it. Each alignment point simply alternates between right-aligned/left-aligned.

```example
$ (3x + y) / 7 &= 9 && "given" \
  3x + y &= 63 & "multiply by 7" \
  3x &= 63 - y && "subtract y" \
  x &= 21 - y/3 & "divide by 3" $
```

= Math fonts <math-fonts>
You can set the math font with a @reference:styling:show-rules[show-set rule] as demonstrated below. Note that only special OpenType math fonts are suitable for typesetting maths.

```example
#show math.equation: set text(font: "Pennstander Math")
$ sum_(i in NN) 1 + i $
```

= Math module <math-module>
All math functions are part of the `math` @reference:scripting:modules[module], which is available by default in equations. Outside of equations, they can be accessed with the `math.` prefix.

= Accessibility <accessibility>
To make math accessible, you must provide alternative descriptions of equations in natural language using the @math.equation.alt[`alt` parameter of `math.equation`]. For more information, see the @guides:accessibility:textual-representations[Textual Representations section of the Accessibility Guide].

```example
#math.equation(
  alt: "d S equals delta q divided by T",
  block: true,
  $ dif S = (delta q) / T $,
)
```

In the future, Typst will automatically make equations without alternative descriptions accessible in HTML and PDF 2.0 export.
