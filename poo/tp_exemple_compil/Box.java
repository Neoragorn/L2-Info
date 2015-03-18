
/**
 * (Documentation should be in english...)
 * la classe des caisses
 *  Dans cette version simple elles sont de différents poids, mais on ne distingue
 *  pas les instances autrement
 * 
 * @author jc 
 * @version 1.0
 */

public class Box {   

    /**
     * constructeurs d'objets de la classe Box
     * @param weight : le poids de la caisse
     */
    public Box(int weight) {
        this.weight = weight;
    }
    
    // les attributs de la classe Caisse
    /** le type de la caisse */
    private int weight;
    
    // les methodes de la classe Caisse 
    /** retourne le poids de la caisse
     */
    public int getWeight() {
        return this.weight;
    }
    
    public String toString() {
        return "a box of weight "+this.weight;
    }
}
