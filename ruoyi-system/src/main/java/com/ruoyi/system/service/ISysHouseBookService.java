package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SysHouseBook;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
public interface ISysHouseBookService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param businessId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public SysHouseBook selectSysHouseBookById(Long businessId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param sysHouseBook 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysHouseBook> selectSysHouseBookList(SysHouseBook sysHouseBook);

    /**
     * 新增【请填写功能名称】
     * 
     * @param sysHouseBook 【请填写功能名称】
     * @return 结果
     */
    public int insertSysHouseBook(SysHouseBook sysHouseBook);

    /**
     * 修改【请填写功能名称】
     * 
     * @param sysHouseBook 【请填写功能名称】
     * @return 结果
     */
    public int updateSysHouseBook(SysHouseBook sysHouseBook);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysHouseBookByIds(String ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param businessId 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteSysHouseBookById(Long businessId);
}
