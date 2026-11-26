#import "/i18n-scope.typ": babel
#import "/components/index.typ": docs-category

#show: docs-category.with(
  title: babel(
    en: "Data Loading",
    zh-status: "need proofread",
    zh: "数据加载",
  ),
  description: babel(
    en: "Documentation for data loading functionality.",
    zh-status: "need proofread",
    zh: "Typst中与数据加载有关联的函数族的文档",
  ),
  category: "data-loading",
)

#babel(
  en: [
    Data loading from external files.

    These functions help you with loading and embedding data, for example from the results of an experiment.
  ],
  zh-status: "need proofread",
  zh: [
    从外部文件加载数据。

    这些函数可以帮助您加载和嵌入数据，例如从实验结果中获取数据。
  ],
)

= Encoding <encoding>
Some of the functions are also capable of encoding, e.g. @cbor.encode. They facilitate passing structured data to @plugin[plugins].

However, each data format has its own native types. Therefore, for an arbitrary Typst value, the encode-to-decode roundtrip might be lossy. In general, numbers, strings, and @array[arrays] or @dictionary[dictionaries] composed of them can be reliably converted, while other types may fall back to strings via @repr, which is @repr:debugging-only[for debugging purposes only]. Please refer to the page of each data format for details.
