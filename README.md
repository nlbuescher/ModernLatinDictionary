# About

This is a dictionary project written using Mac OS X, Xcode 6, and the Dictionary
Developer Tools from Apple. Entries include both Latin-English and English-Latin
definitions.

### Getting Started

NOTE: You must be running Mac OS X 10.7+ to build and run the project. It is
possible to edit the XML file that contains all of the entries on any OS with
a text editor, and to commit changes to the project with Git, but building and
using the dictionary requires Mac OS X.

#### Setting up the development environment

##### 1. Install Xcode

Xcode is available gratis from the [Mac App Store](https://itunes.apple.com/us/app/xcode/id497799835?mt=12).

![Xcode on the App Store](https://raw.github.com/NLBuescher/ModernLatinDictionary/gh-pages/images/xcode_app_store.png)

##### 2. Download the "Auxiliary Tools for Xcode" from the Apple developer page

First, navigate to the [Apple Developer Downloads page](https://developer.apple.com/downloads/)
and sign in. If you do not have an apple developer account, you can register 
your apple ID as a free developer account. (NOTE: This is not the same as the
yearly subscription to the Mac Developer Program which costs $99/yr)

Once you've signed in, click on the search bar in the top left and search for
"Auxiliary Tools". Download the most recent version and open the DMG file.

From the DMG, copy the "Dictionary Development Kit" into "/Applications/Utilities/".
The Makefile for this project is preconfigured to use that directory.

#### Editing the Code

To edit the code, simply clone the repository onto your own machine, and open the
project with Xcode. We recommend using the Github desktop app for ease of use.

#### Building the Dictionary

The project is preconfigured to use the Makefile for building and automatically 
puts the resulting .dictionary file into the "~/Library/Dictionaries" directory.

##### Style Guidelines

In general follow the standards set by the existing entries.

1. Normal Latin text does not have macrons; Only the dictionary entries
   themselves include macrons. All of the search terms and English-Latin
   definitions have to have macrons, whereas all example sentences should not
   have macrons
