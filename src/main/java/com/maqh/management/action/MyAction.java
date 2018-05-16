package com.maqh.management.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyAction {

    @RequestMapping("hello")
    public String hello(){
        return "index";
    }
}
