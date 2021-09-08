package datarget.sys.sec.user;

import org.springframework.stereotype.Repository;

import datarget.egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;


@Repository("userAccessDAO")
public class SUserAccessDAO extends EgovComAbstractDAO {
	
	protected SUserAccessVO getUserInfo(String param) throws Exception {
		return selectOne("member.selectMemberLogin", param);
	}
}
