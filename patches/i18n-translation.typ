//! The initial version of this file was converted from typst-docs-web, licensed under Apache-2.0.
//!
//! That is a JSX project, so the keys here use camelCase instead of kebab-case.
//!
//! Commented keys are unused at present. Ideally, all keys should be used.

#import "i18n-babel.typ": babel
#import "i18n-inputs.typ": enable-pagefind

/// Translation dictionary for UI attributes and aria labels.
#let translation = (
  htmlLang: babel(
    en: "en",
    ja-status: "validated",
    ja: "ja",
    zh-status: "validated",
    zh: "zh-Hans",
  ),
  documentationTitle: babel(
    en: "Typst Documentation (English)",
    ja-status: "validated",
    ja: "Typstドキュメント日本語版",
    zh-status: "validated",
    zh: "Typst中文文档",
  ),
  close: babel(
    en: "Close",
    ja-status: "validated",
    ja: "閉じる",
    zh-status: "validated",
    zh: "关闭",
  ),
  // openMenu: babel(
  //   en: "Open menu",
  //   ja-status: "validated",
  //   ja: "メニューを開く",
  //   zh-status: "validated",
  //   zh: "打开菜单",
  // ),
  // closeMenu: babel(
  //   en: "Close menu",
  //   ja-status: "validated",
  //   ja: "メニューを閉じる",
  //   zh-status: "validated",
  //   zh: "关闭菜单",
  // ),
  search: if enable-pagefind {
    // The original search does not work well after localization. Therefore, pagefind is introduced.
    // - `search`: the original search.
    // - `searchPagefindShort`: pagefind-modal-trigger; the available width is about 3em.
    // - `searchPagefindLong`: pagefind-find; there is plenty of space.
    babel(
      en: "Search identifiers",
      ja-status: "need update",
      ja: "検索",
      zh-status: "validated",
      zh: "搜符号",
    )
  } else {
    babel(
      en: "Search (S)",
      ja-status: "validated",
      ja: "検索（S）",
      zh-status: "validated",
      zh: "搜索（S）",
    )
  },
  searchPagefindShort: babel(
    en: "Search texts",
    zh-status: "proofread",
    zh: "搜全文",
  ),
  searchPagefindLong: babel(
    en: "Full-text search",
    zh-status: "proofread",
    zh: "全文搜索",
  ),
  // openSearch: babel(
  //   en: "Open search",
  //   ja-status: "validated",
  //   ja: "検索を開く",
  //   zh-status: "validated",
  //   zh: "打开搜索",
  // ),
  // closeSearch: babel(
  //   en: "Close search",
  //   ja-status: "validated",
  //   ja: "検索を閉じる",
  //   zh-status: "validated",
  //   zh: "关闭搜索",
  // ),
  // showInformation: name => babel(
  //   en: "Show details for {name}",
  //   ja-status: "validated",
  //   ja: "{name}の詳細情報を表示",
  //   zh-status: "validated",
  //   zh: "具体解释{name}",
  // ).replace("{name}", "name"),
  // tooltipKind: (
  //   element: babel(
  //     en: "Element",
  //     ja-status: "validated",
  //     ja: "要素関数",
  //     zh-status: "validated",
  //     zh: "元素函数",
  //   ),
  //   contextual: babel(
  //     en: "Contextual",
  //     ja-status: "validated",
  //     ja: "コンテキスト関数",
  //     zh-status: "validated",
  //     zh: "上下文相关",
  //   ),
  //   constructor: babel(
  //     en: "Constructor",
  //     ja-status: "validated",
  //     ja: "コンストラクタ",
  //     zh-status: "validated",
  //     zh: "构造函数",
  //   ),
  //   definitions: babel(
  //     en: "Definitions",
  //     ja-status: "validated",
  //     ja: "定義",
  //     zh-status: "validated",
  //     zh: "定义",
  //   ),
  //   parameters: babel(
  //     en: "Parameters",
  //     ja-status: "validated",
  //     ja: "引数",
  //     zh-status: "validated",
  //     zh: "参数",
  //   ),
  //   variadic: babel(
  //     en: "Variadic",
  //     ja-status: "validated",
  //     ja: "可変長引数",
  //     zh-status: "validated",
  //     zh: "变长参数",
  //   ),
  //   settable: babel(
  //     en: "Settable",
  //     ja-status: "validated",
  //     ja: "設定可能引数",
  //     zh-status: "validated",
  //     zh: "可用set规则",
  //   ),
  //   positional: babel(
  //     en: "Positional",
  //     ja-status: "validated",
  //     ja: "位置引数",
  //     zh-status: "validated",
  //     zh: "位置参数",
  //   ),
  //   required: babel(
  //     en: "Required",
  //     ja-status: "validated",
  //     ja: "必須引数",
  //     zh-status: "validated",
  //     zh: "必需参数",
  //   ),
  // ),
)

