lsl-markdown
===

Full Assembled lsl-markdown is available in SecondLife Marcketplace.  
組み立て済みの lsl-markdown は SecondLife Marcketplace で入手できます。  
https://marketplace.secondlife.com/p/lsl-markdown/10150341

[English](#english) / [日本語](#日本語)

## English

The lsl-markdown is Markdown Viewer for SecondLife, developed in LSL.

The lsl-markdown HUD converts and displays the markdown document written in notecard in the prim, as HTML document by using Web browser function of shared media.

You can use this system as a document viewer that has more features than notecard.  
There are features such as URL link, List, Table, In-line display of images and more.

Following 2 types of script are available.  
**Stand Alone HUD type** : For replacemant with distributing notecard.  
**Viewer HUD Giver type** : Touch rezzed panel, and it gives HUD that automatically attach to user.

![sample1](https://i.gyazo.com/d547b9c3ab2e85c431f358433c811ce5.png "lsl-markdown sample1")

![sample2](https://i.gyazo.com/44106f53efde730ef611e9904ea16cc8.png "lsl-markdown sample2")

## Special feature for SecondLife

lsl-markdown supports  [Viewer URI Name Space ](http://wiki.secondlife.com/wiki/Viewer_URI_Name_Space) formated as`secondlife://`.  
It enables the user to open avatar profile or direct teleport link.

**Sample of link opening Teleport**  
```
[Click here to open teleport](secondlife://Lobishomen/44/183/71)
```
[Click here to open teleport](secondlife://Lobishomen/44/183/71)

In case of Region Name including **SPACE**, replace **SPACE** with `%20`.
```
[Teleport link sample to Lawst Paradise](secondlife://Lawst%20Paradise/135/27/22)
```
[Teleport link sample to Lawst Paradise](secondlife://Lawst%20Paradise/135/27/22)

**Sample of link opening Avatar Profile**  
```
[Click here to open avatar profile](secondlife:///app/agent/72c03405-8305-48d9-ad18-f512f9db67f9/about)
```
[Click here to open avatar profile](secondlife:///app/agent/72c03405-8305-48d9-ad18-f512f9db67f9/about)

`%OWNER` will be replaced and displayed as user's DisplayName.

```
**Hello, %OWNER**
```

**Hello, DisplayName**

## Setup Instruction

### Stand Alone HUD type

Stand Alone HUD type is useful for replacemant with distributing notecard.

1. Create new notecard in your inventory, and rename it to the file name as you like.
2. Copy all content of `sample en.txt`and paste to the notecard created on 1.
3. Rez the box prim on the ground, and set scale as  0.050 m x 0.900 m x 0.900 m.
4. Set the status of the object created in 3. as temporary, take it, and attach it to HUD.
5. Set front side face of HUD as full-bright.
6. Put the notecard into HUD created on 2.
7. Move to [Content] tab, create new script, and rename it `lsl-markdown (Stand Alone HUD type)`.
8. Copy the code of `lsl-markdown (Stand Alone HUD type).lsl`, paste to the script creared on 7., and save.
9. Wait until LOADING LINE to disappear.

**If nothing appears, check whether the play-media in the preferrce is checked.**

### Viewer HUD Giver type

Viewer HUD Giver type : Touch rezzed panel, and it gives HUD that automatically attach to user.

1. Create new notecard in your inventory, and rename it to the file name as you like.
2. Copy all content of`sample en.txt`and paste to the notecard created on 1.
3. Rez the box prim on the ground, and set scale as  0.050 m x 0.900 m x 0.900 m.
4. Rename the object created in 3. as `Viewer HUD`, set the status as temporary, take it, and attach it to HUD.
5. Set front side face of HUD as full-bright.
6. Move to [Content] tab, create new script, and rename it`lsl-markdown (Viewer HUD)`.
7. Copy the code of `lsl-markdown (Viewer HUD).lsl`, paste to the script creared on 6., and save.
8. Rez a box prim, and set scale as you like.(This is HUD Giver)
9. Put the notecard into object(HUD Giver) created on 8.
10. Move to [Content] tab, create new script, and rename it`lsl-markdown (HUD Giver)`.
11. Copy the code of `lsl-markdown (Giver).lsl`, paste to the script creared on 10., and save.
12. Put the HUD created on 7. in HUD Giver.
13. Touch HUD Giver, permission dialog will appear. Click Yes on dialog, HUD will automatically attach to HUD and displays Markdown.

**If nothing appears, check whether the play-media in the preferrce is checked.**

## Markdown Syntax

Please refer to the following for details of markdown syntax.

**Sample for Markdown Syntax**  
http://kobito.qiita.com/en/docs/about-markdown  
https://guides.github.com/features/mastering-markdown/

## Detail specification

JavaScript library **markdown-it** is employed as markdown parser. Some additional syntax (e.g. Table) are available over **CommonMark**.  
https://github.com/markdown-it/markdown-it

Style is github like. (github-markdown-css)
    
### Custom CSS

You can apply custom style by editing the line 6 in each HUD script `string css = "";`.

## github
You can get latest code of lsl-markdown  from github page:  
https://github.com/masterpoppy2/lsl-markdown

## System Requirements

One of following viewers is required for normal operation, because lsl-markdown uses Chromium Embedded Framework (CEF).

Second Life 4.0.0 (307894) and later  
Firestorm 4.7.7 (48706) and later  
And other TPV compatible with CEF

***

## 日本語

lsl-markdown はLSLでスクリプトで書かれた SecondLife のための Markdown Viewer です。

プリム内の notecard に markdown 記法で文書を記述すると、  
共有メディアのWebブラウザ機能をつかってHUDプリム上にHTML文書として表示します。  
HUDに装着してノートカードより上位な機能をもった文書として使うことができます。  
ノートカードにはない URLリンク・List・Table・画像のインライン表示などの機能があります。

ノートカードのかわりとして配布するのに便利な **Stand Alone HUD type** と  
看板として設置してタッチすることで自動でHUDを装着させる **Viewer HUD Giver type** があります。

![sample1](https://i.gyazo.com/d547b9c3ab2e85c431f358433c811ce5.png "lsl-markdown sample1")

![sample2](https://i.gyazo.com/44106f53efde730ef611e9904ea16cc8.png "lsl-markdown sample2")

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

`%OWNER`と書くとユーザのDisplayNameに置き換えて表示します。

```
**%OWNERさん、こんにちは**
```

**DisplayNameさん、こんにちは**

## セットアップ手順

### Stand Alone HUD type

Stand Alone HUD type はノートカードのかわりとして配布するのに便利です。

1. 持ち物に新しいノートカードを作成し、好きなファイル名にリネームする。
1. `sample ja.txt` の内容を 1.で作成したノートカードに Copy & Paste して保存する。
1. 地面にBOXプリムをRezし、大きさを 0.050 m x 0.900 m x 0.900 m に設定する。
1. 3.で作成したオブジェクトを臨時プリムに設定し、TakeしてHUDに装着する。
1. 手前の面を明るさ全開に設定する。
1. 作成したHUDに 2. のノートカードをいれる。
1. [中身] タブに移動して [新しいスクリプト] を作成し、`lsl-markdown` にリネームする。
1. 作成した 7. に `lsl-markdown (Stand Alone HUD type).lsl` のコードを Copy & Paste して保存する。
1. LOADING LINEの表示が消えればセットアップは完了です。

**なにも表示されない場合は、環境設定のメディア再生がONになっているか確認してください。**

### Viewer HUD Giver type

Viewer HUD Giver type は看板として設置してタッチすることで自動でHUDを装着させてます。

1. 持ち物に新しいノートカードを作成し、好きなファイル名にリネームする。
2. `sample ja.txt` の内容を 1.で作成したノートカードに Copy & Paste して保存する。
3. 地面にBOXプリムをRezし、大きさを 0.050 m x 0.900 m x 0.900 m に設定する。
4. 3.で作成したオブジェクトを`Viewer HUD`にリネーム、臨時プリムに設定し、TakeしてHUDに装着する。
5. 手前の面を明るさ全開に設定する。
6. [中身] タブに移動して [新しいスクリプト] を作成し、`lsl-markdown (Viewer HUD)` にリネームする。
7. 作成した 6. に `lsl-markdown (Viewer HUD).lsl` のコードを Copy & Paste して保存する。
8. 地面にBOXプリムをRezし、適切なサイズに変更する。(これがHUD Giverになります。)
9. 作成したObject(HUD Giver)に 2. のノートカードをいれる。
10. [中身] タブに移動して [新しいスクリプト] を作成し、`lsl-markdown (HUD Giver)` にリネームする。
11. 作成した 10. に `lsl-markdown (Giver).lsl` のコードを Copy & Paste して保存する。
12. 作成したHUD Giverに 7. のHUDを入れる。
13. タッチすれば装着許可のダイアログが出るのでYESを選択するとMarkdownがHUDに表示される。

**なにも表示されない場合は、環境設定のメディア再生がONになっているか確認してください。**

## Markdown記法について

Markdown記法については下記のページがわかりやすくまとめられています。  
http://kobito.qiita.com/ja/docs/about-markdown  
http://qiita.com/tbpgr/items/989c6badefff69377da7  

Parserにmarkdown-itを採用しています。一般的なMarkdownに加えてTableなどの拡張記法が利用できます。  
https://github.com/markdown-it/markdown-it

## スタイルについて

CSSは github 相当のスタイルになっています。 (github-markdown-css)

**カスタムCSS**  
各HUDスクリプトの6行目 `string css = "";` を編集してカスタムCSSを適用することができます。

## githubページ
lsl-markdownの最新版はこちら  
https://github.com/masterpoppy2/lsl-markdown

## 必要動作環境

lsl-markdownはChromium Embedded Framework (CEF)を利用するため、正常な動作には下記のViewerが必要です。

Second Life 4.0.0 (307894) 以降  
Firestorm 4.7.7 (48706) 以降  
その他CEFに対応したTPV

## その他備考

- REZした場合Owner以外からはHTML文書として表示されません。
- 不明点あれば MasterPoppy まで [気軽にお問い合わせ( IM )](secondlife:///app/agent/72c03405-8305-48d9-ad18-f512f9db67f9/im) ください。

---
