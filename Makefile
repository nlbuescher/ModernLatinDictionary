#
# Makefile
#

###########################

# You need to edit these values.

DICT_NAME		=	"Latin - English"
DICT_SRC_PATH	=	ModernLatinDictionary.xhtml
CSS_PATH		=	style.css
PLIST_PATH		=	Info.plist

# DICT_BUILD_OPTS	=	-s 0	# Suppress adding supplementary key.

###########################

# The DICT_BUILD_TOOL_DIR value is used also in "build_dict.sh" script.
# You need to set it when you invoke the script directly.

DICT_BUILD_TOOL_DIR	=	"Dictionary Development Kit"
DICT_BUILD_TOOL_BIN	=	"$(DICT_BUILD_TOOL_DIR)/bin"

###########################

DICT_DEV_KIT_OBJ_DIR	=	./objects
export	DICT_DEV_KIT_OBJ_DIR

DESTINATION_FOLDER	=	~/Library/Dictionaries
RM					=	/bin/rm

###########################

all:
	"$(DICT_BUILD_TOOL_BIN)/build_dict.sh" $(DICT_BUILD_OPTS) $(DICT_NAME) $(DICT_SRC_PATH) $(CSS_PATH) $(PLIST_PATH)
	echo "Done."


install: all
	echo "Clearing dictionary caches."
	$(RM) -rf ~/Library/Preferences/com.apple.DictionaryServices.plist
	$(RM) -rf ~/Library/Preferences/com.apple.Dictionary.plist
	$(RM) -rf ~/Library/Caches/com.apple.DictionaryApp
	$(RM) -rf ~/Library/Caches/com.apple.DictionaryManager
	$(RM) -rf ~/Library/Caches/com.apple.Dictionary
	$(RM) -rf ~/Library/Caches/com.apple.DictionaryServices
	echo "Done."
	echo "Installing into $(DESTINATION_FOLDER)".
	mkdir -p $(DESTINATION_FOLDER)
	ditto --noextattr --norsrc $(DICT_DEV_KIT_OBJ_DIR)/$(DICT_NAME).dictionary  $(DESTINATION_FOLDER)/$(DICT_NAME).dictionary
	touch $(DESTINATION_FOLDER)
	echo "Done."
	echo "To test the new dictionary, try Dictionary.app."

clean:
	$(RM) -rf $(DICT_DEV_KIT_OBJ_DIR)
