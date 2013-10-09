---
layout: post
title:  "Why I Generate All My Apps With Yeoman"
date:   2013-08-13 10:38:00
categories: html5 javascript ecmascript
thumbnail: /assets/thumbnail/webrtc.png
---
I wanted to do a short post to get back into the swing of things and I thought Yeoman would be a great short and sweet topic. As a developer evangelist I probably start between one to two projects a week. My work is constantly involved in the prototyping and creation of new ideas so one can say I have some experience in the first ten steps of a web project. A typical non-generated projected goes something like this:

1. cd workspace
1. mkdir `<my project name>`
1. cd `<my project name>`
1. touch index.html
1. subl .
1. Fill in standard html boilerplate
1. Make src directory
1. touch src/main.coffee
1. coffee -o lib/ -cw src/
1. Create css directory
1. Create styles.css
1. Start working on my prototype

As you can see none of my first ten steps involves working on application specific code. Now many people might be doing the math now and realize that even if this process took an hour it would only take 52 hours out of every year which honestly is not much in a developer’s work time. I want to talk about how optimizing this process though is not about saving the developer’s time, but rather building on top of a solid foundation. This is where Yeoman comes in to save the day.

Yeoman is the application workflow of the modern web programmer. The idea behind it is to build your application on a solid foundation that not only makes it easier to work but also easier to share your project with others. Taking a look at my non-yeoman apps I typically spend a lot of extra time setting up different frameworks I want to use. This includes setting up Coffeescript and SASS, linters, testers, and more. Even with just using Grunt this is still quite a chore.

Great Features

Building an app with Yeoman means my development has a pre-defined workflow right out of the box. It uses Grunt and Bower as standards in the Yeoman workflow meaning that any build tools or client libraries I need are available a terminal command away. It also means that anyone else who uses my project does not need to guess where all of my project files are. Gone are the days of deciding if dependencies live in lib/vendor, src/vendor, or lib/com/danristic/dependencies/temp/vendor/css/bin! My typical workflow now looks like this:

1. cd workspace
1. mkdir `<project name>`
1. cd `<project name>`
1. yo webapp
1. grunt server
1. Start working!

I end up with an even more powerful application than the above in less time. It even throws in things I usually am too lazy to put in like livereload or sometimes even SASS. There are plenty of additional generators for different kinds of applications as well to fit everyone’s style. Yeoman has not only made my applications easier to download and use but also to build on top of. I highly recommend this tool to anyone developing web applications. Check out their website at http://yeoman.io/ and try out the getting started tutorial, I promise you will enjoy it.

Where to Go Next

The Yeoman web site is a great start
Read more about Bower and Grunt
Check out why Google thinks tooling creates better web applications http://www.youtube.com/watch?feature=player_embedded&v=Mk-tFn2Ix6g
