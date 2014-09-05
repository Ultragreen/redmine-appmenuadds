# Redmine App Menu Adds Plugin


Plugins for redmine for tabs in main menubar for wiki pages, externals URLs or wiki project pages

## Pré-requis

Requierement :

* Redmine 2.x

## Author 

* Romain GEORGES
* Devaroop Bhattacharya (Redmine 2.X portage)

## Installation

###Download and rename folder as redmine_appmenuadds(mind the underscore instead of dash) or more simply only appmenuadds

* After renaming, put the folder in your plugins directory which typically is : /your/redmine/setup/plugins/
* Follow guidelines for installation http://www.redmine.org/projects/redmine/wiki/Plugins

### Via git

```bash
  $ sudo bash
  # export APP_ROOT= <path_vers_votre_app_rails>
  # cd $APP_ROOT
  # cd plugins
  # git clone https://github.com/Ultragreen/redmine-appmenuadds.git appmenuadds
  # cd ..
  # rake redmine:plugins:migrate
```

Reload Rails and Redmine server.

## Configuration 

to configure your plugins use the 'Menu' menu in the Right top Menu of Redmine

## Usage

there is three types of tabs :

- link for project wiki pages
- link for externals URLs
- Links for custom wiki pages
