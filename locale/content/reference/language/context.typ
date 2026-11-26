#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-chapter

#show: docs-chapter.with(
  title: babel(
    en: "Context",
    zh-status: "proofread",
    zh: "上下文",
  ),
  route: "/reference/context",
  description: babel(
    en: "How to deal with content that reacts to its location in the document.",
    zh-status: "need proofread",
    zh: "如何处理对文档中位置做出反应的内容。",
  ),
)

#babel(
  en: [
    Sometimes, we want to create content that reacts to its location in the document. This could be a localized phrase that depends on the configured text language or something as simple as a heading number which prints the right value based on how many headings came before it. However, Typst code isn't directly aware of its location in the document. Some code at the beginning of the source text could yield content that ends up at the back of the document.

    To produce content that is reactive to its surroundings, we must thus specifically instruct Typst: We do this with the `{context}` keyword, which precedes an expression and ensures that it is computed with knowledge of its environment. In return, the context expression itself ends up opaque. We cannot directly access whatever results from it in our code, precisely because it is contextual: There is no one correct result, there may be multiple results in different places of the document. For this reason, everything that depends on the contextual data must happen inside of the context expression.

    Aside from explicit context expressions, context is also established implicitly in some places that are also aware of their location in the document: @reference:styling:show-rules[Show rules] provide context #footnote[Currently, all show rules provide @reference:context:style-context[style context], but only show rules on @location:locatable[locatable] elements provide a @reference:context:location-context[location context].] and numberings in the outline, for instance, also provide the proper context to resolve counters.
  ],
  zh-status: "need proofread",
  zh: [
    有时，我们希望创建响应其文档位置的内容。这可能是一个依赖于配置文本语言的本地化短语，或者像标题编号这样简单的东西，它根据前面有多少标题打印正确的值。然而，Typst代码本身并不直接意识到它在文档中的位置。源文本开头的某些代码可能会产生位于文档末尾的内容。

    为了产生响应其周围环境的内容，我们必须明确地指示Typst：我们使用`{context}`关键字，它前面是一个表达式，并确保它以已知的环境计算。作为回报，上下文表达式本身变得不透明。我们无法直接访问来自它的任何结果，因为它是上下文的：没有一个是正确的结果，可能会有多个结果在文档的不同地方。因此，所有依赖于上下文数据的内容必须发生在上下文表达式内部。

    除了显式上下文表达式，上下文还在一些地方隐式建立：@reference:styling:show-rules[show规则]提供上下文#footnote[目前，所有show规则都提供样式上下文，但只有@reference:context:location-context[可定位]元素的显示规则提供位置上下文。]，例如大纲中的编号，也提供正确的上下文来解析计数器。
  ],
)

= #babel(en: [Style context], zh-status: "proofread", zh: [样式上下文]) <style-context>
#babel(
  en: [
    With set rules, we can adjust style properties for parts or the whole of our document. We cannot access these without a known context, as they may change throughout the course of the document. When context is available, we can retrieve them simply by accessing them as fields on the respective element function.
  ],
  zh-status: "need proofread",
  zh: [
    使用set规则，我们可以调整部分或整个文档的样式属性。我们无法在没有已知上下文的情况下访问这些属性，因为它们可能会在整个文档过程中发生变化。当上下文可用时，我们可以简单地通过访问相应元素函数上的字段来检索它们。
  ],
)

```example
#set text(lang: "de")
#context text.lang
```

#babel(
  en: [
    As explained above, a context expression is reactive to the different environments it is placed into. In the example below, we create a single context expression, store it in the `value` variable and use it multiple times. Each use properly reacts to the current surroundings.
  ],
  zh-status: "need proofread",
  zh: [
    如上所述，上下文表达式对它被放置的不同环境是反应性的。在下面的示例中，我们创建一个单一的上下文表达式，将其存储在`value`变量中，并多次使用它。每次使用都正确地响应当前环境。
  ],
)

```example
#let value = context text.lang
#value

#set text(lang: "de")
#value

#set text(lang: "fr")
#value
```

#babel(
  en: [
    Crucially, upon creation, `value` becomes opaque @content[content] that we cannot peek into. It can only be resolved when placed somewhere because only then the context is known. The body of a context expression may be evaluated zero, one, or multiple times, depending on how many different places it is put into.
  ],
  zh-status: "need proofread",
  zh: [
    至关重要的是，在创建时，`value`变成一个不透明的@content[内容]，我们无法窥视。它只能在放置在某个地方时才能解析，因为只有那时上下文才被知道。上下文表达式的内容可能被评估零次、一次或多次，这取决于它被放置了多少个不同的地方。
  ],
)

