
Перем Токенизатор;
Перем ПрошлиЗаголовок;

Процедура ПриСозданииОбъекта(Лексер)
	Токенизатор = Лексер;
	ПрошлиЗаголовок = Ложь;
КонецПроцедуры

Функция Распарсить() Экспорт
	ТекущийМассив = Новый Массив();

	Пока Токенизатор.ЕстьЕщеТокены() Цикл

		Токен = Токенизатор.СледующийТокен();

		Если ПрошлиЗаголовок = Ложь И Не Токен.ТипТокена() = "Открыть" Тогда
			Продолжить;
		КонецЕсли;

		ПрошлиЗаголовок = Истина;

		Если Токен.ТипТокена() = "Открыть" Тогда
			ТекущийМассив.Добавить(Распарсить());
			Продолжить;
		КонецЕсли;

		Если Токен.ТипТокена() = "Идентификатор" 
				ИЛИ Токен.ТипТокена() = "Число"
				ИЛИ Токен.ТипТокена() = "Строка"  Тогда
			ТекущийМассив.Добавить(Токен.Значение());
		КонецЕсли;

		Если Токен.ТипТокена() = "Закрыть" Тогда
			Возврат ТекущийМассив; 
		КонецЕсли;

	КонецЦикла;

	Возврат ТекущийМассив;

КонецФункции