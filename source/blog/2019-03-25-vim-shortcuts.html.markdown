---

title: Vim Cheatsheet
date: 2019-03-25 01:03 UTC
tags: vim, love, goodness, development, texteditor, shortcuts
published: false

---

I have taken up the challenge to be better at Vim. I love Vim, and the productivity boost it has given me. It honestly just gets me excited about writing code every day.
Taking up Vim however also means that I am taking up the challenge to endlessly configure and tweak it. This blog is all about Vim shortcuts, and tips that I enjoy using. It is by no means a comprehensive guide or anything like that.

Check out my [vimrc](https://github.com/shukerov/myconfig/blob/master/.vimrc).

Use the links below to jump to different sections:



#### General


### Useful simple commands

* In normal mode press `<C-a>` to incerement a number on the line, use `<C-x>` to decrement. This is a favorite of mine.
* Did you know you can time travel in Vim? Type `:earlier 2m` to go back 2 minutes.
* Press `gx` when your cursor is over a link. This should open the link in your browser.

#NOTE: Write up stuff for command below
press z= over word for suggestions
to turn on setlocal spell
to turn off setlocal nospell
\]s \[s for finding misspelled words


### Registers

To reapeat last colon command use @:, and @@ for further repeats
@ just accesses a vim register! In the case above the column register is called.
To view the contents of register type `:reg`


### Text objects

Text objects are an awesome way to manipulate text. Combine them with the usual commands.
You can find some more information on text objects by typing ''':h text-objects''' in vim

* `iw` -- inner word
* `aw` -- a word (includes a space)
* `ip` -- inner paragraph
* `ap` -- a paragraph (includes an empty line)
* `i<) ' " } * >` -- inner parenthesis, single quote, double quote or brace
* `it, at` -- inner tag, a tag (includes the open and closing tag)

#### Shortcuts
* `gqq` -- break up single line to multiple based on the column width you have set.
* `gq` -- same a as above but just for a selection of lines

#### Plugins

I am not a vim purist. I manage plugins with [Vundle](https://github.com/VundleVim/Vundle.vim). Here are the most useful ones (for a full list check [vimrc]()):

* [`traces.vim`](https://github.com/markonm/traces.vim) -- highlights search and replace as you go
* [`vim-esearch`](https://github.com/eugen0329/vim-esearch) -- lets you search through entire project. It also does search and replace in a "sublime-like" fashion.
* [`ctrlp`](https://github.com/ctrlpvim/ctrlp.vim) -- lets you search and open files easily with fuzzy find
* [`nerdtree`](https://github.com/machakann/vim-highlightedyank) -- a very nice side menu, that shows directory trees. I toggle it with `<leader>kb`, so it doesn't take screen space while I code.
* [`vim-highlightedyank`](https://github.com/machakann/vim-highlightedyank) -- highlights when you yank something, a must have
* [`comittia.vim`](https://github.com/rhysd/committia.vim') -- if you have vim set up as your default text editor for git, this will give you an awesome split

# Plugin details
Note that this could be its own blog

## CtrlP
### Opening multiple files
Search with `<C-p>` as usual. Then you can use `<C-z>` to mark files. Once marked press `<C-o>` to open them all.

## NerdTree
### Refreshing NerdTree directories
Creating a new file and it doesn't pop up in NerdTree. Annoyingm but all I have to do is press r and the NerdTree list refreshes!

## VimEsearch
   * <leader> ff -- starts search
   * `s` and `t` to open the search in a new tab or a split respectively

## Gitgutter

Use `[c` and `]c` to jump to changes within a file.
Use `<leader>hs` for staging a hunk, aka stage just a part of the file.
Use `<leader>hp` to view changes of the hunk you are on

:s/<[^>]*>/\r&\r/g
:g/^$/d
http://stackoverflow.com/questions/9987743/ddg#9987878

autoindent html files
