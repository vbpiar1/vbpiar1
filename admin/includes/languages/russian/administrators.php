<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  Released under the GNU General Public License
*/

define('HEADING_TITLE', 'Администраторы');

define('TABLE_HEADING_ADMINISTRATORS', 'Администраторы');
define('TABLE_HEADING_HTPASSWD', 'Защищена htpasswd');
define('TABLE_HEADING_ACTION', 'Действие');

define('TEXT_INFO_INSERT_INTRO', 'Введите данные нового администратора');
define('TEXT_INFO_EDIT_INTRO', 'Сделайте необходимые изменения');
define('TEXT_INFO_DELETE_INTRO', 'Вы уверены, что хотите удалить этого администратора?');
define('TEXT_INFO_HEADING_NEW_ADMINISTRATOR', 'Новый администратор');
define('TEXT_INFO_USERNAME', 'Имя:');
define('TEXT_INFO_NEW_PASSWORD', 'Новый пароль:');
define('TEXT_INFO_PASSWORD', 'Пароль:');
define('TEXT_INFO_PROTECT_WITH_HTPASSWD', 'Защищена htaccess/htpasswd');

define('ERROR_ADMINISTRATOR_EXISTS', 'Ошибка: Администратор уже существует.');

define('HTPASSWD_INFO', '<strong>Дополнительная защита htaccess/htpasswd</strong><p>Эта админ-панель osCommerce дополнительно не защищена htaccess/htpasswd.</p><p>При использовании дополнительного уровня защиты htaccess/htpasswd имя администратора и его пароль будут автоматически сохраняться в файле htpasswd при обновлении записей администратора.</p><p><strong>Пожалуйста помните</strong>, если используется дополнительный уровень защиты и Вы не можете попасть в административную панель, пожалуйста проделайте следующее и проконсультируйтесь с Вашим хостером для использования защиты htaccess/htpasswd:</p><p><u><strong>1. Отредактируйте файл:</strong></u><br /><br />' . DIR_FS_ADMIN . '.htaccess</p><p>Удалите следующию строки, если они есть:</p><p><i>%s</i></p><p><u><strong>2. Удалите файл:</strong></u><br /><br />' . DIR_FS_ADMIN . '.htpasswd_oscommerce</p>');
define('HTPASSWD_SECURED', '<strong>Дополнительная защита htaccess/htpasswd</strong><p>Эта админ-панель osCommerce дополнительно защищена htaccess/htpasswd.</p>');
define('HTPASSWD_PERMISSIONS', '<strong>Дополнительная защита htaccess/htpasswd</strong><p>Эта админ-панель osCommerce дополнительно не защищена htaccess/htpasswd.</p><p>Для дополнительной защиты htaccess/htpasswd необходимо сделать доступными на запись следующие файлы:</p><ul><li>' . DIR_FS_ADMIN . '.htaccess</li><li>' . DIR_FS_ADMIN . '.htpasswd_oscommerce</li></ul><p>Перезагрузите эту страницу для подтверждения, если у файлов установлены правильные параметры доступа.</p>');
