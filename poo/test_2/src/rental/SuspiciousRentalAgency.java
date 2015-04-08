package rental;

import java.util.*;

public class SuspiciousRentalAgency extends RentalAgency {
	public SuspiciousRentalAgency() {
		super();
	}
	/**
	 * rent a vehicle adding 10% of price when the client is < 25
	 * @param client v
	 * @return float the price
	 */
	public float rentVehicule(Client client, Vehicle v) 
	{
		if (client.getAge() < 25) {
		float res = (float)(super.rentVehicule(client,v));
		float res2 =  (float)(0.1 * res);
		return res+res2;
		}
		else {
			return super.rentVehicule(client,v);
		}
	}
}