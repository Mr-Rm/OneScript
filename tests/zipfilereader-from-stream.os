Перем юТест;
Перем ИмяФайла;
Перем ИмяАрхива;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтениеZIPИзПотока");
	
	Возврат ВсеТесты;
	
КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	ИнициализироватьТестовыеДанные();
КонецПроцедуры

Функция СоздатьВременныйФайл(Знач Расширение = "tmp")
	Возврат юТест.ИмяВременногоФайла(Расширение);
КонецФункции

Функция ИнициализироватьТестовыеДанные() Экспорт

	ИмяФайла = СоздатьВременныйФайл("txt"); 
	Сообщить(ИмяФайла);
	Текст = Новый ЗаписьТекста(ИмяФайла, КодировкаТекста.ANSI);
	Текст.ЗаписатьСтроку("Содержимое файла");
	Текст.Закрыть();
	
	ИмяАрхива = СоздатьВременныйФайл("zip");
	Архив = Новый ЗаписьZipФайла(ИмяАрхива);
	Архив.Добавить(ИмяФайла);
	Архив.Записать();
	
	УдалитьФайлы(ИмяФайла);

	Возврат ИмяАрхива; 

КонецФункции

Функция ТестДолжен_ПроверитьЧтениеZIPИзПотока() Экспорт
	
	ДвоичныеДанные = Новый ДвоичныеДанные(ИмяАрхива);
	Поток = ДвоичныеДанные.ОткрытьПотокДляЧтения();
	ЧтениеZipФайла = Новый ЧтениеZipФайла(Поток); 
		
	Файл = Новый Файл(ИмяФайла);
	юТест.ПроверитьЛожь(Файл.Существует(), ИмяФайла + ": должен быть удаленным после архивирования");
	ЧтениеZipФайла.ИзвлечьВсе(КаталогВременныхФайлов(), РежимВосстановленияПутейФайловZIP.НеВосстанавливать);  

	Файл = Новый Файл(ИмяФайла);
	юТест.ПроверитьИстину(Файл.Существует(), ИмяФайла + ": ожидаемый файл не существует.");

КонецФункции