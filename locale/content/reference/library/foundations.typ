#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category, scope

#show: docs-category.with(
  title: babel(
    en: "Foundations",
    zh-status: "need proofread",
    zh: "基础",
  ),
  description: babel(
    en: "Documentation for foundational definitions that make up the bedrock of Typst.",
    zh-status: "need proofread",
    zh: "Typst中与基础有关联的函数族的文档",
  ),
  category: "foundations",
  scope-additions: (
    "none": type(none),
    "auto": type(auto),
  ),
  groups: (
    (
      name: "calc",
      def-target: calc,
      title: babel(
        en: "Calculation",
        zh-status: "need proofread",
        zh: "计算",
      ),
      scope: scope(std, "calc"),
      definitions: dictionary(calc),
      description: "Documentation for the `calc` module, which contains definitions for mathematical computation.",
      docs: babel(
        en: [
          Module for calculations and processing of numeric values.

          These definitions are part of the `calc` module and not imported by default.
        ],
        zh-status: "need proofread",
        zh: [
          用于计算和处理数字值的模块。

          这些定义是`calc`模块的一部分，不会默认导入。
        ],
      ),
    ),
    (
      name: "std",
      def-target: std,
      title: "Standard Library",
      definitions: (:),
      description: "Documentation for the `std` module, which contains all globally accessible items.",
      docs: [
        A module that contains all globally accessible items.

        = Using "shadowed" definitions <using-shadowed-definitions>
        The `std` module is useful whenever you overrode a name from the global scope (this is called _shadowing_). For instance, you might have used the name `text` for a parameter. To still access the `text` element, write `std.text`.

        ```example
        >>> #set page(margin: (left: 3em))
        #let par = [My special paragraph.]
        #let special(text) = {
          set std.text(style: "italic")
          set std.par.line(numbering: "1")
          text
        }

        #special(par)

        #lorem(10)
        ```

        = Conditional access <conditional-access>
        You can also use this in combination with the @dictionary.constructor[dictionary constructor] to conditionally access global definitions. This can, for instance, be useful to use new or experimental functionality when it is available, while falling back to an alternative implementation if used on an older Typst version. In particular, this allows us to create #link("https://en.wikipedia.org/wiki/Polyfill_(programming)")[polyfills].

        This can be as simple as creating an alias to prevent warning messages, for example, conditionally using `pattern` in Typst version 0.12, but using @tiling in newer versions. Since the parameters accepted by the `tiling` function match those of the older `pattern` function, using the `tiling` function when available and falling back to `pattern` otherwise will unify the usage across all versions. Note that, when creating a polyfill, @sys.version can also be very useful.

        ```typ
        #let tiling = if "tiling" in std { tiling } else { pattern }

        ...
        ```
      ],
    ),
    (
      name: "sys",
      def-target: sys,
      title: babel(en: "System", zh-status: "need proofread", zh: "系统"),
      scope: scope(std, "sys"),
      definitions: dictionary(sys),
      description: "Documentation for the `sys` module for system interactions.",
      docs: babel(
        en: [
          Module for system interactions.
        ],
        zh-status: "need proofread",
        zh: [
          用于系统交互的模块。
        ],
      ),
    ),
  ),
)

#babel(
  en: [
    Foundational types and functions.

    Here, you'll find documentation for basic data types like @int[integers] and @str[strings] as well as details about core computational functions.
  ],
  zh-status: "need proofread",
  zh: [
    基础类型和函数。
    在这里，您将找到有关基本数据类型（如@int[整数]和@str[字符串]）以及核心计算功能的详细信息。
  ],
)
