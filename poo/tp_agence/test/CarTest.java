import static org.junit.Assert.*;

import org.junit.Test;

import rental.*;

public class CarTest {

    // ---Pour permettre l'execution des tests ----------------------
    public static junit.framework.Test suite() {
	return new junit.framework.JUnit4TestAdapter(CarTest.class);
    }
    
	@Test
	public void carTest()
	{
		assertNotNull(new Car("Marque","Modele",2015,60,5));
	}

}