/// Translation component for UI text, descriptions, and other content to be embedded as `content`.
#let Translation = (
  // Function tooltips
  elementFunction: babel(
    en: [Element],
    ja-status: "validated",
    ja: [要素関数],
    zh-status: "validated",
    zh: [元素],
  ),
  elementFunctionDescription: babel(
    en: [Element functions can be customized with `set` and `show` rules.],
    ja-status: "validated",
    ja: [要素関数は`set`ルールや`show`ルールでカスタマイズできます。],
    zh-status: "validated",
    zh: [元素函数可用`set`和`show`规则自定义样式。],
  ),
  locatableElement: babel(
    en: [Locatable],
    zh-status: "proofread",
    zh: [可定位],
  ),
  locatableElementDescription: babel(
    en: [Locatable elements can be found with queries.],
    zh-status: "proofread",
    zh: [可定位元素能用query等方法查询到。],
  ),
  contextFunction: babel(
    en: [Contextual],
    ja-status: "need update", // When it was translated, en uses _context_ instead of _contextual_.
    ja: [コンテキスト関数],
    zh-status: "proofread",
    zh: [上下文相关函数],
  ),
  contextFunctionDescription: babel(
    en: [Contextual functions can only be used when the context is known.],
    ja-status: "need update", // When it was translated, en uses _context_ instead of _contextual_.
    ja: [コンテキスト関数は、コンテキストが既知の場合にのみ使用できます。],
    zh-status: "proofread",
    zh: [上下文相关函数只能在确定上下文之后使用。],
  ),
  since: since => babel(
    // `since` will be `"forever"`, `"unreleased"`, or a Typst version, e.g., `version(0, 15, 0)`.
    en: [Since: #since],
    zh-status: "proofread",
    zh: if since == "unreleased" [尚未发布] else if since == "forever" [自始可用] else [#since;起可用],
  ),

  // Section tooltips
  constructor: babel(
    en: [Constructor],
    ja-status: "validated",
    ja: [コンストラクタ],
    zh-status: "validated",
    zh: [构造函数],
  ),
  constructorDescription: babel(
    en: [If a type has a constructor, you can call it like a function to create a new value of the type.],
    ja-status: "validated",
    ja: [コンストラクタを持つ型の場合、関数のように呼び出すことで、その型の新しい値を作成できます。],
    zh-status: "validated",
    zh: [若某类型提供构造函数，可调用它生成该类型的新实例。],
  ),
  definitions: babel(
    en: [Definitions],
    ja-status: "validated",
    ja: [定義],
    zh-status: "validated",
    zh: [定义],
  ),
  definitionsOn: (kind, parent: none) => {
    // `parent` only exists for nested definitions.
    assert(kind in ("constant", "function", "type"))
    babel(
      en: {
        (constant: [Constants], function: [Functions], type: [Types]).at(kind)
        if parent != none [ on #raw(parent)]
      },
      ja-status: "need update", // When it was translated, en used _of_ instead of _on_, and `kind` was always _Definitions_.
      ja: if parent == none [定義] else [#raw(parent)の定義],
      zh-status: "proofread",
      zh: {
        let kind = (constant: [常量], function: [函数], type: [类型]).at(kind)
        if parent == none { kind } else [#raw(parent)上的#kind]
      },
    )
  },
  definitionsDescription: kind => {
    assert(kind in ("constant", "function", "type"))
    babel(
      en: [Functions and types can have associated #{ kind + "s" }. These are accessed by specifying the function or type, followed by a period, and then the #kind's name.],
      ja-status: "need update", // When it was translated, the wording of en was slightly different, and `kind` was always _Definitions_.
      ja: [これらの関数や型には、関連する定義を持たせることができます。定義にアクセスするには、対象の関数や型の名前を指定した後に、ピリオド区切りで定義名を記述します。],
      zh-status: "validated",
      zh: {
        let kind = (constant: [常量], function: [函数], type: [类型]).at(kind)
        [这些函数和类型带有附属#kind。要访问这种#kind，请先写上函数或类型的名称，再加上附属#kind;的名称，并用句点在中间分隔。]
      },
    )
  },
  functions: babel(
    en: [Functions],
    ja-status: "validated",
    ja: [関数],
    zh-status: "validated",
    zh: [函数],
  ),
  parameters: babel(
    en: [Parameters],
    ja-status: "validated",
    ja: [引数],
    zh-status: "validated",
    zh: [参数],
  ),
  parametersDescription: babel(
    en: [Parameters are input values for functions. Specify them in parentheses after the function name.],
    ja-status: "validated",
    ja: [引数は関数への入力値です。関数名の後に括弧で囲んで指定します。],
    zh-status: "validated",
    zh: [参数是传给函数的输入，写在函数名后的括号中。],
  ),

  // Parameter tooltips
  variadic: babel(
    en: [Variadic],
    ja-status: "validated",
    ja: [可変長引数],
    zh-status: "validated",
    zh: [变长参数],
  ),
  variadicDescription: babel(
    en: [Variadic parameters can be specified multiple times.],
    ja-status: "validated",
    ja: [可変長引数は複数回指定することができます。],
    zh-status: "validated",
    zh: [变长参数可以传入多次。],
  ),
  settable: babel(
    en: [Settable],
    ja-status: "validated",
    ja: [設定可能引数],
    zh-status: "validated",
    zh: [可用set规则],
  ),
  settableDescription: babel(
    en: [Settable parameters can be customized for all following uses of the function with a `set` rule.],
    ja-status: "need update", // When it was translated, the wording of en was slightly different.
    ja: [設定可能引数は、`set`ルールを用いて設定でき、それ以降で使用するデフォルト値を変更できます。],
    zh-status: "validated",
    zh: [可用`set`规则设置参数，更改后续调用时的默认值。],
  ),
  positional: babel(
    en: [Positional],
    ja-status: "validated",
    ja: [位置引数],
    zh-status: "validated",
    zh: [位置参数],
  ),
  positionalDescription: babel(
    en: [Positional parameters are specified in order, without names.],
    ja-status: "need update", // When it was translated, the wording of en was slightly different.
    ja: [位置引数は順序通りに指定することで、引数名を省略して設定できます。],
    zh-status: "validated",
    zh: [位置参数按顺序传入，不带参数名。],
  ),
  required: babel(
    en: [Required],
    ja-status: "validated",
    ja: [必須引数],
    zh-status: "validated",
    zh: [必需参数],
  ),
  requiredDescription: babel(
    en: [Required parameters must be specified when calling the function.],
    ja-status: "validated",
    ja: [必須引数は、関数を呼び出す際に必ず指定しなければなりません。],
    zh-status: "validated",
    zh: [必需参数在调用函数时必须传入。],
  ),

  // Other texts in documentation
  defaultValue: babel(
    en: [Default: ],
    ja-status: "need update", // When it was translated, en uses _Default value_ instead of _Default_.
    ja: [デフォルト値：],
    zh-status: "validated",
    zh: [默认值：],
  ),
  viewOptions: babel(
    en: [View options],
    ja-status: "need update", // When it was translated, en was _Available string values_
    ja: [使用可能な文字列値],
    zh-status: "need proofread",
    zh: [展开可填值],
  ),
  viewExample: (title: none) => babel(
    en: if title != none [View example: #title] else [View example],
    ja-status: "need update", // When it was translated, en uses _show_ instead of _view_.
    ja: if title != none [例を表示：#title] else [例を表示],
    zh-status: "proofread",
    zh: if title != none [展开示例：#title] else [展开示例],
  ),
  deprecationWarning: (message, until: none) => {
    // `until` will be a Typst version, e.g., "0.15.0".
    if until != none {
      babel(
        en: message + [; it will be removed in Typst #until],
        zh-status: "validated",
        zh: [#message；Typst #until;将移除该功能],
        ja-status: "not translated",
        ja: [],
      )
    } else {
      message
    }
  },

  // // Translation statuses
  // // TODO: Use `l10n-status` instead.
  // untranslated: [],
  // untranslatedMessage: [],
  // communityContent: [],
  // contentAddedByCommunity: [],
  // partiallyTranslated: [],
  // partiallyTranslatedMessage: [],
  // translated: [],
  // translatedMessage: [],

  // Header, sidebar, and footer
  document: babel(
    en: [Document],
    ja-status: "validated",
    ja: [ドキュメント],
    zh-status: "validated",
    zh: [文档],
  ),
  langVersion: babel(
    en: [English],
    ja-status: "validated",
    ja: [日本語版],
    zh-status: "validated",
    zh: [简体中文版],
  ),
  // translationRate: babel(
  //   en: [Translated],
  //   ja-status: "validated",
  //   ja: [翻訳率],
  //   zh-status: "validated",
  //   zh: [翻译率],
  // ),
  // typstOfficialWebsite: babel(
  //   en: [Typst official website],
  //   ja-status: "validated",
  //   ja: [Typst公式サイト],
  //   zh-status: "validated",
  //   zh: [Typst官方网站],
  // ),
  // typstOfficialDocs: babel(
  //   en: [Typst official docs],
  //   ja-status: "validated",
  //   ja: [Typst公式ドキュメント],
  //   zh-status: "validated",
  //   zh: [Typst官方文档],
  // ),
  openOfficialDocs: babel(
    en: [Open official docs],
    ja-status: "validated",
    ja: [原文（英語）を開く],
    zh-status: "validated",
    zh: [转到官方文档（英文）],
  ),
  downloadPdfDocs: babel(
    en: [Download as PDF],
    zh-status: "proofread",
    zh: [下载PDF版文档],
  ),
  tableOfContents: babel(
    en: [On this page],
    ja-status: "validated",
    ja: [目次],
    zh-status: "validated",
    zh: [目录],
  ),
  summary: babel(
    en: [Summary],
    ja-status: "validated",
    ja: [概要],
    zh-status: "proofread",
    zh: [概要],
  ),
  // TODO: Typst Community is linked to githubOrganizationUrl in typst-docs-web
  footer: [Translated by Typst Community],
  previousPage: babel(
    en: [Previous page],
    ja-status: "validated",
    ja: [前のページ],
    zh-status: "validated",
    zh: [上一页],
  ),
  nextPage: babel(
    en: [Next page],
    ja-status: "validated",
    ja: [次のページ],
    zh-status: "validated",
    zh: [下一页],
  ),

  // Site notice
  siteNoticeBannerTitle: babel(
    en: [Info],
    ja-status: "validated",
    ja: [情報 / Info],
    zh-status: "validated",
    zh: [注意 / Info],
  ),
  siteNoticeBannerDescription: babel(
    // TODO: These descriptions should be rewritten.
    en: [
      This site is generated using the static site generator developed by the #link("https://github.com/typst-community")[Typst Community]. Please adjust the text content of this banner according to your usage requirements. At Typst GmbH's request, when publishing documentation, you must clearly indicate that it is non-official and display the version of Typst being documented. For details, refer to #link("https://github.com/typst/typst/issues/874#issuecomment-2273854138")[Issue \#874 on typst/typst].
    ],
    ja-status: "need update",
    ja: [
      当サイトは、Typst GmbHの許諾を得て、日本語コミュニティ「#link("https://github.com/typst-jp")[Typst Japanese Community]」が#link("https://typst.app/docs/")[Typst v#sys.version;の公式ドキュメント]を翻訳したものです。誤訳や古い情報が含まれている可能性があるため、#link("https://typst.app/docs/")[公式ドキュメント]との併用を推奨します。翻訳の改善やサイトの機能向上について、#link("https://github.com/typst-jp/docs")[GitHub]でのIssueやPull Requestを歓迎します。コミュニティにご興味のある方は#link("https://discord.gg/9xF7k4aAuH")[Discordサーバー「くみはんクラブ」]にぜひご参加ください。

      This site provides a Japanese translation of the #link("https://typst.app/docs/")[Typst v#sys.version documentation] maintained by the "#link("https://github.com/typst-jp")[Typst Japanese Community]" with permission from Typst GmbH. We recommend using this alongside the #link("https://typst.app/docs/")[official documentation]. We welcome contributions through Issues and Pull Requests on #link("https://github.com/typst-jp/docs")[our GitHub repository] for both translation improvements and website enhancements. Feel free to join #link("https://discord.gg/9xF7k4aAuH")[our Discord server "Kumihan Club"].
    ],
    zh-status: "need update",
    zh: [
      本站经 Typst GmbH 许可，提供 #link("https://typst.app/docs/")[Typst v#sys.version 官方文档]的翻译，由#link("https://github.com/typst-doc-cn")[中文社区]维护。建议与#link("https://typst.app/docs/")[官方文档]一同阅读，因为可能存在错译、漏译或过时信息。如有意改进翻译内容或网站本身，可在#link("https://github.com/typst-doc-cn/docs-8138")[GitHub]上提出 Issue、发起 Pull Requests。此外，也欢迎加入#link("https://qm.qq.com/q/MQO6j6jCw2")[「Typst 非官方中文交流群」（QQ 793548390）]。

      This site provides a Chinese translation of the #link("https://typst.app/docs/")[Typst v#sys.version documentation] maintained by the “#link("https://github.com/typst-doc-cn")[Typst Chinese Community]” with permission from Typst GmbH. We recommend using this alongside the #link("https://typst.app/docs/")[official documentation]. We welcome contributions through Issues and Pull Requests on #link("https://github.com/typst-doc-cn/docs-8138")[our GitHub repository] for both translation improvements and website enhancements. Feel free to join #link("https://qm.qq.com/q/MQO6j6jCw2")[our QQ chat group “Typst 非官方中文交流群” (793548390)].
    ],
  ),
)
