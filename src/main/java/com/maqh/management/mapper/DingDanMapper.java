package com.maqh.management.mapper;

import com.maqh.management.entity.dingdan;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface DingDanMapper {

    @Insert("INSERT INTO `dingdan` (`id`,`riqi`,`guige`,`tuangoushulaing`,`fenxiaojia`,`lirun`,`dianhua`,`kuaidi`,`shouhou`,`chanpin`,`tuangoujia`,`zhongjia`,`fanxian`,`xingming`,`dizhi`,`shifoudaohuo`) " +
            "VALUES(#{id},#{riqi},#{guige},#{tuangoushulaing},#{fenxiaojia},#{lirun},#{dianhua},#{kuaidi},#{shouhou},#{chanpin},#{tuangoujia},#{zhongjia},#{fanxian},#{xingming},#{dizhi},#{shifoudaohuo})" )
    void addDingDan(dingdan dingdan);

    @Select("<script> select * from dingdan " +
            " <if test='sousuo !=null and sousuo != \"\" '> WHERE riqi LIKE concat(concat(\"%\",#{sousuo}),\"%\") OR chanpin LIKE  concat(concat(\"%\",#{sousuo}),\"%\") OR xingming LIKE  concat(concat(\"%\",#{sousuo}),\"%\")   </if> " +
            " ORDER BY ADDTIME DESC limit #{offset},#{limit} </script>")
    List<dingdan> getDingDan(Map<String, Object> map);

    @Select("<script> select count(id) from dingdan " +
            " <if test='sousuo !=null and sousuo != \"\" '> WHERE riqi LIKE concat(concat(\"%\",#{sousuo}),\"%\") OR chanpin LIKE  concat(concat(\"%\",#{sousuo}),\"%\") OR xingming LIKE  concat(concat(\"%\",#{sousuo}),\"%\")   </if> </script> " )
    int getDingDanCount(Map<String,Object> map);

    @Select("select * from dingdan where id = #{id}")
    dingdan getDingDanById(@Param("id") String id);

    @Update("UPDATE `dingdan` SET" +
            "  `riqi` = #{riqi}," +
            "  `guige` = #{guige}," +
            "  `tuangoushulaing` = #{tuangoushulaing}," +
            "  `fenxiaojia` = #{fenxiaojia}," +
            "  `lirun` = #{lirun}," +
            "  `dianhua` = #{dianhua}," +
            "  `kuaidi` = #{kuaidi}," +
            "  `shouhou` = #{shouhou}," +
            "  `chanpin` = #{chanpin}," +
            "  `tuangoujia` = #{tuangoujia}," +
            "  `zhongjia` = #{zhongjia}," +
            "  `fanxian` = #{fanxian}," +
            "  `xingming` = #{xingming}," +
            "  `dizhi` = #{dizhi}," +
            "  `shifoudaohuo` = #{shifoudaohuo}," +
            "  `addtime` = now() " +
            "WHERE `id` = #{id} ")
    void updateDingDan(dingdan dingdan);

    @Delete("delete from dingdan where id = #{id}")
    void delDingDan(@Param("id") String id);

    @Select("SELECT COUNT(id) AS zcount,SUM(lirun) AS lirun,SUM(zhongjia) AS zhongjia,SUM(fanxian) AS fanxian FROM dingdan WHERE shouhou ='否'")
    Map<String,Object> sumAll();

    @Select("SELECT COUNT(id) AS zcount,SUM(lirun) AS lirun,SUM(zhongjia) AS zhongjia,SUM(fanxian) AS fanxian  FROM (" +
            "SELECT *FROM dingdan WHERE  shouhou ='否')  a " +
            "WHERE a.riqi LIKE CONCAT(CONCAT(\"%\",#{sousuo}),\"%\") OR a.chanpin LIKE  concat(concat(\"%\",#{sousuo}),\"%\") OR a.xingming LIKE  concat(concat(\"%\",#{sousuo}),\"%\") ")
    Map<String,Object> sumWhere(@Param("sousuo") String sousuo);
}
