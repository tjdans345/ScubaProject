package com.scuba.information;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InformationService {
	@Autowired
	private InformationDAO informationDAO;
}
