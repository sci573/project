package solo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import solo.dto.NotiDTO;
import sqlmap.MybatisManager;

public class NotiDAO {
	public List<NotiDTO> list(String searchkey, String search) {
		SqlSession session=MybatisManager.getInstance().openSession();
		List<NotiDTO> list=null;
		if(searchkey.equals("name_content")) {//이름+내용
			list=session.selectList("notice.NOlistAll", "%"+search+"%");
		}else {
			Map<String,String> map=new HashMap<>();
			map.put("searchkey", searchkey);
			map.put("search", "%"+search+"%");
			list=session.selectList("notice.NOlist",map);
		}
		
		//줄바꿈 및 특수문자 처리기능 추가
		for(NotiDTO dto : list) {
			String content=dto.getContent();
			//태그 문자 처리
			content=content.replace("<", "&lt;");
			content=content.replace(">", "&gt;");
			//줄바꿈 처리
			content=content.replace("\n", "<br>");
			//공백 2문자이상 처리
			content=content.replace("  ", "&nbsp;&nbsp;");
			
			//키워드 색상 처리
			if(!searchkey.equals("name")) {//이름으로만 검색시 제외
				content=content.replace(search,
						"<span style='color:red'>"+search+"</span>");
			}
			dto.setContent(content);
		}
		session.close();
		return list;
	}

	public void NOinsert(NotiDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.insert("notice.NOinsert", dto);
		session.commit();
		session.close();
	}

	public void NOdelete(int idx) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("notice.NOdelete", idx);
		session.commit();
		session.close();
	}

	public void NOupdate(NotiDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("notice.NOupdate", dto);
		session.commit();
		session.close();
	}

	public boolean NOcheck(int idx, String passwd) {
		boolean result=false;
		SqlSession session=MybatisManager.getInstance().openSession();
		NotiDTO dto=new NotiDTO();
		dto.setIdx(idx);
		dto.setPasswd(passwd);
		//레코드가 1개가 리턴
		int count=session.selectOne("notice.NOcheck", dto);
		session.close();
		if(count==1) {
			result=true;
		}
		return result;
	}

	public NotiDTO NOdetail(int idx) {
		NotiDTO dto=new NotiDTO();
		SqlSession session=MybatisManager.getInstance().openSession();
		dto = session.selectOne("notice.NOdetail", idx);
		session.close();
		return dto;
	}

}
