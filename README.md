Fedmine
=======

Fedmine is a simplistic theme for Redmine from [Froiden](http://www.froiden.com/). It is based on [Gitmike](https://github.com/makotokw/redmine-theme-gitmike) theme, modified to look completely different from the original theme.

Fedmine can be configured from redmine settings panel and has installer/updater script. That's why it is a redmine plugin (by [Pouyan](https://github.com/pouyanh))

The theme features somewhat metro style look with simplistic buttons and styles and RTL support (rendering [vazir-font
](https://github.com/rastikerdar/vazir-font)).

Usage
-----

Simply clone this repository to:
```
/your-redmine-installation/plugins/
```
After cloning successfully, you should install plugin:
```
RAILS_ENV=production bundle exec rake redmine:plugins
```
Then you can apply *fedmine* theme from Redmine Administration.

You can upload your company logo from http://redmine.your-domain.xyz/settings/plugin/fedmine

License
-------
MIT

