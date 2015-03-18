/**
 * Word class : methods on Words (tp3) licence S4 - UE POO
 * 
 * @author : 
 */

public class Word {

	// ATTRIBUTS
        /* contains the string that represents the character of this word */
	private String value;

	// CONSTRUCTEURS
	public Word(String s)
	{
		this.value = s;
	}

	// METHODES
	/**
	 * returns <code>true</code> if <code>o</code> is equals to this word object, ie if
	 * <code>o</code> is a Word and its value is the same as this word's value
	 * 
	 * @param o
	 *            the object to be compared with this Word
	 * @return <code>true</code> iff <code>o</code> is a Word with the same value as this word.
	 */
	public boolean equals(Object o) 
	{
		if (o instanceof Word)
		{
			Word theOther = (Word) o;
			return this.value.equals(theOther.value);
		} 
		else 
		{
			return false;
		}
	}

	/**
	 * Renvoie le nombre de caracteres dans la méthode 
	 *
	 */
	public int nbOfChars()
	{
		return (this.value.length());
	}

	/**
	 * Affiche le mot contenu dans l'objet Word
	 *
	 */
	public String toString()
	{
		return (this.value);
	}

	/**
	* calcule le nombre d’occurrences d’un caractere @param
	* (en parametre) dans le mot
	*/
	public int nbOccurrencesOfChar(char c)
	{
		int i = 0, check = 0;
		int n = this.nbOfChars();
		while (i != n)
		{
			if (value.indexOf(c, i) == i)
				check++;
			i++;
		}
		return check;


	} // nbOccurrencesOfChar

	/**
	 *  @return un objet Word dont les caractères de l'attribut value ont été inversés 
	 *
	 */
	public Word reverse()
	{
		String t_final = "";
		for (int i=this.value.length() - 1; i >= 0; i--)
		{
			t_final = t_final + value.charAt(i);
		}
		Word reversed = new Word(t_final);
		return reversed;
	}

	/**
	 * @return un booleen, est vrai si l'attribut value de l'objet Word est un
	 *  palindrome
	 */
	public boolean isPalindrome()
	{
		Word pal = reverse();
		if (pal.equals(this))
			return true;
		return false;
	} // estPalindrome

	/**
	 *  @return un boolean, est vrai si le Word en @param est retrouvé dans
	 *  l'attribut value du Word instancié
	 */
	public boolean contains(Word m)
	{
		for (int i=0; i != value.length();i++)
		{
			String tmp = value.substring(0, i);
			if (tmp.equals(m.value) == true)
				return true;
		}
		return false;
	}

	/**
	 * @return un boolean, est vrai si les 3 derniers caractères
	 *  du value du Word en parametre sont les mêmes que le Word instancié
	 */
	public boolean rhymesWith(Word m)
	{
		String tmp = value.substring(value.length() - 3, value.length());
		System.out.println(tmp);
		if (m.value.endsWith(tmp))
			return true;
		return false;
	}

	/**
	 * @return un booleen. Est vrai si l'attribut value du Word est un nom propre.
	 */
	public boolean isProperNoun()
	{
		if (Character.isUpperCase(this.value.charAt(0)))
			return true;
		return false;
	}

	/**
	 * @return un boolean, est vrai si le Word en parametre et le Word instancié
	 *  sont des anagrammes.
	 */
	public boolean isAnagram(Word m)
	{
		int	tab[] = new int[256];
		int	tab2[] = new int[256];
		for (int i=0;i<256;i++)
		{
			tab[i] = 0;
			tab2[i] = 0;
		}
		for (int i = 0;i != this.value.length();i++)
			tab[(int)value.charAt(i)]++;
		for (int i = 0;i != m.value.length();i++)
			tab2[(int)m.value.charAt(i)]++;
		for (int i = 0; i != 256;i++)
		{
			if (tab[i] != tab2[i])
				return false;
		}
		return true;
	}

	/**
	 * @return un tableau de 2 Word. Le premier correspondant au plus petit prefixe du mot
	 *  précédant la premiere occurence du caractere donne en parametre, le second étant le
	 * reste du mot. Si le caractere n'est pas trouve, on renvoie un tableau dont le premier
	 * word est vide et le deuxieme contient le mot
	 */
	public Word[] extractBefore(char c)
	{
		String s1 = "";
		int i;
		Word[] tab;

		tab = new Word[2];
		if ( (i = value.indexOf(c)) == i)
		{
			tab[0] = new Word(this.value.substring(0, i + 1));
			tab[1] = new Word(this.value.substring(i + 1, this.value.length()));
		}
		else
		{
			tab[0].value = null;
			tab[1].value = this.value;
		}
		return tab;
	}

	public static void main(String[] args)
	{
		Word w = new Word(args[0]);
		Word r = new Word(args[1]);
/*		System.out.println (w.nbOfChars());
		System.out.println(w.toString());
		System.out.println(w.nbOccurrencesOfChar('a'));
		System.out.println(w.contains(r));
		System.out.println(w.reverse());
		System.out.println(w.rhymesWith(r));
		w.extractBefore('p'); */
		w.isPalindrome();
		System.out.println(w.isAnagram(r));
		System.out.println(w.isProperNoun());
	}
}
