package rental;

import java.util.*;

/** a rental vehicle agency, client can rent one vehicle at a time */
public class RentalAgency {
    // vehicles of this agency
    private List<Vehicle> vehicles;

    // maps client and rented vehicle (at most one vehicle by client) 
    private Map<Client,Vehicle> theVehicles;

    public RentalAgency()
    {
        this.vehicles = new ArrayList<Vehicle>();
        this.theVehicles = new HashMap<Client,Vehicle>();
    }
    
    /** adds a vehicle to this agency 
    * @param v the added vehicle
    */
    public void addVehicle(Vehicle v)
    {
        this.vehicles.add(v);
    }

    /** provides the list of the vehicles that satisfy the criterion c 
    * @param c the selection criterion 
    * @return  the list of the vehicles that satisfy the criterion c
    */
    public List<Vehicle> select(Criterion c)
    {	
        List<Vehicle> list = new ArrayList<Vehicle>();
        Iterator<Vehicle> it = this.vehicles.iterator();

        while (it.hasNext())
        {
            Vehicle v = it.next();
            if (c.isSatisfiedBy(v))
                list.add(v);
        }
        return list;
    }
    /** displays the vehicles that satisfy the criterion c 
    * @param c the selection criterion
    */
    public void displaySelection(Criterion c)
    {
        Iterator<Vehicle> it = this.vehicles.iterator();

        while (it.hasNext())
        {
            Vehicle v = it.next();
            if (c.isSatisfiedBy(v))
                System.out.println(v.toString());
        }
    }

    /** client rents a vehicle 
    * @param client the renter
    * @param v the rented vehicle
    * @return the daily rental price
    * @exception NoSuchElementException   if v is not a vehcile of this agency  
    * @exception IllegalStateException if v is already rented or client rents already another vehicle
    */
    public float rentVehicule(Client client, Vehicle v) throws NoSuchElementException, IllegalStateException
    {
        Iterator<Vehicle> it = this.vehicles.iterator();        
        boolean check = false;
        Vehicle v_to_rent = null;

        while (it.hasNext())
        {
            v_to_rent = it.next();
            if (v_to_rent.equals(v))
            {
                check = true;
                break;
            }
        }
        if (check == false)
            throw new NoSuchElementException();
        if (this.hasRentedAVehicle(client) || this.isRented(v_to_rent))
            throw new IllegalStateException();
        this.theVehicles.put(client,v);
    	return v_to_rent.getDailyPrice();
    }
    
    /** returns <em>true</em> iff client c is renting a vehicle
    * @return <em>true</em> iff client c is renting a vehicle
    */
    public boolean hasRentedAVehicle(Client client)
    {
        for (Map.Entry<Client,Vehicle> entry: this.theVehicles.entrySet())
        {
            if (client.equals(entry.getKey()))
                return true;
        }
        return false;
    }
    
    /** returns <em>true</em> iff vehicle v is rented
    * @return <em>true</em> iff vehicle v is rented    
    */
    public boolean isRented(Vehicle v)
    {
        for (Map.Entry<Client,Vehicle> entry: this.theVehicles.entrySet())
        {
            if (v.equals(entry.getValue()))
                return true;
        }
        return false;
    }
    
    /** the client returns a rented vehicle. Nothing happens if client didn't have rented a vehicle. 
    * @param the client who returns a vehicle
    */
    public void returnVehicle(Client client)
    {
        for (Map.Entry<Client,Vehicle> entry: this.theVehicles.entrySet())
        {
            System.out.println(entry.getKey().toString());
            if (client.equals(entry.getKey()))
            {
                if (entry.getValue() != null)
                {
                    this.theVehicles.remove(entry.getKey());
                    this.theVehicles.remove(entry.getValue());
                }
            }
        }
    }
    /** provides the collection of rented vehicles for this agency
    * @return collection of currently rented vehicles 
    */
    public Collection<Vehicle> allRentedVehicles()
    {
        List<Vehicle> list;
        list = new ArrayList<Vehicle>();
        for (Map.Entry<Client,Vehicle> entry: this.theVehicles.entrySet())
        {
            if (entry.getKey() != null)
                list.add(entry.getValue());
        }
        return list;
    }

    public static void main(String[] args)
    {
        RentalAgency rentalAgency = new RentalAgency();
        Vehicle v = new Vehicle("renaut", "bmw", 1999, 750);
        BrandCriterion c = new BrandCriterion("renaut");
        rentalAgency.addVehicle(v);
        rentalAgency.displaySelection(c);
        Client c1 = new Client("Tim Oleon", 25);
        float price = rentalAgency.rentVehicule(c1,v);
        System.out.println(price);
        Client c2 = new Client("Tim Oleones", 23);
        boolean b = rentalAgency.hasRentedAVehicle(c1);
        System.out.println(b);
        Vehicle v2 = new Vehicle("renau", "bm", 1999, 750);
        rentalAgency.addVehicle(v2);
        rentalAgency.rentVehicule(c2,v2);
        boolean cb = rentalAgency.hasRentedAVehicle(c2);
        System.out.println(cb);
        Collection<Vehicle> list;
        list = rentalAgency.allRentedVehicles();
        System.out.println(list.toString());
        rentalAgency.returnVehicle(c2);
        list = rentalAgency.allRentedVehicles();
        System.out.println("response=> " + list.toString());
    }
}
