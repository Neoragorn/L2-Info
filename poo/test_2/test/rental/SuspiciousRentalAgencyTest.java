package rental;

import static org.junit.Assert.*;

import org.junit.Test;

public class SuspiciousRentalAgencyTest {
	private SuspiciousRentalAgency agence = new SuspiciousRentalAgency();
	private Vehicle v = new Vehicle("Marque","Modele",2015,10);
	private Client c2 = new Client("coucou",19);
	agence.addVehicle(v);
	agence.addVehicle(v2);

	@Test
	public void rentVehicleTest() {
		assertEquals(agence.rentVehicle(c2,v),(float)11);
	}
    
    // ---Pour permettre l'execution des tests ----------------------
    public static junit.framework.Test suite() {
	return new junit.framework.JUnit4TestAdapter(rental.SuspiciousRentalAgencyTest.class);
    }

}