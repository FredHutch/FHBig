---
layout: post
title: How to Add Blog Posts to FHBig
date: 2018-03-06
tags: gh-pages 
---

FHBig's website is powered by [GitHub](https://github.com) and
[Jekyll](https://jekyllrb.com) and hosted on the
[gh-pages branch](https://github.com/FredHutch/FHBig/tree/gh-pages) in
our GitHub repo. 
The site contains both static pages (__About__,  __Resources__ and
__Events__) and blog posts. The markdown files (\*.md) of the former
live on the main directory and that of latter on the `_post`
folder. 

__Note.__ Alougth the `gh-pages` branch is protected from being
deleted and  force-pushing, you can, unlike the `master` branch, freely
push items without creating _push request_ and waiting for approval.


To create a new post, you need to create a markdown file in the `_post`
folder. The name of the file must follow the following format:
```
yyyy-mm-dd-title.md
```

The post file must have a [YAML Front
Matter](https://jekyllrb.com/docs/frontmatter/) as the first block of
the content. The file with YAML Front Matter will be processed by
`jekyll`. Here is an example: 
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
[_post](https://github.com/FredHutch/FHBig/tree/gh-pages/_postsd) repo:

```
Create new file -> Name your file -> Edit new file -> Commit
```

The new post will appear on the __Blog__ page, and only the first
paragraph will be displayed. Click the title of the post to view the
whole content. 

## About Tags
Check the `tag` folder for available tags.  To add a new tag, you can
either create an issue on our GitHub repo or add a markdown file in the `tag` 
folde that follows the format below:
```
---
layout: tagpage
title: "Tag: gh-pages"
tag: gh-pages
---
```

## Take 2
Alternatively,  you can create the post from your local repo.

1. __Install Jekyll and Bundler__ through RubyGems.
  - Requirement: GNU/Linux, Uix, or macOS. Ruby version 2.2.5. RubyGems.
```
> sudo gem install jekyll bundler 
```
If you have troubles installing jekyll, go to GitHub help document [here](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/).
2. __Clone the repo__ to your local machine.
```
> cd my_path
> git clone https://github.com/FredHutch/FHBig.git
```
If your have a SSH key on your GitHub account, you can clone the repo this way
```
> git clone git@github.com:FredHutch/FHBig.git
```
3. __Locate the `gh-pages` branch.__
```
> git checkout gh-pages
```
To check which banch you are working on, run `> git branch`
4. __Create a markdown file__ in the `_post` folder, as describe above.
5. __Preview the post locally.__
  Run `rake preview` and visit
  localhost:4444 in your browser.  Because the page root is different
  when you run the page on GitHub and on local machine, `Rakefile` and
  `_config.dev.yml` are created to handle it.  
6. __Stage and commit the post.__
```
> git add file_name.md
> git commit file_name.md
```
7. __Push to the `gh-pages` branch.__
```
> git push origin gh-pages 
```

If you want to avoid typing username and password
everytime you push, you can add an SSH key to your GitHub account.

## Resources
- [Cute GitHub tutorial](https://try.github.io)
- [_posts folder](https://jekyllrb.com/docs/posts/#the-posts-folder)
- [Markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [How to add a new SSH key to GitHub account](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

By Chao-Jen Wong
