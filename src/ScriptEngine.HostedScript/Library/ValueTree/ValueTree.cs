﻿/*----------------------------------------------------------
This Source Code Form is subject to the terms of the 
Mozilla Public License, v.2.0. If a copy of the MPL 
was not distributed with this file, You can obtain one 
at http://mozilla.org/MPL/2.0/.
----------------------------------------------------------*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;

namespace ScriptEngine.HostedScript.Library.ValueTree
{
    /// <summary>
    /// Дерево значений.
    /// Древовидная структура с фунциональностью подобно таблице значений.
    /// </summary>
    [ContextClass("ДеревоЗначений", "ValueTree")]
    class ValueTree : AutoContext<ValueTree>
    {
        private ValueTreeColumnCollection _columns = new ValueTreeColumnCollection();
        private ValueTreeRowCollection _rows;

        public ValueTree()
        {
            _rows = new ValueTreeRowCollection(this, null, 0);
        }

        [ContextProperty("Колонки", "Columns")]
        public ValueTreeColumnCollection Columns
        {
            get { return _columns; }
        }

        [ContextProperty("Строки", "Rows")]
        public ValueTreeRowCollection Rows
        {
            get { return _rows;  }
        }

        /// <summary>
        /// Создаёт копию дерева значений.
        /// </summary>
        /// <param name="Rows">Массив. Строки для копирования. Если не указан, копируются все строки. Необязательный параметр.</param>
        /// <param name="ColumnNames">Строка. Список колонок через запятую, которые должны быть скопированы. Необязательный параметр.</param>
        /// <returns>ДеревоЗначений. Копия исходного дерева значений.</returns>
        [ContextMethod("Скопировать", "Copy")]
        public ValueTree Copy(IValue Rows = null, string ColumnNames = null)
        {

            // TODO: отрабатывать параметр Rows
            // TODO: отрабатывать параметр ColumnNames

            ValueTree result = new ValueTree();
            result._columns.CopyFrom(_columns);
            result._rows.CopyFrom(_rows);
            return result;
        }


        [ScriptConstructor]
        public static IRuntimeContextInstance Constructor()
        {
            return new ValueTree();
        }
    }
}