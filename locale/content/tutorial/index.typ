#import "/i18n-scope.typ": babel, note
#import "/components/index.typ": docs-chapter, paged-heading-offset, short-or-long

#docs-chapter(
  title: babel(
    en: "Tutorial",
    zh-status: "proofread",
    zh: "教程",
  ),
  route: "/tutorial",
  description: babel(
    en: "Typst's tutorial.",
    zh-status: "proofread",
    zh: "Typst的教程。",
  ),
  introduction: true,
)[
  #babel(
    en: [
      Welcome to Typst's tutorial! In this tutorial, you will learn how to write and format documents in Typst. We will start with everyday tasks and gradually introduce more advanced features. This tutorial does not assume prior knowledge of Typst, other markup languages, or programming. We do assume that you know how to edit a text file.

      The best way to start is to sign up to the Typst app for free and follow along with the steps below. The app gives you instant preview, syntax highlighting and helpful autocompletions. Alternatively, you can follow along in your local text editor with the #link("https://github.com/typst/typst")[open-source CLI].
    ],
    zh-status: "proofread",
    zh: [
      欢迎阅读Typst教程！在本教程中，您将学习如何用Typst撰写文档并编排格式。我们将从日常任务开始，逐步引入更高级的功能。本教程不要求您事先了解Typst、其它标记语言或编程知识，但假设您清楚如何编辑文本文件。

      最佳开始方法是免费注册Typst在线应用，然后跟着后续步骤操作。在线应用会提供实时预览、语法着色和自动补全。或者您也可在本地使用文本编辑器和#link("https://github.com/typst/typst")[开源Typst命令行]操作。

      #note[
        【译注】中文社区导航站「#link("https://typst-doc-cn.github.io/guide/quick-start.html#在线使用")[快速开始]」有在线使用、本地使用的具体指导。其实在线应用不注册亦可尝试，而本地VS Code安装插件后不必再安装命令行。
      ]
    ],
  )

  = #babel(
    en: short-or-long[When Typst][When to use Typst],
    zh-status: "proofread",
    zh: short-or-long[使用场景][Typst能用在哪里],
  ) <when-typst>
  #babel(
    en: [
      Before we get started, let's check what Typst is and when to use it. Typst is a markup language for typesetting documents. It is designed to be easy to learn, fast, and versatile. Typst takes text files with markup in them and outputs PDFs.

      Typst is a good choice for writing any long form text such as essays, articles, scientific papers, books, reports, and homework assignments. Moreover, Typst is a great fit for any documents containing mathematical notation, such as papers in the math, physics, and engineering fields. Finally, due to its strong styling and automation features, it is an excellent choice for any set of documents that share a common style, such as a book series.
    ],
    zh-status: "proofread",
    zh: [
      在开始之前，让我们先明确一下Typst是什么、能用在哪里。Typst可看作标记语言，它能排版文档，而且设计得上手简单、响应快速、用途广泛。Typst也可看作编译器，它读取包含标记的文本文件，导出为PDF等格式。

      Typst适合撰写任何长度的文本，包括随笔、文章、科技论文、书籍、报告、作业等。Typst特别适合撰写包含数学公式的文档，例如数学、物理和工程领域的论文。此外，由于Typst设置样式、自动处理的能力强，撰写丛书等样式相同的系列文档时，Typst也是绝佳选择。
    ],
  )

  = #babel(
    en: short-or-long[Learnings][What you will learn],
    zh-status: "proofread",
    zh: short-or-long[学习内容][您将学到什么],
  ) <learnings>
  #babel(
    en: [
      This tutorial has four chapters. Each chapter builds on the previous one. Here is what you will learn in each of them:

      + @tutorial:writing-in-typst[Writing in Typst:] Learn how to write text and insert images, equations, and other elements.
      + @tutorial:formatting[Formatting:] Learn how to adjust the formatting of your document, including font size, heading styles, and more.
      + @tutorial:advanced-styling[Advanced Styling:] Create a complex page layout for a scientific paper with typographic features such as an author list and run-in headings.
      + @tutorial:making-a-template[Making a Template:] Build a reusable template from the paper you created in the previous chapter.

      We hope you'll enjoy Typst!
    ],
    zh-status: "proofread",
    zh: [
      本教程共分四章，每一章都建立在之前章节的基础上。以下是每章学习的内容：

      + @tutorial:writing-in-typst[使用Typst写作]：学习如何编辑文本并插入图片、公式等元素。
      + @tutorial:formatting[基本格式]：学习如何调整文档格式，包含字号、标题样式等。
      + @tutorial:advanced-styling[高级样式]：实现科技论文的复杂页面版式，包含作者列表、同行标题等排版设计。
      + @tutorial:making-a-template[制作模板]：制作可复用的模板，其基础是前一章实现的论文。

      希望您享受用Typst写作！
    ],
  )
]

#show: paged-heading-offset.with(1)
#include "1-writing.typ"
#include "2-formatting.typ"
#include "3-advanced.typ"
#include "4-template.typ"
