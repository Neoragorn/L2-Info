import org.junit.*;
import static org.junit.Assert.*;

import image.color.GrayColor;

public class GrayColorTest
{
	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(GrayColorTest.class);
	}

	@Test
	public void getLevelTest()
	{
		GrayColor g = new GrayColor(100);
		assertEquals(g.getLevel(),100);
	}

	@Test
	public void equalsTest()
	{
		GrayColor g1 = new GrayColor(100);
		GrayColor g2 = new GrayColor(90);
		GrayColor g3 = new GrayColor(100);
		assertFalse(g1.equals(g2));
		assertTrue(g1.equals(g3));
	}

}