= #babel(en: [Location context], zh-status: "proofread", zh: [位置上下文]) <location-context>
#babel(
  en: [
    We've already seen that context gives us access to set rule values. But it can do more: It also lets us know _where_ in the document we currently are, relative to other elements, and absolutely on the pages. We can use this information to create very flexible interactions between different document parts. This underpins features like heading numbering, the table of contents, or page headers dependent on section headings.

    Some functions like @counter.get implicitly access the current location. In the example below, we want to retrieve the value of the heading counter. Since it changes throughout the document, we need to first enter a context expression. Then, we use `get` to retrieve the counter's current value. This function accesses the current location from the context to resolve the counter value. Counters have multiple levels and `get` returns an array with the resolved numbers. Thus, we get the following result:
  ],
  zh-status: "need proofread",
  zh: [
    我们已经看到上下文给了我们访问show规则值的权限。但它还可以做更多：它还让我们知道文档中_哪里_相对于其他元素，以及绝对在页面上。我们可以使用这些信息来创建非常灵活的不同文档部分之间的交互。这支持了像标题编号、目录或依赖于部分标题的页面标题等特性。

    一些函数，如@counter.get\隐式访问当前位置。在下面的示例中，我们想要检索标题计数器的值。由于它在整个文档中发生变化，我们需要首先进入一个上下文表达式。然后，我们使用 `get` 来检索计数器的当前值。该函数从上下文中访问当前位置来解析计数器值。计数器有多个级别，`get` 返回一个包含解析数字的数组。因此，我们得到以下结果：
  ],
)

```example
#set heading(numbering: "1.")

= Introduction
#lorem(5)

#context counter(heading).get()

= Background
#lorem(5)

#context counter(heading).get()
```

#babel(
  en: [
    For more flexibility, we can also use the @here function to directly extract the current @location[location] from the context. The example below demonstrates this:

    - We first have `{counter(heading).get()}`, which resolves to `{(2,)}` as before.
    - We then use the more powerful  @counter.at with @here, which in combination is equivalent to `get`, and thus get `{(2,)}`.
    - Finally, we use `at` with a @label[label] to retrieve the value of the counter at a _different_ location in the document, in our case that of the introduction heading. This yields `{(1,)}`. Typst's context system gives us time travel abilities and lets us retrieve the values of any counters and states at _any_ location in the document.
  ],
  zh-status: "need proofread",
  zh: [
    为了更大的灵活性，我们还可以使用@here\函数直接从上下文中提取当前@location[位置]。下面的示例演示了这一点：

    - 我们首先有`{counter(heading).get()}`，这与之前相同，解析为`{(2,)}`。
    - 然后，我们使用更强大的@counter.at\与@here，它们结合在一起等同于`get`，因此得到`{(2,)}`。
    - 最后，我们使用`at`与一个@label[标签]来检索文档中_不同_位置的计数器值，在我们的例子中是介绍标题的位置。这得到`{(1,)}`。Typst的上下文系统给了我们时间旅行能力，并让我们检索文档中_任何_位置的任何计数器和状态的值。
  ],
)

```example
#set heading(numbering: "1.")

= Introduction <intro>
#lorem(5)

= Background <back>
#lorem(5)

#context [
  #counter(heading).get() \
  #counter(heading).at(here()) \
  #counter(heading).at(<intro>)
]
```

#babel(
  en: [
    As mentioned before, we can also use context to get the physical position of elements on the pages. We do this with the @locate function, which works similarly to `counter.at`: It takes a location or other @selector[selector] that resolves to a unique element (could also be a label) and returns the position on the pages for that element.
  ],
  zh-status: "need proofread",
  zh: [
    我们还可以使用上下文来获取元素在页面上的物理位置。我们使用@locate\函数来做到这一点，它类似于`counter.at`：它接受一个位置或其他@selector[选择器]，解析为一个唯一的元素（也可以是标签），并返回该元素在页面上的位置。
  ],
)

```example
Background is at: \
#context locate(<back>).position()

= Introduction <intro>
#lorem(5)
#pagebreak()

= Background <back>
#lorem(5)
```

#babel(
  en: [
    There are other functions that make use of the location context, most prominently @query. Take a look at the @reference:introspection[introspection] category for more details on those.
  ],
  zh-status: "need proofread",
  zh: [
    还有其他函数利用位置上下文，最突出的是@query。查看@reference:introspection[内省]类别以获取更多详细信息。
  ],
)

= #babel(en: [Nested contexts], zh-status: "need proofread", zh: [嵌套上下文]) <nested-contexts>
#babel(
  en: [
    Context is also accessible from within function calls nested in context blocks. In the example below, `foo` itself becomes a contextual function, just like @length.to-absolute[`to-absolute`] is.
  ],
  zh-status: "need proofread",
  zh: [
    上下文也可以从嵌套在上下文块中的函数调用中访问。在下面的示例中，`foo`本身成为上下文函数，就像@length.to-absolute[`to-absolute`]一样。
  ],
)

```example
#let foo() = 1em.to-absolute()
#context {
  foo() == text.size
}
```

