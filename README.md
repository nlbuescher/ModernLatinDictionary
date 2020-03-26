# About

This is a dictionary project for macOS written using Xcode 11, and the Dictionary Developer Kit from Apple. Entries include both Latin-English and English-Latin definitions.

# Getting Started

NOTE: You must be running macOS to build and run the project. It is possible to edit the XML file that contains all of the entries on any OS with any text editor, and to commit changes to the project with Git, but building and using the dictionary requires macOS.

## Editing the Code

To edit the code, simply clone the repository onto your own machine, and open the `ModernLatinDictionary.xhtml` file. Please see the section on Style Guidelines before making changes. 

### Style Guidelines

In general follow the standards set by the existing entries.

Normal Latin text does not have macrons; Only the dictionary entry *titles* themselves include macrons. All of the search terms and English-Latin definitions have to have macrons, whereas all example sentences, etc. should NOT have macrons.

## Building the Dictionary

The Makefile is preconfigured to build the project using the "Dictionary Development Kit" which it expects to find in the project directory. It defines a task for installing the resulting `.dictionary` file into the `~/Library/Dictionaries` directory.

To build and install the Dictionary, simply open a Terminal window, navigate to the project directory (where the Makefile is), and run the following:

```
make all install clean
```

This will first build the dictionary file from the source code (`make all`), then install the `.dictionary` file in the user Dictionaries directory (`make install`), and finally delete the build files from the project directory (`make clean`). You can run each of these commands separately if you wish, but note that they must be run in that order to have the desired effect.
