package com.maqh.management.action;

import com.maqh.management.entity.dingdan;
import com.maqh.management.service.DingdanService;
import com.sun.media.sound.SoftTuning;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureOrder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

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

    @ResponseBody
    @RequestMapping("getDingDan")
    public Map<String,Object> getDingDan(@RequestParam int limit,@RequestParam String sousuo,@RequestParam int offset){
        return dingdanService.getDingDan(limit,offset,sousuo);
    }


    @RequestMapping("updateDingDan")
    public String updateDingDan(HttpServletRequest hsq, String id){
        hsq.setAttribute("dingdan",dingdanService.getDingDanId(id));
        return "dangdanguanli/dingdanguanliEdit";
    }

    @ResponseBody
    @RequestMapping("updateDingdan")
    public String updateDingdan(dingdan dingdan){
        dingdanService.updateDingdan(dingdan);
        return "200";
    }

    @ResponseBody
    @RequestMapping("delDingDan")
    public String delDingDan(String id){
        dingdanService.delDingDan(id);
        return "200";
    }

    @ResponseBody
    @RequestMapping("queryNow")
    public Map<String,Object> queryNow(String sousuo){
        return dingdanService.queryNow(sousuo);
    }
}
