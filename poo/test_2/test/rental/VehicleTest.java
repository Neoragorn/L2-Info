package rental;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class VehicleTest {
 
	private Vehicle v1;
	private Vehicle v2;

	
	@Before 
	public void before() {
		this.v1 = new Vehicle("brand1","model1",2015,100);
		this.v2 = new Vehicle("brand2","model2",2000,200);
	}

	@Test
	public void createTest() {
		assertNotNull(this.v1);
	}
	
	@Test
	public void testGetBrand() {
		assertEquals(this.v1.getBrand(),"brand1");
		assertEquals(this.v2.getBrand(),"brand2");
	}

	@Test
	public void testGetModel() {
		assertEquals(this.v1.getModel(),"model1");
		assertEquals(this.v2.getModel(),"model2");
	}

	@Test
	public void testGetDailyPrice() {
		assertEquals(this.v1.getDailyPrice(),100);
		assertEquals(this.v2.getDailyPrice(),200);
	}

	@Test
	public void testGetProductionYear() {
		assertEquals(this.v1.getProductionYear(),2015);
		assertEquals(this.v2.getProductionYear(),2000);
	}

	@Test
	public void testEquals() {
		Vehicle v3 = new Vehicle("brand1","model1",2015,100);
		Vehicle v4 = new Vehicle("brand1","model1",2015,200);
		assertTrue(v1.equals(v3));
		assertFalse(v1.equals(v2));
		assertFalse(v1.equals(v4));
		assertFalse(v1.equals(new Object()));
	}

    // ---Pour permettre l'execution des tests ----------------------
    public static junit.framework.Test suite() {
	return new junit.framework.JUnit4TestAdapter(rental.VehicleTest.class);
    }

}
