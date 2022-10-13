package example04.vo;

public class BookVO {
	private String	bookId;
	private String	name;
	private	int		unitPrice;
	private String	author;
	private String	desciption;
	private String	publisher;
	private String	categpry;
	private	long	unitsInStock;
	private	long	totalPages;
	private String	releaseDate;
	private String	condition;
	
	private String filename;
	
	public BookVO() {
		
	}

	public BookVO(String bookId, String name, int unitPrice) {
		this.bookId = bookId;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDesciption() {
		return desciption;
	}

	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCategpry() {
		return categpry;
	}

	public void setCategpry(String categpry) {
		this.categpry = categpry;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(long totalPages) {
		this.totalPages = totalPages;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "BookVO [bookId=" + bookId + ", name=" + name + ", unitPrice=" + unitPrice + ", author=" + author
				+ ", desciption=" + desciption + ", publisher=" + publisher + ", categpry=" + categpry
				+ ", unitsInStock=" + unitsInStock + ", totalPages=" + totalPages + ", releaseDate=" + releaseDate
				+ ", condition=" + condition + ", filename=" + filename + "]";
	}
	
}
