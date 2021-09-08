package datarget.sys.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;

import datarget.sys.cmm.util.PagingVO;
import datarget.sys.sec.handler.SundoUserDetails;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final String FILE_SERVER_PATH = File.separator + "data" + File.separator + "upload" + File.separator
			+ "sample";
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	private EgovPropertyService propertiesService;

	@Resource(name = "adminService")
	private AdminService adminService;

	/* adminRedirect */
	@RequestMapping(value = { "" }, method = RequestMethod.GET)
	public ModelAndView adminRedirect(ModelAndView mv, HttpServletRequest req, HttpServletResponse res,
			HttpSession session) {
		mv.setViewName("redirect:/admin/admin");
		return mv;
	}

	/* admin login */
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin(ModelAndView mv, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		mv.setViewName("admin/admin");
		EgovMap params = paramMap(req);
		String adminId = req.getParameter("id");
		String adminNm = req.getParameter("userNm");
		List<EgovMap> userMap = this.adminService.selectUserMap();
		mv.addObject("userList", userMap);
		mv.addObject("adminId", adminId);
		mv.addObject("adminNm", adminNm);
		return mv;
	}

	/* 사용자 권한변경 */
	@RequestMapping(value = "/ajax/authChange", method = RequestMethod.GET)
	@ResponseBody
	public String authChange(ModelAndView mv, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		mv.setViewName("jsonView");

		EgovMap params = paramMap(req);
		this.adminService.authChange(params);

		return "redirect:/admin/admin";
	}

	/* 사용자 권한변경 */
	@RequestMapping(value = "/ajax/UserDelete", method = RequestMethod.GET)
	@ResponseBody
	public String UserDelete(ModelAndView mv, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		mv.setViewName("jsonView");

		EgovMap params = paramMap(req);
		this.adminService.UserDelete(params);

		return "redirect:/admin/admin";
	}

	/* 사용자 메세지 전송 */
	@RequestMapping(value = "/messageSend", method = RequestMethod.GET)
	public String messageSend(ModelAndView mv, HttpServletRequest req, HttpServletResponse res, HttpSession session) {
		EgovMap params = paramMap(req);

		int data = this.adminService.messageSend(params);

		return "redirect:/admin/admin";
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

	@RequestMapping(value = "/ajax/upload/image", method = RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				try {
					String fileName = file.getOriginalFilename();
					String fileExtention = fileName.substring(fileName.lastIndexOf("."));
					byte[] bytes = file.getBytes();
					logger.info(bytes.toString());
					String uploadPath = "/data/upload/images";
					File uploadFile = new File(uploadPath);
					if (!uploadFile.exists()) {
						uploadFile.mkdirs();
					}
					fileName = UUID.randomUUID().toString();
					uploadPath = uploadPath + "/" + fileName + fileExtention;
					out = new FileOutputStream(new File(uploadPath));
					out.write(bytes);

					printWriter = resp.getWriter();
					resp.setContentType("text/html");

					// json 데이터로 등록
					// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
					// 이런 형태로 리턴이 나가야함.
					json.addProperty("uploaded", 1);
					json.addProperty("fileName", fileName);
					json.addProperty("url", uploadPath);

					printWriter.println(json);
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					if (out != null) {
						try {
							out.close();
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					if (printWriter != null) {
						printWriter.close();
					}
				}
			}
		}
		return null;
	}
}
