
import static org.junit.Assert.*;

import org.junit.Test;
import rental.*;

public class RentalAgencyTest
{
	private RentalAgency agence = new RentalAgency();
	private Vehicle v = new Vehicle("Marque","Modele",2015,65);
	private Vehicle v2 = new Vehicle("Marque2","Modele2",2015,70);
	private Client c2 = new Client("coucou",19);

	@Test
	public void addVehicleTest()
	{
		agence.addVehicle(v);
		agence.addVehicle(v2);
		assertNotNull(agence);
	}

	@Test
	public void selectTest() {
		Criterion c = new PriceCriterion(80);
		assertNotNull(agence.select(c));
	}
    
    // ---Pour permettre l'execution des tests ----------------------
    public static junit.framework.Test suite() {
	return new junit.framework.JUnit4TestAdapter(RentalAgencyTest.class);
    }

}