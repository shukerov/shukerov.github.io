---

title: vim-shortcuts
date: 2019-03-25 01:03 UTC
tags: 
published: false

---

This is a blog about vim shortucts.


gqq -> single line to multiple given you setcolumn width thingie
gq -> same a as above but just for a selection


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

# Just handy command
In normal mode with cursor over a number press <C-a> to incerement that number, use <C-x> to decrement (except i have this overwritten ;( ). I fucking love vim.

# Registers
To reapeat last colon command use @:, and @@ for further repeats
@ just accesses a vim register! In the case above the column register is called.
To view the contents of register type `:reg`

# Not sure where this should go
https://vi.stackexchange.com/questions/6693/replace-current-selection-and-all-identical-occurrences-in-a-file

# Time traveling
:earlier 2m -> goes back in time 2 minutes. WOW

# Plugin blogging
Note that this could be its own blog

## Gitgutter

Use `[c` and `]c` to jump to changes within a file.
Use `<leader>hs` for staging a hunk, aka stage just a part of the file.
Use `<leader>hp` to view changes of the hunk you are on
