# Redmine App Menu Adds Plugin


Plugins for redmine for tabs in main menubar for wiki pages, externals URLs or wiki project pages

## Author 

* Romain GEORGES
* Devaroop Bhattacharya (Redmine 2.X portage)


## Pré-requis

Requierement :

* Redmine 2.x


## Installation

###Download and rename folder as redmine_appmenuadds(mind the underscore instead of dash)

* After renaming, put the folder in your plugins directory which typically is : /your/redmine/setup/plugins/
* Follow guidelines for installation http://www.redmine.org/projects/redmine/wiki/Plugins

Reload Rails and Redmine server.
A hack: Everytime you restart your server, you have to go to the menu tab at the top right corner to activate the existing menu's. This is only if you restart your server. Henceforth it works fine. Anyone with a better solution please submit a pull request with an update to this Readme :)


## Configuration 

to configure your plugins use the 'Menu' menu in the Right top Menu of Redmine

## Usage

there is three types of tabs :

- link for project wiki pages
- link for externals URLs
- Links for custom wiki pages
