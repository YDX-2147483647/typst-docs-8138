#import "/components/index.typ": docs-chapter, docs-table
#import "/i18n-translation.typ": Translation

#show: docs-chapter.with(
  title: "术语表",
  route: "/glossary",
  description: "中英对照术语表",
  keywords: ("community-added",),
)

翻译所用中英术语对照如下表。斜线表示可按语境任选一种翻译。

// W3C CLReq有多个版本，此页一律采用发布到`/TR/`下的 W3C Group Note Draft。
//
// anchor尽量用章节标题的，避免`#id14`这种。后者不太稳定，而且不同语言不一样。
//
// 另外注意 W3C CLReq 和Typst中文社区的 clreq-gap for typst 是两回事。
#let clreq(anchor, body) = {
  assert(anchor.starts-with("#"))
  link("https://www.w3.org/TR/clreq/" + anchor)[《中文排版需求》#body]
}

#let gap = table.cell(colspan: 3, align: center, context if target() == "html" {
  // Use the same color under `<thead>`.
  html.div(style: "width: 100%; border-bottom: 1px dashed #bdbfcc;")
} else {
  line(length: 100%, stroke: (thickness: 0.5pt, dash: "dashed", paint: rgb("#bdbfcc")))
})

= Typst术语 <typst-terms>
下表以外的术语请与@reference:syntax\页保持一致，其次请与@guides:for-latex-users\保持一致。另外亦可参考#link("https://typst-jp.github.io/docs/glossary/")[用語集 – Typstドキュメント日本語版]。

#docs-table(
  table.header[英文原文][中文翻译][备注],

  [Typst],
  [Typst],
  [翻译对象的名称，#link("https://typst-doc-cn.github.io/clreq/#chinese-name")[目前绝大多数人认为没有必要翻译]],

  [web app, Typst app],
  [在线应用],
  [#link("https://typst.app/docs/web-app/")[官方文档Web App]部分#link("https://github.com/typst/typst/pull/4688")[在Typst仓库以外]，目前本站不译],

  gap,

  [set rule],
  [set规则],
  [详见@reference:styling:set-rules],

  [show rule],
  [show规则],
  [详见@reference:styling:show-rules],

  gap,

  [markup (mode)],
  [标记 / 标记模式 / 标记文本],
  [详见@reference:syntax:modes],

  [content (block)],
  [内容 / 内容块],
  [出现于@tutorial:writing-in-typst:figure，详见@content],

  [script, code (mode)],
  [脚本 / 脚本模式],
  [详见@reference:syntax:modes，应与@raw\区分],

  [code block],
  [脚本块],
  [出现于@tutorial:formatting:show-rules，应与raw block区分],

  [math (mode)],
  [数学公式 / 数学模式],
  [详见@reference:syntax:modes，未必总与@math.equation\严格区分],

  gap,

  [(math) expression, equation],
  [公式],
  [出现于@tutorial:writing-in-typst:maths，详见@math.equation],

  [inline math],
  [行内公式],
  [可灵活翻译成「在一行之内」等],

  [block-level math],
  [独行公式],
  [可灵活翻译成「独占一行」等],

  gap,

  [figure],
  [figure / 图表],
  [可附题注的图表版块，详见@figure；避免「图表函数」的说法，可用「figure函数」],

  [image],
  [图片],
  [详见@image，应与figure区分；不译作「图像」，以区别于plot],

  [table],
  [表格],
  [详见@table；尽量避免简称作「表」，否则容易误解成列表@list],

  [grid],
  [网格],
  [详见@grid],

  gap,

  [title],
  [全文标题],
  [详见@title，应与heading、caption、header区分],

  [heading],
  [章节标题],
  [详见@heading，应与title等区分],

  [caption],
  [题注#footnote[以图为例，图题通常包含图序（图的序号）和图名（图的名称），有时除了图题还有图注（图的注解）。这些说明文字一般都填在`caption`字段里，统称题注。#clreq("#major_differences_between_horizontal_and_vertical_writing_modes")[§2.1.2 横排与直排的主要差异点]称作「说明文字」，但易与图内文字混淆。]],
  [图表外的说明文字，详见@figure.caption，应与title等区分],

  [table header],
  [表头#footnote[#clreq("#major_differences_between_horizontal_and_vertical_writing_modes")[§2.1.2 横排与直排的主要差异点]称作「表格标题行（列）」，稍显繁琐，还是叫「表头」吧。]],
  [详见@table.header，应与title等区分],

  gap,

  [reference],
  [交叉引用],
  [引用标签或文献，详见@ref，应与cite区分],

  [cite, citation],
  [文献引用],
  [详见@cite，应与reference区分，且注意与@bibliography\的关系],

  [bibliography],
  [文献数据 / 文献列表],
  [详见@bibliography，注意与citation的关系],

  gap,

  [positional],
  Translation.positional,
  [],

  [named],
  [命名参数],
  [],

  [required],
  Translation.required,
  [],

  [optional],
  [可选参数],
  [],
)

= 一般术语 <general-terms>
#docs-table(
  table.header[英文名称][中文名称][备注],

  [command line, CLI],
  [命令行],
  [出现于@overview、@tutorial\等；「命令行工具」可简称为「命令行」],

  gap,

  [(round) parenthesis],
  [圆括号],
  `( )`,

  [(square) bracket],
  [方括号],
  `[[ ]]`,

  [angle bracket],
  [尖括号],
  `< >`,

  gap,

  [typesetting, typography, typographic],
  [排版 / 字体排印],
  [一般在文中很虚，可按语境灵活变通],

  [page layout],
  [页面版式],
  [出现于@tutorial；参考#clreq("#h_page")[§7 页面与书籍版式]],

  [run-in heading],
  [同行标题#footnote[有人译作「接排标题」，但接排一词有歧义：它有时与「另面起排」相对，表示章节标题与前一段在同一面，和run-in不是一个意思。]],
  [出现于@tutorial；参考#clreq("#types_of_headings")[§7.1.3.1 标题的种类]],

  [font size],
  [字号],
  [出现于@tutorial:formatting:page-setup；即使不采用号数制，也称「字号」],

  [OpenType feature],
  [OpenType特性],
  [参考#link("https://learn.microsoft.com/en-us/typography/opentype/spec/featurelist")[OpenType规范]],
)
