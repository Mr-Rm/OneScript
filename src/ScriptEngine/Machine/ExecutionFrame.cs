/*----------------------------------------------------------
This Source Code Form is subject to the terms of the 
Mozilla Public License, v.2.0. If a copy of the MPL 
was not distributed with this file, You can obtain one 
at http://mozilla.org/MPL/2.0/.
----------------------------------------------------------*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ScriptEngine.Machine
{
    class ExecutionFrame
    {
        public IVariable[] Locals;
        public int InstructionPointer;
        public int LineNumber;
        public bool DiscardReturnValue;
        public string MethodName;
        public RuntimeException LastException;
        public LoadedModule Module;
        public bool IsReentrantCall;
        
        public Stack<IValue> LocalFrameStack = new Stack<IValue>();


        public Scope ModuleScope { get; set; }
        public int ModuleLoadIndex { get; set; }

        public override string ToString()
        {
            return $"{MethodName}: {LineNumber} ({Module.ModuleInfo.ModuleName})";
        }

        public ExecutionFrame(LoadedModule module)
        {
            Module = module;
        }

        public void SetParameters(MethodDescriptor method, IValue[] arguments)
        {
            var parameters = method.Signature.Params;
            for (int i = 0; i < parameters.Length; ++i)
            {
                if (i >= arguments.Length)
                    Locals[i] = Variable.Create(GetDefaultArgValue(parameters, i), method.Variables[i]);
                else if (arguments[i] is IVariable)
                {
                    if (parameters[i].IsByValue)
                    {
                        var value = ((IVariable)arguments[i]).Value;
                        Locals[i] = Variable.Create(value, method.Variables[i]);
                    }
                    else
                    {
                        // TODO: Alias ?
                        Locals[i] =
                            Variable.CreateReference((IVariable)arguments[i], method.Variables[i].Identifier);
                    }
                }
                else if (arguments[i] == null || arguments[i].DataType == DataType.NotAValidValue)
                    Locals[i] = Variable.Create(GetDefaultArgValue( parameters, i), method.Variables[i]);
                else
                    Locals[i] = Variable.Create(arguments[i], method.Variables[i]);
            }
        }

        private IValue GetDefaultArgValue(ParameterDefinition[] parameters, int paramIndex)
        {
            var param = parameters[paramIndex];
            if (!param.IsDefaultValueDefined())
            {
                return ValueFactory.Create();
            }

            return Module.Constants[param.DefaultValueIndex];
        }
    }

    public struct ExecutionFrameInfo
    {
        public string Source;
        public int LineNumber;
        public string MethodName;

        internal ExecutionFrame FrameObject;
    }
}
