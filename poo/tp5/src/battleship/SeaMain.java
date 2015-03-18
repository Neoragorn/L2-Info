package battleship;

import battleship.direction.*;

public class SeaMain {

	public static void main(String[] args) {
		// creates sea and positionning ships
		Sea m = new Sea(15, 12);
		Ship ship = new Ship(3);
		Position position = new Position(2, 3);
		m.placeShip(ship, position, new EastDirection());
		m.placeShip(new Ship(4), new Position(6, 5), new NorthDirection());
		// no ship there : missed
		System.out.println(m.shoot(new Position(3, 10)));
		m.display(true);
		System.out.println();
		m.display(false);
		// hitting a ship
		System.out.println(m.shoot(new Position(2, 3)));
		m.display(false);
		// same position : missed
		System.out.println(m.shoot(new Position(2, 3)));
		// hits twice to sink ship
		System.out.println(m.shoot(new Position(3, 3)));
		System.out.println(m.shoot(new Position(4, 3)));
		m.display(false);
		// positionning ship at an illegal position... exception is thrown
		try {
			m.placeShip(new Ship(10), new Position(10, 10), new SouthDirection());
		} catch (IllegalStateException e) {
			System.out.println("problem while positionning a ship");
			e.printStackTrace();
		}
		// defender's view
		System.out.println("display of player's board");
		m.display(true);
	}

}
