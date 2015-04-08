package trie;

import java.util.*;

public class Node implements Comparable<Node>
{
        private Character val;
        private Map<Character, Node> children;

        public Node()
        {
            children = new LinkedHashMap<>();
        }

        public Node(Character val)
        {
            children = new LinkedHashMap<>();
            this.val = val;
        }

        public Character getValue()
        {
            return this.val;
        }

        public Node getChild(Character c)
        {
            return children.get(c);
        }

        public List<Node> getChildren()
        {
            List<Node> elem_sort = new LinkedList<>(children.values());
            Collections.sort(elem_sort);
            return elem_sort;
        }

        public boolean hasChild(Character c)
        {
            return (children.get(c) != null);
        }

        public Node addChild(Character c)
        {
            Node child = new Node(c);

            children.put(c, child);
            return child;
        }

        @Override
        public int compareTo(Node n)
        {
            return val.compareTo(n.val);
        }
}