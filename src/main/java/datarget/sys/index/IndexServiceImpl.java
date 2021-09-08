package datarget.sys.index;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("indexService")
public class IndexServiceImpl implements IndexService{

	@Resource(name = "indexDAO")
	private IndexDAO indexDAO;

	@Override
	public int insertInquire(EgovMap param) {
		return this.indexDAO.insertInquire(param);
	}

}
