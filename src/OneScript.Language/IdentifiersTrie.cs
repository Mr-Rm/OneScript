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

            public TrieNode Find(char ch)
            {
                var node = this;
                while (node != null)
                {
                    if (node.charL == ch || node.charU == ch)
                        return node;
                    node = node.sibl;
                }
                return null;
            }
        }

        private TrieNode _root;

        public IdentifiersTrie()
        {
            //_root = new TrieNode();
        }

        public void Add(string str, T val)
        {
            var node = _root;
            var key = node;
            int i = 0;
            for (; i < str.Length; ++i)
            {
                if (node == null)
                {
                    break;
                }

                char ch = str[i];
                //key = node.Find(ch);
                key = node;
                TrieNode last=null;
                do
                {
                    if (key.charL == ch || key.charU == ch)
                        break;
                    last = key;
                    key = key.sibl;
                } while (key != null);

                if (key == null)
                {
                    key = new TrieNode
                    {
                        charL = char.ToLower(ch),
                        charU = char.ToUpper(ch),
                    };

                    last.sibl = key;
                    ++i;
                    break;
                }
                else
                {
                    node = key.next;
                }
            }

            if (i==0)
            {
                char ch = str[i];
                _root = new TrieNode
                {
                    charL = char.ToLower(ch),
                    charU = char.ToUpper(ch),
                };
                key = _root;
                ++i;
            }
            for (; i < str.Length; ++i)
            {
                char ch = str[i];
                node = new TrieNode
                {
                    charL = char.ToLower(ch),
                    charU = char.ToUpper(ch),
                };
                key.next = node;
                key = node;
            }

            key.value = val;
        }

        public void Add1(string str, T val)
        {
            var node = _root;
            var key = node;
            foreach (char ch in str)
            {
                if (node == null)
                {
                    node = new TrieNode
                    {
                        charL = char.ToLower(ch),
                        charU = char.ToUpper(ch),
                    };
                    key.next = node;
                    key = node;
                    node = null;
                }
                else
                {
                    key = node.Find(ch);
                    if (key == null)
                    {
                        key = new TrieNode
                        {
                            charL = char.ToLower(ch),
                            charU = char.ToUpper(ch),
                            sibl = node.sibl,
                        };
                        node.sibl = key;
                    }
                    node = key.next;
                }
            }

            key.value = val;
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
            var node = _root;
            TrieNode key = null;
            foreach (char ch in str)
            {
                key = node.Find(ch);
                if (key == null)
                    throw new KeyNotFoundException();

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
            var node = _root;
            TrieNode key = null;
            foreach (char ch in str)
            {
                //key = node.Find(ch);
                while (node != null)
                {
                    if (node.charL == ch || node.charU == ch)
                        break;
                    node = node.sibl;
                }
                if (node == null)
                {
                    value = default(T);
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
