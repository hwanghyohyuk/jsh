package datarget.sys.member;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import datarget.sys.cmm.util.EncryptionComponent;
import datarget.sys.sec.handler.SundoUserDetails;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	/* 의존성 주입 */
	@Resource(name = "memberService")
	private MemberService memberService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Autowired
	private EncryptionComponent encComp;

	@Autowired
	protected AuthenticationManager authenticationManager;

	/* 회원가입 */
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(RedirectAttributes redirect, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {

		EgovMap params = paramMap(req);
		
		try {
			params.put("uId", params.get("joinId").toString());
			params.put("uCrpt", this.encComp.sha256(params.get("joinId").toString()));
			params.put("uPw", this.encComp.sha256(params.get("joinPw").toString()));
			params.put("idGenAgr", params.get("idGenAgr").equals("on")?"Y":"N");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int insertResult = this.memberService.insertMemberJoin(params);

		String id = req.getParameter("join_id").toString();
		String password = req.getParameter("join_pw").toString();

		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(id, password);
		req.getSession();

		token.setDetails(new WebAuthenticationDetails(req));
		Authentication authenticatedUser = authenticationManager.authenticate(token);
		SecurityContextHolder.getContext().setAuthentication(authenticatedUser);

		String message = null;
		boolean mFlag = true;
		if (insertResult > 0) {
			message = "회원가입이 정상적으로 처리되었습니다.";
		} else {
			message = "회원가입 도중 문제가 발생하였습니다. 잠시후에 다시 시도해주시기바랍니다.";
		}
		redirect.addFlashAttribute("mFlag", mFlag);
		redirect.addFlashAttribute("message", message);

		return "redirect:/index";

	}

	/* 회원가입 아이디 중복검사 */
	@RequestMapping(value = "/check/id", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView idCheck(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("jsonView");
		EgovMap params = paramMap(req);
		int data = this.memberService.idConfirm(params);
		mv.addObject("cnt", data);

		return mv;
	}

	/* 회원가입 이메일 인증 진행 */
	@RequestMapping(value = "/certify/email/proc", method = RequestMethod.GET)
	public ModelAndView certifyEmailProc(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("index");
		EgovMap params = paramMap(req);
		int crtResult = this.memberService.certifyEmailProc(params);
		mv.addObject("crtResult", crtResult);
		// 1이면 인증 성공
		// 0이면 인증 실패
		return mv;
	}

	/* 회원가입 이메일 인증 검사 */
	@RequestMapping(value = "/check/certification", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView checkCertification(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("jsonView");
		EgovMap params = paramMap(req);
		int data = this.memberService.checkCertification(params);
		mv.addObject("cnt", data);

		// 1이상이면 인증 확인됨
		// 0이면 인증 필요
		return mv;
	}

	/* 회원가입 이메일 인증 검사 */
	@RequestMapping(value = "/delete/certification", method = RequestMethod.GET)
	@ResponseBody
	public void deleteCertification(HttpServletRequest req, ModelAndView mv) {
		EgovMap params = paramMap(req);
		this.memberService.deleteCertification(params);
	}

	@RequestMapping(value = "/test/mail", method = RequestMethod.GET)
	public String testMail() {
		return "mail";
	}


	/* 비밀번호 찾기 success */
	@RequestMapping(value = "/rewrite/password", method = RequestMethod.GET)
	public ModelAndView campaignPwchkConfirm(ModelAndView mv, HttpServletRequest req, @RequestParam("seq") String seq) {
		mv.setViewName("index"); //

		EgovMap params = paramMap(req);

		String userEmail = this.memberService.selectMemberEmail(params);

		mv.addObject("userEmail", userEmail);
		if(userEmail!=null) {
			mv.addObject("rewrite", true);
		}else {
			mv.addObject("rewrite", false);
		}

		return mv;
	}
	
	@RequestMapping(value = "/change/passwordSameCk", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView passwordSameCk(ModelAndView mv, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {
		mv.setViewName("jsonView");
		EgovMap params = paramMap(req);
		
		String beforePW = this.memberService.selectBeforePassword(params);		
		mv.addObject("beforePW", beforePW); 
		
		return mv;
	}
	
	@RequestMapping(value = "/change/password", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView pwChangeAJAX(ModelAndView mv, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {
		mv.setViewName("index");
		EgovMap params = paramMap(req);
		this.memberService.updateMemberpwChange(params);

		return mv;
	}

	/* 회원정보 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String MemberModify(ModelAndView mv, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		mv.setViewName("index");

		EgovMap params = paramMap(req);

		try {
			params.put("uPw", this.encComp.sha256(params.get("uPw").toString()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.memberService.updateMemberModify(params);

		String id = req.getParameter("id").toString();
		String password = req.getParameter("uPw").toString();

		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(id, password);
		req.getSession();

		token.setDetails(new WebAuthenticationDetails(req));
		Authentication authenticatedUser = authenticationManager.authenticate(token);
		SecurityContextHolder.getContext().setAuthentication(authenticatedUser);

		return "redirect:/campaign";
	}

	/* 기존 비밀번호 동일 여부 */
	@RequestMapping(value = "/password/history", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView passwordHistory(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("jsonView");
		EgovMap params = paramMap(req);
		int data = this.memberService.passwordHistory(params);
		mv.addObject("cnt", data);

		// 1이면 기존비밀번호 동일
		// 0이면 다름
		return mv;
	}

	/* 메시지 열람 */
	@RequestMapping(value = "/read/message", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView readMessage(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("jsonView");
		EgovMap param = paramMap(req);
		EgovMap alarmInfo = this.memberService.selectAlarmInfo(param);
		int isRead = 0;
		if (param.get("p1") != null) {
			isRead = this.memberService.readMessage(param);
		}
		mv.addObject("isRead", isRead);
		mv.addObject("alarmInfo", alarmInfo);
		return mv;
	}
	
	/* 메시지 페이지 열람 */
	@RequestMapping(value = "/read/next", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView nextMessagePage(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("jsonView");
		EgovMap param = this.paramMap(req);

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		SundoUserDetails userDetails = null;
		String userId = null;

		try {
			userDetails = (SundoUserDetails) authentication.getDetails();
			userId = userDetails.getUser_id();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (userId != null) {
			int nextCnt = Integer.parseInt((String) param.get("nextCnt"));
			param.put("uid", userId);
			param.put("curCnt",	nextCnt);
			param.put("nextCnt",nextCnt*3);
			EgovMap cntAlarm = this.memberService.countAlarm(param);
			mv.addObject("cntAlarm", cntAlarm);
			List<EgovMap> alarmList = this.memberService.selectAlarmList(param);
			mv.addObject("alarmList", alarmList);
		}
		return mv;
	}
	
	/* 메시지 열람 */
	@RequestMapping(value = "/read/move", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView moveMessage(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("jsonView");
		EgovMap param = paramMap(req);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		SundoUserDetails userDetails = null;
		String userId = null;

		try {
			userDetails = (SundoUserDetails) authentication.getDetails();
			userId = userDetails.getUser_id();
		} catch (Exception e) {
			e.printStackTrace();
		}
		param.put("uid", userId);
		EgovMap moveAlarm = this.memberService.selectMoveAlarm(param);
		String type = (String) param.get("type");
		int cnt = (int)moveAlarm.get("cnt");
		int idx = (int) moveAlarm.get("idx");
		if(type.equals("b")) {
			if(cnt < 2) {
				mv.addObject("max", true);
			}else {
				mv.addObject("max", false);
			}
			mv.addObject("min", false);
		}else if(type.equals("s")) {
			if(cnt < 2) {
				mv.addObject("min", true);
			}else {
				mv.addObject("min", false);
			}
			mv.addObject("max", false);
		}
		mv.addObject("idx", idx);
		return mv;
	}
	
	private EgovMap paramMap(HttpServletRequest request) {
		EgovMap paramMap = new EgovMap();

		Set keySet = request.getParameterMap().keySet();
		Iterator<?> iter = keySet.iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			paramMap.put(key, request.getParameter(key));
			logger.info("request.getParameter(\"" + key + "\", \"" + request.getParameter(key) + "\")");
		}

		return paramMap;
	}
	
	/* 메시지 열람 */
	@RequestMapping(value = "/read/del", method = RequestMethod.GET)
	@ResponseBody
	public void delMessage(HttpServletRequest req, ModelAndView mv) {
		EgovMap param = paramMap(req);
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		SundoUserDetails userDetails = null;
		String userId = null;

		try {
			userDetails = (SundoUserDetails) authentication.getDetails();
			userId = userDetails.getUser_id();
		} catch (Exception e) {
			e.printStackTrace();
		}
		param.put("uid", userId);
		
		this.memberService.delMessage(param);
	}
	/* 사용자 정보 일괄 암호화
	@RequestMapping(value = "/crypto/user/info", method = RequestMethod.GET)
	public ModelAndView cryptoUserInfo(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("redirect:/index");
		int data = this.memberService.updateUserInfoCryption();
		mv.addObject("cnt", data);
		return mv;
	} */
	
	/*
	@RequestMapping(value = "/svgDownload")
	public String svgDownload( HttpServletRequest request, HttpServletResponse response) {
		//String[] colorNmArr = new String[] { "blue", "indigo", "purple", "pink", "red", "orange", "yellow", "green", "teal", "cyan", "white", "gray", "graydark", "light", "dark"};
		String[] colorNmArr = new String[] { "pink" };
		//String[] colorArr = new String[] { "#007bff", "#6610f2", "#6f42c1", "#e83e8c", "#dc3545", "#fd7e14", "#ffc107", "#28a745", "#20c997", "#17a2b8", "#fff", "#6c757d", "#343a40", "#f8f9fa", "#343a40"};
		String[] colorArr = new String[] {"#ff4aff"};
		String[] shapeArr = new String[] {"heart","circle", "square", "triangle", "rvstriangle", "star", "rhombus", "heart","line"};
		//"circle", "square", "triangle", "rvstriangle", "star", "rhombus", "heart","line"
		String[] fillYn = new String[] {"fill","empty"};
		//,"empty"
		String path = "C:/Users/Hyo-hyuk/Downloads/svgCollection";
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		String sep = "-";
		if(colorNmArr.length == colorArr.length)
		for(int i=0; i<colorArr.length; i++) {
			for(int j=0; j<shapeArr.length; j++) {
				for(int k=0; k<fillYn.length; k++) {
						String color = colorArr[i];
						String colorNm = colorNmArr[i];
						String shape = shapeArr[j];
						String fill = fillYn[k];
						StringBuilder contents = new StringBuilder();
						switch (shape) {
						case "circle":
							contents.append("<svg width=\"10\" height=\"10\" xmlns=\"http://www.w3.org/2000/svg\">");
							contents.append(
									"<ellipse stroke-width=\"2\" cx=\"5\" cy=\"5\" rx=\"4\" ry=\"4\" stroke=\"");
							contents.append(color);
							contents.append("\" fill=\"");
							if (fill.equals("fill"))
								contents.append(color);
							else
								contents.append("#FFF");
							contents.append("\"/></svg>");
							break;
						case "square":
							contents.append("<svg width=\"10\" height=\"10\" xmlns=\"http://www.w3.org/2000/svg\">");
							contents.append(
									"<rect height=\"8\" width=\"8\" y=\"1\" x=\"1\" stroke-width=\"2\" stroke=\"");
							contents.append(color);
							contents.append("\" fill=\"");
							if (fill.equals("fill"))
								contents.append(color);
							else
								contents.append("#FFF");
							contents.append("\"/></svg>");
							break;
						case "triangle":
							contents.append("<svg width=\"10\" height=\"10\" xmlns=\"http://www.w3.org/2000/svg\">");
							contents.append(
									"<path d=\"m1.19773,9.30369l3.79726,-7.7077l3.79726,7.7077l-7.59452,0l-0.00001,0z\" stroke-width=\"1.5\" stroke=\"");
							contents.append(color);
							contents.append("\" fill=\"");
							if (fill.equals("fill"))
								contents.append(color);
							else
								contents.append("#FFF");
							contents.append("\"/></svg>");
							break;
						case "rvstriangle":
							contents.append("<svg width=\"10\" height=\"10\" xmlns=\"http://www.w3.org/2000/svg\">");
							contents.append(
									"<path transform=\"rotate(180 5.005231857299805,4.56617546081543) \" d=\"m1.22286,8.40145l3.78237,-7.67055l3.78237,7.67055l-7.56474,0z\" stroke-width=\"1.5\" stroke=\"");
							contents.append(color);
							contents.append("\" fill=\"");
							if (fill.equals("fill"))
								contents.append(color);
							else
								contents.append("#FFF");
							contents.append("\"/></svg>");
							break;
						case "star":
							contents.append("<svg width=\"14\" height=\"14\" xmlns=\"http://www.w3.org/2000/svg\">");
							contents.append(
									"<path stroke-width=\"1.5\" d=\"m2.07415,6.44199l4.15008,0l1.28241,-4.09601l1.28241,4.09601l4.15008,0l-3.35748,2.53144l1.28247,4.09601l-3.35748,-2.53151l-3.35748,2.53151l1.28247,-4.09601l-3.35748,-2.53144z\" stroke=\"");
							contents.append(color);
							contents.append("\" fill=\"");
							if (fill.equals("fill"))
								contents.append(color);
							else
								contents.append("#FFF");
							contents.append("\"/></svg>");
							break;
						case "rhombus":
							contents.append("<svg width=\"14\" height=\"14\" xmlns=\"http://www.w3.org/2000/svg\">");
							contents.append(
									"<rect height=\"8\" width=\"8\" y=\"3\" x=\"3\" transform=\"rotate(45 7,7)\"  stroke-width=\"2\" stroke=\"");
							contents.append(color);
							contents.append("\" fill=\"");
							if (fill.equals("fill"))
								contents.append(color);
							else
								contents.append("#FFF");
							contents.append("\"/></svg>");
							break;
						case "heart":
							contents.append("<svg width=\"10\" height=\"10\" xmlns=\"http://www.w3.org/2000/svg\">");
							contents.append(
									"<path d=\"m4.87948,4.06871c0.04081,-5.9697 10.09121,-2.55991 0,4.72526c-9.57643,-7.20759 0.0325,-10.68059 0,-4.72526z\" stroke-width=\"1\" stroke=\"");
							contents.append(color);
							contents.append("\" fill=\"");
							if (fill.equals("fill"))
								contents.append(color);
							else
								contents.append("#FFF");
							contents.append("\"/></svg>");
							break;
						case "line":
							contents.append("<svg width=\"10\" height=\"10\" xmlns=\"http://www.w3.org/2000/svg\">");
							contents.append(
									"<line stroke-linecap=\"round\" y2=\"8.97737\" x2=\"1.02031\" y1=\"0.97238\" x1=\"9.01094\" stroke-width=\"1.5\" stroke=\"");
							contents.append(color);
							contents.append("\"/></svg>");
							break;
						default:
							break;
					}
						
					try {
						FileWriter fw = new FileWriter(path+"/"+"unicon"+sep+shape+sep+colorNm+sep+fill+".svg");
						logger.info(contents.toString());
						fw.write(contents.toString());
						fw.close();
						System.out.println(".unicon"+sep+shape+sep+colorNm+sep+fill+"{background-image:url('/resources/unicon/unicon"+sep+shape+sep+colorNm+sep+fill+".svg');}");
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return "redirect:/index";
	}*/
}
