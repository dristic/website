---
layout: post
title:  "How to Redesign a Website in a Week With Jekyll"
date:   2013-07-23 08:44:06
categories: update
thumbnail: /assets/thumbnail/2013-07-23-how-to-redesign-a-website.png
---

> I have finally found some free time in my busy day to build a brand new website 
Well I am glad I got my required first sentence for this blog out of the way. Now onto bigger and better things!

I wanted to start this blog and personal website off right. One of the first things I did was come up with a list of reasons on why I should start building a brand new site:

1. My old website was written when HTML 4 was cool. As a front engineer I felt an obligation to update.
2. It also had outdated content and I could not find the source code (because it was written before I had a GitHub account).
3. I wanted to start writing for both personal and work related reasons and needed to add a blog component.
4. The website was in PHP which I have not used in a while.

From what I have found many people, especially engineers, redesign a website for these issues. The biggest reason is because the code is unmanageable and engineers are perfectionists when it comes to things they build. I find most of these people start a project and never finish. I decided that this was not acceptable and not only forced myself to redesign my website but also to do it in one week.

<img src="{{ site.baseurl }}/assets/jekyll-logo.png" width="50%" height="50%" style="float: right" />

So I set on my task to redesign this website into something much more manageable. My first iteration landed in nodejs. As hard as I tried I could not find something that was not in the prototype stage and decided to ditch that solution. From there I wound up in Wordpress. Finding and customizing a Wordpress template was a nightmare so I opted for something easier. Finally I landed on using [jekyll](http://jekyllrb.com) which is a great ruby gem and is what you are looking at today. The setup code, from the homepage, got me up and running in seconds:

{% highlight bash %}
~ $ gem install jekyll
~ $ jekyll new my-awesome-site
~ $ cd my-awesome-site
~/my-awesome-site $ jekyll serve
# => Now browse to http://localhost:4000
{% endhighlight %}

The biggest reasons for choosing jekyll was for ease of use and speed. With Wordpress you often have five or six complex template files to manage where with jekyll you have two or three simple ones. There is no database to manage and no admin dashboard to learn how to use which made it easy to get started. I was able to add additional features I wanted like SASS and a feed XML quickly and easily with a few lines of code. It is even all open source and on GitHub so you can see the code for yourself! Customizing the style was easy and it provides great templating features like markdown and textile. I was quite amazed at what I had done in the first few days.

My experience with jekyll was great. I never once hit a dead end or a wall and how easy it was to use made me more and more excited to get it finished. It is even able to be hosted on GitHub pages so if you are a GitHub user this makes life easy. If you plan on creating a personal blog or website I would recommend checking it out.

# Where to Go Next
* [jekyll](http://jekyllrb.com)
* [jekyll XML feed](https://github.com/snaptortoise/jekyll-rss-feeds)
* [compass](http://compass-style.org)
