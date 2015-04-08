package rental;

import java.util.*;

public class Car extends Vehicle {
	public int passenger;

	/**
	* creates a car with given informations
	*
	* @param brand
	*            the vehicle's brand
	* @param model
	*            the vehicle's model
	* @param productionYear
	*            the vehicle's production year
	* @param dailyRentalPRice
	*            the daily rental price
	* @param p
	*			 the number of passenger
	*/
	public Car(String brand, String model, int productionYear, int dailyRentalPRice, int p) {
		super(brand,model,productionYear,dailyRentalPRice);
		this.passenger = p;
	}

	public String toString() {
		return this.getProductionYear() + " " + this.getBrand() + " " + this.getDailyPrice() + this.getModel() + " " + this.passenger;
	}
}