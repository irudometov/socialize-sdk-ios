====================
Twitter Integration
====================

Introduction
------------

It is strongly recommended that users be able to authenticate with Twitter when
using Socialize so as to maximize the exposure and promotion of your app.

This provides significant benefits to both your application and your users, including:

1. Improved user experience through personalized comments
2. Automatic profile creation (user name and profile picture)
3. Ability to automatically post user comments and likes to Twitter
4. Promotes your app on Twitter by associating your app with a users' tweets

To add Twitter authentication, you'll need a Twitter Application and the consumer key/consumer secret for the Twitter app.  
If you already have a Twitter app, you can skip this section.

Creating a Twitter Application
-------------------------------
If you **do not** already have a Twitter app just follow these simple steps:

  1. First create a Twitter app.  Go to https://dev.twitter.com/ and create a new app:
  
    .. image:: images/tw_create_app.png
    
  2. When creating the app, make sure you specify a callback URL.  
     This can be any value, and is not actually called during authentication but Twitter requires a 
     valid URL for callback otherwise authentication will fail.
     
    .. note:: 

      Make sure you specify a callback URL
  
    .. image:: images/tw_app_details.png
    
  3. Change the permissions on the app to Read/Write
    
    The default permissions for new Twitter Apps is Read Only, this must be changed to Read/Write.
    
    Your Twitter Consumer Key and Consumer Secret is also displayed on this page
    
    .. image:: images/tw_app_info.png
    
    These settings can be altered from the Settings tab on your Twitter App page
    
    .. image:: images/tw_app_permissions.png    
    
.. _propagate_tw:

Updating your Socialize Application Settings (Web)
--------------------------------------------------

You must enter your Twitter consumer key and secret in the
"App Settings" of your Socialize App Intelligence Dashboard at getsocialize.com

This is a required step. For background info, see the blog post at
http://blog.getsocialize.com/2012/twitter-update

    .. image:: images/twitter_settings.png

Configuring Twitter in Socialize (SDK)
--------------------------------------

Once you have a twitter application, simply tell Socialize about your consumer key and secret:

.. literalinclude:: snippets/twitter.m
  :start-after: begin-configure-snippet
  :end-before: end-configure-snippet
  :emphasize-lines: 9

.. note:: Standard Twitter configuration complete. Keep reading for special configuration

Linking to Twitter Using Existing Credentials
---------------------------------------------
If you already have a Twitter access token of your own, you can link to Socialize like so:

.. note:: You only need to do this if you implement your own twitter link flow. If you just want
  to use Socialize's automatic twitter login, you should not perform this step.

.. literalinclude:: snippets/twitter.m
  :start-after: begin-link-snippet
  :end-before: end-link-snippet

Posting to Twitter on your own
---------------------------------------------
Should you need to post to Facebook on your own, you can do so by using the
direct Twitter access methods on the utils classes. A viewcontroller must be specified
so that Socialize can prompt the user for twitter authentication if needed. You can also preemptively
authorize with twitter by calling the link methods directly.

.. literalinclude:: snippets/twitter.m
  :start-after: begin-post-snippet
  :end-before: end-post-snippet

Posting to twitter with media requires that you use an update_with_media endpoint.

.. literalinclude:: snippets/twitter.m
  :start-after: begin-status-with-media-snippet
  :end-before: end-status-with-media-snippet

Troubleshooting
---------------

There are a couple of app settings that may cause issues. You can configure your app's settings at http://dev.twitter.com

* For token errors during login, please ensure the app has a callback url defined in its settings.
* If posts are not showing up in your feed, you should verify that application is set read-write in its settings.
