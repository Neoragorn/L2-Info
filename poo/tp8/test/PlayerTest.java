import org.junit.*;
import static org.junit.Assert.*;

import game.*;
import game.utils.*;

public class PlayerTest
{

	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(PlayerTest.class);
	}

	@Test
	public void CreateTest()
	{
		Player p = new Player("N");
		assertEquals(p.getName(), "N");
		assertEquals(p.getCompteur(), 0);
	}

	@Test
	public void ChoiceTest()
	{
		Player p = new Player("N");
		p.setChoice("pierre");
		assertEquals(p.getChoice(), GameChoice.ROCK);
	}
}