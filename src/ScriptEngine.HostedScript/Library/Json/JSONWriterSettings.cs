/*----------------------------------------------------------
This Source Code Form is subject to the terms of the 
Mozilla Public License, v.2.0. If a copy of the MPL 
was not distributed with this file, You can obtain one 
at http://mozilla.org/MPL/2.0/.
----------------------------------------------------------*/

using ScriptEngine.Machine;
using ScriptEngine.Machine.Contexts;

namespace ScriptEngine.HostedScript.Library.Json
{
    using JSONCharactersEscapeType = SelfAwareEnumValue<JSONCharactersEscapeModeEnum>;
    using JSONLineBreakType = SelfAwareEnumValue<JSONLineBreakEnum>;

    /// <summary>
    /// 
    /// Определяет набор параметров, используемых при записи JSON.
    /// </summary>
    [ContextClass("ПараметрыЗаписиJSON", "JSONWriterSettings")]
    public class JSONWriterSettings : AutoContext<JSONWriterSettings>
    {

        private bool _useDoubleQuotes;

        private JSONLineBreakType _newLines;

        private string _paddingSymbols;

        private JSONCharactersEscapeType _escapeCharacters;
        private bool _escapeAmpersand;
        private bool _escapeSingleQuotes;
        private bool _escapeLineTerminators;
        private bool _escapeSlash;
        private bool _escapeAngleBrackets;

        public JSONWriterSettings()
        {
            _newLines = (JSONLineBreakType)GlobalsManager.GetEnum<JSONLineBreakEnum>().Auto;
            _paddingSymbols = "";
            _useDoubleQuotes = true;
            _escapeCharacters = (JSONCharactersEscapeType)GlobalsManager.GetEnum<JSONCharactersEscapeModeEnum>().None;
            _escapeAngleBrackets = false;
            _escapeLineTerminators = true;
            _escapeAmpersand = false;
            _escapeSingleQuotes = false;
            _escapeSlash = false;
        }

        public JSONWriterSettings(JSONLineBreakType NewLines , string PaddingSymbols, bool UseDoubleQuotes,
            JSONCharactersEscapeType EscapeCharacters, bool EscapeAngleBrackets, bool EscapeLineTerminators,
            bool EscapeAmpersand, bool EscapeSingleQuotes, bool EscapeSlash)
        {
            _newLines = NewLines;
            _paddingSymbols = PaddingSymbols;
            _useDoubleQuotes = UseDoubleQuotes;
            _escapeCharacters = EscapeCharacters;
            _escapeAngleBrackets = EscapeAngleBrackets;
            _escapeLineTerminators = EscapeLineTerminators;
            _escapeAmpersand = EscapeAmpersand;
            _escapeSingleQuotes = EscapeSingleQuotes;
            _escapeSlash = EscapeSlash;
        }

        /// <summary>
        /// 
        /// Создает объект параметров записи JSON.
        /// </summary>
        ///
        /// <param name="newLines">
        /// Определяет способ переноса строк, который будет использован при записи данных JSON.
        /// Значение по умолчанию: Авто. </param>
        /// <param name="paddingSymbols">
        /// Определяет символы отступа, используемые при записи данных JSON.
        /// Применяется только, если значение ПереносСтрокJSON отлично от Нет.
        /// Значение по умолчанию: " ". </param>
        /// <param name="useDoubleQuotes">
        /// Определяет, будут ли при записи имена свойств JSON записываться в двойных кавычках.
        /// Значение по умолчанию: Истина. </param>
        /// <param name="escapeCharacters">
        /// Определяет используемый способ экранирования (замены) символов при записи данных JSON.
        /// Значение по умолчанию: Нет. </param>
        /// <param name="escapeAngleBrackets">
        /// Определяет, будут ли при записи экранироваться символы '&lt;' и '&gt;'.
        /// Значение по умолчанию: Ложь. </param>
        /// <param name="escapeLineTerminators">
        /// Определяет, будут ли экранироваться разделители строк - U+2028 (line-separator) и U+2029 (page-separator).
        /// Значение по умолчанию: Истина. </param>
        /// <param name="escapeAmpersand">
        /// Определяет, будет ли при записи экранироваться символ амперсанда '&amp;'.
        /// Значение по умолчанию: Ложь. </param>
        /// <param name="escapeSingleQuotes">
        /// Определяет, будут ли экранироваться одинарные кавычки.
        /// Устанавливается в значение Истина, если ИспользоватьДвойныеКавычки установлено в Ложь.
        /// Значение по умолчанию: Ложь. </param>
        /// <param name="escapeSlash">
        /// Определяет, будет ли экранироваться слеш (косая черта) при записи значения.
        /// Значение по умолчанию: Ложь. </param>
        [ScriptConstructor(Name = "По описанию параметров записи")]
        public static JSONWriterSettings Constructor(IValue newLines = null, string paddingSymbols = "", bool useDoubleQuotes = true,
            IValue escapeCharacters = null, bool escapeAngleBrackets = false, bool escapeLineTerminators = true,
            bool escapeAmpersand = false, bool escapeSingleQuotes = false, bool escapeSlash = false)
        {
            JSONLineBreakType linesBreakMode;
            JSONCharactersEscapeType escapeCharactersMode;

            if (newLines == null)
            {
                var LineBreakEnum = GlobalsManager.GetEnum<JSONLineBreakEnum>();
                linesBreakMode = (JSONLineBreakType)LineBreakEnum.Auto;
            }
            else if (newLines.GetRawValue() is JSONLineBreakType lineBr)
            {
                linesBreakMode = lineBr;
            }
            else
                throw RuntimeException.InvalidNthArgumentType(1);


            if (escapeCharacters == null)
            {
                var JsonCharactersEscapeModeEnum = GlobalsManager.GetEnum<JSONCharactersEscapeModeEnum>();
                escapeCharactersMode = (JSONCharactersEscapeType)JsonCharactersEscapeModeEnum.None;
            }
            else if (escapeCharacters.GetRawValue() is JSONCharactersEscapeType escCh)
            {
                escapeCharactersMode = escCh;
            }
            else
                throw RuntimeException.InvalidNthArgumentType(4);

            return new JSONWriterSettings(linesBreakMode, paddingSymbols, useDoubleQuotes,
                                          escapeCharactersMode, escapeAngleBrackets, escapeLineTerminators,
                                          escapeAmpersand, escapeSingleQuotes, escapeSlash );
        }

