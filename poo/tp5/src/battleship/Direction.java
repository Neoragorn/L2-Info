package battleship;

/** represents a direction for "moves" it is possible to know the next position when you "move" in this direction
 *  
 * @author JC
 */

public interface Direction {
    /**
     * returns the next position to p according to this direction
     * @param p the current position
     * @return the next position to p according to this direction
     */
    public Position nextPosition(Position p);
}