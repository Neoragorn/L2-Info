/**
 * Classe s'occupant de la gestion des disques d'Hanoi par un tableau de disques
 * @author Casier Sofian
 */

package hanoi.utils;

public class Disk
{
	/**
	* Taille du disque
	*/

	private int taille;

	/**
	* Constructeur de l'objet Disk
	*/

	public Disk(int t)
	{
		this.taille = t;
	}

	/**
	* @return la taille du disk
	*/
	public int	getTaille()
	{
		return (this.taille);
	}

	/**
	*	Affiche la taille du disk
	*/
	public void	afficherTaille()
	{		
		System.out.print(this.taille);
	}
}