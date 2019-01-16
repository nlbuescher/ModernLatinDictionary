# About

NOT MAINTAINED DUE TO LACK OF TIME

This is a dictionary project written using Mac OS X, Xcode 6, and the Dictionary
Developer Tools from Apple. Entries include both Latin-English and English-Latin
definitions.

# Getting Started

NOTE: You must be running Mac OS X 10.7+ to build and run the project. It is
possible to edit the XML file that contains all of the entries on any OS with
a text editor, and to commit changes to the project with Git, but building and
using the dictionary requires Mac OS X.

## Setting up the development environment

### 1. Install Atom

Atom is my personal preferred choice of text editor, so that's what I use and
recommend, but you can use any text editor of your choice. If you also want to
use Atom, you can find the download [here](https://atom.io).

### 2. Auxiliary Tools for Xcode

As of my switch to Atom I've included the Dictionary Development Kit from Apple
in the project files (I couldn't find any document in it saying that I *couldn't*
do that), so you no longer need to download this separately.

## Editing the Code

To edit the code, simply clone the repository onto your own machine, and open the
`ModernLatinDictionary.xhtml` file. Please see the section on [Style Guidelines](#style-guidelines)
before making changes. I also recommend using the Github desktop app for ease of use.

### Style Guidelines

In general follow the standards set by the existing entries.

1. Normal Latin text does not have macrons; Only the dictionary entry titles
   themselves include macrons. All of the search terms and English-Latin
   definitions have to have macrons, whereas all example sentences, etc. should
   NOT
   have macrons.

## Building the Dictionary

For convenience, I've added a `build.sh` bash script to build and install the `.dictionary` file.
It simply automates the process described below. To run the build script simply run it from the terminal
while in the project directory.

The Makefile is preconfigured to build the project using the "Dictionary Development Kit" which it expects
to find in `/Applications/Utilities`. You can download [on Apple's developer website] (http://adcdownload.apple.com/Developer_Tools/Additional_Tools_for_Xcode_8/Additional_Tools_for_Xcode_8_beta.dmg)
(you'll need to register your AppleID as a developer ID, which is free. **You DO NOT need to pay for a 
Developer Subscription to download the developer tools**). It automatically installs the resulting 
`.dictionary` file into the `~/Library/Dictionaries` directory.

To build and install the Dictionary, simply open a Terminal window, navigate to the project directory
(where the Makefile is), and run the following:

    make all install clean

This will first build the dictionary file from the source code (`make all`), then install the `.dictionary`
file in the user Dictionaries directory (`make install`), and finally delete the build files from the
project directory (`make clean`). You can run each of these commands separately if you wish, but note
that they must be run in that order to have the desired effect.
