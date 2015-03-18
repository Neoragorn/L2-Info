package battleship;

/** minimal main to play the battleship game
 * @author JC
 *
 */
public class GameMain {

	public static void main(String[] args) {
		Game game = new Game(9, 9);
		try {
			game.init();
			game.play();
		} catch (IllegalStateException e) {
			System.out.println("Game is not possible: ships have not been placed.");
		}
	}

}
