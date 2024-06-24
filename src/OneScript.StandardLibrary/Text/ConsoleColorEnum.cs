/*----------------------------------------------------------
This Source Code Form is subject to the terms of the 
Mozilla Public License, v.2.0. If a copy of the MPL 
was not distributed with this file, You can obtain one 
at http://mozilla.org/MPL/2.0/.
----------------------------------------------------------*/

using System;
using OneScript.Contexts.Enums;
using OneScript.Exceptions;
using ScriptEngine.Machine;
using ScriptEngine.Machine.Contexts;

namespace OneScript.StandardLibrary.Text
{
    [EnumerationType("ЦветКонсоли", "ConsoleColor")]
    public enum ConsoleColorEnum
    {
        [EnumValue("Черный")]
        Black = System.ConsoleColor.Black,
        [EnumValue("ТемноСиний")]
        DarkBlue = ConsoleColor.DarkBlue,
        [EnumValue("ТемноЗеленый")]
        DarkGreen = ConsoleColor.DarkGreen,
        [EnumValue("ТемноБирюзовый")]
        DarkCyan = ConsoleColor.DarkCyan,
        [EnumValue("ТемноКрасный")]
        DarkRed = ConsoleColor.DarkRed,
        [EnumValue("ТемноМалиновый")]
        DarkMagenta = ConsoleColor.DarkMagenta,
        [EnumValue("ТемноЖелтый")]
        DarkYellow = ConsoleColor.DarkYellow,
        [EnumValue("Серый")]
        Gray = ConsoleColor.Gray,

        [EnumValue("ТемноСерый")]
        DarkGray = System.ConsoleColor.DarkGray,
        [EnumValue("Синий")]
        Blue = ConsoleColor.Blue,
        [EnumValue("Зеленый")]
        Green = ConsoleColor.Green,
        [EnumValue("Бирюза")]
        Cyan = ConsoleColor.Cyan,
        [EnumValue("Красный")]
        Red = ConsoleColor.Red,
        [EnumValue("Малиновый")]
        Magenta = ConsoleColor.Magenta,
        [EnumValue("Желтый")]
        Yellow = ConsoleColor.Yellow,
        [EnumValue("Белый")]
        White = ConsoleColor.White
    }
    
    public static class ConsoleColorEnumExt
    {
        public static IValue Wrap(this ConsoleColor color)
        {
            return ClrEnumWrapper<ConsoleColorEnum>.Instance?.FromNativeValue((ConsoleColorEnum)color);
        }

        public static ConsoleColor Unwrap(IValue color)
        {
            if (color.GetRawValue() is ClrEnumValueWrapper<ConsoleColorEnum> typed)
            {
                return (ConsoleColor)typed.UnderlyingValue;
            }

            throw new TypeConversionException();
        }
    }
}
