package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.TravelogVO;
import org.zerock.service.TravelogService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/travelog/*")
@AllArgsConstructor
@Log4j
public class TravelogController {

	private TravelogService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("travelog/list executed");
		
		List<TravelogVO> list = service.getList();
		model.addAttribute("tlist", list);
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	@PostMapping("/insert")
	public String insertSelectKey(TravelogVO travelog, RedirectAttributes rttr) {
		log.info("travelog/insert executed");
		service.insertSelectKey(travelog);
		
		rttr.addFlashAttribute("result", travelog.getBno());
		rttr.addFlashAttribute("newwriter", travelog.getWriter());
		return "redirect:/travelog/list";
	}
	
	@GetMapping("/read")
	public void read(@RequestParam("bno") Long bno, Model model) {
		log.info("travelog/read method");
		
		TravelogVO vo = service.read(bno);
		model.addAttribute("travelog", vo);
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("travelog/delete executed");
		boolean success = service.delete(bno);
		if (success) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/travelog/list";
	}

	
	
	
}
