Перем юТест;

////////////////////////////////////////////////////////////////////
// Программный интерфейс

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеАннотацийМетода");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеАннотацийПараметров");
	
	Возврат ВсеТесты;
	
КонецФункции

Процедура САннотированнымиПараметрами(
	
	&АннотацияДляПараметра
	Знач Парам1,

	&АннотацияДляПараметра
	&АннотацияДляПараметра1
	&АннотацияДляПараметра2(СПараметрами = 3, 4, 5)
	Знач Парам2,

	Парам3,
	Парам4 = Неопределено
) Экспорт

КонецПроцедуры

&НаСервере
&НаКлиентеНаСервереБезКонтекста
&НаЧемУгодно(ДажеСПараметром = "Да", СПараметромБезЗначения, "Значение без параметра")
&НаЧемУгодно(ДажеДважды = Истина)
Процедура ТестДолжен_ПроверитьПолучениеАннотацийМетода() Экспорт

	Рефлектор = Новый Рефлектор;
	ТаблицаМетодов = Рефлектор.ПолучитьТаблицуМетодов(ЭтотОбъект);

	юТест.ПроверитьНеРавенство(ТаблицаМетодов.Колонки.Найти("Аннотации"), Неопределено, "Есть колонка Аннотации");

	СтрокаМетода = ТаблицаМетодов.Найти("ТестДолжен_ПроверитьПолучениеАннотацийМетода", "Имя");
	юТест.ПроверитьНеРавенство(СтрокаМетода, Неопределено, "Метод с аннотациями есть в таблице рефлектора");

	юТест.ПроверитьНеРавенство(СтрокаМетода.Аннотации, Неопределено, "Рефлектор знает про аннотации метода");
	юТест.ПроверитьРавенство(СтрокаМетода.Аннотации.Количество(), 4, "Рефлектор вернул верное количество аннотаций");

	юТест.ПроверитьРавенство(СтрокаМетода.Аннотации[0].Имя, "НаСервере", "Рефлектор сохранил порядок указания аннотаций");
	юТест.ПроверитьРавенство(СтрокаМетода.Аннотации[1].Имя, "НаКлиентеНаСервереБезКонтекста", "Рефлектор сохранил порядок указания аннотаций");
	юТест.ПроверитьРавенство(СтрокаМетода.Аннотации[2].Имя, "НаЧемУгодно", "Рефлектор сохранил порядок указания аннотаций");
	юТест.ПроверитьРавенство(СтрокаМетода.Аннотации[3].Имя, "НаЧемУгодно", "Рефлектор сохранил порядок указания аннотаций");

	Аннотация2 = СтрокаМетода.Аннотации[2];
	юТест.ПроверитьНеРавенство(Аннотация2.Параметры,                       Неопределено,             "Есть таблица параметров аннотации");
	юТест.ПроверитьРавенство  (Аннотация2.Параметры.Получить(0).Имя,       "ДажеСПараметром",        "Знаем имя именованного параметра");
	юТест.ПроверитьРавенство  (Аннотация2.Параметры.Получить(0).Значение,  "Да",                     "Знаем значение именованного параметра");
	юТест.ПроверитьРавенство  (Аннотация2.Параметры.Получить(1).Имя,       "СПараметромБезЗначения", "Знаем имя именованного параметра");
	юТест.ПроверитьРавенство  (Аннотация2.Параметры.Получить(1).Значение,  Неопределено,             "Знаем, что значение не определено");
	юТест.ПроверитьРавенство  (Аннотация2.Параметры.Получить(2).Имя,       Неопределено,             "Знаем, что имя не определно");
	юТест.ПроверитьРавенство  (Аннотация2.Параметры.Получить(2).Значение,  "Значение без параметра", "Знаем значение параметра без имени");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеАннотацийПараметров() Экспорт

	Рефлектор = Новый Рефлектор;
	ТаблицаМетодов = Рефлектор.ПолучитьТаблицуМетодов(ЭтотОбъект);

	юТест.ПроверитьНеРавенство(ТаблицаМетодов.Колонки.Найти("Параметры"), Неопределено, "Рефлектор знает о параметрах");

	СтрокаМетода = ТаблицаМетодов.Найти("САннотированнымиПараметрами", "Имя");
	юТест.ПроверитьРавенство(СтрокаМетода.Параметры.Количество(), 4, "Правильное количество параметров");

	Парам1 = СтрокаМетода.Параметры.Получить(0);
	Парам2 = СтрокаМетода.Параметры.Получить(1);
	Парам3 = СтрокаМетода.Параметры.Получить(2);
	Парам4 = СтрокаМетода.Параметры.Получить(3);

	юТест.ПроверитьРавенство(Парам1.Аннотации.Получить(0).Имя, "АннотацияДляПараметра", "Аннотации параметров");
	юТест.ПроверитьРавенство(Парам2.Аннотации.Получить(0).Имя, "АннотацияДляПараметра", "Аннотации параметров");
	юТест.ПроверитьРавенство(Парам2.Аннотации.Получить(1).Имя, "АннотацияДляПараметра1", "Аннотации параметров");
	юТест.ПроверитьРавенство(Парам2.Аннотации.Получить(2).Имя, "АннотацияДляПараметра2", "Аннотации параметров");
	юТест.ПроверитьРавенство(Парам2.Аннотации.Получить(2).Параметры.Количество(), 3, "Параметры аннотации параметров");
	юТест.ПроверитьРавенство(Парам2.Аннотации.Получить(2).Параметры[0].Значение, 3, "Значения параметров аннотации параметров");
	юТест.ПроверитьРавенство(Парам2.Аннотации.Получить(2).Параметры[1].Значение, 4, "Значения параметров аннотации параметров");
	юТест.ПроверитьРавенство(Парам2.Аннотации.Получить(2).Параметры[2].Значение, 5, "Значения параметров аннотации параметров");
	юТест.ПроверитьРавенство(Парам3.Аннотации.Количество(), 0);
	юТест.ПроверитьРавенство(Парам4.Аннотации.Количество(), 0);
	
КонецПроцедуры
