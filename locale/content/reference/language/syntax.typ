#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-table, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Syntax",
    zh-status: "proofread",
    zh: "语法",
  ),
  route: "/reference/syntax",
  description: babel(
    en: "A compact reference for Typst's syntax. Learn more about the language within markup, math, and code mode.",
    zh-status: "need proofread",
    zh: "Typst 语法简略参考索引。更多请参考语言的标记模式，数学公式模式和代码模式。",
  ),
)

#babel(
  en: [
    Typst is a markup language. This means that you can use simple syntax to accomplish common layout tasks. The lightweight markup syntax is complemented by set and show rules, which let you style your document easily and automatically. All this is backed by a tightly integrated scripting language with built-in and user-defined functions.
  ],
  zh-status: "need proofread",
  zh: [
    Typst是一种标记语言。这意味着，使用简单的语法就可以进行常用的布局操作，再辅以set和show规则，格式化文档更加简单，更加自动化，这些均是基于紧密集成在Typst内的脚本语言，其内置大量常用函数，用户亦可根据需求自定义函数。
  ],
)

= Modes <modes>
Typst has three syntactical modes: Markup, math, and code. Markup mode is the default in a Typst document, math mode lets you write mathematical formulas, and code mode lets you use Typst's scripting features.

You can switch to a specific mode at any point by referring to the following table:

#docs-table(
  table.header[New mode][Syntax][Example],

  [Code],
  [Prefix the code with `#`],
  [`[Number: #(1 + 2)]`],

  [Math],
  [Surround equation with `[$..$]`],
  [`[$-x$ is the opposite of $x$]`],

  [Markup],
  [Surround markup with `[[..]]`],
  [`{let name = [*Typst!*]}`],
)

Once you have entered code mode with `#`, you don't need to use further hashes unless you switched back to markup or math mode in between.

= #babel(en: [Markup], zh-status: "proofread", zh: [标记模式]) <markup>
#babel(
  en: [
    Typst provides built-in markup for the most common document elements. Most of the syntax elements are just shortcuts for a corresponding function. The table below lists all markup that is available and links to the  best place to learn more about their syntax and usage.
  ],
  zh-status: "need proofread",
  zh: [
    Typst为常用文档元素内置了语法标记。这些语法标记大多只是相关函数的快捷表达方式，下表列出了所有语法标记，以及它们的详细使用的链接地址。
  ],
)

#let i18n--table-header = table.header(
  babel(en: [Name], zh-status: "proofread", zh: [名称]),
  babel(en: [Example], zh-status: "proofread", zh: [示例]),
  babel(en: [See], zh-status: "proofread", zh: [详情链接]),
)

#docs-table(
  i18n--table-header,

  babel(en: [Paragraph break], zh-status: "need proofread", zh: [段落中断]),
  babel(en: [Blank line], zh-status: "proofread", zh: [空行]),
  [@parbreak],

  babel(en: [Strong emphasis], zh-status: "need proofread", zh: [着重强调]),
  [`[*strong*]`],
  [@strong],

  babel(en: [Emphasis], zh-status: "need proofread", zh: [强调]),
  [`[_emphasis_]`],
  [@emph],

  babel(en: [Raw text], zh-status: "proofread", zh: [代码段]),
  [``` [`print(1)`]```],
  [@raw],

  babel(en: [Link], zh-status: "proofread", zh: [链接]),
  [`[https://typst.app/]`],
  [@link],

  babel(en: [Label], zh-status: "proofread", zh: [标签]),
  [`[<intro>]`],
  [@label],

  babel(en: [Reference], zh-status: "proofread", zh: [交叉引用]),
  [`[@intro]`],
  [@ref],

  babel(en: [Heading], zh-status: "proofread", zh: [章节标题]),
  [`[= Heading]`],
  [@heading],

  babel(en: [Bullet list], zh-status: "proofread", zh: [项目符号列表]),
  [`[- item]`],
  [@list],

  babel(en: [Numbered list], zh-status: "proofread", zh: [编号列表]),
  [`[+ item]`],
  [@enum],

  babel(en: [Term list], zh-status: "proofread", zh: [术语列表]),
  [`[/ Term: description]`],
  [@terms],

  babel(en: [Math], zh-status: "proofread", zh: [数学公式]),
  [`[$x^2$]`],
  [@math[Math]],

  babel(en: [Line break], zh-status: "need proofread", zh: [行中断]),
  [`[\]`],
  [@linebreak],

  babel(en: [Smart quote], zh-status: "proofread", zh: [智能引号]),
  [`['single' or "double"]`],
  [@smartquote],

  babel(en: [Symbol shorthand], zh-status: "need proofread", zh: [快捷符号]),
  [`[~]`, `[---]`],
  [@reference:symbols:shorthands[Symbols]],

  babel(en: [Code expression], zh-status: "need proofread", zh: [代码表达式]),
  [`[#rect(width: 1cm)]`],
  [@reference:scripting:expressions[Scripting]],

  babel(en: [Character escape], zh-status: "proofread", zh: [转义字符]),
  [`[Tweet at us \#ad]`],
  [@reference:syntax:escapes[Below]],

  babel(en: [Comment], zh-status: "proofread", zh: [注释]),
  [`[/* block */]`, `[// line]`],
  [@reference:syntax:comments[Below]],
)

