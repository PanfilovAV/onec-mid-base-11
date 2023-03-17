#Область ПрограммныйИнтерфейс  

Процедура ДополнитьФорму(Форма) Экспорт
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма); 
		ДобавитьПолеСогласованнаяСкидка(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма); 
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма); 
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма); 
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
	ИначеЕсли ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаСписка" Тогда
		ВставитьПолеКонтактноеЛицоВФормуСписка(Форма)	
	КонецЕсли;
	
	

КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс 

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма) Экспорт
	
	ПолеВвода = Форма.Элементы.Добавить("ап_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво); 
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ап_КонтактноеЛицо"
	
КонецПроцедуры  

Процедура ДобавитьПолеСогласованнаяСкидка(Форма) Экспорт
	Группа = Форма.Элементы.Вставить("ап_ГруппаСкидка", Тип("ГруппаФормы"), Форма, Форма.Элементы.Страницы);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа.Заголовок = "Группа Скидка";    
	Группа.Группировка = ГруппировкаПодчиненныхЭлементовФормы.ГоризонтальнаяЕслиВозможно;
	
	ПолеВвода = Форма.Элементы.Добавить("ап_СогласованнаяСкидка", Тип("ПолеФормы"), Группа); 
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ап_СогласованнаяСкидка"; 
	ПолеВвода.УстановитьДействие("ПриИзменении", "ап_СогласованнаяСкидкаПриИзменении");
	
	КомандаФормы = Форма.Команды.Добавить("ап_ПересчитатьТаблицу");
	КомандаФормы.Заголовок = "Пересчитать таблицу";
	КомандаФормы.Действие = "ап_ПересчитатьТаблицуНажатие";
		
	Кнопка = Форма.Элементы.Добавить("ап_КнопкаПересчитатьТаблицу", Тип("КнопкаФормы"), Группа); 
	Кнопка.ИмяКоманды = "ап_ПересчитатьТаблицу";
	Кнопка.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоВФормуСписка(Форма) Экспорт 
	
	ПолеВвода = Форма.Элементы.Вставить("ап_КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.Список, Форма.Элементы.Договор); 
	ПолеВвода.Вид = ВидПоляФормы.ПолеНадписи;
	ПолеВвода.ПутьКДанным = "Список.ап_КонтактноеЛицо";
	
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма) Экспорт

	ПолеВвода = Форма.Элементы.Вставить("ап_КонтактноеЛицо", Тип("ПолеФормы"), Форма, Форма.Элементы.СуммаДокумента); 
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.ап_КонтактноеЛицо";
	
КонецПроцедуры	
	
#КонецОбласти
