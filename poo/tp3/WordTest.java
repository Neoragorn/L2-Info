import org.junit.*;
import static org.junit.Assert.*;

public class WordTest {

    @Test
    public void testEquals(){
	Word word1 = new Word("hello");
	Word word2 = new Word("hello");
	Object obj = new Object();

	assertTrue(word1.equals(word2));
	assertFalse(word1.equals(obj));
    }

	@Test
	public void testNbOfChars() {
		Word word = new Word("bonjour");
		assertEquals(word.nbOfChars(), 7);
	}

	@Test
	public void testNbOccurrencesOfChar() {
		Word word1 = new Word("abracadabra");
		assertEquals(word1.nbOccurrencesOfChar('a'), 5);
		assertEquals(word1.nbOccurrencesOfChar('z'), 0);
	}

	@Test
	public void testReverse() {
		Word word1 = new Word("abcde");
		Word word2 = new Word("edcba");
		assertEquals(word1.reverse(), word2);
	}

	@Test
	public void testContains() {
		Word word1 = new Word("timoleon");
		Word word2 = new Word("tim");
		Word word3 = new Word("mole");
		Word word4 = new Word("leon");
		Word word5 = new Word("truc");
		Word word6 = new Word("molee");

		assertTrue(word1.contains(word2));
		assertTrue(word1.contains(word3));
		assertTrue(word1.contains(word4));
		assertFalse(word1.contains(word5));
		assertFalse(word1.contains(word6));
	}

	@Test
	public void testRhymesWith() {
		Word word1 = new Word("timoleon");
		Word word2 = new Word("tim");
		Word word3 = new Word("leon");

		assertTrue(word1.rhymesWith(word3));
		assertFalse(word1.rhymesWith(word2));
	}

	@Test
	public void testExtractBefore() {
		Word word1 = new Word("timoleon");

		Word[] extract1 = word1.extractBefore('o');
		Word[] extract2 = word1.extractBefore('t');
		Word[] extract3 = word1.extractBefore('n');
		Word[] extract4 = word1.extractBefore('z');

		assertEquals(extract1[0], new Word("timo"));
		assertEquals(extract1[1], new Word("leon"));

		assertEquals(extract2[0], new Word("t"));
		assertEquals(extract2[1], new Word("imoleon"));

		assertEquals(extract3[0], new Word("timoleon"));
		assertEquals(extract3[1], new Word(""));

		assertEquals(extract4[0], new Word(""));
		assertEquals(extract4[1], new Word("timoleon"));
	}

	@Test
	public void testIsPalindrome() {
		Word word1 = new Word("radar");
		Word word2 = new Word("raddar");
		Word word3 = new Word("probleme");

		assertTrue(word1.isPalindrome());
		assertTrue(word2.isPalindrome());
		assertFalse(word3.isPalindrome());
	}

	@Test
	public void testIsAnagram() {
		Word word1 = new Word("timoleon");
		Word word2 = new Word("letomion");
		Word word3 = new Word("letmion");
		Word word4 = new Word("letmionoo");

		assertTrue(word1.isAnagram(word2));
		assertFalse(word1.isAnagram(word3));
		assertFalse(word1.isAnagram(word4));
	}

	@Test
	public void testIsProperNoun() {
		Word word1 = new Word("Timoleon");
		Word word2 = new Word("timoleon");

		assertTrue(word1.isProperNoun());
		assertFalse(word2.isProperNoun());
	}

	// ---Pour permettre l'exécution des test----------------------
	public static junit.framework.Test suite() {
		return new junit.framework.JUnit4TestAdapter(WordTest.class);
	}

	public static void main(String[] args) {
		org.junit.runner.JUnitCore.main("WordTest");
	}
}
