<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="example04.vo.BookVO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="example04.dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
 
<title>Insert title here</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    String fileUploadPath = "C:\\Users\\PC-04\\Desktop\\JSPBook\\JSPBook\\WebContent\\resources\\images";
	DiskFileUpload upload = new DiskFileUpload();
	
	//업로드 객체 환경설정
	upload.setSizeMax(1000000);	
	upload.setSizeThreshold(4096);
	upload.setRepositoryPath(fileUploadPath);
	

	List items= upload.parseRequest(request);
	
	Iterator params = items.iterator();
	BookRepository dao=BookRepository.getInstance();
	BookVO vo = new BookVO();
	while(params.hasNext()){
	
		FileItem fileItem =(FileItem)params.next();
		
		if(fileItem.isFormField()){
			String name = fileItem.getFieldName();	//파라미터의 이름
			String value = fileItem.getString("UTF-8");	//파라미터의 값(개똥이,개똥이 콘서트)
			if(name.equals("bookId")){
				vo.setBookId(value);
			}else if(name.equals("name")){
				vo.setName(value);
			}else if(name.equals("unitPrice")){
				vo.setUnitPrice(Integer.parseInt(value));
			}else if(name.equals("author")){
				vo.setAuthor(value);
			}else if(name.equals("publisher")){
				vo.setPublisher(value);
			}else if(name.equals("releaseDate")){
				vo.setReleaseDate(value);
			}else if(name.equals("totalPages")){
				vo.setTotalPages(Integer.parseInt(value));
			}else if(name.equals("description")){
				vo.setDesciption(value);
			}else if(name.equals("category")){
				vo.setCategpry(value);
			}else if(name.equals("unitsInStock")){
				vo.setUnitsInStock(Integer.parseInt(value));
			}else if(name.equals("condition")){
				vo.setCondition(value);
			}
		}else{
			String fileFiledName = fileItem.getFieldName();	
			String contentType =  fileItem.getContentType();	
			long fileSize = fileItem.getSize();

		String fileName = fileItem.getName();
		fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
	
		File file = new File(fileUploadPath+"/"+fileName);
		vo.setFilename(fileName);
		fileItem.write(file);
		}
	}
	vo.toString();
	 dao.addProduct(vo);
	 response.sendRedirect("books.jsp");
//     request.setCharacterEncoding("UTF-8");
    
//     String filename="";
//     String realFolder="C:\\upload";
//     int maxSize=5*1024*1024;
//     String encType="utf-8";
    
//     MultipartRequest multi=new MultipartRequest(request, realFolder, 5*1024*1024, encType, new DefaultFileRenamePolicy());
    
//     String bookId=multi.getParameter("bookId");
//     String name=multi.getParameter("name");
//     String unitPrice=multi.getParameter("unitPrice");
//     String author=multi.getParameter("author");
//     String description=multi.getParameter("description");
//     String publisher=multi.getParameter("publisher");
//     String category=multi.getParameter("category");
//     String unitsInStock=multi.getParameter("unitsInStock");
//     String totalPages=multi.getParameter("totalPages");
//     String releaseDate=multi.getParameter("releaseDate");
//     String condition=multi.getParameter("condition");
    
//     Integer price;
    
//     if(unitPrice.isEmpty())
//             price=0;
//     else    price=Integer.valueOf(unitPrice);
    
//     long stock;
    
//     if(unitsInStock.isEmpty())
//             stock=0;
//     else    stock=Long.valueOf(unitsInStock);
    
//     long pages;
    
//     if(totalPages.isEmpty())
//             pages=0;
//     else    pages=Long.valueOf(totalPages);
    
//     Enumeration files=multi.getFileNames();
//     String fname=(String)files.nextElement();
//     String fileName=multi.getFilesystemName(fname);
    
//     BookRepository dao=BookRepository.getInstance();
    
//     BookVO newProduct=new BookVO();
    
//     newProduct.setBookId(bookId);
//     newProduct.setName(name);
//     newProduct.setUnitPrice(price);
//     newProduct.setAuthor(author);
//     newProduct.setDesciption(description);
//     newProduct.setPublisher(publisher);
//     newProduct.setCategpry(category);
//     newProduct.setUnitsInStock(stock);
//     newProduct.setTotalPages(pages);
//     newProduct.setReleaseDate(releaseDate);
//     newProduct.setCondition(condition);
//     newProduct.setFilename(fileName);
    
//     dao.addProduct(newProduct);
//     response.sendRedirect("books.jsp");
    %>
</body>
</html>