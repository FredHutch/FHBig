---
layout: post
title: How to Add Blog Posts to FHBig
date: 2018-03-06
tags: gh-pages
---

FHBig's website is powered by [GitHub](https://github.com) and
[Jekyll](https://jekyllrb.com) and hosted on the
[gh-pages branch](https://github.com/FredHutch/FHBig/tree/gh-pages). 
We have both static pages (__About__,  __Resources__ and __Events__) and blog post
pages on the gh-pages. The Markdown files (\*.md) of the former live on the main
directory (*.md) and that of later on the `_post` folder.

Alougth the `gh-pages` branch is protected from being
deleted and  force pushing, you can freely push without making
_push request_ and waiting for approval.

To create a new post, you need to create a Markdown file in the `_post`
folder. The name of the file must follow the following format:
```
yyy-mm-dd-title.md
```

The Markdown file must have a [YAML From
Matter](https://jekyllrb.com/docs/frontmatter/) in the begining of the
file. Here is an example:
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

You are done. Go to [fhbig.net](www.fhbig.net) to check your work.

## About Tags
To checkt the available tags you can use for posts, to go the `tag`
folder. Or you can create a tag by adding a Markdown file in the `tag`
folder. Here is an example:
```
---
layout: tagpage
title: "Tag: gh-pages"
tag: gh-pages
---
```
## Take 2
Alternatively,  you can create the post from your local repos. To do
so, you need to install `jekyll`.

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
4. __Create a Markdown file and commit in the `_post` folder__.
```
> git add file_name.md
> git commit file_name.md
```
5. __Push to the `gh-pages` branch:__
```
> git push origin gh-pages 
```

You can also create local branch and then merge your changes back to
the gh-pages brach. If you want to avoid type username and password
when pushing to github, you can add an SSH key to github.

## Resources
- [Cute GitHub tutorial](https://try.github.io)
- [posts folder](https://jekyllrb.com/docs/posts/#the-posts-folder)
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)


By Chao-Jen Wong
