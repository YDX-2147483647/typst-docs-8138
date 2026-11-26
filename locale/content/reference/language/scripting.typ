#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter, docs-table, short-or-long

#show: docs-chapter.with(
  title: babel(
    en: "Scripting",
    zh-status: "proofread",
    zh: "脚本",
  ),
  route: "/reference/scripting",
  description: babel(
    en: "Automate your document with Typst's scripting capabilities.",
    zh-status: "need proofread",
    zh: "使用 Typst 的脚本功能使得文档更加自动化。",
  ),
)

#babel(
  en: [
    Typst embeds a powerful scripting language. You can automate your documents and create more sophisticated styles with code. Below is an overview over the scripting concepts.
  ],
  zh-status: "need proofread",
  zh: [
    Typst内置了一个强大的脚本语言。可以使用代码自动生成文档，生成丰富多彩的样式。下面是关于脚本语言的综述。
  ],
)

= #babel(en: [Expressions], zh-status: "proofread", zh: [表达式]) <expressions>
#babel(
  en: [
    In Typst, markup and code are fused into one. All but the most common elements are created with _functions._ To make this as convenient as possible, Typst provides compact syntax to embed a code expression into markup: An expression is introduced with a hash (`#`) and normal markup parsing resumes after the expression is finished. If a character would continue the expression but should be interpreted as text, the expression can forcibly be ended with a semicolon (`;`). You can @reference:syntax:escapes[escape a literal `#` or `;` with a backslash].
  ],
  zh-status: "need update",
  zh: [
    Typst里面，标记和代码相互交融在一起。除了最常用的文档元素，其他所有均是由_函数_生成。为了尽可能的便利，Typst设计了精巧的语法，用来将代码嵌入在标记中：用`#`(井号)来引入一个代码表达式，表达式结束后，再恢复到正常的标记语法解析。有些字符能够使其后字符继续解析为表达式，如果想将其解释为文本，可以用分号(`;`)来强制结束表达式解析。
  ],
)

```example
#emph[Hello] \
#emoji.face \
#"hello".len()
```

#babel(
  en: [
    The example above shows a few of the available expressions, including @function[function calls], @reference:scripting:fields[field accesses], and @reference:scripting:methods[method calls]. More kinds of expressions are discussed in the remainder of this chapter. A few kinds of expressions are not compatible with the hash syntax (e.g. binary operator expressions). To embed these into markup, you can use parentheses, as in `[#(1 + 2)]`.
  ],
  zh-status: "need proofread",
  zh: [
    上面示例展示了一些用到的表达式，有@function[函数调用]，@reference:scripting:fields[字段访问]，@reference:scripting:methods[方法调用]。本章余下部分讲解更多类型表达式。有几种表达式与井号语法不一致（比如二元运算表达式），如果需要插入标记模式中，需要使用圆括号，比如`[#(1+2)]`。
  ],
)

= #babel(en: [Blocks], zh-status: "need proofread", zh: [块]) <blocks>
#babel(
  en: [
    To structure your code and embed markup into it, Typst provides two kinds of _blocks:_

    - *Code block:* `{{ let x = 1; x + 2 }}` \
      When writing code, you'll probably want to split up your computation into multiple statements, create some intermediate variables and so on. Code blocks let you write multiple expressions where one is expected. The individual expressions in a code block should be separated by line breaks or semicolons. The output values of the individual expressions in a code block are joined to determine the block's value. Expressions without useful output, like `{let}` bindings yield `{none}`, which can be joined with any value without effect.

    - *Content block:* `{[*Hey* there!]}` \
      With content blocks, you can handle markup/content as a programmatic value, store it in variables and pass it to @function[functions]. Content blocks are delimited by square brackets and can contain arbitrary markup. A content block results in a value of type @content[content]. An arbitrary number of content blocks can be passed as trailing arguments to functions. That is, `{list([A], [B])}` is equivalent to `{list[A][B]}`.

    Content and code blocks can be nested arbitrarily. In the example below, `{[hello ]}` is joined with the output of  `{a + [ the ] + b}` yielding `{[hello from the *world*]}`.
  ],
  zh-status: "need proofread",
  zh: [
    为了架构代码以及将标记嵌入代码中，Typst设计了两种_块_：

    - *代码块：* `{{ let x = 1; x + 2 }}` \
      编写代码时，一个计算过程可能需要分解为多个语句，创建多个中间变量，等等。可以将多个表达式组成一个代码块，就像一个表达式一样。在代码块中，多个表达式由换行符或者分号分割。其中每个表达式的输出值被合并起来，作为代码块的值。有些表达式没有有用的输出，比如`{let}`绑定返回`{none}`，与其他值合并，没有任何效果。

    - *文档内容块* `{[*Hey* there!]}` \
      使用文档内容块，可以将标记/文档内容作为可编程值，存储到变量，传送给@function[函数]。文档内容块由方括号包裹，可以包含任何标记。一个文档内容块产生一个@content[content类型]的值。文档内容块可以后缀参数形式任意多个传递给函数，就是说，`{list[A][B]}`等效于`{list([A], [B])}`。

    文档内容块和代码块可以相互内嵌，下面示例中，`{[hello]}` 与 `{a + [ the ] + b}` 合并，生成 `{[hello from the *world*]}`。
  ],
)

