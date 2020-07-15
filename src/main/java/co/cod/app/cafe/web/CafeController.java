package co.cod.app.cafe.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.cafe.CafeVO;
import co.cod.app.cafe.mapper.CafeMapper;

@Controller
public class CafeController {

	@Autowired
	CafeMapper cafeMapper;

	@RequestMapping("insertFormCafe") // 등록폼
	public String insertFormCafe(CafeVO cafeVO) {
		return "cafe/cafeInsert";
	}

}
