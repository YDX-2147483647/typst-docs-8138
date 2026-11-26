#import "/i18n-scope.typ": babel, note
#import "/components/index.typ": big-nav-button, def-dest, docs-chapter, icon, insertion

#show: docs-chapter.with(
  title: babel(
    en: "Overview",
    zh-status: "proofread",
    zh: "概览",
  ),
  route: "/",
  def-target: <overview>,
  description: babel(
    en: "Learn how to use Typst to compose documents faster. Get started with the tutorial, or dive into the reference.",
    zh-status: "proofread",
    zh: "了解如何用Typst更快地撰写文档。从教程学起，或直接深入参考手册。",
  ),
  nav-buttons: html.div(class: "doc-categories", {
    context big-nav-button(
      icon: icon(32, "tutorial-c", "Circled play icon"),
      href: def-dest(<tutorial>),
      title: babel(
        en: "Tutorial",
        zh-status: "validated",
        zh: "教程",
        ja-status: "validated",
        ja: "チュートリアル",
      ),
      description: babel(
        en: [Step-by-step guide to help you get started.],
        zh-status: "validated",
        zh: [逐步学习如何使用Typst。],
        ja-status: "need update", // When it was translated, the wording of en was slightly different.
        ja: [一歩一歩、Typstの使い方を学びましょう。],
      ),
    )
    context big-nav-button(
      icon: icon(32, "reference-c", "Circled information icon"),
      href: def-dest(<reference>),
      title: babel(
        en: "Reference",
        ja-status: "validated",
        ja: "リファレンス",
        zh-status: "validated",
        zh: "参考手册",
      ),
      description: babel(
        en: [Details about all syntax, concepts, types, and functions.],
        ja-status: "need update", // When it was translated, the wording of en was slightly different.
        ja: [Typstのあらゆる構文、概念、型、関数についての詳細なリファレンスです。],
        zh-status: "proofread",
        zh: [了解Typst的语法、概念、类型、函数等各类细节。],
      ),
    )
  }),
)

#babel(
  en: [
    Welcome to Typst's documentation! Typst is a markup-based typesetting system that combines powerful automation and high-quality typography with speed and ease of use. This makes it suitable for documents of any complexity. Typst is a great alternative to both word processors and LaTeX.
  ],
  zh-status: "proofread",
  zh: [
    欢迎阅读Typst文档！Typst是一种采用标记语法的排版系统，自动处理能力强，字体排印效果好，而且使用起来快捷简单。Typst适用于各种复杂程度的文档，是各种文字处理软件与LaTeX的理想替代方案。

    #note[
      // 此段应与`Translation.siteNoticeBannerDescription`同步更新
      【译注】本站提供#link("https://typst.app/docs/")[官方英文文档]的非官方中文翻译，由#link("https://github.com/typst-doc-cn")[中文社区]维护。目前翻译很不完全，存疑部分会标注⚠️，过时部分会标注⚠️💀。遇到这种情况，可单击页面上方或下方「转到官方文档」参照阅读。如有意改进翻译内容或网站本身，可在#link("https://github.com/typst-doc-cn/docs-8138")[GitHub]上提出 issue、发起 pull request。
    ]

    #divider()
  ],
)