= #babel(en: short-or-long[Math][Math mode], zh-status: "proofread", zh: [数学模式])  <math>
#babel(
  en: [
    Math mode is a special markup mode that is used to typeset mathematical formulas. It is entered by wrapping an equation in `[$]` characters. This works both in markup and code. The equation will be typeset into its own block if it starts and ends with at least one space (e.g. `[$ x^2 $]`). Inline math can be produced by omitting the whitespace (e.g. `[$x^2$]`). An overview over the syntax specific to math mode follows:
  ],
  zh-status: "need proofread",
  zh: [
    数学模式是一种特殊的语法标记模式，专门用来输入数学公式。通过`[$]`字符包裹一个数学公式，如果这个公式头尾都至少一个空格（例如`[$ x^2 $]`），这个公式将会形成一个文档块，单独占用一行，如果头尾没有空格（例如`[$x^2$]`），这个公式将会排版在行内，下面是针对数学模式的语法概述：
  ],
)

#docs-table(
  i18n--table-header,

  babel(en: [Inline math], zh-status: "proofread", zh: [行内公式]),
  [`[$x^2$]`],
  [@math[Math]],

  babel(en: [Block-level math], zh-status: "proofread", zh: [独行公式]),
  [`[$ x^2 $]`],
  [@math[Math]],

  babel(en: [Bottom attachment], zh-status: "proofread", zh: [下标]),
  [`[$x_1$]`],
  [@math:attach[`attach`]],

  babel(en: [Top attachment], zh-status: "proofread", zh: [上标]),
  [`[$x^2$]`],
  [@math:attach[`attach`]],

  babel(en: [Fraction], zh-status: "proofread", zh: [分数]),
  [`[$1 + (a+b)/5$]`],
  [@math.frac[`frac`]],

  babel(en: [Line break], zh-status: "need proofread", zh: [行中断]),
  [`[$x \ y$]`],
  [@linebreak],

  babel(en: [Alignment point], zh-status: "need proofread", zh: [对齐点]),
  [`[$x &= 2 \ &= 3$]`],
  [@math[Math]],

  babel(en: [Variable access], zh-status: "need proofread", zh: [变量访问]),
  [`[$#x$, $pi$]`],
  [@math[Math]],

  babel(en: [Field access], zh-status: "need proofread", zh: [字段访问]),
  [`[$arrow.r.long$]`],
  [@reference:scripting:fields[Scripting]],

  babel(en: [Implied multiplication], zh-status: "proofread", zh: [隐式表达的乘积]),
  [`[$x y$]`],
  [@math[Math]],

  babel(en: [Symbol shorthand], zh-status: "need proofread", zh: [快捷符号]),
  [`[$->$]`, `[$!=$]`],
  [@reference:symbols:shorthands[Symbols]],

  babel(en: [Text/string in math], zh-status: "need proofread", zh: [数学公式内字符串]),
  [`[$a "is natural"$]`],
  [@math[Math]],

  babel(en: [Math function call], zh-status: "need proofread", zh: [数学函数调用]),
  [`[$floor(x)$]`],
  [@math[Math]],

  babel(en: [Code expression], zh-status: "need proofread", zh: [代码表达式]),
  [`[$#rect(width: 1cm)$]`],
  [@reference:scripting:expressions[Scripting]],

  babel(en: [Character escape], zh-status: "need proofread", zh: [转义字符]),
  [`[$x\^2$]`],
  [@reference:syntax:escapes[Below]],

  babel(en: [Comment], zh-status: "proofread", zh: [注释]),
  [`[$/* comment */$]`],
  [@reference:syntax:comments[Below]],
)

= #babel(en: short-or-long[Code][Code mode], zh-status: "proofread", zh: [脚本模式]) <code>
#babel(
  en: [
    Within code blocks and expressions, new expressions can start without a leading `#` character. Many syntactic elements are specific to expressions. Below is a table listing all syntax that is available in code mode:
  ],
  zh-status: "need proofread",
  zh: [
    在代码块和表达式中，新的表达式不再前缀`#`字符。许多代码语法元素是表达式特有的，下面列出了代码模式下所有可用的语法：
  ],
)

