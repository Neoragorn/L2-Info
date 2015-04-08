package trie;

import java.util.*;

public class Trie
{
    private final Node root;

    public Trie()
    {
        root = new Node((char)0);
    }

    public void add(String word)
    {
        Node node = this.root;

        for (Character c : word.toCharArray())
         if (node.hasChild(c))
            node = node.getChild(c);
         else
            node = node.addChild(c);
    }

    public boolean contains(String word)
    {
       Node node = root;
       int i = 0;
       
       while (node != null && i < word.length())
       {
         node = node.getChild(word.charAt(i));
         i++;
       }
       return (node != null);
     }
     
   public void printTrie (Node node, int offset)
   {
    print(node, offset);
    for (Node child : node.getChildren())
      printTrie(child, offset + 2);
    
   }

   public void print()
   {
      printTrie(this.root, 0);
   }
}