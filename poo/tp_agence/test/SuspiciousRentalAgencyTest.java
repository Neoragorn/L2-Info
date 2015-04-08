import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import rental.*;

public class SuspiciousRentalAgencyTest
{
    // ---Pour permettre l'execution des tests ----------------------
    public static junit.framework.Test suite() {
	return new junit.framework.JUnit4TestAdapter(SuspiciousRentalAgencyTest.class);
    }

	@Test
	public void rentVehicleTest()
	{
		SuspiciousRentalAgency agence = new SuspiciousRentalAgency();
		Vehicle v = new Vehicle("Marque","Modele",2015,10);
		Vehicle v2 = new Vehicle("Marque2","Modele2",2015,10);
		Client c2 = new Client("coucou",19);
		agence.addVehicle(v);
		agence.addVehicle(v2);
		float result = agence.rentVehicule(c2, v);
		/* Je n'ai pas reussi a faire en sorte que le test
		assertEquals(agence.rentVehicule(c2, v), 11);
	    J'ai donc dû passer les conditions suivantes pour effectuer
	    quand même le test
		*/
		if (result == 11)
			assertEquals(true, true);
		else
			assertEquals(false, true);
	}

}