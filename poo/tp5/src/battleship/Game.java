package battleship;

import java.util.InputMismatchException;
import java.util.Scanner;

import battleship.direction.*;

public class Game {

	/**
	 * the sea for this game
	 */
	private Sea sea;

	/** creates a battleShip game with given rows and columns board
	 * @param numberOfRows the number of rows 
	 * @param numberOfColumns the number of columns
	 */
	public Game(int numberOfRows, int numberOfColumns) {
		this.sea = new Sea(numberOfRows, numberOfColumns);
	}

	/** creates a initial configuration for battleship game
	 * @throws IllegalStateException if ships are placed at illegal positions
	 */
	public void init() throws IllegalStateException {
		// by example... to be modified
		this.sea.placeShip(new Ship(3), new Position(2, 3), new EastDirection());
		this.sea.placeShip(new Ship(4), new Position(6, 5), new NorthDirection());
	}

	// on pourrait mettre en place une detection de fin de partie lorsque
	// tous les bateaux sont coulesil faudrait, par exemple et pour faire
	// simple, ajouter dans la classe Mer une information
	// sur le nombre de points de vie total des bateaux (obtenu a la pause)
	// et disposer d'une methode indiquant lorsque la mer est "vide".
	// C'est ce qui est fait dans l'archive fournie pour test.
	
	/**
	 * plays to the battleship game
	 */
	public void play() {
		this.displayInstructions();

		boolean finished = false;
		Answer answer = null;
		while (!finished) {
			this.sea.display(false);
			Position aimedPosition = this.inputPosition();
			finished = (aimedPosition == null);
			if (!finished) {
				try {
					answer = this.sea.shoot(aimedPosition);
					this.displayAnswer(answer);
					// if all the ships has been sunk then the sea is empty and the game is finished
					// next line must be uncomment to handle such a  "end of game"
					// finished = this.sea.isEmpty();
				} catch (ArrayIndexOutOfBoundsException e) {
					// this exception is thrown by the Sea.aim() method if a
					// wrong position is aimed (ie. outside of the board)
					// then nothing is done... a new turn begins
				}
			}
		}
		this.displayEndOfGame();		
	}



	// we need only one Scanner for this class, a static fiel can be used
	private static final Scanner IN = new Scanner(System.in);

	/** reads the user's chosen coordinates of the aimed position
	 * @return the aimed position
	 */
	private Position inputPosition() {
		int x = -1;
		int y = -1;
		System.out.print("x y ? ");
		try {
			x = Game.IN.nextInt();
			if (x < 0) {
				return null;
			}
			y = Game.IN.nextInt();
		} catch (InputMismatchException e) {
			// to handle illegal inputs (letters intead of digits by example)
			// the input is then ignored
			Game.IN.skip(".*");
		}
		return new Position(x, y);
	}

	/**
	 * displays instruction at the beginning of the game
	 */
	private void displayInstructions() {
		System.out.println("Entre the coordinates of targetted cell (x,y) using the form: x y, by example : 3 2");
		System.out.println("To end the game, enter a negative coordinate for x.");
	}
	
	/** displays result after each player's turn
	 * @param answer the result of the player's choice
	 */
	private void displayAnswer(Answer answer) {
		System.out.println(answer);		
	}


	/**
	 * displays a message at the end of the game, the opponent's board is displaid
	 */
	private void displayEndOfGame() {
		System.out.println("Here is where the ships were: ");
		this.sea.display(true);
		System.out.println("Good Bye ");		
	}
	
}
