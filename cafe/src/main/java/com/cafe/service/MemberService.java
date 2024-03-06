package com.cafe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe.dao.MemberDao;

@Service
public class MemberService {

	@Autowired
	MemberDao md;
	
	
}
