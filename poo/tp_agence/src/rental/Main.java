package rental;

public class Main
{

	public static void main(String[] args)
	{
		SuspiciousRentalAgency rentalAgency = new SuspiciousRentalAgency();
		Vehicle v = new Vehicle("veahi","vehi",2015,12);
		rentalAgency.addVehicle(v);
		Client c1 = new Client("Tima",15);
		float price1 = rentalAgency.rentVehicule(c1,v);
		System.out.println(price1);
	}
}
