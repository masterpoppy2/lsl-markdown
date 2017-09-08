# lsl-markdown

lsl-markdown はLSLスクリプトで書かれた SecondLife のための Markdown Viewer です。

プリム内の notecard に markdown 記法で文書を記述すると、
共有メディアのWebブラウザ機能をつかってHUDプリム上にHTML文書として表示します。
HUDに装着してノートカードより上位な機能をもった文書として使うことができます。
ノートカードにはない URLリンク・List・Table・画像のインライン表示などの機能があります。
 
## このサンプルの元のMarkdownの開き方
- **Stand Alone HUD type**  
HUDを右クリックして [中身] に入っているnotecardを開いてください。

- **Viewer HUD Giver type**   
GiverのObjectを右クリックして [中身] に入っているnotecardを開いてください。

このnotecardを編集することで内容を変更することもできます。（オリジナルのコピーをとってから作業してください。）

## Markdownの概要

ノートカードに次のような記法で記述すると

```
Markdown（マークダウン）は、 **文章の書き方** です。
デジタル文書を活用する方法として考案されました。特徴は、

- 手軽に文章構造を明示できること
- 簡単で、覚えやすいこと
- 読み書きに特別なアプリを必要としないこと
- それでいて、対応アプリを使えば快適に読み書きできること

などです。Markdownはジョン・グルーバー（John Gruber）によって2004年に開発され、
最初は [Daring Fireball: Markdown](http://daringfireball.net/projects/markdown/)
で公開されました。その後、多くの開発者の手を経ながら発展してきました。
```

このような表示結果になります。
***
Markdown（マークダウン）は、 **文章の書き方** です。
デジタル文書を活用する方法として考案されました。特徴は、

- 手軽に文章構造を明示できること
- 簡単で、覚えやすいこと
- 読み書きに特別なアプリを必要としないこと
- それでいて、対応アプリを使えば快適に読み書きできること

などです。Markdownはジョン・グルーバー（John Gruber）によって2004年に開発され、
最初は [Daring Fireball: Markdown](http://daringfireball.net/projects/markdown/)
で公開されました。その後、多くの開発者の手を経ながら発展してきました。

*[日本語Markdownユーザー会](http://www.markdown.jp/what-is-markdown/) より引用*
***
## 自動リンク
 
単純に&lt;&gt;でURIを囲むことで自動リンクにすることも出来ます。
 
```
<http://www.w3.org>
```
<http://www.w3.org>
 
## 画像

```
![Flickr](https://c2.staticflickr.com/2/1568/24166844372_b78def7eb2.jpg "Flickr")
```
![Flickr](https://c2.staticflickr.com/2/1568/24166844372_b78def7eb2.jpg "Flickr")
 
## 表
 
```
| Left align | Right align | Center align |
|:-----------|------------:|:------------:|
| This       |        This |     This     |
| column     |      column |    column    |
| will       |        will |     will     |
| be         |          be |      be      |
| left       |       right |    center    |
| aligned    |     aligned |   aligned    |  
```

| Left align | Right align | Center align |
|:-----------|------------:|:------------:|
| This       |        This |     This     |
| column     |      column |    column    |
| will       |        will |     will     |
| be         |          be |      be      |
| left       |       right |    center    |
| aligned    |     aligned |   aligned    |  
 
## コードブロック
 
コードブロックはバックスラッシュ3つ(\`\`\`)で囲って表現します。
 
<pre>
```
default
{
    state_entry()
    {
        llSay(0, "Hello, Avatar!");
    }
    touch_start(integer total_number)
    {
        llSay(0, "Touched: "+(string)total_number);
    }
}
```
</pre>


```
default
{
    state_entry()
    {
        llSay(0, "Hello, Avatar!");
    }
    touch_start(integer total_number)
    {
        llSay(0, "Touched: "+(string)total_number);
    }
}
```
 
## Markdown記法

ここで紹介した記法は一部にすぎません。
そのほかの詳しいMarkdown記法については次のドキュメントがわかりやすくまとめられています。

**Markdown記法 サンプル集**
http://kobito.qiita.com/ja/docs/about-markdown
http://qiita.com/tbpgr/items/989c6badefff69377da7

## Markdownの編集

ノートカードに直接Markdownを記述するまえに、
Kobitoなどの専用エディターで下書きしてからノートカードにCopy&Pasteすると便利です。
http://kobito.qiita.com/

## HTML

Markdownを使うにはHTMLの知識は必要ありませんが、MarkdownはHTMLとの共存も可能です。
HTMLの知識があれば、Markdownでサポートされていない表現をHTMLを使うことで表現出来ます。

**例：日付表記**
```
April 1<sup>st</sup>
```
April 1<sup>st</sup>

**例：Youtubeの挿入**
```
<iframe width="640" height="360"
src="https://www.youtube.com/embed/0LC-HO0ljN0?controls=0&amp;showinfo=0"
frameborder="0" allowfullscreen>
</iframe>
```
<iframe width="640" height="360"
src="https://www.youtube.com/embed/0LC-HO0ljN0?controls=0&amp;showinfo=0"
frameborder="0" allowfullscreen>
</iframe>

## SecondLifeならではの機能

secondlife://形式の [Viewer URI Name Space ](http://wiki.secondlife.com/wiki/Viewer_URI_Name_Space) を使うとクリックで直接テレポート画面を開かせたり、
特定のアバターのプロフィールを開かせることができます。

**テレポートを開くリンクのサンプル**
```
[ここをクリックしてテレポート](secondlife://Lobishomen/44/183/71)
```
[ここをクリックしてテレポート](secondlife://Lobishomen/44/183/71)

Region Nameに **スペース** が含まれる場合は **スペース** を`%20`に置き換えてください。
```
[Lawst Paradiseへのテレポートリンクのサンプル](secondlife://Lawst%20Paradise/135/27/22)
```
[Lawst Paradiseへのテレポートリンクのサンプル](secondlife://Lawst%20Paradise/135/27/22)

**アバタープロフィールを開くリンクのサンプル**
```
[ここをクリックしてアバタープロフィール](secondlife:///app/agent/72c03405-8305-48d9-ad18-f512f9db67f9/about)
```
[ここをクリックしてアバタープロフィール](secondlife:///app/agent/72c03405-8305-48d9-ad18-f512f9db67f9/about)

`<PERCENT>OWNER` (<PERCENT>は%に置き換え)と書くとユーザのDisplayNameに置き換えて表示します。

```
**<PERCENT>OWNERさん こんにちは**
```

**%OWNERさんこんにちは**

## 詳しい仕様

ParserにJavaScriptライブラリ **markdown-it** を採用しています。
**CommonMark** に加えてTableなどの拡張記法が利用できます。
https://github.com/markdown-it/markdown-it

スタイルはgithub相当になっています。(github-markdown-css)
    
### カスタムCSS
各HUDスクリプトの6行目 `string css = "";` を編集してカスタムCSSを適用することができます。

## githubページ
lsl-markdownの最新版はこちら
https://github.com/masterpoppy/lsl-markdown

## 必要動作環境

lsl-markdownはChromium Embedded Framework (CEF)を利用するため、正常な動作には下記のViewerが必要です。

Second Life 4.0.0 (307894) 以降
Firestorm 4.7.7 (48706) 以降
その他CEFに対応したTPV

## その他備考

- HUDをREZした場合Owner以外からは正しいHTML文書として表示されません。HUDに装着して利用してください。
- 不明点があれば MasterPoppy まで [気軽にお問い合わせ( IM )](secondlife:///app/agent/72c03405-8305-48d9-ad18-f512f9db67f9/im) ください。

---
