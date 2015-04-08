import org.junit.*;
import static org.junit.Assert.*;

import game.*;
import game.utils.*;

public class IaTest
{
		public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(IaTest.class);
	}

	@Test
	public void CreateTest()
	{
		Ia p = new Ia("ia", 2);
		assertEquals(p.getName(), "ia");
		assertEquals(p.getLevel(), 2);
		assertEquals(p.getCompteur(), 0);
	}

	@Test
	public void ChoiceTest()
	{
		Ia p = new Ia("ia", 2);
		p.setChoice("pierre");
		assertEquals(p.getChoice(), GameChoice.ROCK);
	}
}