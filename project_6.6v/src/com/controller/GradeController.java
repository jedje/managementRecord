package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.domain.Exam;
import com.domain.Instructor;
import com.domain.Open_curriculum;
import com.domain.Open_subject;
import com.domain.Student;
import com.service.ExamService;
import com.service.InstructorService;
import com.service.Open_curriculumService;
import com.service.Open_subjectService;
import com.service.StudentService;

@Controller
public class GradeController {
	@Autowired
	private ServletContext context;
	@Resource(name="examService")
	private ExamService examService;
	@Resource(name="studentService")
	private StudentService studentService;
	@Resource(name="open_curriculumService")
	private Open_curriculumService open_curriculumService;
	@Resource(name = "instructorService")
	private InstructorService instructorService;
	@Resource(name="open_subjectService")
	private Open_subjectService open_subjectService;
	
	@RequestMapping("/grade/download")
	@ResponseBody
	public byte[] downloadGrade(HttpServletResponse response, @RequestParam String question) throws IOException{
		String uploadPath = this.context.getRealPath("") + "resources/exam" + File.separator;
		
	    File file = new File(uploadPath + question +".zip");
	    byte[] bytes = FileCopyUtils.copyToByteArray(file);
	   
	    String fn = new String(file.getName().getBytes(), "iso_8859_1");
	    
	    response.setHeader("Content-Disposition",
	            "attachment;filename=\"" + fn + "\"");
	    response.setContentLength(bytes.length);
	    return bytes;
	}
	
	
	@RequestMapping("/a/grade/student")
	public String listStudent(Model model, String key, String value, String pageNum_) {
		if(key == null || key.equals("")) {
			key = "all";
		}
		if(pageNum_ == null){
			pageNum_ = "1";
		}
		
		int pageNum = Integer.parseInt(pageNum_);
		int startIdx = 10 * (pageNum - 1);
		int totalcount = this.studentService.totalCount();
		int count = this.studentService.count(key, value);
		
		int lastPage = (int)Math.ceil(count/(double)10);
		
		List<Student> list = this.studentService.list(key, value, startIdx);
		
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("totalcount", totalcount);
		
		return "admin/a_grade_student_1";
	}
	
	@RequestMapping("/a/grade/student/info")
	public String infoStudent(Model model, String student_id) {
		List<Student> info = this.studentService.list("student_id", student_id, 0);
		Student st = new Student(); st.setStudent_id(student_id);
		List<Student> lh = this.studentService.lhList(st);
		
		model.addAttribute("info", info);
		model.addAttribute("lh", lh);
		model.addAttribute("lhCount", lh.size());
		return "admin/a_grade_student_2";
	}
	
	@RequestMapping("/a/grade/student/info2")
	public String listGradeSt(Model model, String student_id, String oc_id) {
		List<Student> info = this.studentService.list("student_id", student_id, 0);
		
		Student st = new Student(); st.setStudent_id(student_id); st.setOc_id(oc_id);
		List<Student> lh = this.studentService.lhList(st);
		Exam e = new Exam(); e.setStudent_id(student_id); e.setOc_id(oc_id);
		List<Exam> gList = this.examService.aCheckStGrade(e);
		
		model.addAttribute("info", info);
		model.addAttribute("lh", lh);
		model.addAttribute("gList", gList);
		model.addAttribute("gCount", gList.size());
		return "admin/a_grade_student_3";
	}
	
	
	
	@RequestMapping("/a/grade/oc")
	public String listOC(Model model, String key, String value, String pageNum_) {
		if(key == null || key.equals("")) {
			key = "all";
			value = "";
		}
		if(pageNum_ == null){
			pageNum_ = "1";
		}
		
		int pageNum = Integer.parseInt(pageNum_);
		int startIdx = 10 * (pageNum - 1);
		
		int count = this.open_curriculumService.count(key, value);
		int lastPage = (int)Math.ceil(count/(double)10);
		
		List<Open_curriculum> list = this.open_curriculumService.list(key, value, startIdx);
		
		model.addAttribute("key", key);
		model.addAttribute("value", value);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		
		return "admin/a_grade_oc_1";
	}
	
