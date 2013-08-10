---
layout: post
title:  "Using the WebRTC Data Channel"
date:   2013-07-25 21:34:00
categories: html5 javascript webrtc
thumbnail: /assets/thumbnail/webrtc.png
---

It is no secret that WebRTC is the next hot thing on the web. I recently gave a talk on the WebRTC data channel at WebRTC conference this July in Atlanta, GA and wanted to summarize the key points from that talk in this post. The WebRTC Data Channel is probably the lesser talked about feature of the API as most people are excited about audio and video sharing in the browser.

What is it?

The data channel is a way to share arbitrary amounts of data between users. The amazing thing about this is that it is a peer to peer connection meaning that your users can share data with each other directly without going through a server. This makes the data sharing extremely fast and performant versus other types of connections.

How do I use it?

The WebRTC connection is a little harder to create than your typical web sockets or AJAX requests. It takes a few more steps and requires setting up some outside service for your users to give each other meta information before they can connect. The process typically goes like this:

1. Setup a channel for two users to discover and talk to each other. This can be done easily with a real-time communication framework such as PubNub, Firebase, or Socket.io.

2. Create a RTCPeerConnection object on one side and create a request object to send to the other user.

3. The other user gets the packet of information about the request, signs it thus creating a response, and sending that back to the first user.

4. Once the first user gets that information both users now know how to find each other and create a connection.

5. Both users create a data channel which allows them to send and listen for message events containing arbitrary JavaScript data.

Issues

One of the biggest problems today is that this API is not supported across the board. Both Chrome and Firefox have committed to supporting the API but Internet Explorer is remaining quiet about the subject. Hopefully one day we can all put aside our difference and hold hands in browser heaven but that day has not come yet.

The other thing that developers need to consider is pairing this with great security and additional features to deliver a good user experience. The audio, video, and data communication are amazing features for browsers but will not impress the average internet user.

Amazing Examples

Some great examples of using WebRTC are already popping up in the wild today:

* Google has built a pong-like game called Cube Slam using both the data channel and the video transfer

* Many examples of file sharing using WebRTC are popping up such as sharefest.me and pubnub's pubshare demo

* This is even being used as a content delivery network to allow web pages to load faster by resource sharing with users closest to your location at peercdn

I hope this is enough inspiration to start using WebRTC today!

# Where to Go Next

