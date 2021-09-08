package datarget.sys.member;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import datarget.sys.cmm.util.EncryptionComponent;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name = "memberDAO")
	private MemberDAO memberDAO;
	
	@Autowired
	private EncryptionComponent encComp;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    private EgovPropertyService propertiesService;
    
	
	@Override
	public int insertMemberJoin(EgovMap params) {
		
		return memberDAO.insertMemberJoin(params);
	}

	@Override
	public int idConfirm(EgovMap params) {
		
		return memberDAO.idConfirm(params);
	}

	@Override
	public int pwchkConfirm(EgovMap params) {
		
		return memberDAO.pwchkConfirm(params);
	}

	@Override
	public int updateMemberModify(EgovMap params) {
		
		return memberDAO.updateMemberModity(params);
	}

	@Override
	public int updateMemberpwChange(EgovMap params) {
		
		return memberDAO.updateMemberpwChange(params);
	}

	@Override
	public int selectMemberId(EgovMap params) {
		
		return memberDAO.selectMemberId(params);
	}

	@Override
	public EgovMap selectMemberNo(EgovMap params) {
		return memberDAO.selectMemberNo(params);
	}

	@Override
	public String selectMemberEmail(EgovMap params) {
		return memberDAO.selectMemberEmail(params);
	}

	@Override
	public int certifyEmailProc(EgovMap params) {
		return memberDAO.updateCrt(params);
	}

	@Override
	public int checkCertification(EgovMap params) {
		int chkCrtCnt = memberDAO.selectChkCrtCnt(params);
		return chkCrtCnt;
	}

	@Override
	public void deleteCertification(EgovMap params) {
		memberDAO.deleteCertification(params);
	}

	@Override
	public int passwordHistory(EgovMap params) {
		return memberDAO.selectPasswordCnt(params);
	}

	@Override
	public List<EgovMap> selectAlarmList(EgovMap param) {
		return this.memberDAO.selectAlarmList(param);
	}

	@Override
	public int readMessage(EgovMap params) {
		return this.memberDAO.updateReadMessage(params);		
	}

	@Override
	public void updateMemberRwPw(EgovMap params) {
		this.memberDAO.updateMemberRwPw(params);	
	}

	@Override
	public void updateMemberRwPwSubmit(EgovMap params) {
		this.memberDAO.updateMemberRwPwSubmit(params);
	}

	@Override
	public String selectBeforePassword(EgovMap params) {
		return memberDAO.selectBeforePassword(params);
	}

	@Override
	public int updateUserInfoCryption() {
		List<EgovMap> userInfoList = memberDAO.selectUserInfoList();
		int cnt = 0;
		for(EgovMap u : userInfoList) {
			try {
				u.put("cryptoId", this.encComp.sha256(u.get("uId").toString()));
				u.put("cryptoPw", this.encComp.sha256(u.get("uPw").toString()));

				int updcnt = memberDAO.updateUserInfoCryption(u);
				cnt += updcnt;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	@Override
	public EgovMap countAlarm(EgovMap params) {
		return this.memberDAO.countAlarm(params);	
	}
	
	@Override
	public EgovMap selectAlarmInfo(EgovMap params) {
		return this.memberDAO.selectAlarmInfo(params);	
	}
	
	@Override
	public EgovMap selectMoveAlarm(EgovMap params) {
		return this.memberDAO.selectMoveAlarm(params);	
	}
	
	@Override
	public void delMessage(EgovMap params) {
		this.memberDAO.delMessage(params);	
	}
	/*@Override
	public EgovMap selectMemberLogin(EgovMap params) {
		
		return memberDAO.selectMemberLogin(params);
	}*/
}
