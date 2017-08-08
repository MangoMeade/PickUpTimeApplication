package com.jdbc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Nathan Saleniuc on 8/8/2017.
 */
@Controller
public class MapController {

    @RequestMapping("/map")
    public String map() {
        return "map";
    }


}
