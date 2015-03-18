package image.color;

public class GrayColor
{
	private int level;


	public GrayColor(int level)
	{
		this.level = level;
	}

	public static GrayColor WHITE = new GrayColor(255);

	public static GrayColor BLACK = new GrayColor(0);

	public int getLevel()
	{
		return this.level;
	}

	public boolean equals(Object o)
	{
		if (o instanceof GrayColor)
		{
			GrayColor new_o = (GrayColor) o;
			if (this.level == new_o.getLevel())
				return true;
			return false;
		}
		return false;
	}
}