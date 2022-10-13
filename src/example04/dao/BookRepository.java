package example04.dao;


import java.util.ArrayList;
import java.util.List;


import example04.vo.BookVO;

public class BookRepository {
	private static BookRepository instance;
	
	public static BookRepository getInstance() {
		if(instance == null) {
			instance = new BookRepository();
		}
		return instance;
	}
	
	List<BookVO> bookList = new ArrayList<BookVO>();
	
	public BookRepository() {
		BookVO html = new BookVO("B1235","[Hello Coding] HTML5+CSS3",15000);
		html.setDesciption("워드나 PPT문서를 만들 수 있나요? 그러면 문제 없습니다. 지금 바로 홈페이지 제작에"
				+ " 도전해보세요. 지금 당장 컴퓨터가 없어도 괜찮습니다. 코드와 실행 화면에 바로 보여서 눈이...");
		html.setAuthor("황재호");
		html.setPublisher("한빛미디어");
		html.setCategpry("web");
		html.setUnitsInStock(10);
		html.setTotalPages(200);
		html.setReleaseDate("2019/10/23");
		html.setCondition("New");
		
		html.setFilename("B1235.png");
		bookList.add(html);
		
		BookVO java = new BookVO("B1236","[IT 모바일] 쉽게 배우는 자바 프로그래밍",27000);
		java.setDesciption("객체지향의 핵심과 자바의 현대적 기능을 충실히 다루면서도 초보자가 쉽게 학습할 수 있게"
				+ " 구성했습니다. 시각화 도구를 활용한 개념 설명과 군더더기 없는 핵심 코드를 통해 개념과 구현...");
		java.setAuthor("우종충");
		java.setPublisher("한빛아카데미");
		java.setCategpry("java");
		java.setUnitsInStock(25);
		java.setTotalPages(300);
		java.setReleaseDate("2019/10/24");
		java.setCondition("Old");
		
		java.setFilename("B1236.png");
		bookList.add(java);
		
		BookVO spring = new BookVO("B1237","[IT 모바일] 스프링 입문",22000);
		spring.setDesciption("스프링은 단순히 사용 방법만 익히는 것보다 아키텍쳐를 어떻게 이해하고 설계하는 지가 더 중"
				+ "요합니다. 예제를 붙여넣는 식으로는 실제 개발에서 스프링을 제데로 활용할 수 없습니다...");
		spring.setAuthor("하세가와 유이치,오오노 와타루, 토키 코헤이(권은철, 전민수)");
		spring.setPublisher("한빛아카데미");
		spring.setCategpry("spring");
		spring.setUnitsInStock(30);
		spring.setTotalPages(500);
		spring.setReleaseDate("2019/10/25");
		spring.setCondition("Refurbished");
		
		spring.setFilename("B1237.png");
		bookList.add(spring);
	}
	
	public List<BookVO> getAllBooks(){
		return bookList;
	}
	
	public void addProduct(BookVO book)
	{
		bookList.add(book);
	}
	
	public BookVO getBookById(String bookId) {
		
		BookVO bookById = null;
		for(int i = 0; i < bookList.size();i++) {
			BookVO vo = bookList.get(i);
			if(vo != null && vo.getBookId() != null && vo.getBookId() .equals(bookId)) {
				bookById = vo;	
				break;
			}
		}
		return bookById;
	}
}
