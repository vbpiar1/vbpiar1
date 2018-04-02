<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

define('HEADING_TITLE', 'Категории / Товары');
define('HEADING_TITLE_SEARCH', 'Поиск:');
define('HEADING_TITLE_GOTO', 'Перейти в:');

define('TABLE_HEADING_ID', 'ID');
define('TABLE_HEADING_CATEGORIES_PRODUCTS', 'Категории / Товары');
define('TABLE_HEADING_ACTION', 'Действие');
define('TABLE_HEADING_STATUS', 'Статус');

define('TEXT_NEW_PRODUCT', 'Новый Товар в &quot;%s&quot;');
define('TEXT_CATEGORIES', 'Категории:');
define('TEXT_SUBCATEGORIES', 'Субкатегории:');
define('TEXT_PRODUCTS', 'Товары:');
define('TEXT_PRODUCTS_PRICE_INFO', 'Цена:');
define('TEXT_PRODUCTS_TAX_CLASS', 'Класс Налогов:');
define('TEXT_PRODUCTS_AVERAGE_RATING', 'Средняя Оценка:');
define('TEXT_PRODUCTS_QUANTITY_INFO', 'Количество:');
define('TEXT_DATE_ADDED', 'Дата Добавления:');
define('TEXT_DATE_AVAILABLE', 'Доступно с:');
define('TEXT_LAST_MODIFIED', 'Последнее Изменение:');
define('TEXT_IMAGE_NONEXISTENT', 'Картинка не найдена');
define('TEXT_NO_CHILD_CATEGORIES_OR_PRODUCTS', 'Добавьте, пожалуйста, новую категорию или товар.');
define('TEXT_PRODUCT_MORE_INFORMATION', 'Более подробная информация о товаре <a href="http://%s" target="blank"><u>на этой странице</u></a>.');
define('TEXT_PRODUCT_DATE_ADDED', 'Этот товар был добавлен в каталог %s.');
define('TEXT_PRODUCT_DATE_AVAILABLE', 'Этот товар будет в продаже с %s.');

define('TEXT_EDIT_INTRO', 'Пожалуйста, внесите необходимые изменения');
define('TEXT_EDIT_CATEGORIES_ID', 'ID категории:');
define('TEXT_EDIT_CATEGORIES_NAME', 'Название категории:');
define('TEXT_EDIT_CATEGORIES_IMAGE', 'Картинка для категории:');
define('TEXT_EDIT_SORT_ORDER', 'Порядок сортировки:');

define('TEXT_INFO_COPY_TO_INTRO', 'Выберите, пожалуйста, новую категорию, куда Вы хотите скопировать этот товар');
define('TEXT_INFO_CURRENT_CATEGORIES', 'Текущие категории:');

define('TEXT_INFO_HEADING_NEW_CATEGORY', 'Новая Категория');
define('TEXT_INFO_HEADING_EDIT_CATEGORY', 'Изменить Категорию');
define('TEXT_INFO_HEADING_DELETE_CATEGORY', 'Удалить Категорию');
define('TEXT_INFO_HEADING_MOVE_CATEGORY', 'Перенести Категорию');
define('TEXT_INFO_HEADING_DELETE_PRODUCT', 'Удалить Товар');
define('TEXT_INFO_HEADING_MOVE_PRODUCT', 'Перенести Товар');
define('TEXT_INFO_HEADING_COPY_TO', 'Копировать В');

define('TEXT_DELETE_CATEGORY_INTRO', 'Вы действительно хотите удалить эту категорию?');
define('TEXT_DELETE_PRODUCT_INTRO', 'Вы действительно хотите удалить этот товар?');

define('TEXT_DELETE_WARNING_CHILDS', '<b>ВНИМАНИЕ:</b> Есть еще %s субкатегорий, связанных с этой категорией!');
define('TEXT_DELETE_WARNING_PRODUCTS', '<b>ВНИМАНИЕ:</b> Есть еще %s наименований товара, связанных с этой категорией!');

define('TEXT_MOVE_PRODUCTS_INTRO', 'Пожалуйста, выберите категорию для перемещения <b>%s</b> в');
define('TEXT_MOVE_CATEGORIES_INTRO', 'Пожалуйста, выберите категорию для перемещения <b>%s</b> в');
define('TEXT_MOVE', 'Переместить <b>%s</b> в:');

define('TEXT_NEW_CATEGORY_INTRO', 'Пожалуйста, заполните следующую информацию для новой категории');
define('TEXT_CATEGORIES_NAME', 'Название Категории:');
define('TEXT_CATEGORIES_IMAGE', 'Картинка Категории:');
define('TEXT_SORT_ORDER', 'Порядок Сортировки:');

define('TEXT_PRODUCTS_STATUS', 'Статус Товара:');
define('TEXT_PRODUCTS_DATE_AVAILABLE', 'Дата Поступления:');
define('TEXT_PRODUCT_AVAILABLE', 'В наличии');
define('TEXT_PRODUCT_NOT_AVAILABLE', 'Нет в наличии');
define('TEXT_PRODUCTS_MANUFACTURER', 'Производитель:');
define('TEXT_PRODUCTS_NAME', 'Название:');
define('TEXT_PRODUCTS_DESCRIPTION', 'Описание товара:');
define('TEXT_PRODUCTS_QUANTITY', 'Количество товара на складе:');
define('TEXT_PRODUCTS_MODEL', 'Код товара:');
define('TEXT_PRODUCTS_IMAGE', 'Картинка Товара:');
define('TEXT_PRODUCTS_MAIN_IMAGE', 'Основная картинка');
define('TEXT_PRODUCTS_LARGE_IMAGE', 'Большая картинка');
define('TEXT_PRODUCTS_LARGE_IMAGE_HTML_CONTENT', 'HTML-содержимое (для popup)');
define('TEXT_PRODUCTS_ADD_LARGE_IMAGE', 'Добавить большую картинку');
define('TEXT_PRODUCTS_LARGE_IMAGE_DELETE_TITLE', 'Удалить большую картинку?');
define('TEXT_PRODUCTS_LARGE_IMAGE_CONFIRM_DELETE', 'Подтвердите удаление большой картинки товара.');
define('TEXT_PRODUCTS_URL', 'URL товара:');
define('TEXT_PRODUCTS_URL_WITHOUT_HTTP', '<small>(без http://)</small>');
define('TEXT_PRODUCTS_PRICE_NET', 'Цена (Без налога):');
define('TEXT_PRODUCTS_PRICE_GROSS', 'Цена (С налогом):');
define('TEXT_PRODUCTS_WEIGHT', 'Вес товара:');

define('EMPTY_CATEGORY', 'Пустая Категория');

define('TEXT_HOW_TO_COPY', 'Метод Копирования:');
define('TEXT_COPY_AS_LINK', 'Ссылка на товар');
define('TEXT_COPY_AS_DUPLICATE', 'Дублировать товар');

define('ERROR_CANNOT_LINK_TO_SAME_CATEGORY', 'Ошибка: Нельзя делать ссылку на товар в той же категории.');
define('ERROR_CATALOG_IMAGE_DIRECTORY_NOT_WRITEABLE', 'Ошибка: Каталог с картинками имеет неверные права доступа: ' . DIR_FS_CATALOG_IMAGES);
define('ERROR_CATALOG_IMAGE_DIRECTORY_DOES_NOT_EXIST', 'Ошибка: Каталог с картинками отсутствует: ' . DIR_FS_CATALOG_IMAGES);
define('ERROR_CANNOT_MOVE_CATEGORY_TO_PARENT', 'Ошибка: Категория не может быть перенесена.');