```example
#{
  let a = [from]
  let b = [*world*]
  [hello ]
  a + [ the ] + b
}
```

= #babel(en: short-or-long[Bindings][Bindings and Destructuring], zh-status: "proofread", zh: [绑定和解构]) <bindings>
#babel(
  en: [
    As already demonstrated above, variables can be defined with `{let}` bindings. The variable is assigned the value of the expression that follows the `=` sign. A @reference:syntax:identifiers[valid variable name] may contain `-`, but cannot start with `-`. The assignment of a value is optional, if no value is assigned, the variable will be initialized as `{none}`. The `{let}` keyword can also be used to create a @function:defining-functions[custom named function]. Variables can be accessed for the rest of the containing block (or the rest of the file if there is no containing block).
  ],
  zh-status: "need update",
  zh: [
    上面已经展示，变量由`{let}`绑定定义。`=`符号后表达式的值被赋值给变量，这里赋值可以被省略，如果没有赋值，变量会初始化为`{none}`。`{let}`关键词也可以用来生成一个@function:defining-functions[自定义的有名函数]。let绑定的变量可以在接下来的块中或者文档中被访问。
  ],
)

```example
#let name = "Typst"
This is #name's documentation.
It explains #name.

#let my-add(x, y) = x + y
Sum is #my-add(2, 3).
```

#babel(
  en: [
    Let bindings can also be used to destructure @array[arrays] and @dictionary[dictionaries]. In this case, the structure of the left-hand side of the assignment should mirror the array or dictionary: With bindings corresponding by position for arrays and by key name for dictionaries. The `..` operator can be used once in the pattern to collect the remainder of the array's or the dictionary's items.
  ],
  zh-status: "need proofread",
  zh: [
    let绑定也常用来解构@array[数组]和@dictionary[字典]，解构时，等号左边的形式需要与数组或字典相似，`..`模式操作符只可被使用一次，用来指代数组或字典剩余的条目。
  ],
)

```example
#let (x, y) = (1, 2)
The coordinates are #x, #y.

#let (a, .., b) = (1, 2, 3, 4)
The first element is #a.
The last element is #b.

#let books = (
  Shakespeare: "Hamlet",
  Homer: "The Odyssey",
  Austen: "Persuasion",
)

#let (Austen,) = books
Austen wrote #Austen.

#let (Homer: h) = books
Homer wrote #h.

#let (Homer, ..other) = books
#for (author, title) in other [
  #author wrote #title.
]
```

#babel(
  en: [
    You can use the underscore to discard elements in a destructuring pattern:
  ],
  zh-status: "need proofread",
  zh: [
    在解构匹配模式中，可以使用`_`下划线来丢弃一个元素。
  ],
)

```example
#let (_, y, _) = (1, 2, 3)
The y coordinate is #y.
```

#babel(
  en: [
    Destructuring also works in argument lists of functions ...
  ],
  zh-status: "need proofread",
  zh: [
    解构形式也可用于函数的参数列表中……
  ],
)

