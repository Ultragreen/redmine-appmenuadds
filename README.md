# Redmine App Menu Adds Plugin


Plugins for redmine for tabs in main menubar for wiki pages, externals URLs or wiki project pages

## Pré-requis

Requierement :

* Ruby 1.8.6 or higher
* Rails 2.2.2 or higher
* Redmine trunk from r2493 to r2886 or higher


## Installation

### from SVN 

```bash
  $ sudo bash
  # export APP_ROOT= <path_vers_votre_app_rails>
  # cd $APP_ROOT
  # cd vendors/plugins
  # svn export https://svn.ultragreen.net/public/redmine-appmenuadds/tags/<lastest_tags> redmine-appmenuaddds
  # rake db:migrate_plugins RAILS_ENV=production
```

### Download from Ultragreen.net

http://www.ultragreen.net/projects/redmine-appmenuadds/files

get the tar.gz in your folder vendor/plugin in  APP_ROOT and :


```bash
  $ sudo bash
  # export APP_ROOT= <path_to_app_rails>
  # cd $APP_ROOT
  # cd vendors/plugins
  # wget <URL_FICHIER_TAR_GZ>
  # tar xvzf redmine-appmenuadds.X.X.X.tar.gz
  # rm redmine-appmenuadds.X.X.X.tar.gz
  # rake db:migrate_plugins RAILS_ENV=production
```



Reload Rails and Redmine server


## Configuration 

to configure your plugins use the 'Menu' menu in the Right top Menu of Redmine

## Usage

there is three types of tabs :

- link for project wiki pages
- link for externals URLs
- Links for custom wiki pages