#docs-table(
  i18n--table-header,

  [None],
  [`{none}`],
  [@none],

  [Auto],
  [`{auto}`],
  [@auto],

  [Boolean],
  [`{false}`, `{true}`],
  [@bool],

  [Integer],
  [`{10}`, `{0xff}`],
  [@int],

  [Floating-point number],
  [`{3.14}`, `{1e5}`],
  [@float],

  [Length],
  [`{2pt}`, `{3mm}`, `{1em}`, ..],
  [@length],

  [Angle],
  [`{90deg}`, `{1rad}`],
  [@angle],

  [Fraction],
  [`{2fr}`],
  [@fraction],

  [Ratio],
  [`{50%}`],
  [@ratio],

  [String],
  [`{"hello"}`],
  [@str],

  [Label],
  [`{<intro>}`],
  [@label],

  [Math],
  [`[$x^2$]`],
  [@math[Math]],

  [Raw text],
  [``` [`print(1)`]```],
  [@raw],

  babel(en: [Variable access], zh-status: "need proofread", zh: [变量访问]),
  [`{x}`],
  [@reference:scripting:blocks[Scripting]],

  babel(en: [Code block], zh-status: "need proofread", zh: [代码块]),
  [`{{ let x = 1; x + 2 }}`],
  [@reference:scripting:blocks[Scripting]],

  babel(en: [Content block], zh-status: "need proofread", zh: [文档内容块]),
  [`{[*Hello*]}`],
  [@reference:scripting:blocks[Scripting]],

  babel(en: [Parenthesized expression], zh-status: "need proofread", zh: [括号表达式]),
  [`{(1 + 2)}`],
  [@reference:scripting:blocks[Scripting]],

  babel(en: [Array], zh-status: "need proofread", zh: [数组]),
  [`{(1, 2, 3)}`],
  [@array[Array]],

  babel(en: [Dictionary], zh-status: "need proofread", zh: [字典]),
  [`{(a: "hi", b: 2)}`],
  [@dictionary[Dictionary]],

  babel(en: [Unary operator], zh-status: "need proofread", zh: [一元运算符]),
  [`{-x}`],
  [@reference:scripting:operators[Scripting]],

  babel(en: [Binary operator], zh-status: "need proofread", zh: [二元运算符]),
  [`{x + y}`],
  [@reference:scripting:operators[Scripting]],

  babel(en: [Assignment], zh-status: "need proofread", zh: [赋值]),
  [`{x = 1}`],
  [@reference:scripting:operators[Scripting]],

  babel(en: [Field access], zh-status: "need proofread", zh: [字段访问]),
  [`{x.y}`],
  [@reference:scripting:fields[Scripting]],

  babel(en: [Method call], zh-status: "need proofread", zh: [方法调用]),
  [`{x.flatten()}`],
  [@reference:scripting:methods[Scripting]],

  babel(en: [Function call], zh-status: "need proofread", zh: [函数调用]),
  [`{min(x, y)}`],
  [@function[Function]],

  [Argument spreading],
  [`{min(..nums)}`],
  [@arguments[Arguments]],

  babel(en: [Unnamed function], zh-status: "need proofread", zh: [匿名函数]),
  [`{(x, y) => x + y}`],
  [@function:unnamed[Function]],

  babel(en: [Let binding], zh-status: "need proofread", zh: [let绑定]),
  [`{let x = 1}`],
  [@reference:scripting:bindings[Scripting]],

  babel(en: [Named function], zh-status: "need proofread", zh: [命名函数]),
  [`{let f(x) = 2 * x}`],
  [@function[Function]],

  babel(en: [Set rule], zh-status: "proofread", zh: [set规则]),
  [`{set text(14pt)}`],
  [@reference:styling:set-rules[Styling]],

  babel(en: [Set-if rule], zh-status: "proofread", zh: [set-if规则]),
  [`{set text(..) if .. }`],
  [@reference:styling:set-rules[Styling]],

  babel(en: [Show-set rule], zh-status: "proofread", zh: [show-set规则]),
  [`{show heading: set block(..)}`],
  [@reference:styling:show-rules[Styling]],

  babel(en: [Show rule with function], zh-status: "need proofread", zh: [函数式show规则]),
  [`{show raw: it => {..}}`],
  [@reference:styling:show-rules[Styling]],

  babel(en: [Show-everything rule], zh-status: "need proofread", zh: [show-everything 规则]),
  [`{show: template}`],
  [@reference:styling:show-rules[Styling]],

  [Context expression],
  [`{context text.lang}`],
  [@reference:context[Context]],

  babel(en: [Conditional], zh-status: "need proofread", zh: [条件表语句]),
  [`{if x == 1 {..} else {..}}`],
  [@reference:scripting:conditionals[Scripting]],

  babel(en: [For loop], zh-status: "need proofread", zh: [for循环]),
  [`{for x in (1, 2, 3) {..}}`],
  [@reference:scripting:loops[Scripting]],

  babel(en: [While loop], zh-status: "need proofread", zh: [while循环]),
  [`{while x < 10 {..}}`],
  [@reference:scripting:loops[Scripting]],

  babel(en: [Loop control flow], zh-status: "need proofread", zh: [循环流程控制]),
  [`{break, continue}`],
  [@reference:scripting:loops[Scripting]],

  babel(en: [Return from function], zh-status: "need proofread", zh: [函数返回]),
  [`{return x}`],
  [@function[Function]],

  babel(en: [Include module], zh-status: "need proofread", zh: [include模块]),
  [`{include "bar.typ"}`],
  [@reference:scripting:modules[Scripting]],

  babel(en: [Import module], zh-status: "need proofread", zh: [import模块]),
  [`{import "bar.typ"}`],
  [@reference:scripting:modules[Scripting]],

  babel(en: [Import items from module], zh-status: "need proofread", zh: [从模块内import条目]),
  [`{import "bar.typ": a, b, c}`],
  [@reference:scripting:modules[Scripting]],

  babel(en: [Comment], zh-status: "proofread", zh: [注释]),
  [`{/* block */}`, `{// line}`],
  [@reference:syntax:comments[Below]],
)

