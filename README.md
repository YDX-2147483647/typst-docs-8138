# Typst文档本地化——上游迁移文档构建流程至Typst后的新尝试

> 前辈创建[Typst中文文档](https://typst-doc-cn.github.io/docs/)未满一年，便因更新翻译困难而中途停滞。如今上游官方迁移构建流程（[#8138](https://github.com/typst/typst/pull/8138)），中文文档业已陈旧过时，这正是再思架构、重启翻译的好时机啊。

Typst文档有以下三种来源。

- **单独撰写：**以独立Typst文档的形式直接撰写，主要是[教程](https://typst.app/docs/tutorial/)和[指南](https://typst.app/docs/guides/)。

  这类文档在[`locale/content/**/*.typ`](./locale/content/)本地化。

- **源码注释：**在Rust源代码中以Typst格式添加注释，主要是[参考手册](https://typst.app/docs/reference/)中各种函数及其参数的文档。

  这类文档在[`locale/crates/**/*.rs.typ`](./locale/crates/)本地化，与[Typst源代码](https://github.com/typst/typst/tree/main/crates/)对应，`*.rs.typ`中每项的数字表示与上一项在`*.rs`中相差的行数。

- **程序计算：**由Rust程序根据类型规则推导计算，例如[`page.page`页面尺寸](https://typst.app/docs/reference/layout/page/#parameters-paper)的取值列表。

  这类文档大多无需翻译，不过以防万一，也准备了[`locale/static.typ`](./locale/static.typ)。

无论哪类文档，都使用`babel`函数记录原文和翻译，其用法如下。

```typst
#babel(
  en: [
    Welcome to Typst’s documentation!
  ],
  zh-status: "need proofread",
  zh: [
    欢迎阅读Typst的中文文档！
  ],
)
```

- `en: […]`与`zh: […]`分别填写英文原文与中文翻译。具体写法请参考 [Typst documentation: Editing typst.app/docs - General - Typst Forum](https://forum.typst.app/t/typst-documentation-editing-typst-app-docs/5705)，例如`@counter.display`表示链接到`counter.display`函数。

- `zh-status`表示中文翻译的状态，常用取值如下，更多细节请参考[`i18n-babel.py`](./patches/i18n-babel.typ)中的注释。

  ```mermaid
  flowchart LR
    not-translated[not translated<br>尚未翻译或无需翻译<br>（默认）]
    -->|机器翻译| need-proofread[need proofread<br>待校对]
    -->|人工校对| proofread[proofread<br>已校对]
    -->|另一人校对| validated[validated<br>已核对]
  ```

## 本地预览

TODO: 准备typst-docs CLI下载页面和PR机器人。

本地预览需要[安装just](https://just.systems/man/en/installation.html)、下载typst-docs CLI等准备工作，相对麻烦；一般使用 pull request 机器人即可。

```sh
just setup
just serve
```
