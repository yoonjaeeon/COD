package co.cod.app.photo.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import co.cod.app.photo.service.PhotoService;

@Controller
public class PhotoController {

		@Autowired
		PhotoService photoService;
}
