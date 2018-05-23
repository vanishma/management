package com.maqh.management.action;

import com.maqh.management.entity.dingdan;
import com.maqh.management.service.DingdanService;
import com.sun.media.sound.SoftTuning;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyAction {


    @Autowired
    private DingdanService dingdanService;

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


    @ResponseBody
    @RequestMapping("addDingDan")
    public String addDingDan(dingdan dingdan){
        dingdanService.addDingdan(dingdan);
        return "200";
    }
}
