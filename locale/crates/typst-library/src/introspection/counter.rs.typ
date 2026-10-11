#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Counter": (
    27,
    [
      #babel(
        en: [
          Counts through pages, elements, and more.

          With the counter function, you can access and modify counters for pages,
          headings, figures, and more. Moreover, you can define custom counters for
          other things you want to count.

          Since counters change throughout the course of the document, their current
          value is _contextual._ It is recommended to read the chapter on
          @reference:context[context] before continuing here.
        ],
      )

      = #babel(en: short-or-long[Accessing][Accessing a counter]) <accessing>
      #babel(
        en: [
          To access the raw value of a counter, we can use the @counter.get[`get`]
          function. This function returns an @array[array]: Counters can have multiple
          levels (in the case of headings for sections, subsections, and so on), and
          each item in the array corresponds to one level.
        ],
      )

      ```example
      #set heading(numbering: "1.")

      = Introduction
      Raw value of heading counter is
      #context counter(heading).get()
      ```

      = #babel(en: short-or-long[Displaying][Displaying a counter]) <displaying>
      #babel(
        en: [
          Often, we want to display the value of a counter in a more human-readable
          way. To do that, we can call the @counter.display[`display`] function on the
          counter. This function retrieves the current counter value and formats it
          either with a provided or with an automatically inferred
          @numbering[numbering].
        ],
      )

      ```example
      #set heading(numbering: "1.")

      = Introduction
      Some text here.

      = Background
      The current value is: #context {
        counter(heading).display()
      }

      Or in roman numerals: #context {
        counter(heading).display("I")
      }
      ```

      = #babel(en: short-or-long[Modifying][Modifying a counter]) <modifying>
      #babel(
        en: [
          To modify a counter, you can use the `step` and `update` methods:

          - The `step` method increases the value of the counter by one. Because
            counters can have multiple levels , it optionally takes a `level`
            argument. If given, the counter steps at the given depth.

          - The `update` method allows you to arbitrarily modify the counter. In its
            basic form, you give it an integer (or an array for multiple levels). For
            more flexibility, you can instead also give it a function that receives
            the current value and returns a new value.

          The heading counter is stepped before the heading is displayed, so
          `Analysis` gets the number seven even though the counter is at six after the
          second update.
        ],
      )

      ```example
      #set heading(numbering: "1.")

      = Introduction
      #counter(heading).step()

      = Background
      #counter(heading).update(3)
      #counter(heading).update(n => n * 2)

      = Analysis
      Let's skip 7.1.
      #counter(heading).step(level: 2)

      == Analysis
      Still at #context {
        counter(heading).display()
      }
      ```

      = #babel(en: [Element counters]) <element-counters>
      #babel(
        en: [
          Above, there are various examples of using the @heading counter. Headings
          are just one kind of element that can be counted. In general, counters can
          count through any kind of @location:locatable[_locatable_ element].

          Additionally, a counter can also count just those elements that match a
          specific @selector. For example, `{counter(figure.where(kind: image))}`
          counts figures containing images, but ignores other kinds of figures.
        ],
      )

      = #babel(en: [Page counter]) <page-counter>
      #babel(
        en: [
          The page counter is special. It is automatically stepped at each pagebreak.
          But like other counters, you can also step it manually. For example, you
          could have Roman page numbers for your preface, then switch to Arabic page
          numbers for your main content and reset the page counter to one.
        ],
      )

      ```example
      >>> #set page(
      >>>   height: 100pt,
      >>>   margin: (bottom: 24pt, rest: 16pt),
      >>> )
      #set page(numbering: "(i)")

      = Preface
      The preface is numbered with
      roman numerals.

      #set page(numbering: "1 / 1")
      #counter(page).update(1)

      = Main text
      Here, the counter is reset to one.
      We also display both the current
      page and total number of pages in
      Arabic numbers.
      ```

      = #babel(en: [Custom counters]) <custom-counters>
      #babel(
        en: [
          To define your own counter, call the `counter` function with a string as a
          key. This key identifies the counter globally.
        ],
      )

      ```example
      #let mine = counter("mycounter")
      #context mine.display() \
      #mine.step()
      #context mine.display() \
      #mine.update(c => c * 3)
      #context mine.display()
      ```

      = #babel(en: [How to step]) <how-to-step>
      #babel(
        en: [
          When you define and use a custom counter, in general, you should first step
          the counter and then display it. This way, the stepping behaviour of a
          counter can depend on the element it is stepped for. If you were writing a
          counter for, let's say, theorems, your theorem's definition would thus first
          include the counter step and only then display the counter and the theorem's
          contents.
        ],
      )

      ```example
      #let c = counter("theorem")
      #let theorem(it) = block[
        #c.step()
        *Theorem #context c.display():*
        #it
      ]

      #theorem[$1 = 1$]
      #theorem[$2 < 3$]
      ```

      #babel(
        en: [
          The rationale behind this is best explained on the example of the heading
          counter: An update to the heading counter depends on the heading's level. By
          stepping directly before the heading, we can correctly step from `1` to
          `1.1` when encountering a level 2 heading. If we were to step after the
          heading, we wouldn't know what to step to.

          Because counters should always be stepped before the elements they count,
          they always start at zero. This way, they are at one for the first display
          (which happens after the first step).
        ],
      )

      = #babel(en: [Time travel]) <time-travel>
      #babel(
        en: [
          Counters can travel through time! You can find out the final value of the
          counter before it is reached and even determine what the value was at any
          particular location in the document.
        ],
      )

      ```example
      #let mine = counter("mycounter")

      = Values
      #context [
        Value here: #mine.get() \
        At intro: #mine.at(<intro>) \
        Final value: #mine.final()
      ]

      #mine.update(n => n + 3)

      = Introduction <intro>
      #lorem(10)

      #mine.step()
      #mine.step()
      ```

      = #babel(en: short-or-long[Other State][Other kinds of state]) <other-state>
      #babel(
        en: [
          The `counter` type is closely related to @state[state] type. Read its
          documentation for more details on state management in Typst and why it
          doesn't just use normal variables for counters.
        ],
      )
    ],
  ),
  "Counter::construct": (
    311,
    babel(
      en: [
        Create a new counter identified by a key.
      ],
    ),
  ),
  "Counter::construct::key": (
    3,
    babel(
      en: [
        The key that identifies this counter globally.

        - If it is a string, creates a custom counter that is only affected
          by manual updates,
        - If it is the @page function, counts through pages,
        - If it is a @selector[selector], counts through elements that match
          the selector. For example, you can
          - provide an element function to count elements of that type,
          - provide a @function.where[`where`] selector to count a type of
            element with specific fields,
          - provide a @label[`{<label>}`] to count elements with that label.

          Element and @function.where[`where`] selector counter keys are
          only supported for @location:locatable[locatable elements].
      ],
    ),
  ),
  "Counter::get": (
    19,
    babel(
      en: [
        Retrieves the value of the counter at the current location. Always
        returns an array of integers, even if the counter has just one number.

        This is equivalent to `{counter.at(here())}`.
      ],
    ),
  ),
  "Counter::display": (
    15,
    babel(
      en: [
        Displays the value of the counter.

        You can provide both a custom numbering and a custom location. Both
        default to `{auto}`, selecting sensible defaults (the numbering of the
        counted element and the current location, respectively).

        Returns the formatted output.
      ],
    ),
  ),
  "Counter::display::numbering": (
    13,
    babel(
      en: [
        A @numbering[numbering pattern or a function], which specifies how
        to display the counter. If given a function, that function receives
        each number of the counter as a separate argument. If the amount of
        numbers varies, e.g. for the heading argument, you can use an
        @arguments[argument sink].

        If this is omitted or set to `{auto}`, displays the counter with the
        numbering style for the counted element or with the pattern
        `{"1.1"}` if no such style exists.
      ],
    ),
  ),
  "Counter::display::at": (
    11,
    babel(
      en: [
        The place at which the counter should be displayed.

        If a selector is used, it must match exactly one element in the
        document. The most useful kinds of selectors for this are
        @label[labels] and @location[locations].

        If this is omitted or set to `{auto}`, this displays the counter at
        the current location. This is equivalent to using @here[`{here()}`].

        The numbering will be executed with a context in which `{here()}`
        resolves to the provided location, so that numberings which involve
        further counters resolve correctly.
      ],
    ),
  ),
  "Counter::display::both": (
    15,
    babel(
      en: [
        If enabled, displays the current and final top-level count together.
        Both can be styled through a single numbering pattern. This is used
        by the page numbering property to display the current and total
        number of pages when a pattern like `{"1 / 1"}` is given.
      ],
    ),
  ),
  "Counter::at": (
    35,
    babel(
      en: [
        Retrieves the value of the counter at the given location. Always returns
        an array of integers, even if the counter has just one number.

        The `selector` must match exactly one element in the document. The most
        useful kinds of selectors for this are @label[labels] and
        @location[locations].
      ],
    ),
  ),
  "Counter::at::selector": (
    12,
    babel(
      en: [
        The place at which the counter's value should be retrieved.
      ],
    ),
  ),
  "Counter::final_": (
    7,
    babel(
      en: [
        Retrieves the value of the counter at the end of the document. Always
        returns an array of integers, even if the counter has just one number.
      ],
    ),
  ),
  "Counter::step": (
    13,
    babel(
      en: [
        Increases the value of the counter by one.

        The update will be in effect at the position where the returned content
        is inserted into the document. If you don't put the output into the
        document, nothing happens! This would be the case, for example, if you
        write `{let _ = counter(page).step()}`. Counter updates are always
        applied in layout order and in that case, Typst wouldn't know when to
        step the counter.
      ],
    ),
  ),
  "Counter::step::level": (
    12,
    babel(
      en: [
        The depth at which to step the counter. Defaults to `{1}`.
      ],
    ),
  ),
  "Counter::update": (
    8,
    babel(
      en: [
        Updates the value of the counter.

        Just like with `step`, the update only occurs if you put the resulting
        content into the document.
      ],
    ),
  ),
  "Counter::update::update": (
    8,
    babel(
      en: [
        If given an integer or array of integers, sets the counter to that
        value. If given a function, that function receives the previous
        counter value (with each number as a separate argument) and has to
        return the new value (integer or array).
      ],
    ),
  ),
))
