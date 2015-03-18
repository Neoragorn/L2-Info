import org.junit.*;
import static org.junit.Assert.*;

import hanoi.utils.Disk;

public class DiskTest
{
	public static junit.framework.Test suite()
	{
		return new junit.framework.JUnit4TestAdapter(DiskTest.class);
	}

	@Test
	public void TailleTest ()
	{
		Disk disc = new Disk (10);
		assertEquals("est-ce que le disque a une taille valide ?", disc.getTaille(), 10);
	}
}