```example
#let left = (2, 4, 5)
#let right = (3, 2, 6)
#left.zip(right).map(
  ((a,b)) => a + b
)
```

#babel(
  en: [
    ... and on the left-hand side of normal assignments. This can be useful to swap variables among other things.
  ],
  zh-status: "need proofread",
  zh: [
    ……和普通赋值的左半部分，这通常用于交换两个变量的值。
  ],
)

```example
#{
  let a = 1
  let b = 2
  (a, b) = (b, a)
  [a = #a, b = #b]
}
```

= #babel(en: [Conditionals], zh-status: "proofread", zh: [条件控制]) <conditionals>
#babel(
  en: [
    With a conditional, you can display or compute different things depending on whether some condition is fulfilled. Typst supports `{if}`, `{else if}` and `{else}` expressions. When the condition evaluates to `{true}`, the conditional yields the value resulting from the if's body. Otherwise, it yields the value resulting from the else's body.
  ],
  zh-status: "need proofread",
  zh: [
    使用条件控制语句，可以根据某种条件是否满足，来展示或计算不同的事情。Typst设计了`{if}`,`{else if}`,`{else}`表达式。当条件值为`{true}`时，条件语句会返回if从句的值，否则返回else从句的值。
  ],
)

```example
#if 1 < 2 [
  This is shown
] else [
  This is not.
]
```

#babel(
  en: [
    Each branch can have a code or content block as its body.
  ],
  zh-status: "need proofread",
  zh: [
    每个分支从句可以写为语句块或者文档内容块。
  ],
)

- `{if condition {..}}`
- `{if condition [..]}`
- `{if condition [..] else {..}}`
- `{if condition [..] else if condition {..} else [..]}`

= #babel(en: [Loops], zh-status: "proofread", zh: [循环控制]) <loops>
#babel(
  en: [
    With loops, you can repeat content or compute something iteratively. Typst supports two types of loops: `{for}` and `{while}` loops. The former iterate over a specified collection whereas the latter iterate as long as a condition stays fulfilled. Just like blocks, loops _join_ the results from each iteration into one value.

    In the example below, the three sentences created by the for loop join together into a single content value and the length-1 arrays in the while loop join together into one larger array.
  ],
  zh-status: "need proofread",
  zh: [
    使用循环控制语句，可以反复的显示文档内容或者计算。Typst支持两种循环控制：`{for}`循环和`{while}`循环。`{for}`循环用来遍历特定集合，`{while}`循环根据某条件是否满足来决定是否再次迭代循环。和块类似，循环结构_合并_每一次迭代循环的结果。

    下面示例中，for循环生成了三句话，然后将其合并成一个文档内容。while循环生成数个长度为1的数组，然后将其合并成一个大数组。
  ],
)

```example
#for c in "ABC" [
  #c is a letter.
]

#let n = 2
#while n < 10 {
  n = (n * 2) - 1
  (n,)
}
```

#babel(
  en: [
    For loops can iterate over a variety of collections:
  ],
  zh-status: "need proofread",
  zh: [
    for 循环可以遍历多种集合：
  ],
)

- `{for value in array {..}}` \
  #babel(
    en: [
      Iterates over the items in the @array[array]. The destructuring syntax described in @reference:scripting:bindings[Let binding] can also be used here.
    ],
    zh-status: "need proofread",
    zh: [
      遍历@array[数组]中的条目。@reference:scripting:bindings[let绑定]中的解构语法也可使用于此。
    ],
  )

- `{for pair in dict {..}}` \
  #babel(
    en: [
      Iterates over the key-value pairs of the @dictionary[dictionary]. The pairs can also be destructured by using `{for (key, value) in dict {..}}`. It is more efficient than `{for pair in dict.pairs() {..}}` because it doesn't create a temporary array of all key-value pairs.
    ],
    zh-status: "need proofread",
    zh: [
      遍历@dictionary[字典]的键值对。键值对也可以用 `{for (key, value) in dict {..}}` 语法解构。
    ],
  )

