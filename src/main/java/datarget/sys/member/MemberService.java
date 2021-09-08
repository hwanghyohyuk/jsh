package datarget.sys.member;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MemberService {

	int insertMemberJoin(EgovMap params);

	int idConfirm(EgovMap params);

	int pwchkConfirm(EgovMap params);

	int updateMemberModify(EgovMap params);

	int updateMemberpwChange(EgovMap params);

	int selectMemberId(EgovMap params);

	EgovMap selectMemberNo(EgovMap params);

	String selectMemberEmail(EgovMap params);

	int certifyEmailProc(EgovMap params);

	int checkCertification(EgovMap params);

	void deleteCertification(EgovMap params);

	int passwordHistory(EgovMap params);

	List<EgovMap> selectAlarmList(EgovMap param);

	int readMessage(EgovMap params);

	void updateMemberRwPw(EgovMap params);

	void updateMemberRwPwSubmit(EgovMap params);
	
	String selectBeforePassword(EgovMap params);

	int updateUserInfoCryption();
	
	EgovMap countAlarm(EgovMap params);
	
	EgovMap selectAlarmInfo(EgovMap params);
	
	EgovMap selectMoveAlarm(EgovMap params);
	
	void delMessage(EgovMap params);
	/*EgovMap selectMemberLogin(EgovMap params);*/

	/*boolean selectMemberLogin(String id, String pw);*/
}
