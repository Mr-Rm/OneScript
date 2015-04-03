﻿//////////////////////////////////////////////////////////////
// Перечень тестов

Перем юТест;
Перем СтруктураПараметровЗапуска;
//Перем МассивПараметров;

Функция ПолучитьСписокТестов(Знач ЮнитТесты) Экспорт

	юТест = ЮнитТесты;
	
	СписокТестов = Новый Массив;
	СписокТестов.Добавить("ТестДолжен_ОбработатьПустойПараметрТестирования");
	СписокТестов.Добавить("ТестДолжен_ОбработатьТиповыеПараметрыТестированияОдногоСкрипта");
	СписокТестов.Добавить("ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаИУказанииПутиЛогФайлаJUnit");
	СписокТестов.Добавить("ТестДолжен_ОбработатьПараметрТестированияОдногоСкрипта_БезКомандыЗапустить");
	СписокТестов.Добавить("ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоИмени");
	СписокТестов.Добавить("ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоИмени_БезКомандыЗапустить");
	СписокТестов.Добавить("ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоНомеру");
	СписокТестов.Добавить("ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоНомеру_БезКомандыЗапустить");
	СписокТестов.Добавить("ТестДолжен_ОбработатьТиповыеПараметрыТестированияКаталога");
	СписокТестов.Добавить("ТестДолжен_ОбработатьПараметрыТестированияКаталогаИУказанииПутиЛогФайлаJUnit");
	СписокТестов.Добавить("ТестДолжен_ОбработатьТиповыеПараметрыВыводаСпискаТестов");
	
	СписокТестов.Добавить("ТестДолжен_Проверить_ВСтрокеСодержатсяТолькоЦифры_ЕслиСтрокаИЧисло");
	
	Возврат СписокТестов;

КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	СтруктураПараметровЗапуска = юТест.СоздатьСтруктуруПараметровЗапуска();
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПустойПараметрТестирования() Экспорт
	МассивПараметров = Новый Массив;
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска, Неопределено, "ПараметрыЗапуска");
КонецПроцедуры

