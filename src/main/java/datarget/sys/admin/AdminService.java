package datarget.sys.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import datarget.sys.cmm.util.PagingVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface AdminService {
	
	List<EgovMap> selectUserMap();
	
	int selectAdminCnt();
	
	int authChange(EgovMap params);
	
	int UserDelete(EgovMap params);
	
	int messageSend(EgovMap params);
}