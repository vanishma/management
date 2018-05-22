package com.maqh.management.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyAction {

    @RequestMapping("hello")
    public String hello(){
        return "err";
    }

    @RequestMapping("dingdanguanli")
    public String dingdanguanli(){
        return "dangdanguanli/dingdanguanli";
    }

    @RequestMapping("dingdanguanliAdd")
    public String dingdanguanliAdd(){
        return "dangdanguanli/dingdanguanliAdd";
    }
}