Процедура ТестДолжен_ОбработатьТиповыеПараметрыТестированияОдногоСкрипта() Экспорт
	ПутьТестов = "test1.os";
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить("-run");
	МассивПараметров.Добавить(ПутьТестов);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьЗаполненность(СтруктураПараметровЗапуска, "СтруктураПараметровЗапуска заполненность");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.Запустить, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");

	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПараметрТестированияОдногоСкрипта_БезКомандыЗапустить() Экспорт
	ПутьТестов = "test1.os";
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить(ПутьТестов);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьЗаполненность(СтруктураПараметровЗапуска, "СтруктураПараметровЗапуска заполненность");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.Запустить, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");

	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаИУказанииПутиЛогФайлаJUnit() Экспорт
	ПутьТестов = "test1.os";
	ПутьЛогФайла = "f:/tests";
	
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить("-run");
	МассивПараметров.Добавить(ПутьТестов);
	МассивПараметров.Добавить("xddReportPath");
	МассивПараметров.Добавить(ПутьЛогФайла);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьЗаполненность(СтруктураПараметровЗапуска, "СтруктураПараметровЗапуска заполненность");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.Запустить, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");
	ЮТест.ПроверитьРавенство(ПутьЛогФайла, ПараметрыЗапуска.ПутьЛогФайлаJUnit, "ПараметрыЗапуска.ПутьЛогФайлаJUnit");

	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоИмени() Экспорт
	ПутьТестов = "test1.os";
	ИмяТеста = "Тест1";
	
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить("-run");
	МассивПараметров.Добавить(ПутьТестов);
	МассивПараметров.Добавить(ИмяТеста);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьЗаполненность(СтруктураПараметровЗапуска, "СтруктураПараметровЗапуска заполненность");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.Запустить, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");

	ЮТест.ПроверитьРавенство(ИмяТеста, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоИмени_БезКомандыЗапустить() Экспорт
	ПутьТестов = "test1.os";
	ИмяТеста = "Тест1";
	
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить(ПутьТестов);
	МассивПараметров.Добавить(ИмяТеста);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьЗаполненность(СтруктураПараметровЗапуска, "СтруктураПараметровЗапуска заполненность");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.Запустить, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");

	ЮТест.ПроверитьРавенство(ИмяТеста, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоИмениИУказанииПутиЛогФайлаJUnit() Экспорт
	ПутьТестов = "test1.os";
	ИмяТеста = "Тест1";
	ПутьЛогФайла = "f:/tests";
	
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить("-run");
	МассивПараметров.Добавить(ПутьТестов);
	МассивПараметров.Добавить(ИмяТеста);
	МассивПараметров.Добавить("xddReportPath");
	МассивПараметров.Добавить(ПутьЛогФайла);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьЗаполненность(СтруктураПараметровЗапуска, "СтруктураПараметровЗапуска заполненность");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.Запустить, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");
	ЮТест.ПроверитьРавенство(ПутьЛогФайла, ПараметрыЗапуска.ПутьЛогФайлаJUnit, "ПараметрыЗапуска.ПутьЛогФайлаJUnit");

	ЮТест.ПроверитьРавенство(ИмяТеста, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоНомеру() Экспорт
	ПутьТестов = "test1.os";
	НомерТеста = 4;
	
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить("-run");
	МассивПараметров.Добавить(ПутьТестов);
	МассивПараметров.Добавить(НомерТеста);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьЗаполненность(СтруктураПараметровЗапуска, "СтруктураПараметровЗапуска заполненность");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.Запустить, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");

	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(НомерТеста, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПараметрыТестированияОдногоТестаПоНомеру_БезКомандыЗапустить() Экспорт
	ПутьТестов = "test1.os";
	НомерТеста = 4;
	
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить(ПутьТестов);
	МассивПараметров.Добавить(НомерТеста);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьЗаполненность(СтруктураПараметровЗапуска, "СтруктураПараметровЗапуска заполненность");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.Запустить, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");

	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(НомерТеста, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьТиповыеПараметрыТестированияКаталога() Экспорт
	ПутьТестов = "f:/tests";
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить("-runall");
	МассивПараметров.Добавить(ПутьТестов);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.ЗапуститьКаталог, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");

	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьПараметрыТестированияКаталогаИУказанииПутиЛогФайлаJUnit() Экспорт
	ПутьТестов = "f:/tests";
	ПутьЛогФайла = "f:/tests";
	
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить("-runall");
	МассивПараметров.Добавить(ПутьТестов);
	МассивПараметров.Добавить("xddReportPath");
	МассивПараметров.Добавить(ПутьЛогФайла);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.ЗапуститьКаталог, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");
	ЮТест.ПроверитьРавенство(ПутьЛогФайла, ПараметрыЗапуска.ПутьЛогФайлаJUnit, "ПараметрыЗапуска.ПутьЛогФайлаJUnit");

	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_ОбработатьТиповыеПараметрыВыводаСпискаТестов() Экспорт
	ПутьТестов = "test1.os";
	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить("-show");
	МассивПараметров.Добавить(ПутьТестов);
	
	ПараметрыЗапуска = РазобратьПараметрыЗапуска(МассивПараметров);
	
	ЮТест.ПроверитьРавенство(Тип("Структура"), ТипЗнч(ПараметрыЗапуска), "ТипЗнч(ПараметрыЗапуска)");
	ЮТест.ПроверитьРавенство(ПараметрыЗапуска.Команда, СтруктураПараметровЗапуска.ПоказатьСписок, "ПараметрыЗапуска.Команда");
	
	ЮТест.ПроверитьРавенство(ПутьТестов, ПараметрыЗапуска.ПутьКТестам, "ПараметрыЗапуска.ПутьКТестам");

	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НаименованиеТестаДляЗапуска, "ПараметрыЗапуска.НаименованиеТестаДляЗапуска");
	ЮТест.ПроверитьРавенство(Неопределено, ПараметрыЗапуска.НомерТестаДляЗапуска, "ПараметрыЗапуска.НомерТестаДляЗапуска");
	
КонецПроцедуры

Процедура ТестДолжен_Проверить_ВСтрокеСодержатсяТолькоЦифры_ЕслиСтрокаИЧисло() Экспорт
	Исх = "Тест1";
	естьТолькоЦифра = юТест.ВСтрокеСодержатсяТолькоЦифры(Исх);
	юТест.ПроверитьЛожь(естьТолькоЦифра, "естьТолькоЦифра");
КонецПроцедуры

Функция РазобратьПараметрыЗапуска(МассивПараметров) Экспорт
	Возврат ЮТест.ПолучитьПараметрыЗапуска(МассивПараметров);
КонецФункции
