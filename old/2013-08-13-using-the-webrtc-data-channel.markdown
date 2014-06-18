---
layout: post
title:  "Using the WebRTC Data Channel"
date:   2013-08-13 10:38:00
categories: html5 javascript webrtc
thumbnail: /assets/thumbnail/webrtc.png
---

It is no secret that WebRTC is the next hot thing on the web. With the ability to do high performance UDP data transfer it should be. I recently gave a talk on the WebRTC Data Channel at [WebRTC Conference][webrtcconf] this June in Atlanta, GA and wanted to summarize the key points from that talk in this post. The WebRTC Data Channel is probably the lesser known feature of WebRTC but is what I feel the more important one to know about.

# Well, what is it?

The data channel is a high performance and low latency connection between two clients. The amazing thing about this is that is a direct connection between two users which makes it extremely performant. It can be used in both reliable (TCP) mode for slower speeds but guaranteed delivery or unreliable (UDP) mode for faster speeds with possible packet loss. It allows the transfer of arbitrary JavaScript data such as `DOMStrings`, `Blobs`, and `ArrayBuffers`.

# How do I use it?

The WebRTC connection is a little harder to create than your typical web socket or AJAX request. It takes a few more steps and requires setting up some outside service for your users to give each other meta information before they can connect. The process typically happens like so:

1. Set up an outside channel for two users to discover and talk to each other. This can be done easily with a real-time communication framework such as [PubNub][pubnub], [Firebase][firebase], or [Socket.io][socketio].

2. Create a RTCPeerConnection object on one side and create a request object to send to the other user.

3. The other user gets the packet of information about the request, signs it thus creating a response, and sending that back to the first user.

4. Once the first user gets that information both users now know how to find each other over the internet and create a connection.

5. Both users create a data channel which allows them to send and listen for message events containing arbitrary JavaScript data.

Let's jump into some code to see how this works.

# Hello WebRTC

The first thing is we need to polyfill the objects needed based on the browser we are on. Since WebRTC is only supported on Chrome and Firefox at the moment I have just included those two for now.

{% highlight javascript %}
var IS_CHROME = !!window.webkitRTCPeerConnection,
    RTCPeerConnection,
    RTCIceCandidate,
    RTCSessionDescription;

if (IS_CHROME) {
  RTCPeerConnection = webkitRTCPeerConnection;
  RTCIceCandidate = window.RTCIceCandidate;
  RTCSessionDescription = window.RTCSessionDescription;
} else {
  RTCPeerConnection = mozRTCPeerConnection;
  RTCIceCandidate = mozRTCIceCandidate;
  RTCSessionDescription = mozRTCSessionDescription;
}
{% endhighlight %}

The next thing is setting up a signaling channel so that two clients can talk. This code will not work out of the box but should be a good start to learn how this works. It will take a peer connection and respond to requests from the other user to connect.

{% highlight javascript %}
function SignalingChannel(peerConnection) {
  // Setup the signaling channel here
  this.peerConnection = peerConnection;
}

SignalingChannel.prototype.send = function(message) {
  var data = JSON.stringify(message);

  // Send messages using your favorite real-time network
};

SignalingChannel.prototype.onmessage = function(message) {
  var data = JSON.parse(message);

  // If we get a sdp we have to sign and return it
  if (message.sdp != null) {
    var that = this;
    this.peerConnection.setRemoteDescription(new RTCSessionDescription(message.sdp), function () {
      that.peerConnection.createAnswer(function (description) {
        that.send(description);
      });
    });
  } else {
    this.peerConnection.addIceCandidate(new RTCIceCandidate(message.candidate));
  }
};
{% endhighlight %}

Now we need to create a peer connection, signaling channel, and create a way to start the connection process between two clients.

{% highlight javascript %}
// Create a peer connection object
var connection = new RTCPeerConnection({
  iceServers: [
    { 'url': (IS_CHROME ? 'stun:stun.l.google.com:19302' : 'stun:23.21.150.121') }
  ]
});

// Initiate a signaling channel between two users
var signalingChannel = new SignalingChannel(connection);

// Only one client should initiate the connection, the other client should wait.
function initiateConnection() {
  connection.createOffer(function (description) {
    signalingChannel.send(description);
  });
};
{% endhighlight %}

Finally we create the data channel. With the data channel object we can send and listen for data coming directly from the peer connection.

{% highlight javascript %}
// Firefox does not support unreliable channels at this time
var dataChannel = connection.createDataChannel("my_label", (IS_CHROME ? { reliable: false } : {}));

dataChannel.onmessage = function (event) {
  var data = event.data;

  console.log("I got data channel message: ", data);
};

dataChannel.onopen = function (event) {
  dataChannel.send("Hello World!");
};

// Create a button on the page so only one client initiates the connection
document.querySelector('#initiate-button').onclick = function (event) {
  initiateConnection();
};
{% endhighlight %}

And that should be close to a working example. There is a little bit of work to actually get this thing running such as creating a signaling channel between the users and finding out who to connect to. You can find the full code for copy and pasting [here][gist]

# What's the catch?

One of the biggest problems today is that this API is not supported across the board. Both Chrome and Firefox have committed to supporting the API but Internet Explorer is remaining quiet about the subject. Hopefully one day we can all put aside our difference and hold hands in browser heaven but that day has not come yet.

The other thing that developers need to consider is pairing this with great security and additional features to deliver a good user experience. The audio, video, and data communication are amazing features for browsers but will not impress the average internet user. This is what users already get today with things like Google Hangouts and Skype so this is not anything amazing to them.

# Where to Go Next

* Google has built a pong-like game called [Cube Slam][cubeslam] using both the data channel and the video transfer

* Many examples of file sharing using WebRTC are popping up such as [Sharefest][sharefest] and [PubNub's PubShare Demo][pubshare]

* There are some frameworks being built specifically for WebRTC such as [PeerJS][peerjs] and [PubNub's WebRTC Framework][pubnub-webrtc]

I hope this is enough inspiration to start using WebRTC today!

[webrtcconf]:     http://webrtcworld.com/conference/
[pubnub]:         http://pubnub.com
[firebase]:       http://firebase.com
[socketio]:       http://socket.io
[gist]:           https://gist.github.com/dristic/6225723
[cubeslam]:       https://cubeslam.com
[sharefest]:      http://sharefest.me
[pubshare]:       http://pubnub.github.io/rtc-pubnub-fileshare/
[peerjs]:         http://peerjs.com/
[pubnub-webrtc]:  https://github.com/pubnub/webrtc