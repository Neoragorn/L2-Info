
import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import rental.*;

public class ClientTest {

	private Client c1;
	private Client c2;

    
	@Before 
	public void before() {
		this.c1 = new Client("client1",20);
		this.c2 = new Client("client2",30);
	}
    
	@Test
	public void testClient() {
		assertNotNull(this.c1);
	}

	@Test
	public void testGetName() {
		assertEquals(this.c1.getName(),"client1");
		assertEquals(this.c2.getName(),"client2");
	}

	@Test
	public void testGetAge() {
		assertEquals(this.c1.getAge(),20);
		assertEquals(this.c2.getAge(),30);
	}

    // ---Pour permettre l'execution des tests ----------------------
    
    public static junit.framework.Test suite() {
	return new junit.framework.JUnit4TestAdapter(ClientTest.class);
    }

}
