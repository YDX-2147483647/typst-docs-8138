#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "Location": (
    19,
    [
      #babel(
        en: [
          Identifies an element in the document.

          A location uniquely identifies an element in the document and lets you
          access its absolute position on the pages. You can retrieve the current
          location with the @here function and the location of a queried or shown
          element with the @content.location[`location()`] method on content.
        ],
      )

      = #babel(en: short-or-long[Locatable][Locatable elements]) <locatable>
      #babel(
        en: [
          Elements that are automatically assigned a location are called _locatable_
          and can be found with @query[queries]:

          - In the @reference:model[Model category], the following elements are
            locatable: @asset, @bibliography, @cite, @document, @emph, @enum, @figure,
            @figure.caption, @footnote, @footnote.entry, @heading, @link, @list,
            @outline, @outline.entry, @par, @quote, @ref, @strong, @table, @terms, and
            @title. Most of the elements in the _Model_ category are locatable because
            semantic elements like headings and figures are often
            used with introspection.

          - In the @reference:text[Text category], the @raw element and the
            decoration elements @underline, @overline, @strike, and @highlight are
            locatable as these are also quite semantic in nature.

          - In the @reference:introspection[Introspection category], the @metadata
            element is locatable as being queried for is its primary purpose.

          - In the other categories, most elements are not locatable. Exceptions are
            @math.equation, @image, and @pdf.attach.

          To find out whether a specific element is locatable, you can try to @query
          for it.

          Note that you can still observe elements that are not locatable in queries
          through other means, for instance, when they have a label attached to them.
        ],
      )
    ],
  ),
  "Location::page": (
    61,
    [
      #babel(
        en: [
          Returns the page number for this location.

          Note that this does not return the value of the @counter[page counter]
          at this location, but the true page number (starting from one). If you
          want to know the value of the page counter, use
          `{counter(page).at(loc)}` instead.

          In an HTML document, Typst cannot know where content will end up, so
          this function returns `{none}`.

          This method can be used in combination with @here to retrieve the
          physical page position of the current context:
        ],
      )

      ```example
      #context [
        I am located on
        page #here().page()
      ]
      ```
    ],
  ),
  "Location::page_numbering": (
    24,
    babel(
      en: [
        Returns the page numbering pattern of the page at this location. This
        can be used when displaying the page counter in order to obtain the
        local numbering. This is useful if you are building custom indices or
        outlines.

        If the page numbering is set to `{none}` at that location, this function
        returns `{none}`.
      ],
    ),
  ),
  "Location::position": (
    12,
    babel(
      en: [
        Returns a dictionary with the page number and the x, y position for this
        location. The page number starts at one and the coordinates are measured
        from the top-left of the page.

        If you only need the page number, use @location.page[`page()`] instead
        as it allows Typst to skip unnecessary work.

        In an HTML document, Typst cannot know where content will end up, so
        this function returns `{none}`. The contents of an @html.frame form an
        exception as these are laid out using Typst's layout engine. For
        locations within such frames, this function returns a dictionary with
        just the `x` and `y` coordinates within the frame, but no `page` key.
      ],
    ),
  ),
))
