package ssol.tiles;

public class MenuItem {
	private String name;
	private String link;
	
	public MenuItem(String name,String link) {
		this.name=name;
		this.link=link;
	}
	
	public String getName() {
		return name;
	}
	public String getLink() {
		return link;
	}
}
