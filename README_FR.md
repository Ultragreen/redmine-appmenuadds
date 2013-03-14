# Redmine App Menu Adds Plugin

Plugins de gestion de la barre de menu application de Redmine

## Pr�-requis

Ce plugins requiert :

* Ruby 1.8.6 ou sup�rieur
* Rails 2.2.2 ou sup�rieur
* Redmine trunk from r2493 to r2886	ou sup�rieur


## Installation

### Via SVN 

```bash
  $ sudo bash
  # export APP_ROOT= <path_vers_votre_app_rails>
  # cd $APP_ROOT
  # cd vendors/plugins
  # svn export https://svn.ultragreen.net/public/redmine-appmenuadds/tags/<lastest_tags> redmine-appmenuaddds
  # rake db:migrate_plugins RAILS_ENV=production
```

### Download depuis Ultragreen.net

http://www.ultragreen.net/projects/redmine-appmenuadds/files

r�cup�rer le tar.gz de le r�pertoire APP_ROOT et :

```bash
  $ sudo bash
  # export APP_ROOT= <path_vers_votre_app_rails>
  # cd $APP_ROOT
  # cd vendors/plugins
  # wget <URL_FICHIER_TAR_GZ>
  # tar xvzf redmine-appmenuadds.X.X.X.tar.gz
  # rm redmine-appmenuadds.X.X.X.tar.gz
  # rake db:migrate_plugins RAILS_ENV=production
```

Relancer votre serveur Rails et Redmine.


## Configuration 

Pour configurer le plugins utiliser le menu 'Menu' dans la barre du haut � droite de redmine

## Utilisation

Il existe trois type de tabs : 

- les liens vers de pages wiki de projet
- les liens vers des URLs ext�rieures
- les liens vers de page de wiki sp�cifique au plugin.