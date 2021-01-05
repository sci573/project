package solo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import solo.dto.QnaCommentDTO;
import solo.dto.QnaDTO;
import sqlmap.MybatisManager;

public class QnaDAO {

	public List<QnaDTO> list(int start, int end) {
		List<QnaDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list=session.selectList("qna.Qlist",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null) session.close();
		}
		return list;
	}
	//게시물 저장
	public void insert(QnaDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("qna.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}

	public List<QnaDTO> searchList(String search_option, String keyword) {
		List<QnaDTO> list=null;
		try( SqlSession session=MybatisManager.getInstance().openSession()){
			Map<String,String> map=new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", "%"+keyword+"%");
			list=session.selectList("qna.QsearchList", map);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//조회수 증가 처리
	public void plusReadCount(int num, HttpSession count_session) {
		SqlSession session=null;
		try {
			long read_time=0;
			if(count_session.getAttribute("read_time_"+num)!=null){
				read_time=(long)count_session.getAttribute("read_time_"+num);
			}
			long current_time=System.currentTimeMillis();//현재시각
			session=MybatisManager.getInstance().openSession();
			if(current_time-read_time>5*1000){//현재시간-읽은시간>5초, 
				//만약 하루에 한번이면 24*60*60*1000
				session.update("qna.QplusReadCount", num);
				session.commit();
				//최근 열람 시각 업데이트
				count_session.setAttribute("read_time_"+num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	public QnaDTO viewReplace(int num) {
		QnaDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("qna.Qview", num);
			//줄바꿈 처리
			String content=dto.getContent();
			content=content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}
	public QnaDTO view(int num) {
		QnaDTO dto=null;//초기화
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("qna.Qview", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
	}
	public void update(QnaDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("qna.Qupdate", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public void updateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			QnaDTO dto=new QnaDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("qna.QupdateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public void reply(QnaDTO dto) {
		SqlSession session=null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("qna.Qreply", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	public String passwdCheck(int num, String passwd) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("qna.Qpass_check", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}
	
	public void delete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("qna.Qdelete1", num);
			session.delete("qna.Qdelete2", num);//진짜삭제가 아니기에 update()
            session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}
	
	public int count() {
		int result=0;
		//try~with문
		try(SqlSession session=MybatisManager.getInstance().openSession()){
			result=session.selectOne("qna.Qcount");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<QnaCommentDTO> commentList(int num) {
		List<QnaCommentDTO> list=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("qna.QcommentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	public void commentAdd(QnaCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("qna.QcommentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}

	}

}
