package com.cafe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cafe.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService ms; 
}
