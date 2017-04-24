# Утилиты для обработки данных генетических тестов

* `bin/myheritage-to-ysnps.pl`

  Конвертирует сырые (raw) данные аутосомного теста MyHeritage в список SNP Y-хромосомы, связанных с гаплогруппами. В дальнейшем этот список можно использовать для выяснения гаплогруппы, например, с помощью утилиты [Y-SNP Subclade Predictor](https://ytree.morleydna.com/).

  Использование:
  
      bin/myheritage-to-ysnps.pl <raw-файл> <index-файл>

  где
  
  * `<raw-файл>` — распакованный файл с сырыми данными MyHeritage;
  * `<index-файл>` — файл со списком SNP Y-хромосомы от ISOGG.
  
  Второй файл можно получить, запустив скрипт `bin/fetch-isogg-ysnp-index.sh`, или скачать самостоятельно с сайта [ISOGG](https://isogg.org/tree/ISOGG_YDNA_SNP_Index.html) (в формате TSV).
