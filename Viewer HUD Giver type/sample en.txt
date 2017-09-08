# lsl-markdown

The lsl-markdown is Markdown Viewer for SecondLife, developed in LSL.

The lsl-markdown HUD converts and displays the markdown document written in notecard in the prim, as  HTML document by using Web browser function of shared media.

You can use this system as a document viewer that has more features than notecard.
There are features such as URL link, List, Table, In-line display of images and more.

## How to see the original markdown of this sample
- **Stand Alone HUD type**  
Right click HUD, and open notecard in Content tab.  

- **Viewer HUD Giver type**   
Right click Giver object, and open notecard in Content tab.

The content is changeable by editing this notecard. (Please change after taking copy of the original.)

## Introduction of Markdown

Following code is sample for markdown:
```
Markdown is a lightweight markup language with plain text formatting syntax designed so that it can be converted to HTML.

A First Level Header
====================

A Second Level Header
---------------------

Now is the time for all good men to come to  
the aid of their country. This is just a  
regular paragraph.

The quick brown fox jumped over the lazy
dog's back.

### Header 3

> This is a blockquote.
>
> This is the second paragraph in the blockquote.
>
> ## This is an H2 in a blockquote
```
Renders to:
***
Markdown is a lightweight markup language with plain text formatting syntax designed so that it can be converted to HTML.

A First Level Header
====================

A Second Level Header
---------------------

Now is the time for all good men to come to
the aid of their country. This is just a
regular paragraph.

The quick brown fox jumped over the lazy
dog's back.

### Header 3

> This is a blockquote.
>
> This is the second paragraph in the blockquote.
>
> ## This is an H2 in a blockquote

_(quoted from [Daring Fireball](http://daringfireball.net/projects/markdown/basics) )_
***
## Automatic links
 
If you simply want to be able to click at an URL inserted in your text, put the URL between angle brackets and Markdown will make a clickable link with it:
 
 ```
<http://www.w3.org>
```
<http://www.w3.org>
 
## Image
```
![Flickr](https://c2.staticflickr.com/2/1568/24166844372_b78def7eb2.jpg "Flickr")
```
![Flickr](https://c2.staticflickr.com/2/1568/24166844372_b78def7eb2.jpg "Flickr")
 
## Table
 
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
 
## Code block

You can create fenced code blocks by placing triple backticks ` before and after the code block.
 
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
 
## Markdown Syntax

Syntax introduced here is only part of all markdown syntax.
Refer to the following for details of markdown syntax.

**Sample for Markdown Syntax**  
http://kobito.qiita.com/en/docs/about-markdown
https://guides.github.com/features/mastering-markdown/

## Editing Markdown

Before you edit markdown in notecard directly, it is reccomended to use an external markdown editor (e.g. Kobitp) and copy&paste to notecard.  
http://kobito.qiita.com/

## HTML

You don’t have to know HTML in order to use Markdown.  
But if you know some HTML tags, you can use them where you want.  
For example, to format some text as superscript — something not covered by the Markdown syntax.

**Example：Superscript**
```
April 1<sup>st</sup>
```
April 1<sup>st</sup>

**Example：Insert YouTube**
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

`<PERCENT>OWNER`(<PERCENT> to be replaced with % ) will be replaced and displayed as user's DisplayName.

```
**Hello, <PERCENT>OWNER**
```

**Hello, %OWNER**

## Detail specification

JavaScript library **markdown-it** is employed as markdown parser.
Some additional syntax (e.g. Table) are available over **CommonMark**.  
https://github.com/markdown-it/markdown-it

Style is github like. (github-markdown-css)
    
### Custom CSS

You can apply custom style by editing the line 6 in each HUD script `string css = "";`.

## github
You can get latest code of lsl-markdown  from github page:
https://github.com/masterpoppy/lsl-markdown

## System Requirements

One of following viewers is required for normal operation, because lsl-markdown uses Chromium Embedded Framework (CEF).

Second Life 4.0.0 (307894) and later
Firestorm 4.7.7 (48706) and later
And other TPV compatible with CEF

## Remarks

- Rezzed HUD cannot display correct HTML document for except owner. It need to be attached on HUD.
- If you have any question, [feel free to ask (IM)](secondlife:///app/agent/72c03405-8305-48d9-ad18-f512f9db67f9/im) to me.

---
