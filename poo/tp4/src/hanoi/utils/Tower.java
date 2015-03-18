/**
 * Classe s'occupant des tours abritant les disques du probleme d'Hanoi
 * @author Casier Sofian
 */

package hanoi.utils;

public class Tower
{
	/**
	* Nombre de disk maximum par Tower
	*/
	public static int	nb_disk_max;

	/**
	* Nombre de disk sur la Tower
	*/
	private int	nb_disk;

	/**
	* Tableau de Disk présents sur la Tower
	*/
	private Disk[] tower;

	/**
	* Constructeur d'une Tower
	*/

	public Tower(int nb)
	{
		this.nb_disk_max = nb;
		this.nb_disk = 0;
		this.tower = new Disk[nb];
	}

	/**
	* @return le Disk placé le plus en haut de la Tower
	*/

	public Disk topDisk()
	{
		if (this.nb_disk != 0)
			return (this.tower[nb_disk - 1]);
		else
			return null;
	}

	/**
	* @return la taille du disk le plus en haut de la Tower
	*/

	public int getTopDiskValue()
	{
		Disk d = this.topDisk();
		if (d != null)
			return (d.getTaille());
		return 0;
	}

	/**
	* @return le Disk le plus en haut de la Tower
	*/

	public Disk takeDisk()
	{
		if (this.is_empty() != true)
		{
			this.nb_disk--;
			Disk d = this.tower[nb_disk];
			this.tower[nb_disk] = null;
			return (d);
		}
		else
		{
			System.out.println ("Impossible. La tour selectionnée est vide !\n");
			return null;
		}
	}

	/**
	* @param d : Disk à mettre sur la Tower
	* Ajoute un Disk à la Tower
	*/

	public void putDisk(Disk d)
	{
		if (this.is_empilable())
		{
			this.tower[this.nb_disk] = d;
			this.nb_disk++;
		}
		else
			System.out.println ("Impossible. La tour selectionnée est pleine !\n");
	}

	/**
	* Verifie si la Tower est vide
	* @return  true si elle est vide
	*/

	public boolean is_empty() 
	{
		if (this.nb_disk == 0)
			return true;
		return false;
	}

	/**
	* Verifie si la Tower est pleine ou non
	* @return false si la Tower est pleine
	*/
	public boolean is_empilable()
	{
		if (this.nb_disk >= this.nb_disk_max)
			return false;
		return true;
	}

	/**
	* @return le nombre de Disk présents sur la Tower
	*/

	public int getDisk()
	{
		return (this.nb_disk);
	}

	/**
	* @return le tableau de Disk de la Tower
	*/

	public Disk[] getTowerDisk()
	{
		return (this.tower);
	}
}