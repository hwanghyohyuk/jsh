package datarget.sys.member;

import java.util.List;

import org.springframework.stereotype.Repository;

import datarget.egov.cmm.service.impl.EgovComAbstractDAO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("memberDAO")
public class MemberDAO extends EgovComAbstractDAO {

	public int idConfirm(EgovMap params) {
		return  selectOne("member.idConfirm",params);
	}
	
	public int insertMemberJoin(EgovMap params) {
		
		return insert("member.insertMemberJoin",params);
	}

	public int pwchkConfirm(EgovMap params) {
		
		return selectOne("member.pwchkConfirm",params);
	}

	public int updateMemberModity(EgovMap params) {
		
		return update("member.updateMemberModity",params);
	}

	public int updateMemberpwChange(EgovMap params) {
		
		return update("member.updateMemberpwChange",params);
	}

	public int selectMemberId(EgovMap params) {
		
		return selectOne("member.selectMemberId",params);
	}

	public EgovMap selectMemberNo(EgovMap params) {
		return selectOne("member.selectMemberNo",params);
	}

	public String selectMemberEmail(EgovMap params) {
		return selectOne("member.selectMemberEmail",params);
	}

	public int insertCertification(EgovMap params) {
		return insert("member.insertCertification",params);
	}

	public int selectCrtNo(EgovMap params) {
		return selectOne("member.selectCrtNo",params);
	}

	public int updateCrt(EgovMap params) {
		return update("member.updateCrt",params);
	}

	public int selectCrtCnt(EgovMap params) {
		return selectOne("member.selectCrtCnt",params);
	}

	public int selectChkCrtCnt(EgovMap params) {
		return selectOne("member.selectChkCrtCnt",params);
	}

	public void deleteCertification(EgovMap params) {
		delete("member.deleteCertification",params);
	}

	public int selectPasswordCnt(EgovMap params) {
		return selectOne("member.selectPasswordCnt",params);
	}

	public List<EgovMap> selectAlarmList(EgovMap param) {
		return selectList("member.selectAlarmList", param);
	}

	public int updateReadMessage(EgovMap params) {
		return update("member.updateReadMessage",params);
	}

	public void updateMemberRwPw(EgovMap params) {
		update("member.updateMemberRwPw",params);
	}

	public void updateMemberRwPwSubmit(EgovMap params) {
		update("member.updateMemberRwPwSubmit",params);
	}
	
	public String selectBeforePassword(EgovMap params) {
		return selectOne("member.selectBeforePassword",params);
	}

	public List<EgovMap> selectUserInfoList() {
		return selectList("member.selectUserInfoList");
	}

	public int updateUserInfoCryption(EgovMap u) {
		return update("member.updateUserInfoCryption",u);
	}

	public EgovMap countAlarm(EgovMap params) {
		return selectOne("member.countAlarm",params);
	}
	
	public EgovMap selectAlarmInfo(EgovMap params) {
		return selectOne("member.selectAlarmInfo",params);
	}
	
	public EgovMap selectMoveAlarm(EgovMap params) {
		return selectOne("member.selectMoveAlarm",params);
	}
	
	public void delMessage(EgovMap params) {
		update("member.delMessage",params);
	}
	/*public EgovMap selectMemberLogin(EgovMap params) {
		
		return selectOne("member.selectMemberLogin",params);
	}*/


}
