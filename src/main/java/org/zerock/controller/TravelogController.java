package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		model.addAttribute("list", list);
	}
	
	@PostMapping("/insert")
	public String insert(TravelogVO travelog, RedirectAttributes rttr) {
		service.insertSelectKey(travelog);
		
		rttr.addFlashAttribute("result", travelog.getBno());
		return "redirect:/travelog/list";
	}
}
