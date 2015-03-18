
/**
 * (Documentation should be in english...)
 * la classe des TapisRoulant (ConveyerBelt) sur lesquels pn peut poser les caisses jusqu'un certain poids
 * les tapis ont une (meme) capacite maximale definie par <t>capacity</t>
 * @author jc 
 * @version 1.0
 */

// parce que l'on utilise des listes (sera vu plus tard)
import java.util.*;

public class ConveyerBelt {

	private int capacity = 2;

	// les attributs de la classe ConveyerBelt
	/** le poids maximum des caisses supporte */
	private int maxWeight;
	/** le tapis proprement dit : les caisses portees */
	private ArrayList<Box> boxesOnBelt; // on utilise une liste de caisses pour
										// gerer le tapis

	/**
	 * constructeurs d'objets de la classe TapisRoulant
	 * @param maxWeight poids maximum accepté par le tapis
	 */
	public ConveyerBelt(int maxWeight) {
		this.maxWeight = maxWeight;
		this.boxesOnBelt = new ArrayList<Box>();
	}

	// les methodes de la classe TapisRoulant
	/**
	 * donne le poids maximal accepte
	 * 
	 * @return le pods maximal accepte
	 */
	public int getMaxWeight() {
		return this.maxWeight;
	}

	/**
	 * la tapis recoit une caisse
	 * 
	 * @param box
	 *            la caisse recue
	 */
	public void receive(Box box) {
		if (!this.isFull()) {
			this.boxesOnBelt.add(box);
		} else { // pas de gestion d'exception pour l'instant
			System.out.println("belt full, deposit impossible");
		}
	}

	/**
	 * indique si le tapis est plein
	 * 
	 * @return <t>true</t> si le tapis est plein de caisses
	 */
	public boolean isFull() {
		return this.boxesOnBelt.size() == capacity;
	}

	/**
	 * verifie si le tapis peut accepter la caisse, ie. si elle n'est pas trop
	 * lourde
	 * 
	 * @param box
	 *            : la caisse a verifier
	 * @return <t>true</t> si la caisse peut etre portee, <t>false</t> sinon
	 */
	public boolean accept(Box box) {
		return box.getWeight() <= this.maxWeight;
	}

	/**
	 * affiche le contenu du tapis roulant
	 */
	public void display() {
		System.out.println("the conveyer belt carries" + this.boxesOnBelt.size() + " box(es)");
		for (Box box : this.boxesOnBelt) {
			System.out.println(box.toString());
		}
	}

	/**
	 * vide le tapis roulant (supprime toutes les caisses)
	 */
	public void emptyBelt() {
		// ce code sera explique plus tard dans le cours
		Iterator<Box> boxes_it = this.boxesOnBelt.iterator();
		while (boxes_it.hasNext()) {
			boxes_it.next();
			boxes_it.remove();
		}
	}
}
