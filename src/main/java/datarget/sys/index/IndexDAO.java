package datarget.sys.index;

import java.util.List;

import org.springframework.stereotype.Repository;

import datarget.egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("indexDAO")
public class IndexDAO extends EgovComAbstractDAO {

	public int insertInquire(EgovMap param) {
		return insert("index.insertInquire",param);
	}
}
