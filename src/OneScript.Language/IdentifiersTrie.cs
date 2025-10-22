/*----------------------------------------------------------
This Source Code Form is subject to the terms of the
Mozilla Public License, v.2.0. If a copy of the MPL
was not distributed with this file, You can obtain one
at http://mozilla.org/MPL/2.0/.
----------------------------------------------------------*/

using System;
using System.Collections;
using System.Collections.Generic;

namespace OneScript.Language
{
    public class IdentifiersTrie<T> : IDictionary<string, T>
    {
        private class TrieNode
        {
            public char charL;
            public char charU;
            public T value;
            public TrieNode sibl;
            public TrieNode next;

            public TrieNode() { }
            public TrieNode(char ch)
                { charL = char.ToLower(ch); charU = char.ToUpper(ch); }

            public TrieNode Find(char ch)
            {
                for(var node = this; node != null; node = node.sibl)
                {
                    if (node.charL == ch || node.charU == ch)
                        return node;
                }
                return null;
            }
        }

        private readonly TrieNode _root;
        private TrieNode _first;

        public IdentifiersTrie()
        {
            _root = new TrieNode();
        }

        public void Add(string str, T val)
        {
            var node = _root;
            TrieNode key = node;
            foreach (char ch in str)
            {
                if (node == null)
                {
                    node = new TrieNode(ch);
                    key.next = node;
                    key = node;
                }
                else
                {
                    TrieNode last = node;
                    key = node;
                    while (key != null && key.charL != ch && key.charU != ch)
                    {
                        last = key;
                        key = key.sibl;
                    }
                    if (key == null)
                    {
                        key = new TrieNode(ch);
                        last.sibl = key;
                    }
                }
                node = key.next;
            }

            key.value = val;

            _first = _root.sibl;
        }

 
        public bool ContainsKey(string key)
        {
            throw new System.NotImplementedException();
        }

        public bool Remove(string key)
        {
            throw new System.NotImplementedException();
        }

        public T Get(string str)
        {
            var node = _first;
            TrieNode key = null;
            foreach (char ch in str)
            {
                while (node != null && node.charL != ch && node.charU != ch)
                {
                    node = node.sibl;
                }

                key = node ?? throw new KeyNotFoundException();
                node = key.next;
            }

            return key.value;
        }

        public T this[string index]
        {
            get => Get(index);
            set => Add(index, value);
        }

        public ICollection<string> Keys { get; }
        public ICollection<T> Values { get; }

        public bool TryGetValue(string str, out T value)
        {
            var node = _first;
            TrieNode key = null;
            foreach (char ch in str)
            {
                while (node != null && node.charL != ch && node.charU != ch)
                {
                    node = node.sibl;
                }
                if (node == null)
                {
                    value = default;
                    return false;
                }
                key = node;
                node = key.next;
            }

            value = key.value;
            return true;
        }

        public IEnumerator<KeyValuePair<string, T>> GetEnumerator()
        {
            throw new System.NotImplementedException();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        public void Add(KeyValuePair<string, T> item)
        {
            throw new System.NotImplementedException();
        }

        public void Clear()
        {
            throw new System.NotImplementedException();
        }

        public bool Contains(KeyValuePair<string, T> item)
        {
            throw new System.NotImplementedException();
        }

        public void CopyTo(KeyValuePair<string, T>[] array, int arrayIndex)
        {
            throw new System.NotImplementedException();
        }

        public bool Remove(KeyValuePair<string, T> item)
        {
            throw new System.NotImplementedException();
        }

        public int Count { get; }
        public bool IsReadOnly { get; }
    }
}
