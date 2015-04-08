package rental;

import java.util.*;

/** a rental vehicle agency, client can rent one vehicle at a time */
public class RentalAgency {
    // vehicles of this agency
    private List<Vehicle> vehicles;

    // maps client and rented vehicle (at most one vehicle by client) 
    private Map<Client,Vehicle> theVehicles;

    public RentalAgency() {
    	this.vehicles = new ArrayList<Vehicle>();
        this.theVehicles = new HashMap<Client,Vehicle>();
    }
    
    /** adds a vehicle to this agency 
    * @param v the added vehicle
    */
    public void addVehicle(Vehicle v) {
    	this.vehicles.add(v);
    }

    /** provides the list of the vehicles that satisfy the criterion c 
    * @param c the selection criterion 
    * @return  the list of the vehicles that satisfy the criterion c
    */
    public List<Vehicle> select(Criterion c) {	
    	List<Vehicle> laListe = new ArrayList<Vehicle>();
        for (Vehicle v : this.vehicles) {
            if (c.isSatisfiedBy(v)) {
                laListe.add(v);
            }
        }
        return laListe;
    }    
    /** displays the vehicles that satisfy the criterion c 
    * @param c the selection criterion
    */
    public void displaySelection(Criterion c) {
    	List<Vehicle> laListe = select(c);
        for (Vehicle v : laListe) {
            System.out.println(v);
        }
    }

    /** client rents a vehicle 
    * @param client the renter
    * @param v the rented vehicle
    * @return the daily rental price
    * @exception NoSuchElementException   if v is not a vehcile of this agency  
    * @exception IllegalStateException if v is already rented or client rents already another vehicle
    */
    public float rentVehicule(Client client, Vehicle v) throws NoSuchElementException, IllegalStateException {
            if (hasRentedAVehicle(client)) {
                throw new IllegalStateException();
            }
            else {
                boolean check = false;
                for(Vehicle m : vehicles) {
                    System.out.println(m);
                    if (m.equals(v)) {
                        check = true;
                        break;
                    }
                }
                if ((!check) || isRented(v)) {
                    throw new NoSuchElementException();
                }
                theVehicles.remove(client);
                theVehicles.put(client,v);  
                return v.getDailyPrice();
            }
    }
    
    /** returns <em>true</em> iff client c is renting a vehicle
    * @return <em>true</em> iff client c is renting a vehicle
    */
    public boolean hasRentedAVehicle(Client client){
        if (theVehicles.get(client) == null) {
            return false;
        }
        return true;       
    }
    
    /** returns <em>true</em> iff vehicle v is rented
    * @return <em>true</em> iff vehicle v is rented    
    */
    public boolean isRented(Vehicle v){
        if (theVehicles.containsValue(v)) {
            return true;
        }
        return false;
    }
    
    /** the client returns a rented vehicle. Nothing happens if client didn't have rented a vehicle. 
    * @param the client who returns a vehicle
    */
    public void returnVehicle(Client client){
    	if (theVehicles.get(client) == null) 
            {return;}
        else {
            theVehicles.remove(client);
            theVehicles.put(client,null);
        }
    }
    /** provides the collection of rented vehicles for this agency
    * @return collection of currently rented vehicles 
    */
    public Collection<Vehicle> allRentedVehicles(){
    	return theVehicles.values();
    }

//L'un des main dont je me suis servi lors de la programmation des focntions
/*
public static void main(String[] args) {
    SuspiciousRentalAgency rentalAgency = new SuspiciousRentalAgency();
    Vehicle v = new Vehicle("veahi","vehi",2015,12);
    rentalAgency.addVehicle(v);
    Client c1 = new Client("Tima",15);
    float price1 = rentalAgency.rentVehicule(c1,v);
    System.out.println(price1);

}
*/
}
