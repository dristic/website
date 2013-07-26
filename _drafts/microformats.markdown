---
layout: post
title:  "Make Your Website an Open API With Microformats"
date:   2013-07-25 21:34:00
categories: html5 microformats
---

This post is in relation to a talk that I saw on Microformats given by (speaker) at Adobe in San Francisco. I have to say the talk was well put together and I really enjoyed it. The need to explore microformats for my own needs as well as relaying that information to the public was the inspiration to write a post about it.

Every web developer should be familiar with the idea of formatting. They see it every day. Sometimes it is called "HTML", other times "JSON", and for some even "XML". The idea is simple: format information in such a way that machines can understand, parse, and aggregate data about your website to display it to users. Microformats takes this idea one step further.

Microformats is the idea of taking smaller amounts of data and further annotating them for use in search engines, website crawlers, and more. It creates a standard way of annotating this information so that programmers can create machines that understand this data without having to be a PHD in regular expressions. Some common examples of this data you should see every day:

* Contact Information
* Calendar Invites
* Product Information
* Geolocation Data
* Author Profiles

The biggest example of these formats in the wild is in Google search results. Google introduced the idea of having rich result information such as showing author images next to blog articles when searching. Not only does this make it easy for Google to place your website higher in the search results but it also makes users more likely to click on your website in the results list. Getting started with microformats like author bio information is as simple as adding a few classes to your HTML:

{% highlight html %}
<span class="h-card">
  Dan Ristic
</span>
{% endhighlight %}

Now Google will crawl this special information and include it in search results. I have started adding this to my blog so hopefully they start showing up for this website!

This is just the tip of the iceberg. If you imagine every website having microformats integrated in by default you can think of the amount of detailed information you can get from a website by using a general parsing library.