package rental;

import java.util.*;

public class MotorBike extends Vehicle {
	public int cylindre;

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
	* @param c
	*			 the cylinder of the motorbike (cm^3)
	*/
	public MotorBike(String brand, String model, int productionYear, int dailyRentalPRice, int c) {
		super(brand,model,productionYear,dailyRentalPRice);
		this.cylindre = c;
	}

	public String toString() {
		return this.getProductionYear() + " " + this.getBrand() + " " + this.getDailyPrice() + this.getModel() + " " + this.cylindre;
	}
}