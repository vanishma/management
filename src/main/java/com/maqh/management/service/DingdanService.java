package com.maqh.management.service;

import com.maqh.management.entity.dingdan;
import com.maqh.management.mapper.DingDanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class DingdanService {


    @Autowired
    private DingDanMapper dingDanMapper;

    public void addDingdan(dingdan dingdan) {

        dingdan.setId(UUID.randomUUID().toString().replaceAll("-",""));
        dingDanMapper.addDingDan(dingdan);
    }
}
