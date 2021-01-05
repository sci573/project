package solo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.dto.BoardDTO;
import page.Pager;
import solo.dao.QnaDAO;
import solo.dto.QnaCommentDTO;
import solo.dto.QnaDTO;

@WebServlet("/qna_servlet/*")
public class QnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		QnaDAO dao= new QnaDAO();
		
		if(url.indexOf("list.do") != -1) {
			//레코드 개수 계산
			int count =dao.count();
			//페이지 나누기를 위한 처리
			int curPage=1;
			//숫자 처리는 null포인트 익셉션이 잘 일어나기 때문에 if문으로 처리 해주는 게 좋다.
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage); //import page.Pager
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			List<QnaDTO> list=dao.list(start,end);
			request.setAttribute("list", list);
			//페이지 네비게이션 출력을 위한 정보 전달
			request.setAttribute("page", pager);
			String page="/solo/qna.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("Qinsert.do") != -1) {
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			
			QnaDTO dto=new QnaDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dao.insert(dto);
			String page="/qna_servlet/list.do";
			response.sendRedirect(contextPath+page);
		
		}else if(url.indexOf("Qsearch.do") != -1) {
			//검색옵션과 검색 키워드
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			
			List<QnaDTO> list=dao.searchList(search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			String page="/solo/qna_search.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		
		}else if(url.indexOf("Qview.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//조회수 증가 처리
			dao.plusReadCount(num, session);
			//번호에 해당하는 게시물 리턴
			QnaDTO dto=dao.viewReplace(num);
			//request 영역에 저장
			request.setAttribute("dto", dto);
			//화면 전환
			String page="/solo/qna_view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		
		}else if(url.indexOf("Qreply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			QnaDTO dto=dao.view(num);
			dto.setSubject("└답변 : "+dto.getSubject());
			dto.setContent("=====문의 내용=====\n"+dto.getContent()+"\n\n\n"+"=====답변=====\n");
			request.setAttribute("dto", dto);
			String page="/solo/qna_reply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		
		}else if(url.indexOf("QinsertReply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			QnaDTO dto=dao.view(num);
			int ref=dto.getRef(); //답변 그룹 번호
			int re_step=dto.getRe_step()+1;//출력순번
			int re_level=dto.getRe_level()+1;//답변 단계
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_level(re_level);
			dto.setRe_step(re_step);
			//답글 순서 조정
			dao.updateStep(ref, re_step);
			//답글 쓰기
			dao.reply(dto);
			//목록으로 이동
			String page="/qna_servlet/list.do";
			response.sendRedirect(contextPath + page);
		
		}else if(url.indexOf("Qpass_check.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			//입력한 비밀번호
			String passwd=request.getParameter("passwd");
			//비밀번호가 맞는지 확인
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null) {//비밀번호가 맞으면
				page="/solo/qna_edit.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//비밀번호가 틀리면
				page=contextPath+"/qna_servlet/Qview.do?num="+num+"&message=error";
				response.sendRedirect(page);
			}
		
		}else if(url.indexOf("Qupdate.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			QnaDTO dto=new QnaDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			//레코드 수정
			dao.update(dto);
			//페이지 이동
			String page="/qna_servlet/list.do";
			response.sendRedirect(contextPath+page);
			
		}else if(url.indexOf("Qdelete.do") != -1) {
			//삭제할 게시물 번호
			int num=Integer.parseInt(request.getParameter("num"));
			dao.delete(num);
			//페이지 이동
			String page="/qna_servlet/list.do";
			response.sendRedirect(contextPath+page);
		
		}else if(url.indexOf("QcommentList.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호:"+num);
			//댓글 목록 리턴
			List<QnaCommentDTO> list=dao.commentList(num);
			//request영역에 저장
			request.setAttribute("list", list);
			//출력 페이지로 이동
			String page="/solo/qna_comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		
		}else if(url.indexOf("Qcomment_add.do") != -1) {
			QnaCommentDTO dto=new QnaCommentDTO();
			//게시물 번호
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setBoard_num(board_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
			//이곳은 백그라운드로 실행되기 때문에 어디로 page이동하든
			//소용없다.
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