        /// <summary>
        /// 
        /// Never used
        /// </summary>
        ///
        //[ScriptConstructor]
        //public static JSONWriterSettings Constructor()
        //{
        //    return new JSONWriterSettings();
        //}

        /// <summary>
        /// 
        /// Определяет использование двойных кавычек при записи свойств и значений JSON.
        /// После создания объекта данное свойство имеет значение Истина.
        /// </summary>
        /// <value>Булево (Boolean)</value>
        [ContextProperty("ИспользоватьДвойныеКавычки", "UseDoubleQuotes")]
        public bool UseDoubleQuotes
        {
            get { return _useDoubleQuotes; }
	
        }


        /// <summary>
        /// 
        /// Управляет размещением начала и конца объектов и массивов, ключей и значений на новой строке.
        /// Также установка данного свойства в значение, отличное от Нет, добавляет пробел между именем свойства, двоеточием и значением.
        /// После создания объекта данное свойство имеет значение Авто.
        /// </summary>
        /// <value>ПереносСтрокJSON (JSONLineBreak)</value>
        [ContextProperty("ПереносСтрок", "NewLines")]
        public JSONLineBreakType NewLines => _newLines;

        /// <summary>
        /// 
        /// Определяет символы отступа, используемые при записи документа JSON.
        /// Свойство не используется, если свойство ПереносСтрокJSON установлено в значение Нет.
        /// После создания объекта данное свойство имеет значение - один пробельный символ.
        /// </summary>
        /// <value>Строка (String)</value>
        [ContextProperty("СимволыОтступа", "PaddingSymbols")]
        public string PaddingSymbols
        {
            get { return _paddingSymbols; }
	
        }


        /// <summary>
        /// 
        /// Определяет способ экранирования символов при записи документа JSON.
        /// После создания объекта данное свойство имеет значение СимволыВнеASCII.
        /// </summary>
        /// <value>ЭкранированиеСимволовJSON (JSONCharactersEscapeMode)</value>
        [ContextProperty("ЭкранированиеСимволов", "EscapeCharacters")]
        public JSONCharactersEscapeType EscapeCharacters => _escapeCharacters;


        /// <summary>
        /// 
        /// Определяет, будет ли экранироваться знак амперсанда при записи документа JSON.
        /// После создания объекта данное свойство имеет значение Ложь.
        /// </summary>
        /// <value>Булево (Boolean)</value>
        [ContextProperty("ЭкранироватьАмперсанд", "EscapeAmpersand")]
        public bool EscapeAmpersand
        {
            get { return _escapeAmpersand; }
	
        }


        /// <summary>
        /// 
        /// Определяет, будет ли экранирован знак одинарной кавычки при записи документа JSON.
        /// Имеет значение Истина, если ИспользоватьДвойныеКавычки установлен Ложь.
        /// После создания объекта данное свойство имеет значение Ложь
        /// </summary>
        /// <value>Булево (Boolean)</value>
        [ContextProperty("ЭкранироватьОдинарныеКавычки", "EscapeSingleQuotes")]
        public bool EscapeSingleQuotes
        {
            get { return _escapeSingleQuotes; }	
        }


        /// <summary>
        /// 
        /// Определяет экранирование символов "U+2028" (разделитель строк) и "U+2029" (разделитель абзацев) для совместимости с JavaScript.
        /// После создания объекта данное свойство имеет значение Истина.
        /// </summary>
        /// <value>Булево (Boolean)</value>
        [ContextProperty("ЭкранироватьРазделителиСтрок", "EscapeLineTerminators")]
        public bool EscapeLineTerminators
        {
            get { return _escapeLineTerminators; }
	
        }


        /// <summary>
        /// 
        /// Определяет, будет ли экранироваться слеш (косая черта) при записи значения.
        /// После создания объекта данное свойство имеет значение Ложь.
        /// </summary>
        /// <value>Булево (Boolean)</value>
        [ContextProperty("ЭкранироватьСлеш", "EscapeSlash")]
        public bool EscapeSlash
        {
            get { return _escapeSlash; }
	
        }


        /// <summary>
        /// 
        /// Определяет, будут ли экранированы знаки угловых скобок при записи документа JSON.
        /// После создания объекта данное свойство имеет значение Ложь.
        /// </summary>
        /// <value>Булево (Boolean)</value>
        [ContextProperty("ЭкранироватьУгловыеСкобки", "EscapeAngleBrackets")]
        public bool EscapeAngleBrackets
        {
            get { return _escapeAngleBrackets; }
	
        }

    }
}