	@RequestMapping("/a/grade/oc/info")
	public String infoOC(Model model, String oc_id) {
		List<Open_curriculum> info = this.open_curriculumService.list("oc_id", oc_id, 0);
		Exam e = new Exam(); e.setOc_id(oc_id);
		List<Exam> eList = this.examService.aCheckPoint(e);
		
		model.addAttribute("info", info);
		model.addAttribute("oc_id", oc_id);
		
		model.addAttribute("eList", eList);
		model.addAttribute("eCount", eList.size());
		return "admin/a_grade_oc_2";
	}
	
	@RequestMapping("/a/grade/oc/info2")
	public String listGradeOS(Model model, String oc_id, String ex_id) {
		List<Open_curriculum> info = this.open_curriculumService.list("oc_id", oc_id, 0);
		Exam e = new Exam(); e.setOc_id(oc_id); e.setEx_id(ex_id);
		List<Exam> eList = this.examService.aCheckPoint(e);
		List<Exam> gList = this.examService.aCheckGrade(e);
		
		model.addAttribute("info", info);
		model.addAttribute("eList", eList);
		model.addAttribute("gList", gList);
		model.addAttribute("gCount", gList.size());
		return "admin/a_grade_oc_3";
	}
	

	
	
/*------------------------------------------------------------------------------------------------------------------------------------------*/
	@RequestMapping("/s/grade")
	public String profile(Model model, String student_id) {
		Student st = new Student(); st.setStudent_id(student_id);
		List<Student> lh = this.studentService.lhList(st);		
		
		model.addAttribute("lh", lh);
		
		return "student/s_grade_1";
	}
	
	@RequestMapping("/s/grade2")
	public String grade(Model model, String student_id, String oc_id) {
		// List<Student> info = this.studentService.list("student_id", student_id);
		Student st = new Student(); st.setStudent_id(student_id); st.setOc_id(oc_id);
		List<Student> lh = this.studentService.lhList(st);
		Exam e = new Exam(); e.setStudent_id(student_id); e.setOc_id(oc_id);
		List<Exam> gList = this.examService.aCheckStGrade(e);
		
		//model.addAttribute("info", info);
		model.addAttribute("lh", lh);
		model.addAttribute("gList", gList);
		return "student/s_grade_2";
	}
	
/*------------------------------------------------------------------------------------------------------------------------------------------*/	
	@RequestMapping("/i/point")
	public String pointInst(Model model, String instructor_id, String pageNum_) {
		List<Instructor> list2 = this.instructorService.list2("instructor_id",instructor_id);
		List<Instructor> list3 = this.instructorService.list3("instructor_id",instructor_id);
		List<Instructor> list4 = this.instructorService.list4("instructor_id",instructor_id);
		
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list2count", list2.size());
		model.addAttribute("list3count", list3.size());
		model.addAttribute("list4count", list4.size());
		return "instructor/i_point_1";
	}
	
	@RequestMapping("/i/point/info")
	public String pointInfo(Model model, String instructor_id, String os_id) {
		Exam e = new Exam();
		int countP = 0;
		e.setInstructor_id(instructor_id);
		e.setOs_id(os_id);
		List<Open_subject> temp = this.open_subjectService.listNoLimit("os_id",os_id);
		Open_subject info = temp.get(0);
		List<Exam> point = this.examService.iCheckPoint(e);
		if(point.get(0).getEx_id() == null) {
				countP = 0;
			}else {
				countP = point.size();
			}
		model.addAttribute("info", info);
		model.addAttribute("point", point);
		model.addAttribute("count", countP);
		return "instructor/i_point_2";
	}
	
