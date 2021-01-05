package solo.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import solo.dao.SoloDAO;
import solo.dto.SoloDTO;

@WebServlet("/kakao_servlet/*")
public class SoloController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		SoloDAO dao=new SoloDAO();
		
		if(uri.indexOf("login.do") != -1) {
			SoloDTO dto=new SoloDTO();
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			System.out.println("아이디:"+userid);
			System.out.println("비밀번호:"+passwd);
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(dto);
			if (result == "성공") {
				System.out.println(result);
				response.getWriter().write("loginSuccess");
			} else {
				System.out.println(result);
			}

		}else if(uri.indexOf("join.do") !=-1) {
			String userid =request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			SoloDTO dto=new SoloDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setName(name);
			dto.setAddress(address);
			dao.join(dto);
	}
}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