#babel(
  en: [
    This documentation is split into multiple parts, serving different needs:

    - If you are new to Typst, we highly recommend starting with our @tutorial[beginner-friendly tutorial]. Throughout the tutorial, we will introduce you to Typst through a practical example.

    - To answer targeted questions about Typst and familiarize yourself with advanced features, use the @reference[reference]. It describes the fundamental features of the Typst language and contains sections for all the functions, types, and more that come with Typst.

    - For tailored, in-depth how-tos on specific features, use cases, and audiences, check out our @guides[guides]. They provide copyable snippets throughout and allow you to build confidence with a specific feature area. If you are coming from LaTeX, the @guides:for-latex-users provides an alternative introduction to Typst, building on concepts you already know.
  ],
  zh-status: "proofread",
  zh: [
    本文档分为以下几部分，满足不同需求。

    - 如果刚接触Typst，建议先阅读@tutorial[面向新手的教程]。教程会通过一个实例带您逐步了解Typst。

    - 如需解决关于Typst的具体问题或进一步熟悉其功能，请查阅@reference[参考手册]。参考手册会讲解Typst语言的基本特性，然后分章描述Typst的函数、类型等各类细节。

    - 对于特定功能、场景、受众的操作方法，请深入各篇@guides[指南]。指南会提供直接复制可用的代码片段，并让您熟练掌握相应功能领域。另外如果您用过LaTeX，可阅读@guides:for-latex-users，借助您已经清楚的概念了解Typst。

      #note[
        【译注】中文社区导航站另有#link("https://typst-doc-cn.github.io/guide/FAQ.html")[常见问题集合]和#link("https://typst-doc-cn.github.io/guide/word.html")[面向Word用户的快速入门向导]，可作为文档站指南的补充。
      ]

    #divider()
  ],
)

#babel(
  en: [
    The term _Typst_ refers to three concepts: The Typst language, the Typst compiler, and the Typst web app. The language is what you write, the compiler translates files in the Typst language into PDFs, HTML pages, and other formats, and the Typst web app lets you work collaboratively on Typst projects in your browser. The Typst language and the compiler are open-source.

    This documentation primarily documents the Typst language, although the tutorial and various pages will refer to the web app and the command line Typst compiler.
    #insertion(
      "overview-web-app",
      // The deployed version:
      // Here on typst.app, we also include documentation of key web app features, our roadmap, and more on how you can participate in the Typst community.
      fallback: [
        In the copy of the docs hosted on #link("https://typst.app/docs/"), we also include documentation about the web app.
      ],
    )
    To learn how to install the Typst compiler CLI, visit the #link("https://typst.app/open-source")[Open Source page] on our website. There, you can also learn more about the relationship between the Typst compiler and the web app. Once you have installed the Typst compiler CLI, run `typst help` for more information on how to use it.
  ],
  zh-status: "proofread",
  zh: [
    _Typst_一词包含三个概念：Typst语言、Typst编译器、Typst在线应用。您用Typst语言编辑文件，Typst编译器将文件导出为PDF、HTML等格式，而Typst在线应用支持在浏览器中协作编辑Typst项目。Typst语言和编译器开源。

    本文档主要围绕Typst语言，不过教程和某些页面也会提及在线应用和Typst命令行编译器。#insertion(
      "overview-web-app",
      fallback: [文档站的#link("https://typst.app/docs/")[官方英文版本]还有专门页面介绍在线应用、用户社区和发展路线。],
    )如想安装Typst编译器命令行，请参考官网#link("https://typst.app/open-source")[Open Source页面]，该页面还进一步解释了Typst编译器与在线应用的关系。安装好Typst编译器命令行后，可运行 `typst help` 获取使用说明。

    #note[
      【译注】因技术限制，目前本站不介绍在线应用、用户社区和发展路线，不过用户社区可参考#link("https://typst-doc-cn.github.io/guide/#用户社区")[中文社区导航站首页]的链接，有QQ群、论坛等。
    ]
  ],
)

#babel(
  en: [
    Our #link("https://github.com/typst/typst")[GitHub repository] provides additional developer-facing documentation about how to contribute to Typst and how to integrate it into your applications.

    The documentation also contains a @changelog[changelog], in which you can track the evolution of Typst and what changes to the markup language mean for your projects. This documentation applies to Typst #sys.version.
  ],
  zh-status: "proofread",
  zh: [
    我们的#link("https://github.com/typst/typst")[GitHub仓库]提供了额外的开发文档，介绍如何向Typst贡献代码以及如何将Typst集成进其它应用。

    本文档还包含@changelog[更新记录]。您可在这部分追踪Typst的演进历程，了解Typst语言变化后您应如何更新既有项目。本文档适用于 Typst #sys.version。

    #note[
      【译注】因技术限制，本站当前文档基本适用于 Typst #sys.version，但还包含后续尚未正式发布的开发版特性。如果遇到问题，请「转到官方文档」参照阅读。
    ]
  ],
)
