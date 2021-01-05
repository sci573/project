package solo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import solo.dao.NotiDAO;
import solo.dto.NotiDTO;

@WebServlet("/noti_servlet/*")
public class NotiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		System.out.println(uri);
		NotiDAO dao=new NotiDAO();
		
		if(uri.indexOf("list.do")!= -1) {
			String searchkey=request.getParameter("searchkey");
			String search=request.getParameter("search");
			if(searchkey==null) searchkey="name";
			if(search==null) search="";
			System.out.println("searchkey:"+searchkey);
			System.out.println("search:"+search);

			List<NotiDTO> items=dao.list(searchkey, search);
			request.setAttribute("list", items);
			
			request.setAttribute("searchkey", searchkey);
			request.setAttribute("search", search);
			
			//방명록이 notice.jsp에 출력
			String page="/solo/notice.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		
		}else if(uri.indexOf("NOinsert.do") != -1) {
			String passwd=request.getParameter("passwd");
			String content=request.getParameter("content");
			String name=request.getParameter("name");
			NotiDTO dto=new NotiDTO();
			dto.setName(name);
			dto.setPasswd(passwd);
			dto.setContent(content);
			dao.NOinsert(dto);
			//방명록 목록 갱신
			String url="/noti_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		
		}else if(uri.indexOf("NOdelete.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			dao.NOdelete(idx); //레코드 삭제
			//목록으로 이동
			String url="/noti_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		
		}else if(uri.indexOf("NOupdate.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			String passwd=request.getParameter("passwd");
			String content=request.getParameter("content");
			String name=request.getParameter("name");
			NotiDTO dto=new NotiDTO();
			dto.setName(name);
			dto.setIdx(idx);
			dto.setPasswd(passwd);
			dto.setContent(content);
			dao.NOupdate(dto);
			String url="/noti_servlet/list.do";
			response.sendRedirect(request.getContextPath()+url);
		
		}else if(uri.indexOf("NOcheck.do") != -1) {
			int idx=Integer.parseInt(request.getParameter("idx"));
			String passwd=request.getParameter("passwd");
			System.out.println("게시물번호:"+idx);
			System.out.println("사용자가 입력한 번호:"+passwd);
			
			boolean result=dao.NOcheck(idx, passwd);
			//비번이 맞으면 true, 틀리면 false 값이 리턴됨
			System.out.println("결과:"+result);
			String url="";
			if(result) {
				url="/solo/noti_edit.jsp";//수정용 출력페이지
				//게시물 내용을 dto로 리턴받음
				NotiDTO dto=dao.NOdetail(idx);
				//request 영역에 저장
				request.setAttribute("dto", dto);
			}else {
				url="/noti_servlet/list.do";
			}
			RequestDispatcher rd=request.getRequestDispatcher(url);
			rd.forward(request, response);
			
		}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