- `{for letter in "abc" {..}}` \
  #babel(
    en: [
      Iterates over the characters of the @str[string]. Technically, it iterates over the grapheme clusters of the string. Most of the time, a grapheme cluster is just a single codepoint. However, a grapheme cluster could contain multiple codepoints, like a flag emoji.
    ],
    zh-status: "need proofread",
    zh: [
      遍历@str[字符串]的每个字符。（专业的说，是遍历字符串的每个形位符，大多时候，一个形位符对应一个字符/码位，然而，有些表情标记符号由多个码位组成，但它仍然是一个形位符）。
    ],
  )

- `{for byte in bytes("😀") {..}}` \
  #babel(
    en: [
      Iterates over the @bytes[bytes], which can be converted from a @str[string] or @read[read] from a file without encoding. Each byte value is an @int[integer] between `{0}` and `{255}`.
    ],
    zh: [],
  )

#babel(
  en: [
    To control the execution of the loop, Typst provides the `{break}` and `{continue}` statements. The former performs an early exit from the loop while the latter skips ahead to the next iteration of the loop.
  ],
  zh-status: "need proofread",
  zh: [
    Typst 用 `{break}` 和 `{continue}` 语句来控制循环的执行，
    `{break}` 用来跳出循环，`{continue}` 用来提前结束本次循环，然后执行下一次循环。
  ],
)

```example
#for letter in "abc nope" {
  if letter == " " {
    break
  }

  letter
}
```

#babel(
  en: [
    The body of a loop can be a code or content block:
  ],
  zh-status: "need proofread",
  zh: [
    循环体可以是代码块，也可以是文档内容块：
  ],
)

- `{for .. in collection {..}}`
- `{for .. in collection [..]}`
- `{while condition {..}}`
- `{while condition [..]}`

= #babel(en: [Fields], zh-status: "proofread", zh: [字段]) <fields>
#babel(
  en: [
    You can use _dot notation_ to access fields on a value. For values of type @content, you can also use the @content.fields[`fields`] function to list the fields.

    The value in question can be either:
    - a @dictionary[dictionary] that has the specified key,
    - a @symbol[symbol] that has the specified modifier,
    - a @module[module] containing the specified definition,
    - @content[content] consisting of an element that has the specified field. The available fields match the arguments of the @function:element-functions[element function] that were given when the element was constructed.
  ],
  zh-status: "need proofread",
  zh: [
    可以使用_点号_来访问一个值的字段，这个值可以是：

    - 有特定键的@dictionary[字典]，
    - 有变体的@symbol[符号]，
    - 有定义的@module[模块]，
    - 有特定字段的@content[文档元素]，可访问的字段与文档元素的@function:element-functions[构造函数]参数相匹配。
  ],
)

```example
#let it = [= Heading]
#it.body \
#it.depth \
#it.fields()

#let dict = (greet: "Hello")
#dict.greet \
#emoji.face

```

= Methods <methods>
A _method call_ is a convenient way to call a function that is scoped to a value's @type[type]. For example, we can call the @str.len function in the following two equivalent ways:

```example
#str.len("abc") is the same as
#"abc".len()
```

The structure of a method call is `{value.method(..args)}` and its equivalent full function call is `{type(value).method(value, ..args)}`. The documentation of each type lists its scoped functions. You cannot currently define your own methods.

```example
#let values = (1, 2, 3, 4)
#values.pop() \
#values.len() \

#("a, b, c"
    .split(", ")
    .join[ --- ])

#"abc".len() is the same as
#str.len("abc")
```

There are a few special functions that modify the value they are called on (e.g. @array.push). These functions _must_ be called in method form. In some cases, when the method is only called for its side effect, its return value should be ignored (and not participate in joining). The canonical way to discard a value is with a let binding: `{let _ = array.remove(1)}`.

