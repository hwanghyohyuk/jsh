package datarget.sys.admin;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.springframework.stereotype.Service;

import datarget.sys.cmm.util.PagingVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

   @Resource(name = "adminDAO")
   private AdminDAO adminDAO;

   @Override
   public List<EgovMap> selectUserMap() {
      return this.adminDAO.selectUserMap();
   }

   @Override
   public int selectAdminCnt() {
      return this.adminDAO.selectAdminCnt();
   }
   
   @Override
   public int authChange(EgovMap params) {
      return this.adminDAO.authChange(params);
   }
   
   @Override
   public int UserDelete(EgovMap params) {
      return this.adminDAO.UserDelete(params);
   }
   
   public int messageSend(EgovMap params) {
		return this.adminDAO.messageSend(params);
	}
}