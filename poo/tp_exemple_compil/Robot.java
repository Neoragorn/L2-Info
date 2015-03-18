
/**
 * (Documentation should be in english...) Le robot : capable de porter une
 * caisse a la fois et de la deposer sur un tapis roulant
 * 
 * @author jc
 * @version 1.0
 */

public class Robot {
	/**
	 * constructeurs d'objets de la classe Robot
	 */
	public Robot() {
		this.carriedBox = null;
	}

	// les attributs de la classe Robot
	/** la caisse actuellement portee par le robot */
	private Box carriedBox;

	// les methodes de la classe Robot
	/**
	 * le robot prend une caisse si il n'en tenait aucune
	  *  s'il porte déjà une caisse il ne se passe rien
	 * @param box
	 *            la caisse portée
	 */
	public void take(Box box) {
		if (!this.carryBox()) { // already carrying a box ?
			this.carriedBox = box;
		}	
	}

	/**
	 * le robot pose la caisse qu'il tient sur le tapis precise
	 * 
	 * @param tapis
	 *            le tapis sur lequel la caisse est deposee
	 */
	public void putOn(ConveyerBelt belt) {
		if (this.carryBox() && belt.accept(carriedBox) && !belt.isFull()) {
		    // put box on belt
			belt.receive(carriedBox);
			// no more box is carried
			this.carriedBox = null;
		} else {
			if (!this.carryBox()) {
				System.out.println("no box carried");
			} else if (belt.isFull()) {
				System.out.println("belt is full");
			} else {
				System.out.println("box weights too much for this belt : " + this.carriedBox.getWeight() + " against "
						+ belt.getMaxWeight() + " max");
			}
		}
	}

	/**
	 * retourne <tt>true</tt> si le robot porte une caisse
	 * 
	 * @return <tt>true</tt> si le robot porte une caisse
	 */
	public boolean carryBox() {
		return this.carriedBox != null;
	}
    
        /** returns the carried box
    * @return the carried box
    */
    public Box getCarriedBox() {
        return this.carriedBox();
    }
}