#babel(
  en: [
    Context blocks can be nested. Contextual code will then always access the innermost context. The example below demonstrates this: The first `text.lang` will access the outer context block's styles and as such, it will *not* see the effect of `{set text(lang: "fr")}`. The nested context block around the second `text.lang`, however, starts after the set rule and will thus show its effect.
  ],
  zh-status: "need proofread",
  zh: [
    上下文块可以嵌套。上下文代码将始终访问最内层的上下文。下面的示例演示了这一点：第一个`text.lang`将访问外部上下文块的样式，因此它*不会*看到`{set text(lang: "fr")}`的效果。然而，第二个`text.lang`周围的嵌套上下文块在show规则之后开始，因此将显示其效果。
  ],
)

```example
#set text(lang: "de")
#context [
  #set text(lang: "fr")
  #text.lang \
  #context text.lang
]
```

#babel(
  en: [
    You might wonder why Typst ignores the French set rule when computing the first `text.lang` in the example above. The reason is that, in the general case, Typst cannot know all the styles that will apply as set rules can be applied to content after it has been constructed. Below, `text.lang` is already computed when the template function is applied. As such, it cannot possibly be aware of the language change to French in the template.
  ],
  zh-status: "need proofread",
  zh: [
    您可能想知道为什么Typst在计算上面的第一个`text.lang`时忽略了法语show规则。原因是，在一般情况下，Typst无法知道所有将作为show规则应用的内容。下面，当模板函数被应用时，`text.lang`已经计算出来了。因此，它不可能知道模板中的法语变化。
  ],
)

```example
#let template(body) = {
  set text(lang: "fr")
  upper(body)
}

#set text(lang: "de")
#context [
  #show: template
  #text.lang \
  #context text.lang
]
```

#babel(
  en: [
    The second `text.lang`, however, _does_ react to the language change because evaluation of its surrounding context block is deferred until the styles for it are known. This illustrates the importance of picking the right insertion point for a context to get access to precisely the right styles.

    The same also holds true for the location context. Below, the first `{c.display()}` call will access the outer context block and will thus not see the effect of `{c.update(2)}` while the second `{c.display()}` accesses the inner context and will thus see it.
  ],
  zh-status: "need proofread",
  zh: [
    第二个`text.lang`确实对语言变化有反应，因为它的周围上下文块的评估被推迟到样式已知时。这说明了选择正确的插入点以获得精确的正确样式的上下文的重要性。

    位置上下文也是如此。下面，第一个`{c.display()}`调用将访问外部上下文块，因此不会看到`{c.update(2)}`的效果，而第二个`{c.display()}`访问内部上下文，因此会看到它。
  ],
)

```example
#let c = counter("mycounter")
#c.update(1)
#context [
  #c.update(2)
  #c.display() \
  #context c.display()
]
```

= #babel(en: [Compiler iterations], zh-status: "need proofread", zh: [编译器迭代]) <compiler-iterations>
#babel(
  en: [
    To resolve contextual interactions, the Typst compiler processes your document multiple times. For instance, to resolve a `locate` call, Typst first provides a placeholder position, layouts your document and then recompiles with the known position from the finished layout. The same approach is taken to resolve counters, states, and queries. In certain cases, Typst may even need more than two iterations to resolve everything. While that's sometimes a necessity, it may also be a sign of misuse of contextual functions (e.g. of @state:caution[state]). If Typst cannot resolve everything within five attempts, it will stop and output the warning "document did not converge within five attempts."

    A very careful reader might have noticed that not all of the functions presented above actually make use of the current location. While `{counter(heading).get()}` definitely depends on it, `{counter(heading).at(<intro>)}`, for instance, does not. However, it still requires context. While its value is always the same _within_ one compilation iteration, it may change over the course of multiple compiler iterations. If one could call it directly at the top level of a module, the whole module and its exports could change over the course of multiple compiler iterations, which would not be desirable.
  ],
  zh-status: "need proofread",
  zh: [
    为了解析上下文交互，Typst编译器多次处理您的文档。例如，为了解析`locate`调用，Typst首先提供一个占位符位置，布局您的文档，然后重新编译已知位置的布局。同样的方法用于解析计数器、状态和查询。在某些情况下，Typst甚至可能需要超过两次迭代来解析所有内容。虽然有时这是必要的，但它也可能是上下文函数使用不当的迹象（例如，@state:caution[状态]）。如果Typst无法在五次尝试内解析所有内容，它将停止并输出警告“布局在五次尝试内未收敛”。

    一个非常仔细的读者可能已经注意到，上面提到的所有函数实际上并没有充分利用当前位置。虽然`{counter(heading).get()}`肯定依赖于它，但`{counter(heading).at(<intro>)}`则不然。然而，它仍然需要上下文。虽然它的值在_一次_编译迭代中总是相同的，但它可能会在多次编译迭代过程中发生变化。如果它可以直接在模块的顶层调用，整个模块及其导出可能会在多次编译迭代过程中发生变化，这并不是我们想要的。
  ],
)
