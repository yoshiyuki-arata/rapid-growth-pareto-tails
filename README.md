# Rapid Growth and the Emergence of Pareto Tails の Replication ファイル

本フォルダは、論文 *Rapid Growth and the Emergence of Pareto Tails* の実証分析に用いた計算コードと、その実行に必要なシミュレーションデータの生成コードを収録した補足資料である。
実証分析におけるデータ処理、標本選択、統計量の計算、推定および図表作成の手続きを示し、分析手法と計算過程の透明性を高めることを目的とする。

論文の実証分析に使用した企業データは公開できないため、本資料では、分析コードの入力に必要な変数・データ構造・単位を備えた架空の企業パネルを乱数から生成する。
このシミュレーションデータを実証データの代わりに入力することにより、実際の分析に用いた計算手続きを実行し、データの生成から推定・図表の出力までの一連の処理を確認できるようにしている。
シミュレーションから得られる推定値や図表は、論文に報告された数値・図表を再現するものではない。

各分析の概要および対応する計算コード（QMD）・実行結果（HTML）へのリンクは、[00_summ_Zipf.qmd](00_summ_Zipf.qmd) 及び [00_summ_Zipf.qmd](00_summ_Zipf.qmd) にまとめている。

## 必要な環境

R（4.1以上）、RStudio、Quarto、および以下の R パッケージを用意してください。

```r
install.packages(c(
  "knitr", "rmarkdown", "lubridate", "magrittr", "tidyverse", "pins", "qs2",
  "kableExtra", "hrbrthemes", "corrr", "scattermore", "matrixStats", "ReIns"
))
```

12も実行する場合は、`data.table` と `latex2exp` を追加してください。
30万社のパネルを生成するため、十分な空きメモリが必要です。


