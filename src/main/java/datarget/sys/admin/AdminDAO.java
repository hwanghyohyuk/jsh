package datarget.sys.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import datarget.egov.cmm.service.impl.EgovComAbstractDAO;
import datarget.sys.cmm.util.PagingVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("adminDAO")
public class AdminDAO extends EgovComAbstractDAO {

	public List<EgovMap> selectUserMap() {
		return selectList("admin.selectUserMap");
	}

	public int selectAdminCnt() {
		return selectOne("admin.selectAdminCnt");
	}

	public int UserDelete(EgovMap params) {
		return delete("admin.UserDelete",params);
	}

	public int authChange(EgovMap params) {
		return update("admin.updateAdminCnt",params);
	}
	
	public int messageSend(EgovMap params) {
		return insert("admin.messageSend",params);
	}
	
}
