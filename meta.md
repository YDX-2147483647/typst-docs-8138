# 方针与政策

此文件列出了本项目的潜在方针政策，大多尚未实现，有些还待商榷。另外，文件末尾附了一些历史情况。

## 基本方针

- **重视人类贡献**

  现在有许多工具能在网页上直接调用机器翻译。与直接访问官方文档并使用这类工具相比，此项目的优势主要在于有人参与，因此应重视人类贡献。

- **保持长期更新**

  中文社区早年翻译曾积极维护至2023年末Typst v0.10.0，但此后仅随缘更新，大量内容逐渐过时；到2024年秋Typst v0.12.0发布前后，这版翻译反而频繁误导用户。为避免重蹈覆辙，应保持长期更新。

## 具体政策

### 减少依赖项目

降低外围贡献者参与门槛。避免过多依赖Rust、Node等工具链，尽量保证无需复杂编译就能预览简单编辑。

减轻维护负担。在Typst以外尽量少引入依赖，尽量让更新Typst版本时只需关注Typst本身的更新。

### 保留原文对照

翻译时不能删除原文，应保留原文作为对照。这样更新Typst版本时，可利用原文检查哪些部分需要重译、补译；阅读翻译时，容易参考原文理解翻译模糊之处。

### 允许长期存在不完善页面

过时内容应该自动标注为过时。

允许存在部分翻译的页面。例如某页面之前已完成翻译，后来原文新增一段，此时翻译版可以先照抄原文新增内容。

### 统一术语

用术语表统一前后用词。

### 审核

机器翻译应有人工审核，人工翻译应有他人审核。

允许暂时存在未审核的翻译，但应予以标注。

### 展示贡献者

在页面上展示贡献者名单。一方面尊重许可协议，另一方面也能鼓励贡献。

### 代码注释用英文

