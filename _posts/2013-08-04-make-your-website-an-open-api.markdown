---
layout: post
title:  "Make Your Website an Open API With Microformats"
date:   2013-07-25 21:34:00
categories: html5 microformats
thumbnail: /assets/thumbnail/microformats.png
---

I recently saw a talk on Microformats given by [Tantek Çelik](http://tantek.com) at Adobe in San Francisco. I have to say the talk was well put together and I really enjoyed it. The need to explore microformats for my own needs as well as relaying that information to the public was the inspiration to write about it.

Every web developer should be familiar with the idea of formatting. They see it every day. Sometimes it is called "HTML", other times "JSON", and for some even "XML". The idea is simple: format information in such a way that machines can understand, parse, and aggregate data about your website to display it to users. Microformats takes this idea one step further.

Microformats is the idea of taking smaller amounts of data and further annotating them for use in search engines, website crawlers, and more. It creates a standard way of annotating this information so that programmers can create machines that understand this data without having to be a PHD in regular expressions. Some common examples of this data you should see every day:

* Contact Information
* Calendar Invites
* Product Information
* Geolocation Data
* Author Profiles

<img src="{{ site.baseurl }}/assets/paul-irish-google-search.png" alt="Paul Irish Google Search" width="400" height="151" style="float: right" />

The biggest example of these formats in the wild is in Google search results. Google introduced the idea of having rich result information such as showing author images next to blog articles when searching. Not only does this make it easy for Google to place your website higher in the search results but it also makes users more likely to click on your website in the results list. Getting started with microformats like author bio information is as simple as adding a few classes to your HTML:

{% highlight html %}
<span class="vcard">
  <span class="fn">
    Dan Ristic
  </span>
</span>
{% endhighlight %}

Now this will tell parsers that anything inside my "vcard" class is related to my contact information. It also tells the parser that anything inside the "fn" element is a formatted name. With this in place we could easily put together a program that aggregates contact information from several developer evangelists across the web. (Hint hint, nudge nudge)

The microformats API has standards in place for numerous types of data. Another one of the popular formats is calendar formats. It includes another easy to follow guide that ends up looking like this:

{% highlight html %}
<span class="vevent">
  <span class="summary">HTML 5 Conference</span>
 on <span class="dtstart">2013-10-22</span> 
 at the Moscone Center 
 in <span class="location">San Francisco, CA, USA</span>.
</span>
{% endhighlight %}

Now your event information is easier to find and add to digital calendars like iCal and Google Calendar.

I am sure one could spend all day adding microformats to their website. Although there are formats for every case not all of them are useful today. I would say if you are just getting started to look into a few for now and investigate the rest when you have some extra time:

* Contact information is the best first step. It is the easiest to add and the most valuable for search results
* Add a class to your `<body>` tags that explains the type of content as this is where most engines will look first
* Add any specific formats from social networks you use such as [Twitter Cards](https://dev.twitter.com/docs/cards) and [Facebook OGP](http://ogp.me/)

This is just the tip of the iceberg. If you imagine every website having microformats integrated in by default you can think of the amount of detailed information you can get from a website by using a general parsing library. Not only is it easier to find information through search engines but you can also build your own social systems around these formats. One example shown at the talk was a comment system based on posting tags on your personal website which would get crawled and aggregated for a twitter-like social system.

# Where to Go Next
* [Slides From the Talk](http://tantek.com/presentations/2013/07/microformats2/)
* [Microformats Getting Started](http://microformats.org/get-started)
* [Microformats Website](http://microformats.org)
* [Twitter Cards](https://dev.twitter.com/docs/cards)
