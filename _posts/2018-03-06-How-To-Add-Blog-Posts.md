---
title: How to Add Blog Posts to FHBig
tags: Technical-Note
author: Chao-Jen Wong
---

FHBig's website is powered by [GitHub](https://github.com) and
[Jekyll](https://jekyllrb.com) and hosted on the
[gh-pages branch](https://github.com/FredHutch/FHBig/tree/gh-pages) in
our GitHub repo.
The site contains both static pages (About, Resources and
Events) and blog posts. The markdown files (\*.md) of the former
live on the main directory and that of latter on the `_posts`
folder.

__Note.__ Alougth the `gh-pages` branch is protected from being
deleted and  force-pushing, you can, unlike the `master` branch, freely
push items without creating _push request_ and waiting for approval.

## Get started
To create a new post, you need to create a markdown file in the `_posts`
folder. The name of the file must follow the following format:
```
yyyy-mm-dd-title.
```

The post file must have a [YAML Front
Matter](https://jekyllrb.com/docs/frontmatter/) as the first block of
the content. The file with YAML Front Matter will be processed by
`jekyll`. Here is an example:

```yml
---
title: How to Add Blog Posts to FHBig
tags: your_tag
author: your_name
---
```

### Now Action
You can create the post and commit directly on the
[_post](https://github.com/FredHutch/FHBig/tree/gh-pages/_postsd) repo:

```
Create new file -> Name your file -> Edit new file -> Commit
```

The new post will appear on the __Blog's__ year-archieve page, and only the first
180 characters will be displayed. Click the title of the post to view the
whole content.

## Author sidebar (optional)
To attribute author profile to a post: 
1. Append author's profile to `/_data/authors.yml`, if not already, using the following format. Anything variables found under author in `_config.yml` can be used (e.g. _name_, _bio_, _avatar_, _links_, etc.).

```yml
# /_data/authors.yml

Meow Good:
  name        : "Meow Good"
  bio         : "Cat behavioral Scientist at Fred Hutch"
  github      : TapscottLab
  avatar      : "/images/avatar-unknown.png"
  links:
    - label: "Email"
      icon: "fas fa-fw fa-envelope-square"
      url: "mailto:cwon2@fredhutch.org"
      

```

2. Make sure include `author: xxx` in the post's YAML front matter and enable `author_profile`, i.e.,

```yml
---
title: How to be a Good Cat
tags: Technical_Note
author: Meow Good
author_profile: true
---
```

3. Optional. Add author's avatar image to `/images` folder.

Reference: https://mmistakes.github.io/minimal-mistakes/layout-author-override/

## Alternatively using git to commit and push
Alternatively,  you can create the post from your local repo.

1. Install Jekyll and Bundler through RubyGems.
  - Requirement: GNU/Linux, Uix, or macOS. Ruby version 2.2.5. RubyGems.
```
> sudo gem install jekyll bundler
```
Havng troubles installing jekyll? Find GitHub help document [here](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/).
2. Clone the repo to your local machine.
```
> cd my_path
> git clone https://github.com/FredHutch/FHBig.git
```
If your have a SSH key on your GitHub account, you can clone the repo this way
```
> git clone git@github.com:FredHutch/FHBig.git
```
3. locate the `gh-pages` branch.
```
> git checkout gh-pages
```
To check which banch you are working on, run `> git branch`
4. Create a markdown file in the `_posts` folder, as describe above.
5. Preview the post locally.
  Run `bundle exec jekyll build` and visit the designated port.
6. Stage and commit the post.
```
> git add file_name.md
> git commit file_name.md
```
7. Push to the `gh-pages` branch.
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


