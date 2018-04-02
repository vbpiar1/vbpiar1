# osCommerce, Open Source E-Commerce Solutions
# http://www.oscommerce.com
#
# Database Backup For osCommerce 2.3.4 Bootstrap демо-магазин
# Copyright (c) 2015 Spidometrs
#
# Database: osc2-3-bootstrap
# Database Server: localhost
#
# Backup Date: 16/08/2015 16:29:39

drop table if exists action_recorder;
create table action_recorder (
  id int(11) not null auto_increment,
  module varchar(255) not null ,
  user_id int(11) ,
  user_name varchar(255) ,
  identifier varchar(255) not null ,
  success char(1) ,
  date_added datetime not null ,
  PRIMARY KEY (id),
  KEY idx_action_recorder_module (module),
  KEY idx_action_recorder_user_id (user_id),
  KEY idx_action_recorder_identifier (identifier),
  KEY idx_action_recorder_date_added (date_added)
);

drop table if exists address_book;
create table address_book (
  address_book_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  entry_gender char(1) ,
  entry_company varchar(255) ,
  entry_firstname varchar(255) not null ,
  entry_lastname varchar(255) not null ,
  entry_street_address varchar(255) not null ,
  entry_suburb varchar(255) ,
  entry_postcode varchar(255) not null ,
  entry_city varchar(255) not null ,
  entry_state varchar(255) ,
  entry_country_id int(11) default '0' not null ,
  entry_zone_id int(11) default '0' not null ,
  PRIMARY KEY (address_book_id),
  KEY idx_address_book_customers_id (customers_id)
);

drop table if exists address_format;
create table address_format (
  address_format_id int(11) not null auto_increment,
  address_format varchar(128) not null ,
  address_summary varchar(48) not null ,
  PRIMARY KEY (address_format_id)
);

