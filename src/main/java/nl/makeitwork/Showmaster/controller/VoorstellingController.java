package nl.makeitwork.Showmaster.controller;

import nl.makeitwork.Showmaster.repository.VoorstellingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class VoorstellingController {

    @Autowired
    VoorstellingRepository voorstellingRepository;



}
