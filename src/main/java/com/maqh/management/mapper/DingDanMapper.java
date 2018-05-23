package com.maqh.management.mapper;

import com.maqh.management.entity.dingdan;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DingDanMapper {

    @Insert("INSERT INTO `dingdan` (`id`,`riqi`,`guige`,`tuangoushulaing`,`fenxiaojia`,`lirun`,`dianhua`,`kuaidi`,`shouhou`,`chanpin`,`tuangoujia`,`zhongjia`,`fanxian`,`xingming`,`dizhi`,`shifoudaohuo`) \n" +
            "VALUES(#{id},#{riqi},#{guige},#{tuangoushulaing},#{fenxiaojia},#{lirun},#{dianhua},#{kuaidi},#{shouhou},#{chanpin},#{tuangoujia},#{zhongjia},#{fanxian},#{xingming},#{dizhi},#{shifoudaohuo})" )
    void addDingDan(dingdan dingdan);
}
