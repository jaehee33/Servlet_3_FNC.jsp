<%@page import="java.util.Enumeration"%>
<%@page import="com.iu.files.FileDAO"%>
<%@page import="com.iu.files.FilesDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	int maxSize=1024*1024*10; //파일크기 10메가 이하에서 받겠다.
	String save=session.getServletContext().getRealPath("upload"); //파일을 어디에 저장할거냐
	File f=new File(save);
	if(!f.exists()){
		f.mkdirs();
	}
	MultipartRequest multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
	NoticeDTO noticeDTO=new NoticeDTO();
	noticeDTO.setWriter(multi.getParameter("writer"));
	noticeDTO.setTitle(multi.getParameter("title"));
	noticeDTO.setContents(multi.getParameter("contents"));	
	
	String oName=multi.getOriginalFileName("file");
	String fName=multi.getFilesystemName("file");

	NoticeDAO noticeDAO=new NoticeDAO();
	int result=noticeDAO.getNum();
	noticeDTO.setNum(result);
	result=noticeDAO.insert(noticeDTO);
	
//파라미터이름 정확히 모를때 사용
	Enumeration e = multi.getFileNames();
	FileDAO fileDAO = new FileDAO();
	while(e.hasMoreElements()){
		String obj =(String)e.nextElement();
		FilesDTO fileDTO = new FilesDTO();
		fileDTO.setoName(multi.getOriginalFileName(obj));
		fileDTO.setfName(multi.getFilesystemName(obj));
		fileDTO.setNum(result);
		fileDAO.insert(fileDTO);
	}
	
	String s="Fail";
	if(result>0){
		s="Success";
	}
	request.setAttribute("message", s);
	request.setAttribute("path", "noticeList.jsp");
	// 1. forward 방식
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);
	
	//2. redirect 방식
	/* response.sendRedirect("../common/result.jsp"); */
	
	
	
	
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