composer create-project drupal/cms
cm cms/
composer require drush/drush
vendor/bin/drush si --db-url=sqlite://drupal:drupal@127.0.0.1:3306/drupal
vendor/bin/drush upwd admin 123
vendor/bin/drush cr
chmod 777 -R .
echo '$settings["reverse_proxy"] = TRUE;' >> web/sites/default/settings.php
echo '$settings["reverse_proxy_addresses"] = ["127.0.0.1"];' >> web/sites/default/settings.php
echo 'export PATH="./vendor/bin:$PATH"' >> ~/.bashrc
export PATH="./vendor/bin:$PATH"
