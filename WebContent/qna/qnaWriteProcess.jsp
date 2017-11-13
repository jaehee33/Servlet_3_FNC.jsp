<%@page import="java.util.Enumeration"%>
<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.files.FilesDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int maxSize=1024*1024*10; 
	String save=session.getServletContext().getRealPath("upload"); 
	File f=new File(save);
	if(!f.exists()){
		f.mkdirs();
	}
	MultipartRequest multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
	QnaDTO qnaDTO = new QnaDTO();
	qnaDTO.setWriter(multi.getParameter("writer"));
	qnaDTO.setTitle(multi.getParameter("title"));
	qnaDTO.setContents(multi.getParameter("contents"));
	
	String oName=multi.getOriginalFileName("file");
	String fName=multi.getFilesystemName("file");

	QnaDAO qnaDAO = new QnaDAO();
	int result=qnaDAO.getNum();	
	qnaDTO.setNum(result);
	result=qnaDAO.insert(qnaDTO);
	
	Enumeration e=multi.getFileNames();
	FileDAO fileDAO=new FileDAO();
	while(e.hasMoreElements()){
		String object=(String)e.nextElement();
		FilesDTO filesDTO = new FilesDTO();
		filesDTO.setoName(multi.getOriginalFileName(object));
		filesDTO.setfName(multi.getFilesystemName(object));
		filesDTO.setNum(result);
		fileDAO.insert(filesDTO);
	}
	
	
	String s="Fail";
	if(result>0){
		s="Success";
	}
	request.setAttribute("message", s);
	request.setAttribute("path", "qnaList.jsp");
	RequestDispatcher view= request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>