insert into address_format (address_format_id, address_format, address_summary) values ('1', '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('2', '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('3', '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('4', '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country');
insert into address_format (address_format_id, address_format, address_summary) values ('5', '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');
drop table if exists administrators;
create table administrators (
  id int(11) not null auto_increment,
  user_name varchar(255) not null ,
  user_password varchar(60) not null ,
  PRIMARY KEY (id)
);

insert into administrators (id, user_name, user_password) values ('4', 'admin', '$P$DS7altzLTTix4/0e.pVVWKnsbL6TlQ1');
drop table if exists banners;
create table banners (
  banners_id int(11) not null auto_increment,
  banners_title varchar(64) not null ,
  banners_url varchar(255) not null ,
  banners_image varchar(64) not null ,
  banners_group varchar(10) not null ,
  banners_html_text text ,
  expires_impressions int(7) default '0' ,
  expires_date datetime ,
  date_scheduled datetime ,
  date_added datetime not null ,
  date_status_change datetime ,
  status int(1) default '1' not null ,
  PRIMARY KEY (banners_id),
  KEY idx_banners_group (banners_group)
);

insert into banners (banners_id, banners_title, banners_url, banners_image, banners_group, banners_html_text, expires_impressions, expires_date, date_scheduled, date_added, date_status_change, status) values ('1', 'osCommerce.ru', 'http://oscommerce.ru', 'banners/oscommerce.gif', 'footer', '', '0', NULL, NULL, '2015-03-18 19:09:49', '2015-03-18 19:55:27', '1');
drop table if exists banners_history;
create table banners_history (
  banners_history_id int(11) not null auto_increment,
  banners_id int(11) not null ,
  banners_shown int(5) default '0' not null ,
  banners_clicked int(5) default '0' not null ,
  banners_history_date datetime not null ,
  PRIMARY KEY (banners_history_id),
  KEY idx_banners_history_banners_id (banners_id)
);

insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('1', '1', '50', '1', '2015-03-18 21:24:34');
insert into banners_history (banners_history_id, banners_id, banners_shown, banners_clicked, banners_history_date) values ('2', '1', '236', '5', '2015-03-19 00:01:24');
drop table if exists categories;
create table categories (
  categories_id int(11) not null auto_increment,
  categories_image varchar(64) ,
  parent_id int(11) default '0' not null ,
  sort_order int(3) ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (categories_id),
  KEY idx_categories_parent_id (parent_id)
);

insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('1', 'category_hardware.gif', '0', '1', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('2', 'category_software.gif', '0', '2', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('3', 'category_dvd_movies.gif', '0', '3', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('4', 'subcategory_graphic_cards.gif', '1', '0', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('5', 'subcategory_printers.gif', '1', '0', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('6', 'subcategory_monitors.gif', '1', '0', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('7', 'subcategory_speakers.gif', '1', '0', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('8', 'subcategory_keyboards.gif', '1', '0', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('9', 'subcategory_mice.gif', '1', '0', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('10', 'subcategory_action.gif', '3', '0', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('11', 'subcategory_science_fiction.gif', '3', '0', '2015-03-18 19:09:49', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('12', 'subcategory_comedy.gif', '3', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('13', 'subcategory_cartoons.gif', '3', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('14', 'subcategory_thriller.gif', '3', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('15', 'subcategory_drama.gif', '3', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('16', 'subcategory_memory.gif', '1', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('17', 'subcategory_cdrom_drives.gif', '1', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('18', 'subcategory_simulation.gif', '2', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('19', 'subcategory_action_games.gif', '2', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('20', 'subcategory_strategy.gif', '2', '0', '2015-03-18 19:09:50', NULL);
insert into categories (categories_id, categories_image, parent_id, sort_order, date_added, last_modified) values ('21', 'category_gadgets.png', '0', '4', '2015-03-18 19:09:50', NULL);
drop table if exists categories_description;
create table categories_description (
  categories_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  categories_name varchar(32) not null ,
  PRIMARY KEY (categories_id, language_id),
  KEY idx_categories_name (categories_name)
);

insert into categories_description (categories_id, language_id, categories_name) values ('10', '1', 'Action');
insert into categories_description (categories_id, language_id, categories_name) values ('10', '2', 'Action');
insert into categories_description (categories_id, language_id, categories_name) values ('19', '1', 'Action');
insert into categories_description (categories_id, language_id, categories_name) values ('19', '2', 'Action');
insert into categories_description (categories_id, language_id, categories_name) values ('13', '1', 'Cartoons');
insert into categories_description (categories_id, language_id, categories_name) values ('13', '2', 'Cartoons');
insert into categories_description (categories_id, language_id, categories_name) values ('17', '1', 'CDROM Drives');
insert into categories_description (categories_id, language_id, categories_name) values ('17', '2', 'CDROM Drives');
insert into categories_description (categories_id, language_id, categories_name) values ('12', '1', 'Comedy');
insert into categories_description (categories_id, language_id, categories_name) values ('12', '2', 'Comedy');
insert into categories_description (categories_id, language_id, categories_name) values ('15', '1', 'Drama');
insert into categories_description (categories_id, language_id, categories_name) values ('15', '2', 'Drama');
insert into categories_description (categories_id, language_id, categories_name) values ('3', '1', 'DVD Movies');
insert into categories_description (categories_id, language_id, categories_name) values ('3', '2', 'DVD Movies');
insert into categories_description (categories_id, language_id, categories_name) values ('21', '1', 'Gadgets');
insert into categories_description (categories_id, language_id, categories_name) values ('21', '2', 'Gadgets');
insert into categories_description (categories_id, language_id, categories_name) values ('4', '1', 'Graphics Cards');
insert into categories_description (categories_id, language_id, categories_name) values ('4', '2', 'Graphics Cards');
insert into categories_description (categories_id, language_id, categories_name) values ('1', '1', 'Hardware');
insert into categories_description (categories_id, language_id, categories_name) values ('1', '2', 'Hardware');
insert into categories_description (categories_id, language_id, categories_name) values ('8', '1', 'Keyboards');
insert into categories_description (categories_id, language_id, categories_name) values ('8', '2', 'Keyboards');
insert into categories_description (categories_id, language_id, categories_name) values ('16', '1', 'Memory');
insert into categories_description (categories_id, language_id, categories_name) values ('16', '2', 'Memory');
insert into categories_description (categories_id, language_id, categories_name) values ('9', '1', 'Mice');
insert into categories_description (categories_id, language_id, categories_name) values ('9', '2', 'Mice');
insert into categories_description (categories_id, language_id, categories_name) values ('6', '1', 'Monitors');
insert into categories_description (categories_id, language_id, categories_name) values ('6', '2', 'Monitors');
insert into categories_description (categories_id, language_id, categories_name) values ('5', '1', 'Printers');
insert into categories_description (categories_id, language_id, categories_name) values ('5', '2', 'Printers');
insert into categories_description (categories_id, language_id, categories_name) values ('11', '1', 'Science Fiction');
insert into categories_description (categories_id, language_id, categories_name) values ('11', '2', 'Science Fiction');
insert into categories_description (categories_id, language_id, categories_name) values ('18', '1', 'Simulation');
insert into categories_description (categories_id, language_id, categories_name) values ('18', '2', 'Simulation');
insert into categories_description (categories_id, language_id, categories_name) values ('2', '1', 'Software');
insert into categories_description (categories_id, language_id, categories_name) values ('2', '2', 'Software');
insert into categories_description (categories_id, language_id, categories_name) values ('7', '1', 'Speakers');
insert into categories_description (categories_id, language_id, categories_name) values ('7', '2', 'Speakers');
insert into categories_description (categories_id, language_id, categories_name) values ('20', '1', 'Strategy');
insert into categories_description (categories_id, language_id, categories_name) values ('20', '2', 'Strategy');
insert into categories_description (categories_id, language_id, categories_name) values ('14', '1', 'Thriller');
insert into categories_description (categories_id, language_id, categories_name) values ('14', '2', 'Thriller');
drop table if exists configuration;
create table configuration (
  configuration_id int(11) not null auto_increment,
  configuration_title varchar(255) not null ,
  configuration_key varchar(255) not null ,
  configuration_value text not null ,
  configuration_description varchar(255) not null ,
  configuration_group_id int(11) not null ,
  sort_order int(5) ,
  last_modified datetime ,
  date_added datetime not null ,
  use_function varchar(255) ,
  set_function varchar(255) ,
  PRIMARY KEY (configuration_id)
);

insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('1', 'Название магазина', 'STORE_NAME', 'osCommerce 2.3.4 Bootstrap демо-магазин', 'Название Вашего магазина', '1', '1', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('2', 'Владелец магазина', 'STORE_OWNER', 'Spidometrs', 'Имя владельца магазина', '1', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('3', 'E-Mail Адрес', 'STORE_OWNER_EMAIL_ADDRESS', 'admin@oscommerce.ru', 'E-Mail адрес владельца магазина', '1', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('4', 'E-Mail От', 'EMAIL_FROM', '\"Spidometrs\" <admin@oscommerce.ru>', 'E-Mail адрес в отправляемых письмах', '1', '4', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('5', 'Страна', 'STORE_COUNTRY', '176', 'Страна находения магазина.<br><br><b>Замечание: Не забудьте также указать Зону.</b>', '1', '6', '2015-03-20 09:56:00', '2015-03-19 17:04:53', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('6', 'Зона', 'STORE_ZONE', '18', 'Регион нахождения магазина', '1', '7', NULL, '2015-03-19 17:04:53', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('7', 'Порядок сортировки ожидаемых товаров', 'EXPECTED_PRODUCTS_SORT', 'desc', 'Укажите порядок сортировки для ожидаемых товаров, по возрастанию - asc или по убыванию - desc.', '1', '8', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'asc\', \'desc\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('8', 'Сортировка ожидаемых товаров', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'По какому значению будут сортироваться ожидаемые товары.', '1', '9', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'products_name\', \'date_expected\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('9', 'Переключение на валюту текущего языка', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Автоматическое переключение цен в магазине на валюту текущего языка.', '1', '10', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('10', 'Отправка копий писем с заказом', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Если Вы хотите получать письма с заказами, т.е. такие же письма, что и получает клиент после оформления заказа, укажите e-mail адрес для получения копий писем в следующем формате: Имя 1 &lt;email@address1&gt;, Имя 2 &lt;email@address2&gt;', '1', '11', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('11', 'Использовать короткие URL адреса (находится в разработке)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Использовать короткие URL адреса в магазине', '1', '12', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('12', 'Переходить в корзину после добавления товара', 'DISPLAY_CART', 'true', 'Переходить в корзину после добавления товара в корзину или оставаться на той же странице.', '1', '14', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('13', 'Разрешить гостям использовать функцию Рассказать другу', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Позволить гостям использовать функцию магазина Рассказать другу, если нет, то данной функцией могут пользоваться только зарегистрированные пользователи магазина.', '1', '15', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('14', 'Оператор поиска по умолчанию', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Укажите, какой оператор будет использоваться по умолчанию при осуществлении посетителем поиска в магазине.', '1', '17', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'and\', \'or\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('15', 'Адрес магазина', 'STORE_ADDRESS', 'Address Line 1
Address Line 2
Country
Phone', 'Адрес магазина используется на печатных документах и отображается на сайте', '1', '18', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('16', 'Телефон магазина', 'STORE_PHONE', '555-1234', 'Телефон магазина используется на печатных документах и отображается на сайте', '1', '19', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_textarea(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('17', 'Количество знаков после запятой у налогов', 'TAX_DECIMAL_PLACES', '0', 'Количество знаков после целого числа у налогов.', '1', '20', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('18', 'Показывать цены с налогами', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Показывать цены в магазине с налогами (true) или показывать налог только на заключительном этапе оформления заказа (false)', '1', '21', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('19', 'Имя', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Минимальное количество символов поля Имя', '2', '1', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('20', 'Фамилия', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Минимальное количество символов поля Фамилия', '2', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('21', 'Дата рождения', 'ENTRY_DOB_MIN_LENGTH', '10', 'Минимальное количество символов поля Дата рождения', '2', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('22', 'E-Mail Адрес', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Минимальное количество символов поля E-Mail адрес', '2', '4', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('23', 'Адрес', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Минимальное количество символов поля Адрес', '2', '5', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('24', 'Компания', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Минимальное количество символов поля Компания', '2', '6', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('25', 'Почтовый индекс', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Минимальное количество символов поля Почтовый индекс', '2', '7', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('26', 'Город', 'ENTRY_CITY_MIN_LENGTH', '3', 'Минимальное количество символов поля Город', '2', '8', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('27', 'Регион', 'ENTRY_STATE_MIN_LENGTH', '2', 'Минимальное количество символов поля Регион', '2', '9', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('28', 'Телефон', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Минимальное количество символов поля Телефон', '2', '10', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('29', 'Пароль', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Минимальное количество символов поля Пароль', '2', '11', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('30', 'Владелец кредитной карточки', 'CC_OWNER_MIN_LENGTH', '3', 'Минимальное количество символов поля Владелец кредитной карточки', '2', '12', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('31', 'Номер кредитной карточки', 'CC_NUMBER_MIN_LENGTH', '10', 'Минимальное количество символов поля Номер кредитной карточки', '2', '13', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('32', 'Текст отзыва', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Минимальное количество символов для отызов', '2', '14', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('33', 'Лидеры продаж', 'MIN_DISPLAY_BESTSELLERS', '1', 'Минимальное количество товара, выводимого в блоке Лидеры продаж', '2', '15', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('34', 'Также заказали', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Минимальное количество товара, выводимого в боксе Также заказали', '2', '16', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('35', 'Записи в адресной книге', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Максимальное количество записей, которые может сделать покупатель в своей адресной книге', '3', '1', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('36', 'Товаров на одной странице в каталоге', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Количество товара, выводимого на одной странице', '3', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('37', 'Ссылок на страницы', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Количество ссылок на другие страницы', '3', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('38', 'Специальные цены', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Максимальное количество товара, выводимого на странице Скидки', '3', '4', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('39', 'Новинки', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Максимальное количество товара, выводимых в боксе Новинки', '3', '5', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('40', 'Ожидаемые товары', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Максимальное количество товара, выводимого в блоке Ожидаемые товары', '3', '6', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('41', 'Список производителей', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Данная опция используется для настройки бокса производителей, если число производителей превышает указанное в данной опции, список производителей будет выводиться в виде drop-down списка, если число производителей меньше указанного в данной опции, произво', '3', '7', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('42', 'Производители в виде развёрнутого меню', 'MAX_MANUFACTURERS_LIST', '1', 'Данная опция используется для настройки бокса производителей, если указана цифра \'1\', то список производителей выводится в виде стандартного drop-down списка. Если указана любая другая цифра, то выводится только X производителей в виде развёрнутого меню.', '3', '7', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('43', 'Ограничение длины названия производителя', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Данная опция используется для настройки бокса производителей, Вы указываете количество символов, выводимого в боксе производителей, если название производителя будет состоять из большего количества символов, то будут выведены первые X символов названия', '3', '8', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('44', 'Новые отзывы', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Максимальное количество выводимых новых отзывов', '3', '9', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('45', 'Выбор случайных отзывов', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'Количество отзывов, которое будет использоваться для вывода случайного, т.е. если указано X - число отзывов, то случайный отзыв будет выбран из этих X отзывов', '3', '10', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('46', 'Выбор случайного товара в боксе Новинки', 'MAX_RANDOM_SELECT_NEW', '10', 'Количество товара, среди которого будет выбран случайный товар и выведен в бокс Новинок, т.е. если указано число X, то новый товар, который будет показан в боксе Новинок будет выбран из этих X новых товаров', '3', '11', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('47', 'Выбор случайного товара в боксе Скидки', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'Количество товара, среди которого будет выбран случайный товар и выведен в бокс Скидки, т.е. если указано число X, то товар, который будет показан в боксе Скидки будет выбран из этих X товаров', '3', '12', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('48', 'Количество категорий в строке', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'Сколько категорий выводить в одной строке', '3', '13', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('49', 'Количество Новинок на странице', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Максимальное количество новинок, выводимых на одной странице в разделе Новинки', '3', '14', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('50', 'Лидеры продаж', 'MAX_DISPLAY_BESTSELLERS', '10', 'Максимальное количество лидеров продаж, выводимых в боксе Лидеры продаж', '3', '15', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('51', 'Также заказази', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Максимальное количество товаров в боксе Наши покупатели также заказали', '3', '16', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('52', 'Бокс История заказов', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Максимальное количество товаров, выводимых в боксе История заказов', '3', '17', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('53', 'История заказов', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Максимальное количество заказов, выводимых на странице История заказов', '3', '18', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('54', 'Количество товара в корзину', 'MAX_QTY_IN_CART', '99', 'Максимальное количество товара, которое можно положить в корзину (0 - без ограничений)', '3', '19', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('55', 'Ширина маленькой картинки', 'SMALL_IMAGE_WIDTH', '100', 'Ширина картинки в пикселах. Оставьте поле пустым или поставьте 0, если не хотите ограничивать ширину картинки. Ограничение ширины картинки не значит физического уменьшения размеров картинки.', '4', '1', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('56', 'Высота маленькой картинки', 'SMALL_IMAGE_HEIGHT', '80', 'Высота картинки в пикселах. Оставьте поле пустым или поставьте 0, если не хотите ограничивать высоту картинки. Ограничение высоты картинки не значит физического уменьшения размеров картинки.', '4', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('57', 'Ширина картинки категории', 'HEADING_IMAGE_WIDTH', '57', 'Ширина картинки в пикселах. Оставьте поле пустым или поставьте 0, если не хотите ограничивать ширину картинки. Ограничение ширины картинки не значит физического уменьшения размеров картинки.', '4', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('58', 'Высота картинки категории', 'HEADING_IMAGE_HEIGHT', '40', 'Высота картинки в пикселах. Оставьте поле пустым или поставьте 0, если не хотите ограничивать высоту картинки. Ограничение высоты картинки не значит физического уменьшения размеров картинки.', '4', '4', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('59', 'Ширина картинки подкатегории', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'Ширина картинки в пикселах. Оставьте поле пустым или поставьте 0, если не хотите ограничивать ширину картинки. Ограничение ширины картинки не значит физического уменьшения размеров картинки.', '4', '5', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('60', 'Высота картинки подкатегории', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'Высота картинки в пикселах. Оставьте поле пустым или поставьте 0, если не хотите ограничивать высоту картинки. Ограничение высоты картинки не значит физического уменьшения размеров картинки.', '4', '6', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('61', 'Вычислять размер картинки', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Данная опция просто смотрит переменные, указанные выше и сжимает картинку до указанных размеров, это не значит, что физический размер картинки уменьшится, происходит принудительный вывод картинки определённого размера. Рекомендуется ставить значение false', '4', '7', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('62', 'Картинка обязательна', 'IMAGE_REQUIRED', 'true', 'Необходимо для поиска ошибок, в случае, если картинка не выводится.', '4', '8', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('63', 'Пол', 'ACCOUNT_GENDER', 'true', 'Показывать поле Пол при регистрации покупателя в магазине и в адресной книге', '5', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('64', 'Дата рождения', 'ACCOUNT_DOB', 'true', 'Показывать поле Дата рождения при регистрации покупателя в магазине и в адресной книге', '5', '2', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('65', 'Компания', 'ACCOUNT_COMPANY', 'true', 'Показывать поле Компания при регистрации покупателя в магазине и в адресной книге', '5', '3', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('66', 'Район', 'ACCOUNT_SUBURB', 'true', 'Показывать поле Район при регистрации покупателя в магазине и в адресной книге', '5', '4', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('67', 'Регион', 'ACCOUNT_STATE', 'true', 'Показывать поле Регион при регистрации покупателя в магазине и в адресной книге', '5', '5', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('68', 'Установленные модули', 'MODULE_PAYMENT_INSTALLED', 'cod.php;paypal_express.php', 'Список установленных модулей оплаты, разделённых точкой с запятой. Страница автоматически обновляется. Ничего изменять не нужно, это просто информативная страница об установленных модулях. (Например: cc.php;cod.php;paypal.php)', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('69', 'Установленные модули', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_shipping.php;ot_tax.php;ot_total.php', 'Список установленных модулей заказ итого, разделённых точкой с запятой. Страница автоматически обновляется. Ничего изменять не нужно, это просто информативная страница об установленных модулях. (Например: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_tota', '6', '0', '2015-03-19 17:19:27', '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('70', 'Установленные модули', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'Список установленных модулей доставки, разделённых точкой с запятой. Страница автоматически обновляется. Ничего изменять не нужно, это просто информативная страница об установленных модулях. (Например: ups.php;flat.php;item.php)', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('71', 'Installed Modules', 'MODULE_ACTION_RECORDER_INSTALLED', 'ar_admin_login.php;ar_contact_us.php;ar_reset_password.php;ar_tell_a_friend.php', 'List of action recorder module filenames separated by a semi-colon. This is automatically updated. No need to edit.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('72', 'Installed Modules', 'MODULE_SOCIAL_BOOKMARKS_INSTALLED', 'sb_email.php;sb_google_plus_share.php;sb_facebook.php;sb_twitter.php;sb_pinterest.php', 'List of social bookmark module filenames separated by a semi-colon. This is automatically updated. No need to edit.', '6', '0', '2015-03-19 17:37:48', '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('73', 'Разрешить модуль Оплата наличными при получении', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Вы хотите разрешить использование модуля при оформлении заказов?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('74', 'Зона', 'MODULE_PAYMENT_COD_ZONE', '0', 'Если выбрана зона, то данный модуль оплаты будет виден только покупателям из выбранной зоны.', '6', '2', NULL, '2015-03-19 17:04:53', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('75', 'Порядок сортировки.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Порядок сортировки модуля.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('76', 'Статус заказа', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Заказы, оформленные с использованием данного модуля оплаты будут принимать указанный статус.', '6', '0', NULL, '2015-03-19 17:04:53', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('77', 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', '6', '0', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('78', 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('79', 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', '6', '0', NULL, '2015-03-19 17:04:53', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('80', 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', '6', '0', NULL, '2015-03-19 17:04:53', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('81', 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('82', 'Валюта по умолчанию', 'DEFAULT_CURRENCY', 'RUR', 'Валюта по умолчанию', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('83', 'Язык по умолчанию', 'DEFAULT_LANGUAGE', 'ru', 'Язык по умолчанию', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('84', 'Статус заказа по умолчанию', 'DEFAULT_ORDERS_STATUS_ID', '1', 'Статус заказа по умолчанию, присваиваемый новым заказам.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('85', 'Показывать доставку', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Вы хотите показывать стоимость доставки?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('86', 'Порядок сортировки', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Порядок сортировки модуля.', '6', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('87', 'Разрешить бесплатную доставку', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Вы хотите разрешить использование модуля бесплатной доставки?', '6', '3', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('88', 'Бесплатная доставка для заказов на сумму свыше', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Заказы, свыше суммы, указанной данной поле, будут доставляться бесплатно.', '6', '4', NULL, '2015-03-19 17:04:53', 'currencies->format', NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('89', 'Бесплатная доставка для заказов, оформленных из', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'national - заказы из страны нахождения магазина(переменная Страна магазина), international - заказы из любой страны, кроме страны нахождения магазина, если both - тогда все заказы. При условии, что сумма заказы выше суммы, указанной в переменной выше.', '6', '5', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'national\', \'international\', \'both\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('90', 'Показывать стоимость товара', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Вы хотите показывать стоимость товара?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('91', 'Порядок сортировки', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Порядок сортировки модуля.', '6', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('92', 'Показывать налог', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Вы хотите показывать налог?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('93', 'Порядок сортировки', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Порядок сортировки модуля.', '6', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('94', 'Показывать всего', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Вы хотите показывать общую стоимость заказа?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('95', 'Порядок сортировки', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Порядок сортировки модуля.', '6', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('96', 'Minimum Minutes Per E-Mail', 'MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES', '15', 'Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('97', 'Minimum Minutes Per E-Mail', 'MODULE_ACTION_RECORDER_TELL_A_FRIEND_EMAIL_MINUTES', '15', 'Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('98', 'Allowed Minutes', 'MODULE_ACTION_RECORDER_ADMIN_LOGIN_MINUTES', '5', 'Number of minutes to allow login attempts to occur.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('99', 'Allowed Attempts', 'MODULE_ACTION_RECORDER_ADMIN_LOGIN_ATTEMPTS', '3', 'Number of login attempts to allow within the specified period.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('100', 'Allowed Minutes', 'MODULE_ACTION_RECORDER_RESET_PASSWORD_MINUTES', '5', 'Number of minutes to allow password resets to occur.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('101', 'Allowed Attempts', 'MODULE_ACTION_RECORDER_RESET_PASSWORD_ATTEMPTS', '1', 'Number of password reset attempts to allow within the specified period.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('102', 'Enable E-Mail Module', 'MODULE_SOCIAL_BOOKMARKS_EMAIL_STATUS', 'True', 'Do you want to allow products to be shared through e-mail?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('103', 'Сортировка', 'MODULE_SOCIAL_BOOKMARKS_EMAIL_SORT_ORDER', '10', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('104', 'Enable Google+ Share Module', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_STATUS', 'True', 'Do you want to allow products to be shared through Google+?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('105', 'Annotation', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ANNOTATION', 'None', 'The annotation to display next to the button.', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'Inline\', \'Bubble\', \'Vertical-Bubble\', \'None\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('106', 'Width', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_WIDTH', '', 'The maximum width of the button.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('107', 'Height', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_HEIGHT', '15', 'Sets the height of the button.', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'15\', \'20\', \'24\', \'60\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('108', 'Alignment', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ALIGN', 'Left', 'The alignment of the button assets.', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'Left\', \'Right\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('109', 'Сортировка', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_SORT_ORDER', '20', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('110', 'Enable Facebook Module', 'MODULE_SOCIAL_BOOKMARKS_FACEBOOK_STATUS', 'True', 'Do you want to allow products to be shared through Facebook?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('111', 'Сортировка', 'MODULE_SOCIAL_BOOKMARKS_FACEBOOK_SORT_ORDER', '30', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('112', 'Enable Twitter Module', 'MODULE_SOCIAL_BOOKMARKS_TWITTER_STATUS', 'True', 'Do you want to allow products to be shared through Twitter?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('113', 'Сортировка', 'MODULE_SOCIAL_BOOKMARKS_TWITTER_SORT_ORDER', '40', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('114', 'Enable Pinterest Module', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_STATUS', 'True', 'Do you want to allow Pinterest Button?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('115', 'Layout Position', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_BUTTON_COUNT_POSITION', 'None', 'Horizontal or Vertical or None', '6', '2', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'Horizontal\', \'Vertical\', \'None\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('116', 'Сортировка', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_SORT_ORDER', '50', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('117', 'Страна магазина', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Страна, где находится магазин. Необходимо для некоторых модулей доставки.', '7', '1', NULL, '2015-03-19 17:04:53', 'tep_get_country_name', 'tep_cfg_pull_down_country_list(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('118', 'Почтовый индекс магазина', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Укажите почтовый индекс магазина. Необходимо для некоторых модулей доставки.', '7', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('119', 'Максимальный вес доставки', 'SHIPPING_MAX_WEIGHT', '50', 'Вы можете указать максимальный вес доставки, свыше которого заказы не доставляются. Необходимо для некоторых модулей доставки.', '7', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('120', 'Вес упаковки', 'SHIPPING_BOX_WEIGHT', '3', 'Вы можете указать вес упаковки.', '7', '4', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('121', 'Тяжёлые заказы - Процентное увеличение стоимости', 'SHIPPING_BOX_PADDING', '10', 'Доставка заказов, вес которых больше указанного в переменной Максимальный вес доставки, увеличивается на указанный процент. Если Вы хотите увелить стоимость на 10%, пишите - 10', '7', '5', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('122', 'Разрешить заказы не соответствующие определённым зонам доставки', 'SHIPPING_ALLOW_UNDEFINED_ZONES', 'False', 'Разрешить заказы не соответствующие определённым зонам доставки?', '7', '5', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('123', 'Показывать картинку товара', 'PRODUCT_LIST_IMAGE', '1', 'Укажите порядок вывода, т.е. введите цифру. Если укажите 1, то картинка будет слева на первом месте, если 2, то картинка будет показана после(правее) поля, у которого указана цифра 1 и т.д.', '8', '1', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('124', 'Показывать производителя товара', 'PRODUCT_LIST_MANUFACTURER', '0', 'Укажите порядок вывода данного поля в Вашем магазине, т.е. введите цифру. Если укажите 1, то данное поле будет слева на первом месте, если 2, то поле будет показана после(правее) поля, у которого указана цифра 1 и т.д.', '8', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('125', 'Показывать код товара', 'PRODUCT_LIST_MODEL', '0', 'Укажите порядок вывода данного поля в Вашем магазине, т.е. введите цифру. Если укажите 1, то данное поле будет слева на первом месте, если 2, то поле будет показана после(правее) поля, у которого указана цифра 1 и т.д.', '8', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('126', 'Показывать название товара', 'PRODUCT_LIST_NAME', '2', 'Укажите порядок вывода данного поля в Вашем магазине, т.е. введите цифру. Если укажите 1, то данное поле будет слева на первом месте, если 2, то поле будет показана после(правее) поля, у которого указана цифра 1 и т.д.', '8', '4', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('127', 'Показывать стоимость товара', 'PRODUCT_LIST_PRICE', '3', 'Укажите порядок вывода данного поля в Вашем магазине, т.е. введите цифру. Если укажите 1, то данное поле будет слева на первом месте, если 2, то поле будет показана после(правее) поля, у которого указана цифра 1 и т.д.', '8', '5', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('128', 'Показывать количество товара на складе', 'PRODUCT_LIST_QUANTITY', '0', 'Укажите порядок вывода данного поля в Вашем магазине, т.е. введите цифру. Если укажите 1, то данное поле будет слева на первом месте, если 2, то поле будет показана после(правее) поля, у которого указана цифра 1 и т.д.', '8', '6', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('129', 'Показывать вес товара', 'PRODUCT_LIST_WEIGHT', '0', 'Укажите порядок вывода данного поля в Вашем магазине, т.е. введите цифру. Если укажите 1, то данное поле будет слева на первом месте, если 2, то поле будет показана после(правее) поля, у которого указана цифра 1 и т.д.', '8', '7', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('130', 'Показывать кнопку Купить сейчас!', 'PRODUCT_LIST_BUY_NOW', '4', 'Укажите порядок вывода данного поля в Вашем магазине, т.е. введите цифру. Если укажите 1, то данное поле будет слева на первом месте, если 2, то поле будет показана после(правее) поля, у которого указана цифра 1 и т.д.', '8', '8', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('131', 'Показывать фильтр Категория/Производители (0=не показывать; 1=показывать)', 'PRODUCT_LIST_FILTER', '1', 'Показывать бокс(drop-down) меню, с помощью которого можно сортировать товар в какой-либо категории магазина по Производителю.', '8', '9', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('132', 'Расположение навигации Следующая/Предыдущая страница', 'PREV_NEXT_BAR_LOCATION', '2', 'Установите расположение навигации Следующая/Предыдущая страница (1-верх, 2-низ, 3-верх+низ)', '8', '10', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('133', 'Проверять наличие товара на складе', 'STOCK_CHECK', 'true', 'Проверять, есть ли необходимое количество товара на складе при оформлении заказа', '9', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('134', 'Вычитать товар со склада', 'STOCK_LIMITED', 'true', 'Вычитать со склада то количество товара, которое будет заказываться в интернет-магазине', '9', '2', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('135', 'Разрешить оформление заказа', 'STOCK_ALLOW_CHECKOUT', 'true', 'Разрешить покупателям оформлять заказ, даже если на складе нет достаточного количества единиц заказываемого товара', '9', '3', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('136', 'Отмечать товар, отсутствующий на складе', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Показывать покупателю маркер напротив товара при оформлении заказа, если на складе нет необходимого количества единиц заказываемого товара', '9', '4', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('137', 'Лимит количества товара на складе', 'STOCK_REORDER_LEVEL', '5', 'Если количество товара на складе меньше, чем указанное число в данной переменной, то в корзине выводится предупреждение о недостаточном количестве товара на складе для выполнения заказа.', '9', '5', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('138', 'Сохранять время парсинга страниц', 'STORE_PAGE_PARSE_TIME', 'false', 'Хранить время, затраченное на генерацию(парсинг) страниц магазина.', '10', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('139', 'Директория хранения логов', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Полный путь до директории и файла, в который будет записываться лог парсинга страниц.', '10', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('140', 'Формат даты логов', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'Формат даты', '10', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('141', 'Показывать время парсинга страниц', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Показывать время парсинга страницы в интернет-магазине (опция Сохранять время парсинга страниц должна быть включена)', '10', '4', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('142', 'Сохранять запросы к базе дынных', 'STORE_DB_TRANSACTIONS', 'false', 'Сохранять все запросы к базе данных в файле, указанном в переменной Директория хранение логов (только для PHP4 и выше)', '10', '5', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('143', 'Использовать кэш', 'USE_CACHE', 'false', 'Использовать кэширование информации.', '11', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('144', 'Кэш директория', 'DIR_FS_CACHE', 'C:/inetpub/phpsites/demshop2-3x-bootstrap.oscommerce.ru/includes/work/', 'Директория, куда будут записываться и сохраняться кэш-файлы.', '11', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('145', 'Способ отправки E-Mail', 'EMAIL_TRANSPORT', 'sendmail', 'Укажите, какой способ отправки писем из магазина будет использоваться. Для серверов, работающих под управлением Windows или MacOS необходимо установить SMTP для отправки писем.', '12', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'sendmail\', \'smtp\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('146', 'Разделитель строк в E-Mail', 'EMAIL_LINEFEED', 'LF', 'Используемая последовательность символов для разделения заголовков в письме.', '12', '2', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'LF\', \'CRLF\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('147', 'Использовать HTML формат при отправке писем', 'EMAIL_USE_HTML', 'false', 'Отправлять письма из магазина в HTML формате.', '12', '3', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'),');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('148', 'Проверять E-Mail адрес через DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Проверять, верные ли e-mail адреса указываются при регистрации в интернет-магазине. Для проверки используется DNS.', '12', '4', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('149', 'Отправлять письма из магазина', 'SEND_EMAILS', 'true', 'Отправлять письма из мгаазина.', '12', '5', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('150', 'Разрешить функцию скачивания товаров', 'DOWNLOAD_ENABLED', 'false', 'Разрешить функцию скачивания товаров.', '13', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('151', 'Использовать перенаправление при скачивании', 'DOWNLOAD_BY_REDIRECT', 'false', 'Использовать перенаправление в браузере для скачивания товара. Для не Unix систем(Windows, Mac OS и т.д.) должно стоять false.', '13', '2', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('152', 'Срок существования ссылки для скачивания (дней)', 'DOWNLOAD_MAX_DAYS', '7', 'Установите количество дней, в течение которых покупатель может скачать свой товар. Если укажите 0, тогда срок существования ссылки для скачивания ограничен не будет.', '13', '3', NULL, '2015-03-19 17:04:53', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('153', 'Максимальное количество скачиваний', 'DOWNLOAD_MAX_COUNT', '5', 'Установите максимальное количество скачиваний для одного товара. Если укажите 0, тогда никаких ограничений по количеству скачиваний не будет.', '13', '4', NULL, '2015-03-19 17:04:53', NULL, '');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('154', 'Разрешить GZip компрессию', 'GZIP_COMPRESSION', 'false', 'Разрешить HTTP GZip компрессию.', '14', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'true\', \'false\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('155', 'Уровень компрессии', 'GZIP_LEVEL', '5', 'Вы можете указать уровень компрессии от 0 до 9 (0 = минимум, 9 = максимум).', '14', '2', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('156', 'Директория сессий', 'SESSION_WRITE_DIRECTORY', 'C:/inetpub/phpsites/demshop2-3x-bootstrap.oscommerce.ru/includes/work/', 'Если сессии хранятся в файлах, то здесь необходимо указать полный путь до папки, в которой будут храниться файлы сессий.', '15', '1', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('157', 'Принудительное использование Cookie', 'SESSION_FORCE_COOKIE_USE', 'False', 'Принудительно использовать сессии, только когда в браузере активированы cookies.', '15', '2', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('158', 'Проверять ID SSL сессии', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Проверять  SSL_SESSION_ID при каждом обращении к странице, защищённой протоколом HTTPS.', '15', '3', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('159', 'Проверять переменную User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Проверять переменную бразура user agent при каждом обращении к страницам интернет-магазина.', '15', '4', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('160', 'Проверять IP адрес', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Проверять IP адреса клиентов при каждом обращении к страницам интернет-магазина.', '15', '5', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('161', 'Не показывать сессию в адресе паукам поисковых машин', 'SESSION_BLOCK_SPIDERS', 'True', 'Не показывать сессию в адресе при обращении к станицам магазина известных поисковых пауков. Список известных пауков находится в файле includes/spiders.txt.', '15', '6', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('162', 'Воссоздавать сессию', 'SESSION_RECREATE', 'True', 'Воссоздавать сессию для генерации нового ID кода сессии при входе зарегистрированного покупателя в магазин, либо при регистрации нового покупателя (Только для PHP 4.1 и выше).', '15', '7', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('163', 'Last UPDATE Check Time', 'LAST_UPDATE_CHECK_TIME', '', 'Last time a check for new versions of osCommerce was run', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('164', 'Store Logo', 'STORE_LOGO', 'store_logo.png', 'This is the filename of your Store Logo.  This should be updated at admin > configuration > Store Logo', '6', '1000', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('165', 'Bootstrap Container', 'BOOTSTRAP_CONTAINER', 'container-fluid', 'What type of container should the page content be shown in? See http://getbootstrap.com/css/#overview-container', '16', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'container-fluid\', \'container\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('166', 'Bootstrap Content', 'BOOTSTRAP_CONTENT', '8', 'What width should the page content default to?  (8 = two thirds width, 6 = half width, 4 = one third width) Note that the Side Column(s) will adjust automatically.', '16', '2', '2015-03-20 09:34:44', '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'8\', \'6\', \'4\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('167', 'Enable PayPal Express Checkout', 'MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS', 'True', 'Do you want to accept PayPal Express Checkout payments?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('168', 'Seller Account', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SELLER_ACCOUNT', 'admin@oscommerce.ru', 'The email address of the seller account if no API credentials has been setup.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('169', 'API Username', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME', '', 'The username to use for the PayPal API service', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('170', 'API Password', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD', '', 'The password to use for the PayPal API service', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('171', 'API Signature', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE', '', 'The signature to use for the PayPal API service', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('172', 'PayPal Account Optional', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ACCOUNT_OPTIONAL', 'False', 'This must also be enabled in your PayPal account, in Profile > Website Payment Preferences.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('173', 'PayPal Instant Update', 'MODULE_PAYMENT_PAYPAL_EXPRESS_INSTANT_UPDATE', 'True', 'Support PayPal shipping and tax calculations on the PayPal.com site during Express Checkout.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('174', 'PayPal Checkout Image', 'MODULE_PAYMENT_PAYPAL_EXPRESS_CHECKOUT_IMAGE', 'Static', 'Use static or dynamic Express Checkout image buttons. Dynamic images are used with PayPal campaigns.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'Static\', \'Dynamic\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('175', 'Page Style', 'MODULE_PAYMENT_PAYPAL_EXPRESS_PAGE_STYLE', '', 'The page style to use for the checkout flow (defined at your PayPal Profile page)', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('176', 'Transaction Method', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD', 'Sale', 'The processing method to use for each transaction.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'Authorization\', \'Sale\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('177', 'Set Order Status', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', '6', '0', NULL, '2015-03-19 17:04:53', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('178', 'PayPal Transactions Order Status Level', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTIONS_ORDER_STATUS_ID', '4', 'Include PayPal transaction information in this order status level', '6', '0', NULL, '2015-03-19 17:04:53', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('179', 'Payment Zone', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', '6', '2', NULL, '2015-03-19 17:04:53', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('180', 'Transaction Server', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER', 'Live', 'Use the live or testing (sandbox) gateway server to process transactions?', '6', '0', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'Live\', \'Sandbox\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('181', 'Verify SSL Certificate', 'MODULE_PAYMENT_PAYPAL_EXPRESS_VERIFY_SSL', 'True', 'Verify gateway server SSL certificate on connection?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('182', 'Proxy Server', 'MODULE_PAYMENT_PAYPAL_EXPRESS_PROXY', '', 'Send API requests through this proxy server. (host:port, eg: 123.45.67.89:8080 or proxy.example.com:8080)', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('183', 'Debug E-Mail Address', 'MODULE_PAYMENT_PAYPAL_EXPRESS_DEBUG_EMAIL', '', 'All parameters of an invalid transaction will be sent to this email address.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('184', 'Sort order of display.', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('185', 'Installed Modules', 'MODULE_HEADER_TAGS_INSTALLED', 'ht_product_colorbox.php;ht_grid_list_view.php;ht_div_equal_heights.php;ht_manufacturer_title.php;ht_category_title.php;ht_product_title.php;ht_canonical.php;ht_robot_noindex.php;ht_datepicker_jquery.php;ht_table_click_jquery.php;ht_noscript.php', 'List of header tag module filenames separated by a semi-colon. This is automatically updated. No need to edit.', '6', '0', '2015-08-08 15:54:03', '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('186', 'Enable Category Title Module', 'MODULE_HEADER_TAGS_CATEGORY_TITLE_STATUS', 'True', 'Do you want to allow category titles to be added to the page title?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('187', 'Сортировка', 'MODULE_HEADER_TAGS_CATEGORY_TITLE_SORT_ORDER', '200', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('188', 'Enable Manufacturer Title Module', 'MODULE_HEADER_TAGS_MANUFACTURER_TITLE_STATUS', 'True', 'Do you want to allow manufacturer titles to be added to the page title?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('189', 'Сортировка', 'MODULE_HEADER_TAGS_MANUFACTURER_TITLE_SORT_ORDER', '100', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('190', 'Enable Product Title Module', 'MODULE_HEADER_TAGS_PRODUCT_TITLE_STATUS', 'True', 'Do you want to allow product titles to be added to the page title?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('191', 'Сортировка', 'MODULE_HEADER_TAGS_PRODUCT_TITLE_SORT_ORDER', '300', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('192', 'Enable Canonical Module', 'MODULE_HEADER_TAGS_CANONICAL_STATUS', 'True', 'Do you want to enable the Canonical module?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('193', 'Сортировка', 'MODULE_HEADER_TAGS_CANONICAL_SORT_ORDER', '400', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('194', 'Enable Robot NoIndex Module', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_STATUS', 'True', 'Do you want to enable the Robot NoIndex module?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('195', 'Pages', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_process.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;cookie_usage.php;create_account.php;create_account_success.php;login.php;logoff.php;password_forgotten.php;password_reset.php;product_reviews_write.php;shopping_cart.php;ssl_check.php;tell_a_friend.php', 'The pages to add the meta robot noindex tag to.', '6', '0', NULL, '2015-03-19 17:04:53', 'ht_robot_noindex_show_pages', 'ht_robot_noindex_edit_pages(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('196', 'Сортировка', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_SORT_ORDER', '500', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('197', 'Enable No Script Module', 'MODULE_HEADER_TAGS_NOSCRIPT_STATUS', 'True', 'Add message for people with .js turned off?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('198', 'Сортировка', 'MODULE_HEADER_TAGS_NOSCRIPT_SORT_ORDER', '1000', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('199', 'Enable Datepicker jQuery Module', 'MODULE_HEADER_TAGS_DATEPICKER_JQUERY_STATUS', 'True', 'Do you want to enable the Datepicker module?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('200', 'Pages', 'MODULE_HEADER_TAGS_DATEPICKER_JQUERY_PAGES', 'advanced_search.php;account_edit.php;create_account.php', 'The pages to add the Datepicker jQuery Scripts to.', '6', '0', NULL, '2015-03-19 17:04:53', 'ht_datepicker_jquery_show_pages', 'ht_datepicker_jquery_edit_pages(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('201', 'Сортировка', 'MODULE_HEADER_TAGS_DATEPICKER_JQUERY_SORT_ORDER', '600', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('205', 'Enable Clickable Table Rows Module', 'MODULE_HEADER_TAGS_TABLE_CLICK_JQUERY_STATUS', 'True', 'Do you want to enable the Clickable Table Rows module?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('206', 'Pages', 'MODULE_HEADER_TAGS_TABLE_CLICK_JQUERY_PAGES', 'checkout_payment.php;checkout_shipping.php', 'The pages to add the jQuery Scripts to.', '6', '0', NULL, '2015-03-19 17:04:53', 'ht_table_click_jquery_show_pages', 'ht_table_click_jquery_edit_pages(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('207', 'Сортировка', 'MODULE_HEADER_TAGS_TABLE_CLICK_JQUERY_SORT_ORDER', '800', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('211', 'Installed Modules', 'MODULE_ADMIN_DASHBOARD_INSTALLED', 'd_total_revenue.php;d_total_customers.php;d_orders.php;d_customers.php;d_admin_logins.php;d_security_checks.php;d_version_check.php;d_reviews.php', 'List of Administration Tool Dashboard module filenames separated by a semi-colon. This is automatically updated. No need to edit.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('212', 'Enable Administrator Logins Module', 'MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_STATUS', 'True', 'Do you want to show the latest administrator logins on the dashboard?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('213', 'Сортировка', 'MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_SORT_ORDER', '500', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('214', 'Enable Customers Module', 'MODULE_ADMIN_DASHBOARD_CUSTOMERS_STATUS', 'True', 'Do you want to show the newest customers on the dashboard?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('215', 'Сортировка', 'MODULE_ADMIN_DASHBOARD_CUSTOMERS_SORT_ORDER', '400', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('220', 'Enable Orders Module', 'MODULE_ADMIN_DASHBOARD_ORDERS_STATUS', 'True', 'Do you want to show the latest orders on the dashboard?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('221', 'Сортировка', 'MODULE_ADMIN_DASHBOARD_ORDERS_SORT_ORDER', '300', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('222', 'Enable Security Checks Module', 'MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_STATUS', 'True', 'Do you want to run the security checks for this installation?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('223', 'Сортировка', 'MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_SORT_ORDER', '600', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('224', 'Enable Total Customers Module', 'MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_STATUS', 'True', 'Do you want to show the total customers chart on the dashboard?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('225', 'Сортировка', 'MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_SORT_ORDER', '200', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('226', 'Enable Total Revenue Module', 'MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_STATUS', 'True', 'Do you want to show the total revenue chart on the dashboard?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('227', 'Сортировка', 'MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_SORT_ORDER', '100', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('228', 'Enable Version Check Module', 'MODULE_ADMIN_DASHBOARD_VERSION_CHECK_STATUS', 'True', 'Do you want to show the version check results on the dashboard?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('229', 'Сортировка', 'MODULE_ADMIN_DASHBOARD_VERSION_CHECK_SORT_ORDER', '900', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('230', 'Enable Latest Reviews Module', 'MODULE_ADMIN_DASHBOARD_REVIEWS_STATUS', 'True', 'Do you want to show the latest reviews on the dashboard?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('231', 'Сортировка', 'MODULE_ADMIN_DASHBOARD_REVIEWS_SORT_ORDER', '1000', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('234', 'Installed Modules', 'MODULE_BOXES_INSTALLED', 'bm_search.php;bm_categories.php;bm_product_social_bookmarks.php;bm_card_acceptance.php;bm_information.php;bm_whats_new.php;bm_shopping_cart.php;bm_currencies.php;bm_best_sellers.php;bm_languages.php;bm_manufacturer_info.php;bm_manufacturers.php;bm_order_history.php;bm_product_notifications.php;bm_reviews.php;bm_specials.php', 'List of box module filenames separated by a semi-colon. This is automatically updated. No need to edit.', '6', '0', '2015-03-20 10:23:10', '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('254', 'Установленные группы блока шаблона', 'TEMPLATE_BLOCK_GROUPS', 'boxes;header_tags', 'This is automatically updated. No need to edit.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('255', 'Installed Modules', 'MODULE_CONTENT_INSTALLED', 'account/cm_account_set_password;checkout_success/cm_cs_redirect_old_order;checkout_success/cm_cs_thank_you;checkout_success/cm_cs_product_notifications;checkout_success/cm_cs_downloads;footer/cm_footer_account;footer/cm_footer_information_links;footer/cm_footer_contact_us;footer/cm_footer_text;footer_suffix/cm_footer_extra_copyright;footer_suffix/cm_footer_extra_icons;header/cm_header_breadcrumb;header/cm_header_logo;header/cm_header_search;header/cm_header_messagestack;login/cm_login_form;login/cm_create_account_link;navigation/cm_navbar;product_info/cm_pi_reviews', 'This is automatically updated. No need to edit.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('256', 'Enable Set Account Password', 'MODULE_CONTENT_ACCOUNT_SET_PASSWORD_STATUS', 'True', 'Do you want to enable the Set Account Password module?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('257', 'Allow Local Passwords', 'MODULE_CONTENT_ACCOUNT_SET_PASSWORD_ALLOW_PASSWORD', 'True', 'Allow local account passwords to be set.', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('258', 'Сортировка', 'MODULE_CONTENT_ACCOUNT_SET_PASSWORD_SORT_ORDER', '100', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('259', 'Enable Redirect Old Order Module', 'MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_STATUS', 'True', 'Should customers be redirected when viewing old checkout success orders?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('260', 'Redirect Minutes', 'MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_MINUTES', '60', 'Redirect customers to the My Account page after an order older than this amount is viewed.', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('261', 'Сортировка', 'MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_SORT_ORDER', '500', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('262', 'Enable Thank You Module', 'MODULE_CONTENT_CHECKOUT_SUCCESS_THANK_YOU_STATUS', 'True', 'Should the thank you block be shown on the checkout success page?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('263', 'Сортировка', 'MODULE_CONTENT_CHECKOUT_SUCCESS_THANK_YOU_SORT_ORDER', '1000', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('264', 'Enable Product Notifications Module', 'MODULE_CONTENT_CHECKOUT_SUCCESS_PRODUCT_NOTIFICATIONS_STATUS', 'True', 'Should the product notifications block be shown on the checkout success page?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('265', 'Сортировка', 'MODULE_CONTENT_CHECKOUT_SUCCESS_PRODUCT_NOTIFICATIONS_SORT_ORDER', '2000', 'Порядок сортировки', '6', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('266', 'Enable Product Downloads Module', 'MODULE_CONTENT_CHECKOUT_SUCCESS_DOWNLOADS_STATUS', 'True', 'Should ordered product download links be shown on the checkout success page?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('267', 'Сортировка', 'MODULE_CONTENT_CHECKOUT_SUCCESS_DOWNLOADS_SORT_ORDER', '3000', 'Порядок сортировки', '6', '3', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('268', 'Enable Login Form Module', 'MODULE_CONTENT_LOGIN_FORM_STATUS', 'True', 'Do you want to enable the login form module?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('269', 'Content Width', 'MODULE_CONTENT_LOGIN_FORM_CONTENT_WIDTH', 'Half', 'Should the content be shown in a full or half width container?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'Full\', \'Half\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('270', 'Сортировка', 'MODULE_CONTENT_LOGIN_FORM_SORT_ORDER', '1000', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('271', 'Enable New User Module', 'MODULE_CONTENT_CREATE_ACCOUNT_LINK_STATUS', 'True', 'Do you want to enable the new user module?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('272', 'Content Width', 'MODULE_CONTENT_CREATE_ACCOUNT_LINK_CONTENT_WIDTH', 'Half', 'Should the content be shown in a full or half width container?', '6', '1', NULL, '2015-03-19 17:04:53', NULL, 'tep_cfg_select_option(array(\'Full\', \'Half\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('273', 'Сортировка', 'MODULE_CONTENT_CREATE_ACCOUNT_LINK_SORT_ORDER', '2000', 'Порядок сортировки', '6', '0', NULL, '2015-03-19 17:04:53', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('304', 'Enable Search Module', 'MODULE_BOXES_SEARCH_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:08:04', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('305', 'Content Placement', 'MODULE_BOXES_SEARCH_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:08:04', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('306', 'Sort Order', 'MODULE_BOXES_SEARCH_SORT_ORDER', '1', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:08:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('307', 'Enable Categories Module', 'MODULE_BOXES_CATEGORIES_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:08:39', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('308', 'Content Placement', 'MODULE_BOXES_CATEGORIES_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:08:39', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('309', 'Sort Order', 'MODULE_BOXES_CATEGORIES_SORT_ORDER', '2', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:08:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('313', 'Enable Shopping Cart Module', 'MODULE_BOXES_SHOPPING_CART_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:11:08', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('314', 'Content Placement', 'MODULE_BOXES_SHOPPING_CART_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:11:08', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('315', 'Sort Order', 'MODULE_BOXES_SHOPPING_CART_SORT_ORDER', '11', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:11:08', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('316', 'Enable Currencies Module', 'MODULE_BOXES_CURRENCIES_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:11:50', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('317', 'Content Placement', 'MODULE_BOXES_CURRENCIES_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:11:50', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('318', 'Sort Order', 'MODULE_BOXES_CURRENCIES_SORT_ORDER', '12', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:11:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('319', 'Enable Product Social Bookmarks Module', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:13:39', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('320', 'Content Placement', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:13:39', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('321', 'Sort Order', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_SORT_ORDER', '3', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:13:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('322', 'Enable Best Sellers Module', 'MODULE_BOXES_BEST_SELLERS_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:14:36', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('323', 'Content Placement', 'MODULE_BOXES_BEST_SELLERS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:14:36', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('324', 'Sort Order', 'MODULE_BOXES_BEST_SELLERS_SORT_ORDER', '13', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:14:36', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('325', 'Enable Card Acceptance Module', 'MODULE_BOXES_CARD_ACCEPTANCE_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:15:19', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('326', 'Logos', 'MODULE_BOXES_CARD_ACCEPTANCE_LOGOS', 'paypal_horizontal_large.png;visa.png;mastercard_transparent.png;american_express.png;maestro_transparent.png', 'The card acceptance logos to show.', '6', '0', NULL, '2015-03-20 10:15:19', 'bm_card_acceptance_show_logos', 'bm_card_acceptance_edit_logos(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('327', 'Content Placement', 'MODULE_BOXES_CARD_ACCEPTANCE_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:15:19', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('328', 'Sort Order', 'MODULE_BOXES_CARD_ACCEPTANCE_SORT_ORDER', '4', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:15:19', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('329', 'Enable Languages Module', 'MODULE_BOXES_LANGUAGES_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:18:00', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('330', 'Content Placement', 'MODULE_BOXES_LANGUAGES_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:18:00', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('331', 'Sort Order', 'MODULE_BOXES_LANGUAGES_SORT_ORDER', '14', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:18:00', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('332', 'Enable Information Module', 'MODULE_BOXES_INFORMATION_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:18:29', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('333', 'Content Placement', 'MODULE_BOXES_INFORMATION_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:18:29', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('334', 'Sort Order', 'MODULE_BOXES_INFORMATION_SORT_ORDER', '5', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:18:29', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('335', 'Enable Manufacturer Info Module', 'MODULE_BOXES_MANUFACTURER_INFO_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:19:02', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('336', 'Content Placement', 'MODULE_BOXES_MANUFACTURER_INFO_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:19:02', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('337', 'Sort Order', 'MODULE_BOXES_MANUFACTURER_INFO_SORT_ORDER', '15', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:19:02', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('338', 'Enable Manufacturers Module', 'MODULE_BOXES_MANUFACTURERS_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:19:48', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('339', 'Content Placement', 'MODULE_BOXES_MANUFACTURERS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:19:48', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('340', 'Sort Order', 'MODULE_BOXES_MANUFACTURERS_SORT_ORDER', '16', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:19:48', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('341', 'Enable Order History Module', 'MODULE_BOXES_ORDER_HISTORY_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:20:34', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('342', 'Content Placement', 'MODULE_BOXES_ORDER_HISTORY_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:20:34', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('343', 'Sort Order', 'MODULE_BOXES_ORDER_HISTORY_SORT_ORDER', '17', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:20:34', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('344', 'Enable Product Notifications Module', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:21:16', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('345', 'Content Placement', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:21:16', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('346', 'Sort Order', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_SORT_ORDER', '18', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:21:16', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('347', 'Enable Reviews Module', 'MODULE_BOXES_REVIEWS_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:22:01', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('348', 'Content Placement', 'MODULE_BOXES_REVIEWS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:22:01', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('349', 'Sort Order', 'MODULE_BOXES_REVIEWS_SORT_ORDER', '19', 'Sort order of display. Lowest is displayed first.', '6', '1', NULL, '2015-03-20 10:22:01', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('350', 'Enable Specials Module', 'MODULE_BOXES_SPECIALS_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:22:30', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('351', 'Content Placement', 'MODULE_BOXES_SPECIALS_CONTENT_PLACEMENT', 'Right Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:22:30', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('352', 'Sort Order', 'MODULE_BOXES_SPECIALS_SORT_ORDER', '20', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:22:30', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('353', 'Enable What\'s New Module', 'MODULE_BOXES_WHATS_NEW_STATUS', 'True', 'Do you want to add the module to your shop?', '6', '1', NULL, '2015-03-20 10:22:50', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('354', 'Content Placement', 'MODULE_BOXES_WHATS_NEW_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', '6', '1', NULL, '2015-03-20 10:22:50', NULL, 'tep_cfg_select_option(array(\'Left Column\', \'Right Column\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('355', 'Sort Order', 'MODULE_BOXES_WHATS_NEW_SORT_ORDER', '6', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 10:22:50', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('356', 'Security Check Extended Last Run', 'MODULE_SECURITY_CHECK_EXTENDED_LAST_RUN_DATETIME', '1435314093', 'The date and time the last extended security check was performed.', '6', NULL, NULL, '2015-03-20 10:34:56', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('360', 'Enable Copyright Details Footer Module', 'MODULE_CONTENT_FOOTER_EXTRA_COPYRIGHT_STATUS', 'True', 'Do you want to enable the Copyright content module?', '6', '1', NULL, '2015-03-20 20:05:52', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('361', 'Content Width', 'MODULE_CONTENT_FOOTER_EXTRA_COPYRIGHT_CONTENT_WIDTH', '6', 'What width container should the content be shown in? (12 = full width, 6 = half width).', '6', '1', NULL, '2015-03-20 20:05:52', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('362', 'Sort Order', 'MODULE_CONTENT_FOOTER_EXTRA_COPYRIGHT_SORT_ORDER', '400', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:05:52', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('363', 'Enable Payment Icons Footer Module', 'MODULE_CONTENT_FOOTER_EXTRA_ICONS_STATUS', 'True', 'Do you want to enable the Payment Icons content module?', '6', '1', NULL, '2015-03-20 20:10:01', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('364', 'Content Width', 'MODULE_CONTENT_FOOTER_EXTRA_ICONS_CONTENT_WIDTH', '6', 'What width container should the content be shown in? (12 = full width, 6 = half width).', '6', '1', NULL, '2015-03-20 20:10:01', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('365', 'Sort Order', 'MODULE_CONTENT_FOOTER_EXTRA_ICONS_SORT_ORDER', '401', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:10:01', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('366', 'Enable Account Footer Module', 'MODULE_CONTENT_FOOTER_ACCOUNT_STATUS', 'True', 'Do you want to enable the Account content module?', '6', '1', NULL, '2015-03-20 20:11:03', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('367', 'Content Width', 'MODULE_CONTENT_FOOTER_ACCOUNT_CONTENT_WIDTH', '3', 'What width container should the content be shown in? (12 = full width, 6 = half width).', '6', '1', NULL, '2015-03-20 20:11:03', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('368', 'Sort Order', 'MODULE_CONTENT_FOOTER_ACCOUNT_SORT_ORDER', '402', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:11:03', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('369', 'Enable Information Links Footer Module', 'MODULE_CONTENT_FOOTER_INFORMATION_STATUS', 'True', 'Do you want to enable the Information Links content module?', '6', '1', NULL, '2015-03-20 20:11:54', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('370', 'Content Width', 'MODULE_CONTENT_FOOTER_INFORMATION_CONTENT_WIDTH', '3', 'What width container should the content be shown in? (12 = full width, 6 = half width).', '6', '1', NULL, '2015-03-20 20:11:54', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('371', 'Sort Order', 'MODULE_CONTENT_FOOTER_INFORMATION_SORT_ORDER', '403', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:11:54', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('372', 'Enable Contact Us Footer Module', 'MODULE_CONTENT_FOOTER_CONTACT_US_STATUS', 'True', 'Do you want to enable the Contact Us content module?', '6', '1', NULL, '2015-03-20 20:12:37', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('373', 'Content Width', 'MODULE_CONTENT_FOOTER_CONTACT_US_CONTENT_WIDTH', '3', 'What width container should the content be shown in? (12 = full width, 6 = half width).', '6', '1', NULL, '2015-03-20 20:12:37', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('374', 'Sort Order', 'MODULE_CONTENT_FOOTER_CONTACT_US_SORT_ORDER', '404', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:12:37', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('375', 'Enable Generic Text Footer Module', 'MODULE_CONTENT_FOOTER_TEXT_STATUS', 'True', 'Do you want to enable the Generic Text content module?', '6', '1', NULL, '2015-03-20 20:13:04', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('376', 'Content Width', 'MODULE_CONTENT_FOOTER_TEXT_CONTENT_WIDTH', '3', 'What width container should the content be shown in? (12 = full width, 6 = half width).', '6', '1', NULL, '2015-03-20 20:13:04', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('377', 'Sort Order', 'MODULE_CONTENT_FOOTER_TEXT_SORT_ORDER', '405', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:13:04', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('378', 'Enable Header Logo Module', 'MODULE_CONTENT_HEADER_LOGO_STATUS', 'True', 'Do you want to enable the Logo content module?', '6', '1', NULL, '2015-03-20 20:19:32', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('379', 'Content Width', 'MODULE_CONTENT_HEADER_LOGO_CONTENT_WIDTH', '2', 'What width container should the content be shown in?', '6', '1', NULL, '2015-03-20 20:19:32', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('380', 'Sort Order', 'MODULE_CONTENT_HEADER_LOGO_SORT_ORDER', '601', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:19:32', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('381', 'Enable Search Box Module', 'MODULE_CONTENT_HEADER_SEARCH_STATUS', 'True', 'Do you want to enable the Search Box content module?', '6', '1', NULL, '2015-03-20 20:23:08', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('382', 'Content Width', 'MODULE_CONTENT_HEADER_SEARCH_CONTENT_WIDTH', '8', 'What width container should the content be shown in?', '6', '1', NULL, '2015-03-20 20:23:08', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('383', 'Sort Order', 'MODULE_CONTENT_HEADER_SEARCH_SORT_ORDER', '602', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:23:08', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('387', 'Enable Header Breadcrumb Module', 'MODULE_CONTENT_HEADER_BREADCRUMB_STATUS', 'True', 'Do you want to enable the Breadcrumb content module?', '6', '1', NULL, '2015-03-20 20:28:39', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('388', 'Content Width', 'MODULE_CONTENT_HEADER_BREADCRUMB_CONTENT_WIDTH', '12', 'What width container should the content be shown in?', '6', '1', NULL, '2015-03-20 20:28:39', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('389', 'Sort Order', 'MODULE_CONTENT_HEADER_BREADCRUMB_SORT_ORDER', '600', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:28:39', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('390', 'Enable Message Stack Notifications Module', 'MODULE_CONTENT_HEADER_MESSAGESTACK_STATUS', 'True', 'Should the Message Stack Notifications be shown in the header when needed? ', '6', '1', NULL, '2015-03-20 20:29:20', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('391', 'Sort Order', 'MODULE_CONTENT_HEADER_MESSAGESTACK_SORT_ORDER', '605', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:29:20', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('392', 'Enable Reviews Module', 'MODULE_CONTENT_PRODUCT_INFO_REVIEWS_STATUS', 'True', 'Should the reviews block be shown on the product info page?', '6', '1', NULL, '2015-03-20 20:32:13', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('393', 'Content Width', 'MODULE_CONTENT_PRODUCT_INFO_REVIEWS_CONTENT_WIDTH', '6', 'What width container should the content be shown in?', '6', '1', NULL, '2015-03-20 20:32:13', NULL, 'tep_cfg_select_option(array(\'12\', \'11\', \'10\', \'9\', \'8\', \'7\', \'6\', \'5\', \'4\', \'3\', \'2\', \'1\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('394', 'Number of Reviews', 'MODULE_CONTENT_PRODUCT_INFO_REVIEWS_CONTENT_LIMIT', '4', 'How many reviews should be shown?', '6', '1', NULL, '2015-03-20 20:32:13', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('395', 'Sort Order', 'MODULE_CONTENT_PRODUCT_INFO_REVIEWS_SORT_ORDER', '705', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:32:13', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('396', 'Enable Navbar Module', 'MODULE_CONTENT_NAVBAR_STATUS', 'True', 'Should the Navbar be shown? ', '6', '1', NULL, '2015-03-20 20:34:05', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('397', 'Sort Order', 'MODULE_CONTENT_NAVBAR_SORT_ORDER', '407', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-03-20 20:34:05', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('398', 'Enable Grid List javascript', 'MODULE_HEADER_TAGS_GRID_LIST_VIEW_STATUS', 'True', 'Do you want to enable the Grid/List Javascript module?', '6', '1', NULL, '2015-08-08 15:47:56', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('399', 'Pages', 'MODULE_HEADER_TAGS_GRID_LIST_VIEW_PAGES', 'advanced_search_result.php;index.php;products_new.php;specials.php', 'The pages to add the Grid List JS Scripts to.', '6', '4', NULL, '2015-08-08 15:47:56', 'ht_grid_list_view_show_pages', 'ht_grid_list_view_edit_pages(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('400', 'Sort Order', 'MODULE_HEADER_TAGS_GRID_LIST_VIEW_SORT_ORDER', '21', 'Sort order of display. Lowest is displayed first.', '6', '5', NULL, '2015-08-08 15:47:56', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('401', 'Enable Colorbox Script', 'MODULE_HEADER_TAGS_PRODUCT_COLORBOX_STATUS', 'True', 'Do you want to enable the Colorbox Scripts?', '6', '1', NULL, '2015-08-08 15:48:42', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('402', 'Pages', 'MODULE_HEADER_TAGS_PRODUCT_COLORBOX_PAGES', 'product_info.php', 'The pages to add the Colorbox Scripts to.', '6', '0', NULL, '2015-08-08 15:48:42', 'ht_product_colorbox_show_pages', 'ht_product_colorbox_edit_pages(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('403', 'Sort Order', 'MODULE_HEADER_TAGS_PRODUCT_COLORBOX_SORT_ORDER', '20', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-08-08 15:48:42', NULL, NULL);
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('404', 'Enable Equal Heights Module', 'MODULE_HEADER_TAGS_DIV_EQUAL_HEIGHTS_STATUS', 'True', 'Do you want to enable the Equal Heights module?', '6', '1', NULL, '2015-08-08 15:52:33', NULL, 'tep_cfg_select_option(array(\'True\', \'False\'), ');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('405', 'Pages', 'MODULE_HEADER_TAGS_DIV_EQUAL_HEIGHTS_PAGES', 'index.php', 'The pages to add the script to.', '6', '0', NULL, '2015-08-08 15:52:33', 'ht_div_equal_heights_show_pages', 'ht_div_equal_heights_edit_pages(');
insert into configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) values ('406', 'Sort Order', 'MODULE_HEADER_TAGS_DIV_EQUAL_HEIGHTS_SORT_ORDER', '22', 'Sort order of display. Lowest is displayed first.', '6', '0', NULL, '2015-08-08 15:52:33', NULL, NULL);
drop table if exists configuration_group;
create table configuration_group (
  configuration_group_id int(11) not null auto_increment,
  configuration_group_title varchar(64) not null ,
  configuration_group_description varchar(255) not null ,
  sort_order int(5) ,
  visible int(1) default '1' ,
  PRIMARY KEY (configuration_group_id)
);

insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('1', 'Магазин', 'Основные настройки магазина', '1', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('2', 'Минимальные значения', 'Минимальные значения функций и данных', '2', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('3', 'Максимальные значения', 'Максимальные значения функций и данных', '3', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('4', 'Картинки', 'Настройки картинок', '4', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('5', 'Данные покупателя', 'Настройка формы регистрации', '5', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('6', 'Установленные модули', 'Скрытые опции', '6', '0');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('7', 'Доставка/Упаковка', 'Настройка опци доставки и упаковки', '7', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('8', 'Вывод товара', 'Настройка вывода товара', '8', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('9', 'Склад', 'Настройка склада', '9', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('10', 'Логи', 'Настройка логов', '10', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('11', 'Кэш', 'Настройка кэша', '11', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('12', 'Настройка E-Mail', 'Настройка E-Mail', '12', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('13', 'Скачивание', 'Настройка скачиваемых товаров', '13', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('14', 'GZip Компрессия', 'Настройка GZip компрессии', '14', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('15', 'Сессии', 'Session options', '15', '1');
insert into configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) values ('16', 'Bootstrap Setup', 'Basic Bootstrap Options', '16', '1');
drop table if exists counter;
create table counter (
  startdate char(8) ,
  counter int(12) 
);

insert into counter (startdate, counter) values ('20150318', '288');
drop table if exists counter_history;
create table counter_history (
  month char(8) ,
  counter int(12) 
);

drop table if exists countries;
create table countries (
  countries_id int(11) not null auto_increment,
  countries_name varchar(255) not null ,
  countries_iso_code_2 char(2) not null ,
  countries_iso_code_3 char(3) not null ,
  address_format_id int(11) not null ,
  PRIMARY KEY (countries_id),
  KEY IDX_COUNTRIES_NAME (countries_name)
);

insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('1', 'Афганистан', 'AF', 'AFG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('2', 'Албания', 'AL', 'ALB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('3', 'Алжир', 'DZ', 'DZA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('4', 'Американский Самоа', 'AS', 'ASM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('5', 'Андорра', 'AD', 'AND', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('6', 'Ангола', 'AO', 'AGO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('7', 'Ангилья', 'AI', 'AIA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('8', 'Антарктика', 'AQ', 'ATA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('9', 'Антигуа и Барбуда', 'AG', 'ATG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('10', 'Аргентина', 'AR', 'ARG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('11', 'Армения', 'AM', 'ARM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('12', 'Аруба', 'AW', 'ABW', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('13', 'Австралия', 'AU', 'AUS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('14', 'Австрия', 'AT', 'AUT', '5');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('15', 'Азербайджан', 'AZ', 'AZE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('16', 'Багамские острова', 'BS', 'BHS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('17', 'Бахрейн', 'BH', 'BHR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('18', 'Бангладеш', 'BD', 'BGD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('19', 'Барбадос', 'BB', 'BRB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('20', 'Беларусь', 'BY', 'BLR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('21', 'Бельгия', 'BE', 'BEL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('22', 'Белиз', 'BZ', 'BLZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('23', 'Бенин', 'BJ', 'BEN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('24', 'Бермуды', 'BM', 'BMU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('25', 'Бутан', 'BT', 'BTN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('26', 'Боливия', 'BO', 'BOL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('27', 'Босния и Герцеговина', 'BA', 'BIH', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('28', 'Ботсвана', 'BW', 'BWA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('29', 'остров Буве', 'BV', 'BVT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('30', 'Бразилия', 'BR', 'BRA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('31', 'Британские территории Индийского океана', 'IO', 'IOT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('32', 'Бруней', 'BN', 'BRN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('33', 'Болгария', 'BG', 'BGR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('34', 'Буркина Фасо', 'BF', 'BFA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('35', 'Бурунди', 'BI', 'BDI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('36', 'Камбоджа', 'KH', 'KHM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('37', 'Камерун', 'CM', 'CMR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('38', 'Канада', 'CA', 'CAN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('39', 'острова Зеленого Мыса', 'CV', 'CPV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('40', 'Каймановы острова', 'KY', 'CYM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('41', 'Центральная Африканская Республика', 'CF', 'CAF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('42', 'Чад', 'TD', 'TCD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('43', 'Чили', 'CL', 'CHL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('44', 'Китайская Народная Республика', 'CN', 'CHN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('45', 'остров Рождества', 'CX', 'CXR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('46', 'Кокосовые острова', 'CC', 'CCK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('47', 'Колумбия', 'CO', 'COL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('48', 'Коморские острова', 'KM', 'COM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('49', 'Конго', 'CG', 'COG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('50', 'острова Кука', 'CK', 'COK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('51', 'Коста Рика', 'CR', 'CRI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('52', 'Кот-д\'Ивуар', 'CI', 'CIV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('53', 'Хорватия', 'HR', 'HRV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('54', 'Куба', 'CU', 'CUB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('55', 'Кипр', 'CY', 'CYP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('56', 'Чехия', 'CZ', 'CZE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('57', 'Дания', 'DK', 'DNK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('58', 'Джибути', 'DJ', 'DJI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('59', 'Доминика', 'DM', 'DMA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('60', 'Доминиканская республика', 'DO', 'DOM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('61', 'Восточный Тимур', 'TP', 'TMP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('62', 'Эквадор', 'EC', 'ECU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('63', 'Египет', 'EG', 'EGY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('64', 'Сальвадор', 'SV', 'SLV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('65', 'Экваториальная Гвинея', 'GQ', 'GNQ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('66', 'Эритрея', 'ER', 'ERI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('67', 'Эстония', 'EE', 'EST', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('68', 'Эфиопия', 'ET', 'ETH', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('69', 'Фолклендские', 'FK', 'FLK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('70', 'Фарерские острова', 'FO', 'FRO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('71', 'Фиджи', 'FJ', 'FJI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('72', 'Финляндия', 'FI', 'FIN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('73', 'Франция', 'FR', 'FRA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('74', 'Франция, Метрополия', 'FX', 'FXX', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('75', 'Французская Гвиана', 'GF', 'GUF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('76', 'Французская Полинезия', 'PF', 'PYF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('77', 'Французские Южные Территории', 'TF', 'ATF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('78', 'Габон', 'GA', 'GAB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('79', 'Гамбия', 'GM', 'GMB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('80', 'Грузия', 'GE', 'GEO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('81', 'Германия', 'DE', 'DEU', '5');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('82', 'Гана', 'GH', 'GHA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('83', 'Гибралтар', 'GI', 'GIB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('84', 'Греция', 'GR', 'GRC', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('85', 'Гренландия', 'GL', 'GRL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('86', 'Гренада', 'GD', 'GRD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('87', 'Гваделупа', 'GP', 'GLP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('88', 'Гуам', 'GU', 'GUM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('89', 'Гватемала', 'GT', 'GTM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('90', 'Гвинея', 'GN', 'GIN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('91', 'Гвинея-Бисау', 'GW', 'GNB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('92', 'Гайана', 'GY', 'GUY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('93', 'Гаити', 'HT', 'HTI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('94', 'острова Герда и МакДональда', 'HM', 'HMD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('95', 'Гондурас', 'HN', 'HND', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('96', 'Гонконг', 'HK', 'HKG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('97', 'Венгрия', 'HU', 'HUN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('98', 'Исландия', 'IS', 'ISL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('99', 'Индия', 'IN', 'IND', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('100', 'Индонезия', 'ID', 'IDN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('101', 'Иран', 'IR', 'IRN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('102', 'Ирак', 'IQ', 'IRQ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('103', 'Ирландия', 'IE', 'IRL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('104', 'Израиль', 'IL', 'ISR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('105', 'Италия', 'IT', 'ITA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('106', 'Ямайка', 'JM', 'JAM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('107', 'Япония', 'JP', 'JPN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('108', 'Иордания', 'JO', 'JOR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('109', 'Казахстан', 'KZ', 'KAZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('110', 'Кения', 'KE', 'KEN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('111', 'Кирибати', 'KI', 'KIR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('112', 'Корейская Народная Демократическая республика', 'KP', 'PRK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('113', 'Корея', 'KR', 'KOR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('114', 'Кувейт', 'KW', 'KWT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('115', 'Кыргызстан', 'KG', 'KGZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('116', 'Лаос', 'LA', 'LAO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('117', 'Латвия', 'LV', 'LVA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('118', 'Ливан', 'LB', 'LBN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('119', 'Лесото', 'LS', 'LSO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('120', 'Либерия', 'LR', 'LBR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('121', 'Ливия', 'LY', 'LBY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('122', 'Лихтенштейн', 'LI', 'LIE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('123', 'Литва', 'LT', 'LTU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('124', 'Люксембург', 'LU', 'LUX', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('125', 'Макао', 'MO', 'MAC', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('126', 'Македония', 'MK', 'MKD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('127', 'Мадагаскар', 'MG', 'MDG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('128', 'Малави', 'MW', 'MWI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('129', 'Малайзия', 'MY', 'MYS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('130', 'Мальдивские острова', 'MV', 'MDV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('131', 'Мали', 'ML', 'MLI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('132', 'Мальта', 'MT', 'MLT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('133', 'Маршалловы острова', 'MH', 'MHL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('134', 'Мартиника', 'MQ', 'MTQ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('135', 'Мавритания', 'MR', 'MRT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('136', 'Маврикий', 'MU', 'MUS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('137', 'Майотта', 'YT', 'MYT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('138', 'Мексика', 'MX', 'MEX', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('139', 'Микронезия', 'FM', 'FSM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('140', 'Молдова', 'MD', 'MDA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('141', 'Монако', 'MC', 'MCO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('142', 'Монголия', 'MN', 'MNG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('143', 'Монтсеррат', 'MS', 'MSR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('144', 'Марокко', 'MA', 'MAR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('145', 'Мозамбик', 'MZ', 'MOZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('146', 'Мьянма', 'MM', 'MMR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('147', 'Намибия', 'NA', 'NAM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('148', 'Науру', 'NR', 'NRU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('149', 'Непал', 'NP', 'NPL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('150', 'Нидерланды', 'NL', 'NLD', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('151', 'Антильские острова', 'AN', 'ANT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('152', 'Новая Каледония', 'NC', 'NCL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('153', 'Новая Зеландия', 'NZ', 'NZL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('154', 'Никарагуа', 'NI', 'NIC', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('155', 'Нигер', 'NE', 'NER', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('156', 'Нигерия', 'NG', 'NGA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('157', 'Ниуэ', 'NU', 'NIU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('158', 'остров Норфолк', 'NF', 'NFK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('159', 'Марианские острова', 'MP', 'MNP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('160', 'Норвегия', 'NO', 'NOR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('161', 'Оман', 'OM', 'OMN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('162', 'Пакистан', 'PK', 'PAK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('163', 'Палау', 'PW', 'PLW', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('164', 'Панама', 'PA', 'PAN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('165', 'Папуа - Новая Гвинея', 'PG', 'PNG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('166', 'Парагвай', 'PY', 'PRY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('167', 'Перу', 'PE', 'PER', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('168', 'Филиппины', 'PH', 'PHL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('169', 'остров Питкэрн', 'PN', 'PCN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('170', 'Польша', 'PL', 'POL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('171', 'Португалия', 'PT', 'PRT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('172', 'Пуэрто-Рико', 'PR', 'PRI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('173', 'Катар', 'QA', 'QAT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('174', 'Реюньон', 'RE', 'REU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('175', 'Румыния', 'RO', 'ROM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('176', 'Россия', 'RU', 'RUS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('177', 'Руанда', 'RW', 'RWA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('178', 'Сент-Китс и Невис', 'KN', 'KNA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('179', 'Сент-Люсия', 'LC', 'LCA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('180', 'Сент-Винсент и Гренадины', 'VC', 'VCT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('181', 'острова Самоа', 'WS', 'WSM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('182', 'Сан-Марино', 'SM', 'SMR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('183', 'Сан-Томе и Принсипи', 'ST', 'STP', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('184', 'Саудовская Аравия', 'SA', 'SAU', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('185', 'Сенегал', 'SN', 'SEN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('186', 'Сейшельские острова', 'SC', 'SYC', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('187', 'Сьерра-Леоне', 'SL', 'SLE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('188', 'Сингапур', 'SG', 'SGP', '4');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('189', 'Словакия', 'SK', 'SVK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('190', 'Словения', 'SI', 'SVN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('191', 'Соломоновы острова', 'SB', 'SLB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('192', 'Сомали', 'SO', 'SOM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('193', 'ЮАР', 'ZA', 'ZAF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('194', 'Южная Георгия и Южные Сандвичевы острова', 'GS', 'SGS', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('195', 'Испания', 'ES', 'ESP', '3');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('196', 'Шри Ланка', 'LK', 'LKA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('197', 'остров Святой Елены', 'SH', 'SHN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('198', 'Сен-Пьер и Микелон', 'PM', 'SPM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('199', 'Судан', 'SD', 'SDN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('200', 'Суринам', 'SR', 'SUR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('201', 'острова Свалбард и Ян Майен', 'SJ', 'SJM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('202', 'Свазиленд', 'SZ', 'SWZ', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('203', 'Швеция', 'SE', 'SWE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('204', 'Швейцария', 'CH', 'CHE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('205', 'Сирия', 'SY', 'SYR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('206', 'Тайвань', 'TW', 'TWN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('207', 'Таджикистан', 'TJ', 'TJK', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('208', 'Танзания', 'TZ', 'TZA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('209', 'Тайланд', 'TH', 'THA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('210', 'Того', 'TG', 'TGO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('211', 'Токелау', 'TK', 'TKL', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('212', 'Тонга', 'TO', 'TON', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('213', 'Тринидад и Тобаго', 'TT', 'TTO', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('214', 'Тунис', 'TN', 'TUN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('215', 'Турция', 'TR', 'TUR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('216', 'Туркменистан', 'TM', 'TKM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('217', 'острова Туркс и Кайкос', 'TC', 'TCA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('218', 'Тувалу', 'TV', 'TUV', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('219', 'Уганда', 'UG', 'UGA', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('220', 'Украина', 'UA', 'UKR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('221', 'Арабские Эмираты', 'AE', 'ARE', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('222', 'Великобритания', 'GB', 'GBR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('223', 'Соединенные Штаты Америки', 'US', 'USA', '2');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('224', 'Отдаленные Острова США', 'UM', 'UMI', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('225', 'Уругвай', 'UY', 'URY', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('226', 'Узбекистан', 'UZ', 'UZB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('227', 'Вануату', 'VU', 'VUT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('228', 'Ватикан', 'VA', 'VAT', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('229', 'Венесуэла', 'VE', 'VEN', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('230', 'Вьетнам', 'VN', 'VNM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('231', 'Британские Виргинские острова', 'VG', 'VGB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('232', 'Американские Виргинские острова', 'VI', 'VIR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('233', 'острова Валлис и Футуна', 'WF', 'WLF', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('234', 'Западная Сахара', 'EH', 'ESH', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('235', 'Йемен', 'YE', 'YEM', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('236', 'Югославия', 'YU', 'YUG', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('237', 'Заир', 'ZR', 'ZAR', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('238', 'Замбия', 'ZM', 'ZMB', '1');
insert into countries (countries_id, countries_name, countries_iso_code_2, countries_iso_code_3, address_format_id) values ('239', 'Зимбабве', 'ZW', 'ZWE', '1');
drop table if exists currencies;
create table currencies (
  currencies_id int(11) not null auto_increment,
  title varchar(32) not null ,
  code char(3) not null ,
  symbol_left varchar(12) ,
  symbol_right varchar(12) ,
  decimal_point char(1) ,
  thousands_point char(1) ,
  decimal_places char(1) ,
  value float(13,8) ,
  last_updated datetime ,
  PRIMARY KEY (currencies_id),
  KEY idx_currencies_code (code)
);

insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('1', 'U.S. Dollar', 'USD', '$', '', '.', ',', '2', '0.01612000', '2015-03-18 19:09:50');
insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('2', 'Euro', 'EUR', '', '€', '.', ',', '2', '0.01433000', '2015-03-18 19:09:50');
insert into currencies (currencies_id, title, code, symbol_left, symbol_right, decimal_point, thousands_point, decimal_places, value, last_updated) values ('3', 'Рубль', 'RUR', '', 'руб.', '.', ',', '2', '1.00000000', '2015-03-18 19:09:50');
drop table if exists customers;
create table customers (
  customers_id int(11) not null auto_increment,
  customers_gender char(1) ,
  customers_firstname varchar(255) not null ,
  customers_lastname varchar(255) not null ,
  customers_dob datetime default '0000-00-00 00:00:00' not null ,
  customers_email_address varchar(255) not null ,
  customers_default_address_id int(11) ,
  customers_telephone varchar(255) not null ,
  customers_fax varchar(255) ,
  customers_password varchar(60) not null ,
  customers_newsletter char(1) ,
  PRIMARY KEY (customers_id),
  KEY idx_customers_email_address (customers_email_address)
);

drop table if exists customers_basket;
create table customers_basket (
  customers_basket_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  products_id tinytext not null ,
  customers_basket_quantity int(2) not null ,
  final_price decimal(15,4) ,
  customers_basket_date_added char(8) ,
  PRIMARY KEY (customers_basket_id),
  KEY idx_customers_basket_customers_id (customers_id)
);

drop table if exists customers_basket_attributes;
create table customers_basket_attributes (
  customers_basket_attributes_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  products_id tinytext not null ,
  products_options_id int(11) not null ,
  products_options_value_id int(11) not null ,
  PRIMARY KEY (customers_basket_attributes_id),
  KEY idx_customers_basket_att_customers_id (customers_id)
);

drop table if exists customers_info;
create table customers_info (
  customers_info_id int(11) not null ,
  customers_info_date_of_last_logon datetime ,
  customers_info_number_of_logons int(5) ,
  customers_info_date_account_created datetime ,
  customers_info_date_account_last_modified datetime ,
  global_product_notifications int(1) default '0' ,
  password_reset_key char(40) ,
  password_reset_date datetime ,
  PRIMARY KEY (customers_info_id)
);

drop table if exists geo_zones;
create table geo_zones (
  geo_zone_id int(11) not null auto_increment,
  geo_zone_name varchar(32) not null ,
  geo_zone_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime not null ,
  PRIMARY KEY (geo_zone_id)
);

insert into geo_zones (geo_zone_id, geo_zone_name, geo_zone_description, last_modified, date_added) values ('1', 'Florida', 'Florida local sales tax zone', NULL, '2015-03-18 19:09:50');
drop table if exists languages;
create table languages (
  languages_id int(11) not null auto_increment,
  name varchar(32) not null ,
  code char(2) not null ,
  image varchar(64) ,
  directory varchar(32) ,
  sort_order int(3) ,
  PRIMARY KEY (languages_id),
  KEY IDX_LANGUAGES_NAME (name)
);

insert into languages (languages_id, name, code, image, directory, sort_order) values ('1', 'English', 'en', 'icon.gif', 'english', '1');
insert into languages (languages_id, name, code, image, directory, sort_order) values ('2', 'Russian', 'ru', 'icon.gif', 'russian', '1');
drop table if exists manufacturers;
create table manufacturers (
  manufacturers_id int(11) not null auto_increment,
  manufacturers_name varchar(32) not null ,
  manufacturers_image varchar(64) ,
  date_added datetime ,
  last_modified datetime ,
  PRIMARY KEY (manufacturers_id),
  KEY IDX_MANUFACTURERS_NAME (manufacturers_name)
);

insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('1', 'Matrox', 'manufacturer_matrox.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('2', 'Microsoft', 'manufacturer_microsoft.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('3', 'Warner', 'manufacturer_warner.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('4', 'Fox', 'manufacturer_fox.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('5', 'Logitech', 'manufacturer_logitech.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('6', 'Canon', 'manufacturer_canon.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('7', 'Sierra', 'manufacturer_sierra.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('8', 'GT Interactive', 'manufacturer_gt_interactive.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('9', 'Hewlett Packard', 'manufacturer_hewlett_packard.gif', '2015-03-18 19:09:50', NULL);
insert into manufacturers (manufacturers_id, manufacturers_name, manufacturers_image, date_added, last_modified) values ('10', 'Samsung', 'manufacturer_samsung.png', '2015-03-18 19:09:50', NULL);
drop table if exists manufacturers_info;
create table manufacturers_info (
  manufacturers_id int(11) not null ,
  languages_id int(11) not null ,
  manufacturers_url varchar(255) not null ,
  url_clicked int(5) default '0' not null ,
  date_last_click datetime ,
  PRIMARY KEY (manufacturers_id, languages_id)
);

insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('1', '1', 'http://www.matrox.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('1', '2', 'http://www.matrox.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('2', '1', 'http://www.microsoft.com', '1', '2015-06-25 21:30:00');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('2', '2', 'http://www.microsoft.com', '1', '2015-03-20 22:17:20');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('3', '1', 'http://www.warner.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('3', '2', 'http://www.warner.com', '5', '2015-08-11 17:00:50');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('4', '1', 'http://www.fox.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('4', '2', 'http://www.fox.com', '1', '2015-03-20 22:32:28');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('5', '1', 'http://www.logitech.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('5', '2', 'http://www.logitech.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('6', '1', 'http://www.canon.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('6', '2', 'http://www.canon.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('7', '1', 'http://www.sierra.com', '1', '2015-08-11 18:07:13');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('7', '2', 'http://www.sierra.com', '3', '2015-06-25 15:42:20');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('8', '1', 'http://www.infogrames.com', '1', '2015-06-25 12:05:36');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('8', '2', 'http://www.infogrames.com', '4', '2015-08-11 19:19:06');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('9', '1', 'http://www.hewlettpackard.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('9', '2', 'http://www.hewlettpackard.com', '1', '2015-03-20 22:16:47');
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('10', '1', 'http://www.samsung.com', '0', NULL);
insert into manufacturers_info (manufacturers_id, languages_id, manufacturers_url, url_clicked, date_last_click) values ('10', '2', 'http://www.samsung.com', '3', '2015-08-06 01:47:20');
drop table if exists newsletters;
create table newsletters (
  newsletters_id int(11) not null auto_increment,
  title varchar(255) not null ,
  content text not null ,
  module varchar(255) not null ,
  date_added datetime not null ,
  date_sent datetime ,
  status int(1) ,
  locked int(1) default '0' ,
  PRIMARY KEY (newsletters_id)
);

drop table if exists orders;
create table orders (
  orders_id int(11) not null auto_increment,
  customers_id int(11) not null ,
  customers_name varchar(255) not null ,
  customers_company varchar(255) ,
  customers_street_address varchar(255) not null ,
  customers_suburb varchar(255) ,
  customers_city varchar(255) not null ,
  customers_postcode varchar(255) not null ,
  customers_state varchar(255) ,
  customers_country varchar(255) not null ,
  customers_telephone varchar(255) not null ,
  customers_email_address varchar(255) not null ,
  customers_address_format_id int(5) not null ,
  delivery_name varchar(255) not null ,
  delivery_company varchar(255) ,
  delivery_street_address varchar(255) not null ,
  delivery_suburb varchar(255) ,
  delivery_city varchar(255) not null ,
  delivery_postcode varchar(255) not null ,
  delivery_state varchar(255) ,
  delivery_country varchar(255) not null ,
  delivery_address_format_id int(5) not null ,
  billing_name varchar(255) not null ,
  billing_company varchar(255) ,
  billing_street_address varchar(255) not null ,
  billing_suburb varchar(255) ,
  billing_city varchar(255) not null ,
  billing_postcode varchar(255) not null ,
  billing_state varchar(255) ,
  billing_country varchar(255) not null ,
  billing_address_format_id int(5) not null ,
  payment_method varchar(255) not null ,
  cc_type varchar(20) ,
  cc_owner varchar(255) ,
  cc_number varchar(32) ,
  cc_expires varchar(4) ,
  last_modified datetime ,
  date_purchased datetime ,
  orders_status int(5) not null ,
  orders_date_finished datetime ,
  currency char(3) ,
  currency_value decimal(14,6) ,
  PRIMARY KEY (orders_id),
  KEY idx_orders_customers_id (customers_id)
);

drop table if exists orders_products;
create table orders_products (
  orders_products_id int(11) not null auto_increment,
  orders_id int(11) not null ,
  products_id int(11) not null ,
  products_model varchar(12) ,
  products_name varchar(64) not null ,
  products_price decimal(15,4) not null ,
  final_price decimal(15,4) not null ,
  products_tax decimal(7,4) not null ,
  products_quantity int(2) not null ,
  PRIMARY KEY (orders_products_id),
  KEY idx_orders_products_orders_id (orders_id),
  KEY idx_orders_products_products_id (products_id)
);

drop table if exists orders_products_attributes;
create table orders_products_attributes (
  orders_products_attributes_id int(11) not null auto_increment,
  orders_id int(11) not null ,
  orders_products_id int(11) not null ,
  products_options varchar(32) not null ,
  products_options_values varchar(32) not null ,
  options_values_price decimal(15,4) not null ,
  price_prefix char(1) not null ,
  PRIMARY KEY (orders_products_attributes_id),
  KEY idx_orders_products_att_orders_id (orders_id)
);

drop table if exists orders_products_download;
create table orders_products_download (
  orders_products_download_id int(11) not null auto_increment,
  orders_id int(11) default '0' not null ,
  orders_products_id int(11) default '0' not null ,
  orders_products_filename varchar(255) not null ,
  download_maxdays int(2) default '0' not null ,
  download_count int(2) default '0' not null ,
  PRIMARY KEY (orders_products_download_id),
  KEY idx_orders_products_download_orders_id (orders_id)
);

drop table if exists orders_status;
create table orders_status (
  orders_status_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  orders_status_name varchar(32) not null ,
  public_flag int(11) default '1' ,
  downloads_flag int(11) default '0' ,
  PRIMARY KEY (orders_status_id, language_id),
  KEY idx_orders_status_name (orders_status_name)
);

insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('1', '1', 'Pending', '1', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('1', '2', 'Ожидает', '1', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('2', '1', 'Processing', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('2', '2', 'Обрабатывается', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('3', '1', 'Delivered', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('3', '2', 'Доставляется', '1', '1');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('4', '1', 'PayPal [Transactions]', '0', '0');
insert into orders_status (orders_status_id, language_id, orders_status_name, public_flag, downloads_flag) values ('4', '2', 'PayPal [Транзакция]', '0', '0');
drop table if exists orders_status_history;
create table orders_status_history (
  orders_status_history_id int(11) not null auto_increment,
  orders_id int(11) not null ,
  orders_status_id int(5) not null ,
  date_added datetime not null ,
  customer_notified int(1) default '0' ,
  comments text ,
  PRIMARY KEY (orders_status_history_id),
  KEY idx_orders_status_history_orders_id (orders_id)
);

drop table if exists orders_total;
create table orders_total (
  orders_total_id int(10) unsigned not null auto_increment,
  orders_id int(11) not null ,
  title varchar(255) not null ,
  text varchar(255) not null ,
  value decimal(15,4) not null ,
  class varchar(32) not null ,
  sort_order int(11) not null ,
  PRIMARY KEY (orders_total_id),
  KEY idx_orders_total_orders_id (orders_id)
);

drop table if exists products;
create table products (
  products_id int(11) not null auto_increment,
  products_quantity int(4) not null ,
  products_model varchar(64) ,
  products_image varchar(64) ,
  products_price decimal(15,4) not null ,
  products_date_added datetime not null ,
  products_last_modified datetime ,
  products_date_available datetime ,
  products_weight decimal(5,2) not null ,
  products_status tinyint(1) not null ,
  products_tax_class_id int(11) not null ,
  manufacturers_id int(11) ,
  products_ordered int(11) default '0' not null ,
  PRIMARY KEY (products_id),
  KEY idx_products_model (products_model),
  KEY idx_products_date_added (products_date_added)
);

insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('1', '32', 'MG200MMS', 'matrox/mg200mms.gif', '299.9900', '2015-03-18 19:09:50', NULL, NULL, '23.00', '1', '1', '1', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('2', '32', 'MG400-32MB', 'matrox/mg400-32mb.gif', '499.9900', '2015-03-18 19:09:50', NULL, NULL, '23.00', '1', '1', '1', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('3', '2', 'MSIMPRO', 'microsoft/msimpro.gif', '49.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('4', '13', 'DVD-RPMK', 'dvd/replacement_killers.gif', '42.0000', '2015-03-18 19:09:50', NULL, NULL, '23.00', '1', '1', '2', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('5', '17', 'DVD-BLDRNDC', 'dvd/blade_runner.gif', '35.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('6', '10', 'DVD-MATR', 'dvd/the_matrix.gif', '39.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('7', '10', 'DVD-YGEM', 'dvd/youve_got_mail.gif', '34.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('8', '10', 'DVD-ABUG', 'dvd/a_bugs_life.gif', '35.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('9', '10', 'DVD-UNSG', 'dvd/under_siege.gif', '29.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('10', '10', 'DVD-UNSG2', 'dvd/under_siege2.gif', '29.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('11', '10', 'DVD-FDBL', 'dvd/fire_down_below.gif', '29.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('12', '10', 'DVD-DHWV', 'dvd/die_hard_3.gif', '39.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '4', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('13', '10', 'DVD-LTWP', 'dvd/lethal_weapon.gif', '34.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('14', '10', 'DVD-REDC', 'dvd/red_corner.gif', '32.0000', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('15', '10', 'DVD-FRAN', 'dvd/frantic.gif', '35.0000', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('16', '10', 'DVD-CUFI', 'dvd/courage_under_fire.gif', '38.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '4', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('17', '10', 'DVD-SPEED', 'dvd/speed.gif', '39.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '4', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('18', '10', 'DVD-SPEED2', 'dvd/speed_2.gif', '42.0000', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '4', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('19', '10', 'DVD-TSAB', 'dvd/theres_something_about_mary.gif', '49.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '4', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('20', '10', 'DVD-BELOVED', 'dvd/beloved.gif', '54.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '3', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('21', '16', 'PC-SWAT3', 'sierra/swat_3.gif', '79.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '7', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('22', '13', 'PC-UNTM', 'gt_interactive/unreal_tournament.gif', '89.9900', '2015-03-18 19:09:50', NULL, NULL, '7.00', '1', '1', '8', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('23', '16', 'PC-TWOF', 'gt_interactive/wheel_of_time.gif', '99.9900', '2015-03-18 19:09:50', NULL, NULL, '10.00', '1', '1', '8', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('24', '17', 'PC-DISC', 'gt_interactive/disciples.gif', '90.0000', '2015-03-18 19:09:50', NULL, NULL, '8.00', '1', '1', '8', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('25', '16', 'MSINTKB', 'microsoft/intkeyboardps2.gif', '69.9900', '2015-03-18 19:09:50', NULL, NULL, '8.00', '1', '1', '2', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('26', '10', 'MSIMEXP', 'microsoft/imexplorer.gif', '64.9500', '2015-03-18 19:09:50', NULL, NULL, '8.00', '1', '1', '2', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('27', '8', 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', '499.9900', '2015-03-18 19:09:50', NULL, NULL, '45.00', '1', '1', '9', '0');
insert into products (products_id, products_quantity, products_model, products_image, products_price, products_date_added, products_last_modified, products_date_available, products_weight, products_status, products_tax_class_id, manufacturers_id, products_ordered) values ('28', '100', 'GT-P1000', 'samsung/galaxy_tab.gif', '749.9900', '2015-03-18 19:09:50', NULL, NULL, '1.00', '1', '1', '10', '0');
drop table if exists products_attributes;
create table products_attributes (
  products_attributes_id int(11) not null auto_increment,
  products_id int(11) not null ,
  options_id int(11) not null ,
  options_values_id int(11) not null ,
  options_values_price decimal(15,4) not null ,
  price_prefix char(1) not null ,
  PRIMARY KEY (products_attributes_id),
  KEY idx_products_attributes_products_id (products_id)
);

insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('1', '1', '4', '1', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('2', '1', '4', '2', '50.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('3', '1', '4', '3', '70.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('4', '1', '3', '5', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('5', '1', '3', '6', '100.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('6', '2', '4', '3', '10.0000', '-');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('7', '2', '4', '4', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('8', '2', '3', '6', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('9', '2', '3', '7', '120.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('10', '26', '3', '8', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('11', '26', '3', '9', '6.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('26', '22', '5', '10', '0.0000', '+');
insert into products_attributes (products_attributes_id, products_id, options_id, options_values_id, options_values_price, price_prefix) values ('27', '22', '5', '13', '0.0000', '+');
drop table if exists products_attributes_download;
create table products_attributes_download (
  products_attributes_id int(11) not null ,
  products_attributes_filename varchar(255) not null ,
  products_attributes_maxdays int(2) default '0' ,
  products_attributes_maxcount int(2) default '0' ,
  PRIMARY KEY (products_attributes_id)
);

insert into products_attributes_download (products_attributes_id, products_attributes_filename, products_attributes_maxdays, products_attributes_maxcount) values ('26', 'unreal.zip', '7', '3');
drop table if exists products_description;
create table products_description (
  products_id int(11) not null auto_increment,
  language_id int(11) default '1' not null ,
  products_name varchar(64) not null ,
  products_description text ,
  products_url varchar(255) ,
  products_viewed int(5) default '0' ,
  PRIMARY KEY (products_id, language_id),
  KEY products_name (products_name)
);

insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('1', '1', 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters &amp; Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', '34');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('1', '2', 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br /><br />With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br /><br />Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters &amp; Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', '176');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('2', '1', 'Matrox G400 32MB', '<strong>Dramatically Different High Performance Graphics</strong><br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br /><strong>Key features:</strong><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', '52');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('2', '2', 'Matrox G400 32MB', '<strong>Dramatically Different High Performance Graphics</strong><br /><br />Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry\'s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC\'s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br /><br /><strong>Key features:</strong><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', '179');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('3', '1', 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', '63');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('3', '2', 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft\'s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', '250');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('4', '1', 'The Replacement Killers', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.replacement-killers.com', '50');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('4', '2', 'The Replacement Killers', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 80 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.replacement-killers.com', '186');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('5', '1', 'Blade Runner - Director\'s Cut', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.bladerunner.com', '73');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('5', '2', 'Blade Runner - Director\'s Cut', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />Languages: English, Deutsch.<br />Subtitles: English, Deutsch, Spanish.<br />Audio: Dolby Surround 5.1.<br />Picture Format: 16:9 Wide-Screen.<br />Length: (approx) 112 minutes.<br />Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.bladerunner.com', '352');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('6', '1', 'The Matrix', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch.<br />
Audio: Dolby Surround.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 131 minutes.<br />
Other: Interactive Menus, Chapter Selection, Making Of.', 'www.thematrix.com', '84');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('6', '2', 'The Matrix', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch.<br />
Audio: Dolby Surround.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 131 minutes.<br />
Other: Interactive Menus, Chapter Selection, Making Of.', 'www.thematrix.com', '245');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('7', '1', 'You\'ve Got Mail', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch, Spanish.<br />
Subtitles: English, Deutsch, Spanish, French, Nordic, Polish.<br />
Audio: Dolby Digital 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 115 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.youvegotmail.com', '68');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('7', '2', 'You\'ve Got Mail', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch, Spanish.<br />
Subtitles: English, Deutsch, Spanish, French, Nordic, Polish.<br />
Audio: Dolby Digital 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 115 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.youvegotmail.com', '178');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('8', '1', 'A Bug\'s Life', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Digital 5.1 / Dobly Surround Stereo.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 91 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', '45');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('8', '2', 'A Bug\'s Life', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Digital 5.1 / Dobly Surround Stereo.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 91 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', '152');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('9', '1', 'Under Siege', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 98 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '64');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('9', '2', 'Under Siege', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 98 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '185');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('10', '1', 'Under Siege 2 - Dark Territory', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 98 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '33');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('10', '2', 'Under Siege 2 - Dark Territory', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 98 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '134');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('11', '1', 'Fire Down Below', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 100 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '36');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('11', '2', 'Fire Down Below', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 100 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '166');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('12', '1', 'Die Hard With A Vengeance', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 122 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '54');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('12', '2', 'Die Hard With A Vengeance', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 122 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '178');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('13', '1', 'Lethal Weapon', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 100 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '64');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('13', '2', 'Lethal Weapon', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 100 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '192');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('14', '1', 'Red Corner', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 117 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '52');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('14', '2', 'Red Corner', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 117 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '190');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('15', '1', 'Frantic', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 115 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '46');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('15', '2', 'Frantic', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 115 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '184');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('16', '1', 'Courage Under Fire', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 112 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '69');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('16', '2', 'Courage Under Fire', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 112 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '219');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('17', '1', 'Speed', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 112 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '55');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('17', '2', 'Speed', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 112 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '185');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('18', '1', 'Speed 2: Cruise Control', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 120 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '55');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('18', '2', 'Speed 2: Cruise Control', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 120 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '133');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('19', '1', 'There\'s Something About Mary', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 114 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '79');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('19', '2', 'There\'s Something About Mary', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 114 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '210');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('20', '1', 'Beloved', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 164 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '162');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('20', '2', 'Beloved', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br />
Languages: English, Deutsch.<br />
Subtitles: English, Deutsch, Spanish.<br />
Audio: Dolby Surround 5.1.<br />
Picture Format: 16:9 Wide-Screen.<br />
Length: (approx) 164 minutes.<br />
Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', '447');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('21', '1', 'SWAT 3: Close Quarters Battle', '<strong>Windows 95/98</strong><br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and \"When needed\" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!', 'www.swat3.com', '95');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('21', '2', 'SWAT 3: Close Quarters Battle', '<strong>Windows 95/98</strong><br /><br />211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and \"When needed\" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!', 'www.swat3.com', '450');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('22', '1', 'Unreal Tournament', 'From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.', 'www.unrealtournament.net', '208');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('22', '2', 'Unreal Tournament', 'From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br /><br />This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It\'s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of \'bots\' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.', 'www.unrealtournament.net', '510');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('23', '1', 'The Wheel Of Time', 'The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.', 'www.wheeloftime.com', '119');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('23', '2', 'The Wheel Of Time', 'The world in which The Wheel of Time takes place is lifted directly out of Jordan\'s pages; it\'s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you\'re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter\'angreal, Portal Stones, and the Ways. However you move around, though, you\'ll quickly discover that means of locomotion can easily become the least of the your worries...<br /><br />During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time\'s main characters. Some of these places are ripped directly from the pages of Jordan\'s books, made flesh with Legend\'s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you\'ll have this year.', 'www.wheeloftime.com', '439');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('24', '1', 'Disciples: Sacred Lands', 'A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.', '', '111');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('24', '2', 'Disciples: Sacred Lands', 'A new age is dawning...<br /><br />Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br /><br />The day of reckoning has come... and only the chosen will survive.', '', '508');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('25', '1', 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', '128');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('25', '2', 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', '472');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('26', '1', 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', '143');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('26', '2', 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', '517');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('27', '1', 'Hewlett Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '151');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('27', '2', 'Hewlett Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP\'s Resolution Enhancement technology (REt) makes every document more professional.<br /><br />Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br /><br />HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', '645');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('28', '1', 'Samsung Galaxy Tab', '<p>Powered by a Cortex A8 1.0GHz application processor, the Samsung GALAXY Tab is designed to deliver high performance whenever and wherever you are. At the same time, HD video contents are supported by a wide range of multimedia formats (DivX, XviD, MPEG4, H.263, H.264 and more), which maximizes the joy of entertainment.</p><p>With 3G HSPA connectivity, 802.11n Wi-Fi, and Bluetooth 3.0, the Samsung GALAXY Tab enhances users\' mobile communication on a whole new level. Video conferencing and push email on the large 7-inch display make communication more smooth and efficient. For voice telephony, the Samsung GALAXY Tab turns out to be a perfect speakerphone on the desk, or a mobile phone on the move via Bluetooth headset.</p>', 'http://galaxytab.samsungmobile.com', '112');
insert into products_description (products_id, language_id, products_name, products_description, products_url, products_viewed) values ('28', '2', 'Samsung Galaxy Tab', '<p>Powered by a Cortex A8 1.0GHz application processor, the Samsung GALAXY Tab is designed to deliver high performance whenever and wherever you are. At the same time, HD video contents are supported by a wide range of multimedia formats (DivX, XviD, MPEG4, H.263, H.264 and more), which maximizes the joy of entertainment.</p><p>With 3G HSPA connectivity, 802.11n Wi-Fi, and Bluetooth 3.0, the Samsung GALAXY Tab enhances users\' mobile communication on a whole new level. Video conferencing and push email on the large 7-inch display make communication more smooth and efficient. For voice telephony, the Samsung GALAXY Tab turns out to be a perfect speakerphone on the desk, or a mobile phone on the move via Bluetooth headset.</p>', 'http://galaxytab.samsungmobile.com', '708');
drop table if exists products_images;
create table products_images (
  id int(11) not null auto_increment,
  products_id int(11) not null ,
  image varchar(64) ,
  htmlcontent text ,
  sort_order int(11) not null ,
  PRIMARY KEY (id),
  KEY products_images_prodid (products_id)
);

insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('1', '28', 'samsung/galaxy_tab_1.jpg', NULL, '1');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('2', '28', 'samsung/galaxy_tab_2.jpg', NULL, '2');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('3', '28', 'samsung/galaxy_tab_3.jpg', NULL, '3');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('4', '28', 'samsung/galaxy_tab_4.jpg', '<iframe width=\"560\" height=\"315\" src=\"http://www.youtube.com/embed/tAbsmHMAhrQ\" frameborder=\"0\" allowfullscreen></iframe>', '4');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('5', '17', 'dvd/speed_large.jpg', NULL, '1');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('6', '12', 'dvd/die_hard_3_large.jpg', NULL, '1');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('7', '11', 'dvd/fire_down_below_large.jpg', NULL, '1');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('8', '13', 'dvd/lethal_weapon_large.jpg', NULL, '1');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('9', '18', 'dvd/speed_2_large.jpg', NULL, '1');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('10', '6', 'dvd/the_matrix_large.jpg', NULL, '1');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('11', '4', 'dvd/replacement_killers_large.jpg', NULL, '1');
insert into products_images (id, products_id, image, htmlcontent, sort_order) values ('12', '9', 'dvd/under_siege_large.jpg', NULL, '1');
drop table if exists products_notifications;
create table products_notifications (
  products_id int(11) not null ,
  customers_id int(11) not null ,
  date_added datetime not null ,
  PRIMARY KEY (products_id, customers_id)
);

drop table if exists products_options;
create table products_options (
  products_options_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  products_options_name varchar(32) not null ,
  PRIMARY KEY (products_options_id, language_id)
);

insert into products_options (products_options_id, language_id, products_options_name) values ('1', '1', 'Color');
insert into products_options (products_options_id, language_id, products_options_name) values ('1', '2', 'Цвет');
insert into products_options (products_options_id, language_id, products_options_name) values ('2', '1', 'Size');
insert into products_options (products_options_id, language_id, products_options_name) values ('2', '2', 'Размер');
insert into products_options (products_options_id, language_id, products_options_name) values ('3', '1', 'Model');
insert into products_options (products_options_id, language_id, products_options_name) values ('3', '2', 'Модель');
insert into products_options (products_options_id, language_id, products_options_name) values ('4', '1', 'Memory');
insert into products_options (products_options_id, language_id, products_options_name) values ('4', '2', 'Память');
insert into products_options (products_options_id, language_id, products_options_name) values ('5', '1', 'Version');
insert into products_options (products_options_id, language_id, products_options_name) values ('5', '2', 'Версия');
drop table if exists products_options_values;
create table products_options_values (
  products_options_values_id int(11) default '0' not null ,
  language_id int(11) default '1' not null ,
  products_options_values_name varchar(64) not null ,
  PRIMARY KEY (products_options_values_id, language_id)
);

insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('1', '1', '4 mb');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('1', '2', '4 mb');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('2', '1', '8 mb');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('2', '2', '8 mb');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('3', '1', '16 mb');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('3', '2', '16 mb');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('4', '1', '32 mb');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('4', '2', '32 mb');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('5', '1', 'Value');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('5', '2', 'Value');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('6', '1', 'Premium');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('6', '2', 'Premium');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('7', '1', 'Deluxe');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('7', '2', 'Deluxe');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('8', '1', 'PS/2');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('8', '2', 'PS/2');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('9', '1', 'USB');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('9', '2', 'USB');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('10', '1', 'Download: Windows - English');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('10', '2', 'Download: Windows - English');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('13', '1', 'Box: Windows - English');
insert into products_options_values (products_options_values_id, language_id, products_options_values_name) values ('13', '2', 'Box: Windows - English');
drop table if exists products_options_values_to_products_options;
create table products_options_values_to_products_options (
  products_options_values_to_products_options_id int(11) not null auto_increment,
  products_options_id int(11) not null ,
  products_options_values_id int(11) not null ,
  PRIMARY KEY (products_options_values_to_products_options_id)
);

insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('1', '4', '1');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('2', '4', '2');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('3', '4', '3');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('4', '4', '4');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('5', '3', '5');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('6', '3', '6');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('7', '3', '7');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('8', '3', '8');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('9', '3', '9');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('10', '5', '10');
insert into products_options_values_to_products_options (products_options_values_to_products_options_id, products_options_id, products_options_values_id) values ('13', '5', '13');
drop table if exists products_to_categories;
create table products_to_categories (
  products_id int(11) not null ,
  categories_id int(11) not null ,
  PRIMARY KEY (products_id, categories_id)
);

insert into products_to_categories (products_id, categories_id) values ('1', '4');
insert into products_to_categories (products_id, categories_id) values ('2', '4');
insert into products_to_categories (products_id, categories_id) values ('3', '9');
insert into products_to_categories (products_id, categories_id) values ('4', '10');
insert into products_to_categories (products_id, categories_id) values ('5', '11');
insert into products_to_categories (products_id, categories_id) values ('6', '10');
insert into products_to_categories (products_id, categories_id) values ('7', '12');
insert into products_to_categories (products_id, categories_id) values ('8', '13');
insert into products_to_categories (products_id, categories_id) values ('9', '10');
insert into products_to_categories (products_id, categories_id) values ('10', '10');
insert into products_to_categories (products_id, categories_id) values ('11', '10');
insert into products_to_categories (products_id, categories_id) values ('12', '10');
insert into products_to_categories (products_id, categories_id) values ('13', '10');
insert into products_to_categories (products_id, categories_id) values ('14', '15');
insert into products_to_categories (products_id, categories_id) values ('15', '14');
insert into products_to_categories (products_id, categories_id) values ('16', '15');
insert into products_to_categories (products_id, categories_id) values ('17', '10');
insert into products_to_categories (products_id, categories_id) values ('18', '10');
insert into products_to_categories (products_id, categories_id) values ('19', '12');
insert into products_to_categories (products_id, categories_id) values ('20', '15');
insert into products_to_categories (products_id, categories_id) values ('21', '18');
insert into products_to_categories (products_id, categories_id) values ('22', '19');
insert into products_to_categories (products_id, categories_id) values ('23', '20');
insert into products_to_categories (products_id, categories_id) values ('24', '20');
insert into products_to_categories (products_id, categories_id) values ('25', '8');
insert into products_to_categories (products_id, categories_id) values ('26', '9');
insert into products_to_categories (products_id, categories_id) values ('27', '5');
insert into products_to_categories (products_id, categories_id) values ('28', '21');
drop table if exists reviews;
create table reviews (
  reviews_id int(11) not null auto_increment,
  products_id int(11) not null ,
  customers_id int(11) ,
  customers_name varchar(255) not null ,
  reviews_rating int(1) ,
  date_added datetime ,
  last_modified datetime ,
  reviews_status tinyint(1) default '0' not null ,
  reviews_read int(5) default '0' not null ,
  PRIMARY KEY (reviews_id),
  KEY idx_reviews_products_id (products_id),
  KEY idx_reviews_customers_id (customers_id)
);

insert into reviews (reviews_id, products_id, customers_id, customers_name, reviews_rating, date_added, last_modified, reviews_status, reviews_read) values ('1', '19', '0', 'John Doe', '5', '2015-03-18 19:09:50', NULL, '1', '0');
drop table if exists reviews_description;
create table reviews_description (
  reviews_id int(11) not null ,
  languages_id int(11) not null ,
  reviews_text text not null ,
  PRIMARY KEY (reviews_id, languages_id)
);

insert into reviews_description (reviews_id, languages_id, reviews_text) values ('1', '1', 'This has to be one of the funniest movies released for 1999!');
drop table if exists sec_directory_whitelist;
create table sec_directory_whitelist (
  id int(11) not null auto_increment,
  directory varchar(255) not null ,
  PRIMARY KEY (id)
);

insert into sec_directory_whitelist (id, directory) values ('1', 'admin/backups');
insert into sec_directory_whitelist (id, directory) values ('2', 'admin/images/graphs');
insert into sec_directory_whitelist (id, directory) values ('3', 'images');
insert into sec_directory_whitelist (id, directory) values ('4', 'images/banners');
insert into sec_directory_whitelist (id, directory) values ('5', 'images/dvd');
insert into sec_directory_whitelist (id, directory) values ('6', 'images/gt_interactive');
insert into sec_directory_whitelist (id, directory) values ('7', 'images/hewlett_packard');
insert into sec_directory_whitelist (id, directory) values ('8', 'images/matrox');
insert into sec_directory_whitelist (id, directory) values ('9', 'images/microsoft');
insert into sec_directory_whitelist (id, directory) values ('10', 'images/samsung');
insert into sec_directory_whitelist (id, directory) values ('11', 'images/sierra');
insert into sec_directory_whitelist (id, directory) values ('12', 'includes/work');
insert into sec_directory_whitelist (id, directory) values ('13', 'pub');
drop table if exists sessions;
create table sessions (
  sesskey varchar(128) not null ,
  expiry int(11) unsigned not null ,
  value text not null ,
  PRIMARY KEY (sesskey)
);

drop table if exists specials;
create table specials (
  specials_id int(11) not null auto_increment,
  products_id int(11) not null ,
  specials_new_products_price decimal(15,4) not null ,
  specials_date_added datetime ,
  specials_last_modified datetime ,
  expires_date datetime ,
  date_status_change datetime ,
  status int(1) default '1' not null ,
  PRIMARY KEY (specials_id),
  KEY idx_specials_products_id (products_id)
);

insert into specials (specials_id, products_id, specials_new_products_price, specials_date_added, specials_last_modified, expires_date, date_status_change, status) values ('1', '3', '39.9900', '2015-03-18 19:09:50', NULL, NULL, NULL, '1');
insert into specials (specials_id, products_id, specials_new_products_price, specials_date_added, specials_last_modified, expires_date, date_status_change, status) values ('2', '5', '30.0000', '2015-03-18 19:09:50', NULL, NULL, NULL, '1');
insert into specials (specials_id, products_id, specials_new_products_price, specials_date_added, specials_last_modified, expires_date, date_status_change, status) values ('3', '6', '30.0000', '2015-03-18 19:09:50', NULL, NULL, NULL, '1');
insert into specials (specials_id, products_id, specials_new_products_price, specials_date_added, specials_last_modified, expires_date, date_status_change, status) values ('4', '16', '29.9900', '2015-03-18 19:09:50', NULL, NULL, NULL, '1');
drop table if exists tax_class;
create table tax_class (
  tax_class_id int(11) not null auto_increment,
  tax_class_title varchar(32) not null ,
  tax_class_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime not null ,
  PRIMARY KEY (tax_class_id)
);

insert into tax_class (tax_class_id, tax_class_title, tax_class_description, last_modified, date_added) values ('1', 'Taxable Goods', 'The following types of products are included non-food, services, etc', '2015-03-18 19:09:50', '2015-03-18 19:09:50');
drop table if exists tax_rates;
create table tax_rates (
  tax_rates_id int(11) not null auto_increment,
  tax_zone_id int(11) not null ,
  tax_class_id int(11) not null ,
  tax_priority int(5) default '1' ,
  tax_rate decimal(7,4) not null ,
  tax_description varchar(255) not null ,
  last_modified datetime ,
  date_added datetime not null ,
  PRIMARY KEY (tax_rates_id)
);

insert into tax_rates (tax_rates_id, tax_zone_id, tax_class_id, tax_priority, tax_rate, tax_description, last_modified, date_added) values ('1', '1', '1', '1', '7.0000', 'FL TAX 7.0%', '2015-03-18 19:09:50', '2015-03-18 19:09:50');
drop table if exists whos_online;
create table whos_online (
  customer_id int(11) ,
  full_name varchar(255) not null ,
  session_id varchar(128) not null ,
  ip_address varchar(15) not null ,
  time_entry varchar(14) not null ,
  time_last_click varchar(14) not null ,
  last_page_url text not null ,
  KEY idx_whos_online_session_id (session_id)
);

drop table if exists zones;
create table zones (
  zone_id int(11) not null auto_increment,
  zone_country_id int(11) not null ,
  zone_code varchar(32) not null ,
  zone_name varchar(255) not null ,
  PRIMARY KEY (zone_id),
  KEY idx_zones_country_id (zone_country_id)
);

insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('1', '223', 'AL', 'Alabama');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('2', '223', 'AK', 'Alaska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('3', '223', 'AS', 'American Samoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('4', '223', 'AZ', 'Arizona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('5', '223', 'AR', 'Arkansas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('6', '223', 'AF', 'Armed Forces Africa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('7', '223', 'AA', 'Armed Forces Americas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('8', '223', 'AC', 'Armed Forces Canada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('9', '223', 'AE', 'Armed Forces Europe');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('10', '223', 'AM', 'Armed Forces Middle East');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('11', '223', 'AP', 'Armed Forces Pacific');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('12', '223', 'CA', 'California');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('13', '223', 'CO', 'Colorado');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('14', '223', 'CT', 'Connecticut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('15', '223', 'DE', 'Delaware');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('16', '223', 'DC', 'District of Columbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('17', '223', 'FM', 'Federated States Of Micronesia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('18', '223', 'FL', 'Florida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('19', '223', 'GA', 'Georgia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('20', '223', 'GU', 'Guam');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('21', '223', 'HI', 'Hawaii');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('22', '223', 'ID', 'Idaho');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('23', '223', 'IL', 'Illinois');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('24', '223', 'IN', 'Indiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('25', '223', 'IA', 'Iowa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('26', '223', 'KS', 'Kansas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('27', '223', 'KY', 'Kentucky');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('28', '223', 'LA', 'Louisiana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('29', '223', 'ME', 'Maine');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('30', '223', 'MH', 'Marshall Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('31', '223', 'MD', 'Maryland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('32', '223', 'MA', 'Massachusetts');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('33', '223', 'MI', 'Michigan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('34', '223', 'MN', 'Minnesota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('35', '223', 'MS', 'Mississippi');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('36', '223', 'MO', 'Missouri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('37', '223', 'MT', 'Montana');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('38', '223', 'NE', 'Nebraska');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('39', '223', 'NV', 'Nevada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('40', '223', 'NH', 'New Hampshire');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('41', '223', 'NJ', 'New Jersey');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('42', '223', 'NM', 'New Mexico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('43', '223', 'NY', 'New York');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('44', '223', 'NC', 'North Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('45', '223', 'ND', 'North Dakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('46', '223', 'MP', 'Northern Mariana Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('47', '223', 'OH', 'Ohio');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('48', '223', 'OK', 'Oklahoma');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('49', '223', 'OR', 'Oregon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('50', '223', 'PW', 'Palau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('51', '223', 'PA', 'Pennsylvania');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('52', '223', 'PR', 'Puerto Rico');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('53', '223', 'RI', 'Rhode Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('54', '223', 'SC', 'South Carolina');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('55', '223', 'SD', 'South Dakota');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('56', '223', 'TN', 'Tennessee');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('57', '223', 'TX', 'Texas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('58', '223', 'UT', 'Utah');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('59', '223', 'VT', 'Vermont');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('60', '223', 'VI', 'Virgin Islands');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('61', '223', 'VA', 'Virginia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('62', '223', 'WA', 'Washington');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('63', '223', 'WV', 'West Virginia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('64', '223', 'WI', 'Wisconsin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('65', '223', 'WY', 'Wyoming');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('66', '38', 'AB', 'Alberta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('67', '38', 'BC', 'British Columbia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('68', '38', 'MB', 'Manitoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('69', '38', 'NF', 'Newfoundland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('70', '38', 'NB', 'New Brunswick');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('71', '38', 'NS', 'Nova Scotia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('72', '38', 'NT', 'Northwest Territories');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('73', '38', 'NU', 'Nunavut');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('74', '38', 'ON', 'Ontario');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('75', '38', 'PE', 'Prince Edward Island');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('76', '38', 'QC', 'Quebec');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('77', '38', 'SK', 'Saskatchewan');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('78', '38', 'YT', 'Yukon Territory');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('79', '81', 'NDS', 'Niedersachsen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('80', '81', 'BAW', 'Baden-Württemberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('81', '81', 'BAY', 'Bayern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('82', '81', 'BER', 'Berlin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('83', '81', 'BRG', 'Brandenburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('84', '81', 'BRE', 'Bremen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('85', '81', 'HAM', 'Hamburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('86', '81', 'HES', 'Hessen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('87', '81', 'MEC', 'Mecklenburg-Vorpommern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('88', '81', 'NRW', 'Nordrhein-Westfalen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('89', '81', 'RHE', 'Rheinland-Pfalz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('90', '81', 'SAR', 'Saarland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('91', '81', 'SAS', 'Sachsen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('92', '81', 'SAC', 'Sachsen-Anhalt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('93', '81', 'SCN', 'Schleswig-Holstein');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('94', '81', 'THE', 'Thüringen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('95', '14', 'WI', 'Wien');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('96', '14', 'NO', 'Niederösterreich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('97', '14', 'OO', 'Oberösterreich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('98', '14', 'SB', 'Salzburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('99', '14', 'KN', 'Kärnten');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('100', '14', 'ST', 'Steiermark');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('101', '14', 'TI', 'Tirol');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('102', '14', 'BL', 'Burgenland');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('103', '14', 'VB', 'Voralberg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('104', '204', 'AG', 'Aargau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('105', '204', 'AI', 'Appenzell Innerrhoden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('106', '204', 'AR', 'Appenzell Ausserrhoden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('107', '204', 'BE', 'Bern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('108', '204', 'BL', 'Basel-Landschaft');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('109', '204', 'BS', 'Basel-Stadt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('110', '204', 'FR', 'Freiburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('111', '204', 'GE', 'Genf');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('112', '204', 'GL', 'Glarus');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('113', '204', 'JU', 'Graubünden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('114', '204', 'JU', 'Jura');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('115', '204', 'LU', 'Luzern');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('116', '204', 'NE', 'Neuenburg');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('117', '204', 'NW', 'Nidwalden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('118', '204', 'OW', 'Obwalden');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('119', '204', 'SG', 'St. Gallen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('120', '204', 'SH', 'Schaffhausen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('121', '204', 'SO', 'Solothurn');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('122', '204', 'SZ', 'Schwyz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('123', '204', 'TG', 'Thurgau');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('124', '204', 'TI', 'Tessin');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('125', '204', 'UR', 'Uri');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('126', '204', 'VD', 'Waadt');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('127', '204', 'VS', 'Wallis');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('128', '204', 'ZG', 'Zug');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('129', '204', 'ZH', 'Zürich');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('130', '195', 'A Coruña', 'A Coruña');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('131', '195', 'Alava', 'Alava');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('132', '195', 'Albacete', 'Albacete');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('133', '195', 'Alicante', 'Alicante');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('134', '195', 'Almeria', 'Almeria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('135', '195', 'Asturias', 'Asturias');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('136', '195', 'Avila', 'Avila');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('137', '195', 'Badajoz', 'Badajoz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('138', '195', 'Baleares', 'Baleares');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('139', '195', 'Barcelona', 'Barcelona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('140', '195', 'Burgos', 'Burgos');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('141', '195', 'Caceres', 'Caceres');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('142', '195', 'Cadiz', 'Cadiz');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('143', '195', 'Cantabria', 'Cantabria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('144', '195', 'Castellon', 'Castellon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('145', '195', 'Ceuta', 'Ceuta');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('146', '195', 'Ciudad Real', 'Ciudad Real');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('147', '195', 'Cordoba', 'Cordoba');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('148', '195', 'Cuenca', 'Cuenca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('149', '195', 'Girona', 'Girona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('150', '195', 'Granada', 'Granada');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('151', '195', 'Guadalajara', 'Guadalajara');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('152', '195', 'Guipuzcoa', 'Guipuzcoa');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('153', '195', 'Huelva', 'Huelva');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('154', '195', 'Huesca', 'Huesca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('155', '195', 'Jaen', 'Jaen');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('156', '195', 'La Rioja', 'La Rioja');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('157', '195', 'Las Palmas', 'Las Palmas');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('158', '195', 'Leon', 'Leon');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('159', '195', 'Lleida', 'Lleida');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('160', '195', 'Lugo', 'Lugo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('161', '195', 'Madrid', 'Madrid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('162', '195', 'Malaga', 'Malaga');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('163', '195', 'Melilla', 'Melilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('164', '195', 'Murcia', 'Murcia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('165', '195', 'Navarra', 'Navarra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('166', '195', 'Ourense', 'Ourense');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('167', '195', 'Palencia', 'Palencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('168', '195', 'Pontevedra', 'Pontevedra');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('169', '195', 'Salamanca', 'Salamanca');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('170', '195', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('171', '195', 'Segovia', 'Segovia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('172', '195', 'Sevilla', 'Sevilla');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('173', '195', 'Soria', 'Soria');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('174', '195', 'Tarragona', 'Tarragona');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('175', '195', 'Teruel', 'Teruel');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('176', '195', 'Toledo', 'Toledo');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('177', '195', 'Valencia', 'Valencia');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('178', '195', 'Valladolid', 'Valladolid');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('179', '195', 'Vizcaya', 'Vizcaya');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('180', '195', 'Zamora', 'Zamora');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('181', '195', 'Zaragoza', 'Zaragoza');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('182', '176', '01', 'Республика Адыгея (Адыгея)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('183', '176', '04', 'Республика Алтай');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('184', '176', '02', 'Республика Башкортостан');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('185', '176', '03', 'Республика Бурятия');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('186', '176', '05', 'Республика Дагестан');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('187', '176', '06', 'Республика Ингушетия');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('188', '176', '07', 'Кабардино-Балкарская Республика');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('189', '176', '08', 'Республика Калмыкия');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('190', '176', '09', 'Карачаево-Черкесская Республика');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('191', '176', '10', 'Республика Карелия');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('192', '176', '11', 'Республика Коми');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('193', '176', '12', 'Республика Марий Эл');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('194', '176', '13', 'Республика Мордовия');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('195', '176', '14', 'Республика Саха (Якутия)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('196', '176', '15', 'Республика Северная Осетия - Алания');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('197', '176', '16', 'Республика Татарстан (Татарстан)');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('198', '176', '17', 'Республика Тыва');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('199', '176', '18', 'Удмуртская Республика');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('200', '176', '19', 'Республика Хакасия');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('201', '176', '20', 'Чеченская Республика');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('202', '176', '21', 'Чувашская Республика - Чувашия');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('203', '176', '22', 'Алтайский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('204', '176', '23', 'Краснодарский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('205', '176', '24', 'Красноярский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('206', '176', '25', 'Приморский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('207', '176', '26', 'Ставропольский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('208', '176', '27', 'Хабаровский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('209', '176', '28', 'Амурская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('210', '176', '29', 'Архангельская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('211', '176', '30', 'Астраханская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('212', '176', '31', 'Белгородская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('213', '176', '32', 'Брянская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('214', '176', '33', 'Владимирская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('215', '176', '34', 'Волгоградская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('216', '176', '35', 'Вологодская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('217', '176', '36', 'Воронежская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('218', '176', '37', 'Ивановская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('219', '176', '38', 'Иркутская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('220', '176', '39', 'Калининградская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('221', '176', '40', 'Калужская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('222', '176', '41', 'Камчатский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('223', '176', '42', 'Кемеровская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('224', '176', '43', 'Кировская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('225', '176', '44', 'Костромская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('226', '176', '45', 'Курганская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('227', '176', '46', 'Курская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('228', '176', '47', 'Ленинградская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('229', '176', '48', 'Липецкая область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('230', '176', '49', 'Магаданская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('231', '176', '50', 'Московская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('232', '176', '51', 'Мурманская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('233', '176', '52', 'Нижегородская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('234', '176', '53', 'Новгородская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('235', '176', '54', 'Новосибирская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('236', '176', '55', 'Омская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('237', '176', '56', 'Оренбургская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('238', '176', '57', 'Орловская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('239', '176', '58', 'Пензенская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('240', '176', '59', 'Пермский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('241', '176', '60', 'Псковская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('242', '176', '61', 'Ростовская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('243', '176', '62', 'Рязанская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('244', '176', '63', 'Самарская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('245', '176', '64', 'Саратовская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('246', '176', '65', 'Сахалинская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('247', '176', '66', 'Свердловская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('248', '176', '67', 'Смоленская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('249', '176', '68', 'Тамбовская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('250', '176', '69', 'Тверская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('251', '176', '70', 'Томская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('252', '176', '71', 'Тульская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('253', '176', '72', 'Тюменская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('254', '176', '73', 'Ульяновская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('255', '176', '74', 'Челябинская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('256', '176', '75', 'Забайкальский край');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('257', '176', '76', 'Ярославская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('258', '176', '77', 'Москва');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('259', '176', '78', 'Санкт-Петербург');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('260', '176', '79', 'Еврейская автономная область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('261', '176', '82', 'Крым Республика');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('262', '176', '83', 'Ненецкий автономный округ');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('263', '176', '86', 'Ханты-Мансийский автономный округ');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('264', '176', '87', 'Чукотский автономный округ');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('265', '176', '89', 'Ямало-Ненецкий автономный округ');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('266', '176', '92', 'Севастополь');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('267', '11', 'Араратская область', 'Араратская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('268', '11', 'Армавирская область', 'Армавирская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('269', '11', 'Гегаркуникская область', 'Гегаркуникская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('270', '11', 'Ереван', 'Ереван');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('271', '11', 'Котайкская область', 'Котайкская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('272', '11', 'Лорийская область', 'Лорийская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('273', '11', 'Область Вайоц Дзор', 'Область Вайоц Дзор');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('274', '11', 'Область Арагацотн', 'Область Арагацотн');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('275', '11', 'Сюникская область', 'Сюникская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('276', '11', 'Тавушская область', 'Тавушская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('277', '11', 'Ширакская область', 'Ширакская область');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('278', '15', 'Агдашский район', 'Агдашский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('279', '15', 'Агдамский район', 'Агдамский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('280', '15', 'Агджабединский район', 'Агджабединский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('281', '15', 'Агсуинский район', 'Агсуинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('282', '15', 'Акстафинский район', 'Акстафинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('283', '15', 'Апшеронский район', 'Апшеронский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('284', '15', 'Астаринский район', 'Астаринский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('285', '15', 'Бабекский район', 'Бабекский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('286', '15', 'Балакенский район', 'Балакенский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('287', '15', 'Бардинский район', 'Бардинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('288', '15', 'Бейлаганский район', 'Бейлаганский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('289', '15', 'Билясуварский район', 'Билясуварский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('290', '15', 'Габалинский район', 'Габалинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('291', '15', 'Гаджигабульский район', 'Гаджигабульский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('292', '15', 'Газахский район', 'Газахский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('293', '15', 'Гахский район', 'Гахский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('294', '15', 'Геокчайский район', 'Геокчайский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('295', '15', 'Геранбойский район', 'Геранбойский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('296', '15', 'Гобустанский район', 'Гобустанский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('297', '15', 'Губинский район', 'Губинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('298', '15', 'Губадлинский район', 'Губадлинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('299', '15', 'Гусарский район', 'Гусарский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('300', '15', 'Дашкесанский район', 'Дашкесанский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('301', '15', 'Джалилабадский район', 'Джалилабадский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('302', '15', 'Джебраильский район', 'Джебраильский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('303', '15', 'Джульфинский район', 'Джульфинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('304', '15', 'Дивичинский район', 'Дивичинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('305', '15', 'Евлахский район', 'Евлахский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('306', '15', 'Закатальский район', 'Закатальский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('307', '15', 'Зангеланский район', 'Зангеланский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('308', '15', 'Зардабский район', 'Зардабский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('309', '15', 'Имишлинский район', 'Имишлинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('310', '15', 'Исмаиллинский район', 'Исмаиллинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('311', '15', 'Кедабекский район', 'Кедабекский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('312', '15', 'Кельбаджарский район', 'Кельбаджарский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('313', '15', 'Кюрдамирский район', 'Кюрдамирский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('314', '15', 'Лачинский район', 'Лачинский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('315', '15', 'Ленкоранский район', 'Ленкоранский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('316', '15', 'Лерикский район', 'Лерикский район');
insert into zones (zone_id, zone_country_id, zone_code, zone_name) values ('317', '15', 'Масаллинский район', 'Масаллинский район');
drop table if exists zones_to_geo_zones;
create table zones_to_geo_zones (
  association_id int(11) not null auto_increment,
  zone_country_id int(11) not null ,
  zone_id int(11) ,
  geo_zone_id int(11) ,
  last_modified datetime ,
  date_added datetime not null ,
  PRIMARY KEY (association_id),
  KEY idx_zones_to_geo_zones_country_id (zone_country_id)
);

insert into zones_to_geo_zones (association_id, zone_country_id, zone_id, geo_zone_id, last_modified, date_added) values ('1', '223', '18', '1', NULL, '2015-03-18 19:09:50');