= #babel(en: [Comments], zh-status: "proofread", zh: [注释]) <comments>
#babel(
  en: [
    Comments are ignored by Typst and will not be included in the output. This is useful to exclude old versions or to add annotations. To comment out a single line, start it with `//`:
  ],
  zh-status: "need proofread",
  zh: [
    Typst会忽略注释，最终生成的文档不会包含它们。它们通常被用于剔除旧版本，或者添加标注说明。如果一行开头是`//`，这行就会被认为是注释：
  ],
)

```example
// our data barely supports
// this claim

We show with $p < 0.05$
that the difference is
significant.
```

#babel(
  en: [
    Comments can also be wrapped between `/*` and `*/`. In this case, the comment can span over multiple lines:
  ],
  zh-status: "need proofread",
  zh: [
    babel(en: )  也可以通过`/*`和`*/`来包裹注释，这种方式，注释可以分布于多行：
  ],
)

```example
Our study design is as follows:
/* Somebody write this up:
   - 1000 participants.
   - 2x2 data design. */
```

= #babel(en: short-or-long[Escapes][Escape sequences], zh-status: "proofread", zh: [转义序列]) <escapes>
#babel(
  en: [
    Escape sequences are used to insert special characters that are hard to type or otherwise have special meaning in Typst. To escape a character, precede it with a backslash. To insert any Unicode codepoint, you can write a hexadecimal escape sequence: `[\u{1f600}]`. The same kind of escape sequences also work in @str[strings].
  ],
  zh-status: "need proofread",
  zh: [
    转义序列可以用来插入难于输入的特殊字符，或者Typst内有特殊含义的字符。前缀一个反斜杠转义一个字符，转移序列如果是十六进制，比如`[\u{1f600}]`，就会插入一个Unicode码点。这些类型的转义序列也作用于@str[字符串]中。
  ],
)

```example
I got an ice cream for
\$1.50! \u{1f600}
```

= Identifiers <identifiers>
Names of variables, functions, and so on (_identifiers_) can contain letters, numbers, hyphens (`-`), and underscores (`_`). They must start with a letter or an underscore.

More specifically, the identifier syntax in Typst is based on the #link("https://www.unicode.org/reports/tr31/")[Unicode Standard Annex \#31], with two extensions: Allowing `_` as a starting character, and allowing both `_` and `-` as continuing characters.

For multi-word identifiers, the recommended case convention is #link("https://en.wikipedia.org/wiki/Letter_case#Kebab_case")[Kebab case]. In Kebab case, words are written in lowercase and separated by hyphens (as in `top-edge`). This is especially relevant when developing modules and packages for others to use, as it keeps things predictable.

```example
#let kebab-case = [Using hyphen]
#let _schön = "😊"
#let 始料不及 = "😱"
#let π = calc.pi

#kebab-case
#if -π < 0 { _schön } else { 始料不及 }
// -π means -1 * π,
// so it's not a valid identifier
```