	@RequestMapping(value = "/i/point/add", method = RequestMethod.POST)
	public String addPoint(MultipartFile examFile, Exam e, RedirectAttributes rttr) throws IOException {
		String txt = "fail";
		System.out.println(txt);
		String uploadPath = this.context.getRealPath("") + "resources/exam" + File.separator;
		String temp = examFile.getOriginalFilename();
		String ext = temp.substring(temp.lastIndexOf("."));
		int cnt = this.examService.quesName(e);
		String newFileName = e.getOs_id() + "_EX" + (cnt+1) + ext;
		
		FileCopyUtils.copy(examFile.getBytes(), new File(uploadPath + newFileName));
		System.out.println(ext);

		e.setQuestion(newFileName);
		int result = this.examService.addPoint(e);
		if (result == 1) {
			txt = "success";
		}
		
		rttr.addFlashAttribute("result", txt);
		
		System.out.println(uploadPath + newFileName);
		
		
		return "redirect:/i/point/info?instructor_id="+e.getInstructor_id()+"&os_id="+e.getOs_id();
	}
	
	@RequestMapping("/i/point/del")
	public String delPoint(String ex_id, RedirectAttributes rttr) {
		
		String txt = "fail";
		int result = this.examService.delPoint(ex_id);
		if (result == 1) {
			txt = "success";
		}
		
		rttr.addFlashAttribute("result", txt);
		
		return "redirect:/i/point/info";
	}

	
	@RequestMapping("/i/grade")
	public String gradeInst(Model model, String instructor_id) {
		List<Instructor> list2 = this.instructorService.list2("instructor_id",instructor_id);
		List<Instructor> list3 = this.instructorService.list3("instructor_id",instructor_id);
		List<Instructor> list4 = this.instructorService.list4("instructor_id",instructor_id);
		
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		model.addAttribute("list2count", list2.size());
		model.addAttribute("list3count", list3.size());
		model.addAttribute("list4count", list4.size());
		return "instructor/i_grade_1";
	}
	
	@RequestMapping("/i/grade/info")
	public String gradeInfo(Model model, String instructor_id, String os_id) {
		Exam e = new Exam();
		int countP = 0;
		e.setInstructor_id(instructor_id);
		e.setOs_id(os_id);
		List<Open_subject> info = this.open_subjectService.listNoLimit("os_id",os_id);
		List<Exam> point = this.examService.iCheckPoint(e);
		if(point.get(0).getEx_id() == null) {
			countP = 0;
		}else {
			countP = point.size();
		}
		model.addAttribute("info", info);
		model.addAttribute("os_id", os_id);
		model.addAttribute("point", point);
		model.addAttribute("count", countP);
		return "instructor/i_grade_2";
	}
	
	@RequestMapping("/i/grade/info2")
	public String gradeInfo2(Model model, String instructor_id ,String os_id, String ex_id) {
		List<Open_subject> info = this.open_subjectService.listNoLimit("os_id",os_id);
		Exam e = new Exam();
		e.setInstructor_id(instructor_id);
		e.setOs_id(os_id); e.setEx_id(ex_id);
		List<Exam> point = this.examService.iCheckPoint(e);
		List<Exam> gList = this.examService.aCheckGrade(e);
		model.addAttribute("info", info);
		model.addAttribute("point", point);
		model.addAttribute("gList", gList);
		model.addAttribute("instructor_id", instructor_id);
		model.addAttribute("os_id", os_id);
		model.addAttribute("ex_id", ex_id);
		model.addAttribute("count", gList.size());
		return "instructor/i_grade_3";
	}
	
	
	@RequestMapping("/i/grade/add")
	public String addGrade(Exam e, RedirectAttributes rttr) {
		
		String txt = "fail";
		int result = this.examService.addGrade(e);
		if (result == 1) {
			txt = "success";
		}
		
		rttr.addFlashAttribute("result", txt);
		
		return "redirect:/i/grade/info2?instructor_id="+e.getInstructor_id()+"&os_id="+e.getOs_id()+"&ex_id="+e.getEx_id();
	}
	
	@RequestMapping("/i/grade/del")
	public String delGrade(Exam e, RedirectAttributes rttr) {
		
		String txt = "fail";
		int result = this.examService.delGrade(e);
		if (result == 1) {
			txt = "success";
		}
		
		rttr.addFlashAttribute("result", txt);
		
		return "redirect:/i/grade/info2?instructor_id="+e.getInstructor_id()+"&os_id="+e.getOs_id()+"&ex_id="+e.getEx_id();
	}

	
}
