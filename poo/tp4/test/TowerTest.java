import org.junit.*;
import static org.junit.Assert.*;

import hanoi.utils.*;

public class TowerTest
{
	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(TowerTest.class);
	}

	@Test
	public void tourTest()
	{
		Tower uneTour = new Tower(3);
		assertEquals (uneTour.getDisk(),0);
	}

	@Test
	public void getNombreDisqueTest()
	{
		Tower tower_test = new Tower(3);
		Disk d1 = new Disk(1);
		Disk d2 = new Disk(2);
		tower_test.putDisk(d1);
		tower_test.putDisk(d2);
		assertEquals(tower_test.getDisk(),2);
	}

	@Test
	public void enleverDisqueTest()
	{
	Tower tower_test = new Tower(3);
		Disk d1 = new Disk(1);
		Disk d2 = new Disk(2);
		tower_test.putDisk(d1);
		tower_test.putDisk(d2);
		tower_test.takeDisk();
		assertEquals(tower_test.getDisk(),1);
	}

	@Test
	public void tourVideTest()
	{
		Tower uneTour = new Tower(3);

		assertEquals(uneTour.is_empty(),true);
	}

	@Test
	public void tourPleineTest()
	{
		Tower tower_test = new Tower(2);
		Disk d1 = new Disk(1);
		Disk d2 = new Disk(2);
		tower_test.putDisk(d1);
		tower_test.putDisk(d2);
		assertEquals(tower_test.is_empilable(),false);
	}
}