package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.domain.TravelogVO;
import org.zerock.service.MemberService;
import org.zerock.service.TravelogService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/travelog/*")
@AllArgsConstructor
@Log4j
public class TravelogController {

	private TravelogService service;
	
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		log.info("travelog/list executed");
		
		int total = service.getTotal(cri);
		
		List<TravelogVO> list = service.getList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/insert")
	@PreAuthorize("isAuthenticated()")
	public void insert(@ModelAttribute("cri") Criteria cri ) {
		
	}
	
	@PostMapping("/insert")
	public String insertSelectKey(TravelogVO travelog, RedirectAttributes rttr, MemberVO mvo) {
		log.info("travelog/insert executed");
		service.insertSelectKey(travelog);
		
		//MemberVO mvo = new MemberVO();
		//travelog.setWriterName(mvo.getUsername());
		
		rttr.addFlashAttribute("result", travelog.getBno());
		rttr.addFlashAttribute("newwriter", travelog.getWriterName());
		return "redirect:/travelog/list";
	}
	
	@GetMapping("/read")
	@PreAuthorize("isAuthenticated()")
	public void read(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("travelog/read method");
		
		TravelogVO vo = service.read(bno);
		model.addAttribute("travelog", vo);
		
//		model.addAttribute("pageNum", cri.getPageNum());
//		model.addAttribute("amount", cri.getAmount());
	}
	
	@PostMapping("/delete")
	@PreAuthorize("principal.username == #writer")
	public String delete(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr, String writer) {
		log.info("travelog/delete executed");
		boolean success = service.delete(bno);
		if (success) {
			rttr.addAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "삭제 성공");
			rttr.addFlashAttribute("messageBody", "삭제 되었습니다.");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/travelog/list";
	}
}