非文档性代码的注释应该用英文。日文社区的朋友未来可能会参考，用英文更方便交流。[之前](https://github.com/typst-jp/docs/pull/283)他们发现他们开发的程序在日文社区以外有用处，就贴心地主动把注释转成英文了。

### 用CSS实现中西间距

用[CSS属性`text-autospace`](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/text-autospace)实现中西间距，而源代码的中西字符间不加空格。不过若源代码已加空格，则不必特意删除。

## 附录：先前项目

- [typst-docs-web](https://typst-docs-web.netlify.app/)提供了与Typst官方不同的网站前端，支持全文搜索，并且专门适配了本地化场景；不过目前只支持输入Typst v0.14.2及之前的JSON。

- [typst-docs-l10n](https://github.com/typst-doc-cn/docs)与[tinymist-l10n](https://docs.rs/tinymist-l10n)利用TOML实现了一种不同于fork仓库的翻译方式，并尝试调用人工智能大量翻译。

更多项目见 [🏗 Documentation infrastructure — Best of Typst (TCDM)](https://ydx-2147483647.github.io/best-of-typst/#docs-infra)。

## 附录：fork式翻译的详细历史

（以下Typst版本发布日期按官方日志，其余日期按UTC+8）

<details><summary>2023年：Typst公开发布版本；中文社区启动翻译</summary>

1. 🟢[Typst v0.1.0](https://typst.app/docs/changelog/0.5.0/)于2023-04-04发布，此前数月还有多个早期版本

2. 🟢[Typst v0.5.0](https://typst.app/docs/changelog/0.5.0/)于2023-06-09发布

3. 🐼中文社区[2023-06-24 `8506922`](https://github.com/typst-doc-cn/typst-doc-cn.github.io/commit/8506922a826a61626721982d1c3eb70f2e7a9fb3)：克隆Typst官方仓库，修改typst-docs模块，从官方文档逆向工程制作模板与静态资源，创建「Typst中文文档」

4. 🟢[Typst v0.6.0](https://typst.app/docs/changelog/0.6.0/)于2023-06-30发布

5. 🐼中文社区[2023-07-01 `6128ccb`](https://github.com/typst-doc-cn/typst-doc-cn.github.io/commit/6128ccb2a95fc1b98c50e9859a707e57d8ecbf8d)：合并上游，更新到Typst v0.6.0

6. 🟢[Typst v0.7.0](https://typst.app/docs/changelog/0.7.0/)于2023-08-07发布，[Typst v0.8.0](https://typst.app/docs/changelog/0.8.0/)于2023-09-13发布

7. 🐼中文社区[2023-09-17 `27b786d`](https://github.com/typst-doc-cn/typst-doc-cn.github.io/commit/27b786d157889a53ecb7e110610ddca168ebb50a)：跳过Typst v0.7.0，「直接在0.8的基础上改写」，从而更新到Typst v0.8.0

8. 🟢[Typst v0.9.0](https://typst.app/docs/changelog/0.9.0/)于2023-10-31发布，[Typst v0.10.0](https://typst.app/docs/changelog/0.10.0/)于2023-12-04发布

9. 🐼中文社区[2023-12-05 `002ac83`](https://github.com/typst-doc-cn/typst-doc-cn.github.io/commit/002ac835ab2166e201916bf64df803d8eb21393e)：最后一次在`0.8.0`分支更新

10. 🐼中文社区[2023-12-08 `719ab4b`](https://github.com/typst-doc-cn/typst-doc-cn.github.io/commit/719ab4b9a62360afb453cc3f5127ebfc511102a9)：另建分支，更新到Typst v0.10.0

</details>

<details><summary>2024年：中文翻译引发域外关注，但内容逐渐过时；日文社区启动翻译，最初克隆中文社区仓库，后来积极同步新版Typst</summary>

1. 🟢Typst官方人员[2024-02-20讨论#3425](https://github.com/typst/typst/pull/3425#issuecomment-1954341630)时，表示中文翻译的情况欠佳，尽管确实有用且已注明非官方，但完全复刻官方文档网站前端还是“not great”

2. 🟢Typst上游合并[2024-02-27 `7ed257a` (#3429)](https://github.com/typst/typst/commit/7ed257a3c7d9aa69e9f127e78a918b862c4d4f74)：美国人Jacob Hummer向typst-docs模块添加能生成JSON的CLI，JSON中包含文档各部分的HTML，可用于构建网站；不过Typst官方内部构建时并不使用

3. 🟢[Typst v0.11.0](https://typst.app/docs/changelog/0.11.0/)于2024-03-15发布，[Typst v0.11.1](https://typst.app/docs/changelog/0.11.1/)于2024-05-17发布

4. 🗻日文社区[2024-06-11 `e84c3e4`](https://github.com/typst-jp/docs/commit/e84c3e40cee6b44c96c1f571366df74913aa860c)：克隆中文社区仓库，创建「Typstドキュメント」（Typst文档）；后来明确为「Typstドキュメント日本語版」

5. 🗻日文社区[2024-08-19 `deb3c25` (#40)](https://github.com/typst-jp/docs/commit/deb3c25fbed41969af3a6dd6db89b51e2cf11998)：合并上游，更新到Typst v0.11.0

6. 🗻日文社区[2024-08-25 `b9e4d1a` (#47)](https://github.com/typst-jp/docs/commit/b9e4d1aaf7b88461a156cb0cc975ba117c2aaa9d)：合并上游，更新到Typst v0.11.1

7. 🗻日文社区[2024-08-26创建#54](https://github.com/typst-jp/docs/issues/54)，注意到Typst官方在[#3425](https://github.com/typst/typst/pull/3425#issuecomment-1954341630)对网站前端的意见，准备另外开发，避免许可争议

8. 🐼中文社区[2024-10–08 `509040e`](https://github.com/typst-doc-cn/typst-doc-cn.github.io/commit/509040efe27b40a81ee0136ff59b71b4bad92986)：提示「本教程存在过时问题，更详细教程请阅读[小蓝书](https://typst-doc-cn.github.io/tutorial/)和[Typst中文社区导航FAQ](https://typst-doc-cn.github.io/guide/)」

9. 🟢[Typst v0.12.0](https://typst.app/docs/changelog/0.12.0/)于2024-10-18发布

10. 🗻日文社区[2024-10-23 `69f9d41` (#62)](https://github.com/typst-jp/docs/commit/69f9d4179b947891bcd2a7490d7677f91543c5c6)：合并上游，更新到Typst v0.12.0

</details>

<details><summary>2025年：中文翻译基本停滞，中文社区重心移至其它站点；日文翻译再接再厉，内容与样式一同发展</summary>

1. 🟢[Typst v0.13.0](https://typst.app/docs/changelog/0.13.0/)于2025-02-19发布

2. 🗻日文社区[2025-03-29 `027451a` (#109)](https://github.com/typst-jp/docs/commit/027451a05cb2d99f45411a28d3939d629114f9e6)：合并上游，更新到Typst v0.13.0

3. 🐼中文社区[2025-03-02 `6eb7325`](https://github.com/typst-doc-cn/typst-doc-cn.github.io/commit/6eb732587f4faf35291973cac798ef52ff81565d)：该仓库最后一次更新，删除《中文用户指南》中已迁移到[中文社区导航](https://typst-doc-cn.github.io/guide/)的内容。

4. 🟢[Typst v0.13.1](https://typst.app/docs/changelog/0.13.1/)于2025-03-07发布

5. 🗻日文社区[2025-04-01 `5c056b7` (#111)](https://github.com/typst-jp/docs/commit/5c056b7f890784c3bf0677f85d33673d244b0e0a)：合并上游，更新到Typst v0.13.1

6. 🗻日文社区[2025-04-12 `c514876` (#117)](https://github.com/typst-jp/docs/commit/c5148769cf3d2a12dd7ff9d240a44d7b925f37f9)：针对先前创建的[#54](https://github.com/typst-jp/docs/issues/54)，用Hono JSX开发网站前端，替代先前官方文档逆向工程结果

7. 🗻日文社区[2025-09-21 `7618dd5`](https://github.com/typst-community/typst-docs-web/commit/7618dd58a6900085ec0f268ef7a393f303a278a8)：将网站前端导出为可复用的typst-docs-web仓库

8. 🟢[Typst v0.14.0](https://typst.app/docs/changelog/0.14.0/)于2025-10-24发布，[Typst v0.14.1](https://typst.app/docs/changelog/0.14.1/)于2025-12-03发布，[Typst v0.14.2](https://typst.app/docs/changelog/0.14.2/)于2025-12-12发布

9. 🟢Typst官方人员于[2025-11-07](https://github.com/typst-community/typst-docs-web/discussions/38)向社区表示正在将文档构建流程迁移到Typst，估计之后不再支持JSON

</details>

<details><summary>2026年：日文翻译稳步进行，但Typst版本略有落后；Typst官方迁移文档构建流程至Typst，西语翻译随之启动</summary>

1. 🗻日文社区[2026-02-15 `741ce18` (#340)](https://github.com/typst-jp/docs/commit/741ce18762a16b1c1e0cfc927107bde12d680abe)：合并上游，更新到Typst v0.14.0

2. 🟢Typst官方[2026-05-06 `c190c21` (#8138)](https://github.com/typst/typst/commit/c190c21639312242ed634ea3192077e22bff484a)：迁移文档构建流程至Typst，同时不再支持JSON

3. 🟢[Typst v0.15.0](https://typst.app/docs/changelog/0.15.0/)于2026-06-15发布，[Typst v0.15.1](https://typst.app/docs/changelog/0.15.1/)于2026-07-17发布

4. 🗻日文社区[2026-09-06 `0395a20` (#415)](https://github.com/typst-jp/docs/commit/0395a2046252b9ad431a9471a864fede4b8500bb)：合并上游，更新到Typst v0.14.1

5. 🧉Jassiel [2026-09-30 `796b080`](https://github.com/typst/typst/commit/796b0804acc79df959bf363138e32cbae95003c9)：以Typst构建流程为基础，创建 Documentación de Typst en español rioplatense（拉普拉塔河西班牙语Typst文档）

6. 🗻日文社区[2026-10-02 `3cab60e` (#437)](https://github.com/typst-jp/docs/commit/3cab60eb3b76db0472258fe8e24ef92e249ae440)：合并上游，更新到Typst v0.14.2

</details>
