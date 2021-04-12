package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysBookBase;
import com.ruoyi.system.domain.SysHouseBook;
import org.apache.ibatis.annotations.Param;

/**
 * 图书基本信息Service接口
 * 
 * @author ruoyi
 * @date 2021-04-01
 */
public interface ISysBookBaseService 
{
    /**
     * 查询图书基本信息
     * 
     * @param businessId 图书基本信息ID
     * @return 图书基本信息
     */
    public SysBookBase selectSysBookBaseById(Long businessId);

    /**
     * 查询图书基本信息列表
     * 
     * @param sysBookBase 图书基本信息
     * @return 图书基本信息集合
     */
    public List<SysBookBase> selectSysBookBaseList(SysBookBase sysBookBase);

    /**
     * 新增图书基本信息
     * 
     * @param sysBookBase 图书基本信息
     * @return 结果
     */
    public int insertSysBookBase(SysBookBase sysBookBase);

    /**
     * 修改图书基本信息
     * 
     * @param sysBookBase 图书基本信息
     * @return 结果
     */
    public int updateSysBookBase(SysBookBase sysBookBase);

    /**
     * 批量删除图书基本信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysBookBaseByIds(String ids);

    /**
     * 删除图书基本信息信息
     * 
     * @param businessId 图书基本信息ID
     * @return 结果
     */
    public int deleteSysBookBaseById(Long businessId);

    List<SysBookBase> getAllBooksById( SysHouseBook houseId);
}
