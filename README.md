# check-docs-freshness

[Software Engineer at Google](https://learning.oreilly.com/library/view/software-engineering-at/9781492082781/)の10章DocumentationのDeprecating Documentsの項目を読んでて
> At Google, we often attach “freshness dates” to documentation. Such documents note the last time a document was reviewed, and metadata in the documentation set will send email reminders when the document hasn’t been touched in, for example, three months. Such freshness dates, as shown in the following example—and tracking your documents as bugs—can help make a documentation set easier to maintain over time, which is the main concern for a document:

という思想に近いものを作ってみようと思って書いた

### Overview
github actionで定期的にリポジトリ内のdocsをチェックして最終更新日から一定時間以上経っていたらissueを作成する
