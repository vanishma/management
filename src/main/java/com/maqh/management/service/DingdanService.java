package com.maqh.management.service;

import com.maqh.management.entity.dingdan;
import com.maqh.management.mapper.DingDanMapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.logging.SimpleFormatter;

@Service
public class DingdanService {


    @Autowired
    private DingDanMapper dingDanMapper;

    public void addDingdan(dingdan dingdan) {

        dingdan.setId(UUID.randomUUID().toString().replaceAll("-",""));
        if (dingdan.getShifoudaohuo() == null){
            dingdan.setShifoudaohuo("否");
        }else{
            dingdan.setShifoudaohuo("是");
        }

        if(dingdan.getShouhou()== null){
            dingdan.setShouhou("否");
        } else {
            dingdan.setShouhou("是");
        }

        dingDanMapper.addDingDan(dingdan);
    }

    public Map<String, Object> getDingDan(int limit, int offset, String sousuo) {
        Map<String,Object> map = new HashMap<>();
        map.put("limit", limit);
        map.put("offset", offset);
        map.put("sousuo",sousuo);
        map.put("rows",dingDanMapper.getDingDan(map));
        map.put("total",dingDanMapper.getDingDanCount(map));
        return map;
    }

    public dingdan getDingDanId(String id) {
        return dingDanMapper.getDingDanById(id);
    }

    public void updateDingdan(dingdan dingdan) {

        if (dingdan.getShifoudaohuo() == null){
            dingdan.setShifoudaohuo("否");
        }else{
            dingdan.setShifoudaohuo("是");
        }

        if(dingdan.getShouhou()== null){
            dingdan.setShouhou("否");
        } else {
            dingdan.setShouhou("是");
        }

        dingDanMapper.updateDingDan(dingdan);
    }

    public void delDingDan(String id) {
        dingDanMapper.delDingDan(id);
    }

    public Map<String, Object> queryNow(String sousuo) {

        Map<String,Object> map = new HashMap<>();
        Map<String,Object> allmap = dingDanMapper.sumAll();
        map.put("zzcount",allmap.get("zcount"));
        map.put("zlirun", allmap.get("lirun"));
        map.put("zzhongjia", allmap.get("zhongjia"));
        map.put("zfanxian", allmap.get("fanxian"));
        Map<String,Object> wheremap = null;
        if (sousuo.equals("")){
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String date =simpleDateFormat.format(new Date());
            map.put("serch",date);
             wheremap = dingDanMapper.sumWhere(date);

        } else {
            map.put("serch",sousuo);
            wheremap = dingDanMapper.sumWhere(sousuo);
        }

        if(wheremap != null){
            map.putAll(wheremap);
        }else{
            map.put("zcount", "0");
            map.put("fanxian", "0");
            map.put("zhongjia", "0");
            map.put("lirun", "0");
        }
        return map;
    }
}
