
import static org.junit.Assert.*;

import org.junit.Test;
import rental.*;

public class MotorBikeTest {

	@Test
	public void motoTest() {
		assertNotNull(new MotorBike("Marque","Modele",2015,60,120));
	}
    
    // ---Pour permettre l'execution des tests ----------------------
    public static junit.framework.Test suite() {
	return new junit.framework.JUnit4TestAdapter(MotorBikeTest.class);
    }

}