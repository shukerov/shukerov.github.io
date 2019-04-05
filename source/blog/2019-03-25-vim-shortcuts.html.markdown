---

title: vim-shortcuts
date: 2019-03-25 01:03 UTC
tags: 
published: false

---

This is a blog about vim shortucts.


gqq -> single line to multiple given you setcolumn width thingie
gq -> same a as above but just for a selection
hs -> for hunk stage. Staging just a part of a file. Need to check if you need plugins to get this
      actually runnning


Cool plugins
traces.vim (highlights and edits search and replace as you go baby)
rhysd/clever-f

eugen0329/vim-esearch (searches through entire project)
   * <leader> ff -> starts search
   * s and t to open the search in a new tab or a split respectively


# Text objects
iw - inner word
aw - a word (includes a space)
ip - inner paragraph
ap - a paragraph (includes an empty line)
i*), ', ", }* - inner parenthesis, single quote, double quote or brace
it, at - inner tag, a tag (includes the open and closing tag)

You can find some more information on text objects by typing ''':h text-objects''' in vim
