package rental;

import static org.junit.Assert.*;

import org.junit.Test;

public class CarTest {

	@Test
	public void carTest() {
		assertNotNull(new Car("Marque","Modele",2015,60,5));
	}
    
    // ---Pour permettre l'execution des tests ----------------------
    public static junit.framework.Test suite() {
	return new junit.framework.JUnit4TestAdapter(rental.CarTest.class);
    }

}