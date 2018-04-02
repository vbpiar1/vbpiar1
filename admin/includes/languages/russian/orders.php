<?php
/*
  $Id$

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

define('HEADING_TITLE', 'Список заказов');
define('HEADING_TITLE_SEARCH', 'Поиск по ID заказа');
define('HEADING_TITLE_STATUS', 'Состояние:');

define('TABLE_HEADING_COMMENTS', 'Комментарий');
define('TABLE_HEADING_CUSTOMERS', 'Покупатели');
define('TABLE_HEADING_ORDER_TOTAL', 'Заказ итого');
define('TABLE_HEADING_DATE_PURCHASED', 'Дата покупки');
define('TABLE_HEADING_STATUS', 'Состояние');
define('TABLE_HEADING_ACTION', 'Действие');
define('TABLE_HEADING_QUANTITY', 'Количество');
define('TABLE_HEADING_PRODUCTS_MODEL', 'Код товара');
define('TABLE_HEADING_PRODUCTS', 'Товары');
define('TABLE_HEADING_TAX', 'Налог');
define('TABLE_HEADING_TOTAL', 'Всего');
define('TABLE_HEADING_PRICE_EXCLUDING_TAX', 'Цена (не включая налог)');
define('TABLE_HEADING_PRICE_INCLUDING_TAX', 'Цена (включая налог)');
define('TABLE_HEADING_TOTAL_EXCLUDING_TAX', 'Общая (не включая налог)');
define('TABLE_HEADING_TOTAL_INCLUDING_TAX', 'Общая (включая налог)');

define('TABLE_HEADING_CUSTOMER_NOTIFIED', 'Покупатель уведомлён');
define('TABLE_HEADING_DATE_ADDED', 'Дата добавления');

define('ENTRY_CUSTOMER', 'Клиент:');
define('ENTRY_SOLD_TO', 'ПОКУПАТЕЛЬ:');
define('ENTRY_DELIVERY_TO', 'Адрес:');
define('ENTRY_SHIP_TO', 'АДРЕС ДОСТАВКИ:');
define('ENTRY_SHIPPING_ADDRESS', 'Адрес Доставки:');
define('ENTRY_BILLING_ADDRESS', 'Адрес Покупателя:');
define('ENTRY_PAYMENT_METHOD', 'Способ Оплаты:');
define('ENTRY_CREDIT_CARD_TYPE', 'Тип Кредитной Карточки:');
define('ENTRY_CREDIT_CARD_OWNER', 'Владелец Кредитной Карточки:');
define('ENTRY_CREDIT_CARD_NUMBER', 'Номер Кредитной Карточки:');
define('ENTRY_CREDIT_CARD_EXPIRES', 'Срок окончания действия кредитной карточки:');
define('ENTRY_SUB_TOTAL', 'Предварительный Итог:');
define('ENTRY_TAX', 'Налог:');
define('ENTRY_SHIPPING', 'Доставка:');
define('ENTRY_TOTAL', 'Всего:');
define('ENTRY_DATE_PURCHASED', 'Дата Покупки:');
define('ENTRY_STATUS', 'Состояние:');
define('ENTRY_DATE_LAST_UPDATED', 'Последнее изменение:');
define('ENTRY_NOTIFY_CUSTOMER', 'Уведомить Покупателя:');
define('ENTRY_NOTIFY_COMMENTS', 'Добавить комментарии:');
define('ENTRY_PRINTABLE', 'Напечатать счёт');

define('TEXT_INFO_HEADING_DELETE_ORDER', 'Удалить Заказ');
define('TEXT_INFO_DELETE_INTRO', 'Вы действительно хотите удалить этот заказ?');
define('TEXT_INFO_RESTOCK_PRODUCT_QUANTITY', 'Пересчитать количество товара');
define('TEXT_DATE_ORDER_CREATED', 'Дата Создания:');
define('TEXT_DATE_ORDER_LAST_MODIFIED', 'Последние Изменения:');
define('TEXT_INFO_PAYMENT_METHOD', 'Способ Оплаты:');

define('TEXT_ALL_ORDERS', 'Все Заказы');
define('TEXT_NO_ORDER_HISTORY', 'История заказа отсутствует');

define('EMAIL_SEPARATOR', '------------------------------------------------------');
define('EMAIL_TEXT_SUBJECT', 'Статус Вашего заказа изменён');
define('EMAIL_TEXT_ORDER_NUMBER', 'Номер заказа:');
define('EMAIL_TEXT_INVOICE_URL', 'Информация о заказе:');
define('EMAIL_TEXT_DATE_ORDERED', 'Дата заказа:');
define('EMAIL_TEXT_STATUS_UPDATE', 'Статус Вашего заказа изменён.' . "\n\n" . 'Новый статус: %s' . "\n\n" . 'Если у Вас возникли вопросы, просто задайте нам их в ответном письме.' . "\n");
define('EMAIL_TEXT_COMMENTS_UPDATE', 'Комментарии к Вашему заказу' . "\n\n%s\n\n");

define('ERROR_ORDER_DOES_NOT_EXIST', 'Ошибка: Заказ не существует.');
define('SUCCESS_ORDER_UPDATED', 'Выполнено: Заказ успешно обновлён.');
define('WARNING_ORDER_NOT_UPDATED', 'Внимание: Изменять нечего. Заказ НЕ обновлён.');