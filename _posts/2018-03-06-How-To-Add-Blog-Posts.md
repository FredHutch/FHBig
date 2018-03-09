---
layout: post
title: How to Add Blog Posts to FHBig
date: 2018-03-06
tags: gh-pages 
---

FHBig's website is powered by [GitHub](https://github.com) and
[Jekyll](https://jekyllrb.com) and hosted on the
[gh-pages branch](https://github.com/FredHutch/FHBig/tree/gh-pages). 
It contains both static pages (__About__,  __Resources__ and
__Events__) and blog posts. The markdown files (\*.md) of the former
live on the main directory and that of latter on the `_post`
folder. 

Alougth the `gh-pages` branch is protected from being
deleted and  force pushing, you can, unlike the master branch, freely
push items without making _push request_ and waiting for approval.


To create a new post, you need to create a markdown file in the `_post`
folder. The name of the file must follow the following format:
```
yyyy-mm-dd-title.md
```

The markdown file must have a [YAML From
Matter](https://jekyllrb.com/docs/frontmatter/) as the header.
Here is an example:
```
---
layout: post
title: How to Add Blog Posts to FHBig
date: 2018-03-06
tags: gh-pages
---
```

## Now Action
You can create the post and commit directly on the
[_post](https://github.com/FredHutch/FHBig/tree/gh-pages/_postsd) repos:

```
Create new file -> Name your file -> Edit new file -> Commit
```

## About Tags
Check the `tag` folder for available tags. To add a new tag, you can
either file an issue or add a markdown file in the `tag` 
folder. Here is an example:
```
---
layout: tagpage
title: "Tag: gh-pages"
tag: gh-pages
---
```

## Take 2
Alternatively,  you can create the post from your local repos.

1. __Install Jekyll:__
2. __Clone the repos:__
Clone the FHBig repository to your local path (my_dir)
```
> cd my_dir
> git clone https://github.com/FredHutch/FHBig.git
```
If your have added an SSH key on github, you can clone the repos this way
```
> git clone git@github.com:FredHutch/FHBig.git
```
3. __Locate the `gh-pages` branch:__
```
> git checkout gh-pages
```
Check which banch you are working on `> git branch`
4. __Create a markdown file__ in the `_post` folder.  To preview the post locally, run
   `rake preview` and visit localhost:4444 in your browser. 
5. __Stage and commit the post:__
```
> git add file_name.md
> git commit file_name.md
```
5. __Push to the `gh-pages` branch:__
```
> git push origin gh-pages 
```

You can also create local branch and merge back to
the gh-pages brach. If you want to avoid typing username and password
when pushing to github, you can add an SSH key to github.

## Resources
- [Cute GitHub tutorial](https://try.github.io)
- [_posts folder](https://jekyllrb.com/docs/posts/#the-posts-folder)
- [Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)


By Chao-Jen Wong
