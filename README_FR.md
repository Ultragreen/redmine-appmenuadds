# Redmine App Menu Adds Plugin

Plugins de gestion de la barre de menu application de Redmine

## Pré-requis

Ce plugins requiert :

* Redmine 2.X

## Auteurs

* Romain GEORGES
* Devaroop Bhattacharya (Redmine 2.X portage)


## Installation

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

Relancer votre serveur Rails et Redmine.


## Configuration 

Pour configurer le plugins utiliser le menu 'Menu' dans la barre du haut à droite de redmine

## Utilisation

Il existe trois type de tabs : 

- les liens vers de pages wiki de projet
- les liens vers des URLs extérieures
- les liens vers de page de wiki spécifique au plugin.