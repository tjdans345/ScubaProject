package com.scuba.freeboard;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.scuba.common.Common;


@Controller
@RequestMapping("/freeBoard/*")
public class FreeBoardController {

	@Autowired
	FreeBoardService freeboardService;
	
	private ModelAndView mav = new ModelAndView();

	// 자유게시판 이동
	@RequestMapping(value = "freeBoardList")
	public ModelAndView freeboard() {
		mav.setViewName("C_free/List");
		return mav;
	}

	// 글쓰기게시판 이동
	@RequestMapping(value = "writeboard")
	public ModelAndView writeboard() {
		mav.setViewName("C_free/Write");
		return mav;
	}
	
	// 글 등록
	@RequestMapping(value = "writeinsert", method = RequestMethod.POST)
	public ModelAndView write(FreeBoardVO freeboardVO, HttpServletRequest request, HttpServletResponse response) throws IOException {
		//Service 글 등록
		mav.addObject("content", freeboardService.write(freeboardVO, request, response));
		mav.setViewName("C_free/List");
		return mav;
	}
	
	// 글쓰기 취소
		@RequestMapping(value = "writecancle")
		public ModelAndView writecancle() {
			mav.setViewName("C_free/List");
			return mav;
		}
}
