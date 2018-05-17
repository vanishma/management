package com.maqh.management.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeAction {

    @RequestMapping("/home")
    public String home(HttpServletRequest request){

        List<Object> menuList = new ArrayList<>();
        Map<String, Object> map = new HashMap<>();
        map.put("url","/hello");
        map.put("menuName","首页");
        map.put("child","1"); //1 是没有子菜单  0 是有子菜单
        menuList.add(map);
        Map<String, Object> map2 = new HashMap<>();
        map2.put("url","");
        map2.put("menuName","客户");
        map2.put("child","0"); //1 是没有子菜单  0 是有子菜单
        List<Object> childArr = new ArrayList<>();
        map2.put("childArr", childArr);

        Map<String, Object> child1 = new HashMap<>();
        child1.put("url","/hello");
        child1.put("menuName","客户1");
        childArr.add(child1);

        Map<String, Object> child2 = new HashMap<>();
        child2.put("url","/hello");
        child2.put("menuName","客户2lsit");
        childArr.add(child2);

        menuList.add(map2);

        request.setAttribute("menu",menuList);

        return "home";
    }
}