= #babel(en: [Modules], zh-status: "proofread", zh: [模块]) <modules>
#babel(
  en: [
    You can split up your Typst projects into multiple files called _modules._ A module can refer to the content and definitions of another module in multiple ways:

    - *Including:* `{include "bar.typ"}` \
      Evaluates the file at the @path[path] `bar.typ` and returns the resulting @content[content].

    - *Import:* `{import "bar.typ"}` \
      Evaluates the file at the @path[path] `bar.typ` and inserts the resulting @module[module] into the current scope as `bar` (filename without extension). You can use the `as` keyword to rename the imported module: `{import "bar.typ" as baz}`. You can import nested items using dot notation: `{import "bar.typ": baz.a}`.

    - *Import items:* `{import "bar.typ": a, b}` \
      Evaluates the file at the @path[path] `bar.typ`, extracts the values of the variables `a` and `b` (that need to be defined in `bar.typ`, e.g. through `{let}` bindings) and defines them in the current file. Replacing `a, b` with `*` loads all variables defined in a module. You can use the `as` keyword to rename the individual items: `{import "bar.typ": a as one, b as two}`

    Instead of a string or @path[path], you can also use a @module[module value], as shown in the following example:
  ],
  zh-status: "need proofread",
  zh: [
    一个Typst工程项目可以拆解为多个_模块_文件。一个模块可以使用多种方式引用其他模块的文档内容和定义。

    - *插入：* `{include "bar.typ"}` \
      计算`bar.typ`路径文件，返回其@content[文档内容]结果。

    - *导入：* `{import "bar.typ"}` \
      在路径`bar.typ`处加载文档并插入结果@module[模块]作为`bar`进入当前范围（不带后缀拓展名的文档名）。您可以使用`as`关键字重命名导入的模块：`{import "bar.typ" as baz}`

    - *Import items:* `{import "bar.typ": a, b}` \
      Evaluates the file at the path `bar.typ`, extracts the values of the variables  `a` and `b` (that need to be defined in `bar.typ`, e.g. through `{let}`  bindings) and defines them in the current file. Replacing `a, b` with `*`  loads all variables defined in a module. You can use the `as` keyword to  rename the individual items: `{import "bar.typ": a as one, b as two}`

    - *导入项目:* `{import "bar.typ": a, b}` \
      加载路径为`bar.typ`的文档，提取变量`a`和`b`(需要在`bar.typ`中定义，例如通过`{let}`绑定)的值，并在当前文档中定义它们。将`a,b`替换为`*`可以加载模块中定义的所有变量。您可以使用`as`关键字来重命名各个项目: `{import "bar.typ": a as one, b as two}`

    除了使用路径，也可以使用@module[模块值]，如下面示例：
  ],
)

```example
#import emoji: face
#face.grin
```

= #babel(en: [Packages], zh-status: "proofread", zh: [包]) <packages>
#babel(
  en: [
    To reuse building blocks across projects, you can also create and import Typst _packages._ A package import is specified as a triple of a namespace, a name, and a version.
  ],
  zh-status: "need proofread",
  zh: [
    可以创建并导入Typst_包_，在多个工程项目中进行复用。一个包的导入需有三部分指定：包命名空间，包名称，包版本号。
  ],
)

```example
>>> #let add(x, y) = x + y
<<< #import "@preview/example:0.1.0": add
#add(2, 7)
```

#babel(
  en: [
    The `preview` namespace contains packages shared by the community. You can find all available community packages on #link("https://typst.app/universe")[Typst Universe].

    If you are using Typst locally, you can also create your own system-local packages. For more details on this, see the #link("https://github.com/typst/packages")[package repository].
  ],
  zh-status: "need update",
  zh: [
    `preview`包命名空间包含了Typst社区分享的包。可以在#link("https://typst.app/universe")[Typst Universe]章节搜索可用的社区分享包。

    在本地使用Typst时，可以创建本地包。更多详情参考#link("https://github.com/typst/packages")[包仓库]。
  ],
)

= #babel(en: [Operators], zh-status: "need proofread", zh: [操作符]) <operators>
#babel(
  en: [
    The following table lists all available unary and binary operators with effect, arity (unary, binary) and precedence level (higher binds stronger). Some operations, such as @calc.rem-euclid[modulus], do not have a special syntax and can be achieved using functions from the @calc module.
  ],
  zh-status: "need proofread",
  zh: [
    下表类出了所有一元和二元操作符的作用、参数数量（一元、二元）和优先级（优先级越高，越优先执行）
  ],
)

