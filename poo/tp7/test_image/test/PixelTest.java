import org.junit.*;
import static org.junit.Assert.*;

import image.Pixel;
import image.color.*;

public class PixelTest
{
	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(PixelTest.class);
	}

	@Test
	public void getAndSetColorTest()
	{
		GrayColor g1 = new GrayColor(100);
		GrayColor g2 = new GrayColor(90);
		Pixel p = new Pixel(g1);
		assertEquals(p.getColor(),g1);
		p.setColor(g2);
		assertEquals(p.getColor(),g2);
	}

	@Test
	public void equalsTest()
	{
		GrayColor g1 = new GrayColor(50);
		GrayColor g2 = new GrayColor(100);
		Pixel p1 = new Pixel(g1);
		Pixel p2 = new Pixel(g2);
		Pixel p3 = new Pixel(g1);
		assertFalse(p1.equals(p2));
		assertTrue(p1.equals(p3));
	}

	@Test
	public void colorDifferenceTest()
	{
		GrayColor g1 = new GrayColor(40);
		GrayColor g2 = new GrayColor(30);
		Pixel p1 = new Pixel(g1);
		Pixel p2 = new Pixel(g2);
		assertEquals(p1.colorDifference(p2),10);
	}

}

