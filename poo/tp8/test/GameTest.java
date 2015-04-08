import org.junit.*;
import static org.junit.Assert.*;

import game.*;

public class GameTest
{
		public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(GameTest.class);
	}

	@Test
		public void CreateTest()
	{
		Game game = new Game(3);

		assertEquals(game.getTours(), 3);
	}
}