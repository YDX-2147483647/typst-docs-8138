#import "/i18n-scope.typ": *
#let live-item-data = resolve-lines((
  "SvgFormat": (
    11,
    [
      #babel(
        en: [
          Typst's SVG export format.

          Instead of creating a PDF, Typst can also directly render pages to scalable
          vector graphics (SVGs), which are the preferred format for embedding vector
          graphics in web pages. Like PDF files, SVGs display your document exactly
          how you have laid it out in Typst. Likewise, they share the benefit of not
          being bound to a specific resolution. Hence, you can print or view SVG files
          on any device without incurring a loss of quality. (Note that font printing
          quality may be better with a PDF.) In contrast to a PDF, an SVG cannot
          contain multiple pages. When exporting a multi-page document, Typst will
          emit multiple SVGs.

          SVGs can represent text in two ways: By embedding the text itself and
          rendering it with the fonts available on the viewer's computer or by
          embedding the shapes of each glyph in the font used to create the document.
          To ensure that the SVG file looks the same across all devices it is viewed
          on, Typst chooses the latter method. This means that the text in the SVG
          cannot be extracted automatically, for example by copy/paste or a screen
          reader. If you need the text to be accessible, export a PDF or HTML file
          instead.

          SVGs can have transparent backgrounds. By default, Typst will output an SVG
          with an opaque white background. You can make the background transparent
          using `[#set page(fill: none)]`. Learn more on the @page.fill[`page`
            function's reference page].
        ],
        zh-status: "need update",
        zh: [
          Typst不仅可以创建PDF，还可以直接渲染页面到可缩放的矢量图形（SVG），这是在网页中嵌入矢量图形的优选格式。与PDF文件一样，SVG会精确显示您在Typst中布置的文档。同样，它们共享不「绑定」到特定分辨率的优点。因此，您可以在任何设备上打印或查看SVG文件，而不会损失质量。（请注意，使用PDF打印质量可能更好。）与PDF不同，SVG不能包含多个页面。当导出多页文档时，Typst将发出多个SVG。

          SVG可以以两种方式表示文本：通过嵌入文本本身并使用查看器计算机上可用的字体渲染它，或者通过嵌入创建文档时使用的字体中每个字形的形状。为了确保SVG文件在所有设备上看起来相同，Typst选择后者方法。这意味着SVG中的文本不能自动提取，例如通过复制/粘贴或屏幕阅读器。如果您需要文本可访问，请导出PDF或HTML文件。

          SVG可以有透明背景。默认情况下，Typst将输出一个不透明的白色背景的SVG。您可以使用 `[#set page(fill: none)]` 使背景透明。有关详细信息，请参阅@page.fill[`page`函数参考页]。
        ],
      )

      = #babel(en: [Exporting as SVG], zh-status: "need proofread", zh: [导出为SVG]) <exporting-as-svg>
      == #babel(en: [Command Line], zh-status: "need proofread", zh: [命令行]) <command-line>
      #babel(
        en: [
          Pass `--format svg` to the `compile` or `watch` subcommand or provide an
          output file name that ends with `.svg`.

          If your document has more than one page, Typst will create multiple image
          files. The output file name must then be a template string containing at
          least one of
          - `[{p}]`, which will be replaced by the page number
          - `[{0p}]`, which will be replaced by the zero-padded page number (so that
            all numbers have the same length)
          - `[{t}]`, which will be replaced by the total number of pages

          When exporting to SVG, you have the following configuration options:

          - Which pages to export by specifying `--pages` followed by a
            comma-separated list of numbers or dash-separated number ranges. Ranges
            can be half-open. Example: `2,3,7-9,11-`.
        ],
        zh-status: "need proofread",
        zh: [
          通过`--format svg`向`compile`或`watch`子命令或提供一个以`.svg`结尾的输出文件名。

          如果您的文档有多页，Typst将创建多个图像文件。然后，输出文件名必须是一个包含至少一个的模板字符串：
          - `[{p}]`，将被替换为页码
          - `[{0p}]`，将被替换为零填充的页码（以便所有数字具有相同的长度）
          - `[{t}]`，将被替换为总页数

          当导出为 SVG 时，您有以下配置选项：

          - 要导出的页面，通过`--pages`后跟一个逗号分隔的数字或破折号分隔的数字范围列表。范围可以半开。示例：`2,3,7-9,11-`。
        ],
      )

      == #babel(en: [Web App], zh-status: "need proofread", zh: [网络应用]) <web-app>
      #babel(
        en: [
          Click "File" > "Export as" > "SVG" or click the downwards-facing arrow next
          to the quick download button and select "Export as SVG". When exporting to
          SVG, you have the following configuration options:

          - Which pages to export. Valid options are "All pages", "Current page", and
            "Custom ranges". Custom ranges are a comma-separated list of numbers or
            dash-separated number ranges. Ranges can be half-open. Example:
            `2,3,7-9,11-`.
        ],
        zh-status: "need proofread",
        zh: [
          点击「文件 → 导出为 → SVG」或点击快速下载按钮旁边的向下箭头并选择“导出为 SVG”。当导出为 SVG 时，您有以下配置选项：

          - 要导出的页面。有效选项为"所有页面"、"当前页面"和"自定义范围"。自定义范围是逗号分隔的数字或破折号分隔的数字范围列表。范围可以半开。示例：`2,3,7-9,11-`。
        ],
      )
    ],
  ),
  "SvgFormat::pretty": (
    56,
    babel(
      en: [
        Whether to pretty-print the produced SVG file.

        This formats the output in a more human-readable, but less
        space-efficient way.
      ],
    ),
  ),
))