#let i18n--arity = (
  unary: babel(
    en: [Unary],
    zh-status: "proofread",
    zh: [一元],
  ),
  binary: babel(
    en: [Binary],
    zh-status: "proofread",
    zh: [二元],
  ),
)

#docs-table(
  table.header(
    babel(en: [Operator], zh-status: "need proofread", zh: [操作符]),
    babel(en: [Effect], zh-status: "need proofread", zh: [作用说明]),
    babel(en: [Arity], zh-status: "need proofread", zh: [参数数量]),
    babel(en: [Precedence], zh-status: "proofread", zh: [优先级]),
  ),

  [`{-}`],
  babel(en: [Negation], zh-status: "proofread", zh: [负号]),
  i18n--arity.unary,
  [7],

  [`{+}`],
  babel(en: [No effect (exists for symmetry)], zh-status: "need proofread", zh: [正号，无作用，仅仅为了对称性]),
  i18n--arity.unary,
  [7],

  [`{*}`],
  babel(en: [Multiplication], zh-status: "proofread", zh: [乘号]),
  i18n--arity.binary,
  [6],

  [`{/}`],
  babel(en: [Division], zh-status: "proofread", zh: [除号]),
  i18n--arity.binary,
  [6],

  [`{+}`],
  babel(en: [Addition], zh-status: "proofread", zh: [加号]),
  i18n--arity.binary,
  [5],

  [`{-}`],
  babel(en: [Subtraction], zh-status: "proofread", zh: [减号]),
  i18n--arity.binary,
  [5],

  [`{==}`],
  babel(en: [Check equality], zh-status: "proofread", zh: [等号]),
  i18n--arity.binary,
  [4],

  [`{!=}`],
  babel(en: [Check inequality], zh-status: "need proofread", zh: [不等于号]),
  i18n--arity.binary,
  [4],

  [`{<}`],
  babel(en: [Check less-than], zh-status: "proofread", zh: [小于号]),
  i18n--arity.binary,
  [4],

  [`{<=}`],
  babel(en: [Check less-than or equal], zh-status: "proofread", zh: [小于等于号]),
  i18n--arity.binary,
  [4],

  [`{>}`],
  babel(en: [Check greater-than], zh-status: "proofread", zh: [大于号]),
  i18n--arity.binary,
  [4],

  [`{>=}`],
  babel(en: [Check greater-than or equal], zh-status: "proofread", zh: [大于等于号]),
  i18n--arity.binary,
  [4],

  [`{in}`],
  babel(en: [Check if in collection], zh-status: "proofread", zh: [属于]),
  i18n--arity.binary,
  [4],

  [`{not in}`],
  babel(en: [Check if not in collection], zh-status: "proofread", zh: [不属于]),
  i18n--arity.binary,
  [4],

  [`{not}`],
  babel(en: [Logical "not"], zh-status: "need proofread", zh: [逻辑非]),
  i18n--arity.unary,
  [3],

  [`{and}`],
  babel(en: [Short-circuiting logical "and"], zh-status: "need proofread", zh: [短路式逻辑并]),
  i18n--arity.binary,
  [3],

  [`{or}`],
  babel(en: [Short-circuiting logical "or"], zh-status: "need proofread", zh: [短路式逻辑或]),
  i18n--arity.binary,
  [2],

  [`{=}`],
  babel(en: [Assignment], zh-status: "need proofread", zh: [赋值]),
  i18n--arity.binary,
  [1],

  [`{+=}`],
  babel(en: [Add-Assignment], zh-status: "need proofread", zh: [相加赋值]),
  i18n--arity.binary,
  [1],

  [`{-=}`],
  babel(en: [Subtraction-Assignment], zh-status: "need proofread", zh: [相减赋值]),
  i18n--arity.binary,
  [1],

  [`{*=}`],
  babel(en: [Multiplication-Assignment], zh-status: "need proofread", zh: [相乘赋值]),
  i18n--arity.binary,
  [1],

  [`{/=}`],
  babel(en: [Division-Assignment], zh-status: "need proofread", zh: [相除赋值]),
  i18n--arity.binary,
  [1],
)
