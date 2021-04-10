package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.SysHouse;
import org.springframework.stereotype.Service;

/**
 * 仓库Service接口
 * 
 * @author ruoyi
 * @date 2021-04-09
 */
//@Service("house")
public interface ISysHouseService 
{
    /**
     * 查询仓库
     * 
     * @param businessId 仓库ID
     * @return 仓库
     */
    public SysHouse selectSysHouseById(Long businessId);

    /**
     * 查询仓库列表
     * 
     * @param sysHouse 仓库
     * @return 仓库集合
     */
    public List<SysHouse> selectSysHouseList(SysHouse sysHouse);

    public List<SysHouse> selectSysHouseLists();

    /**
     * 新增仓库
     * 
     * @param sysHouse 仓库
     * @return 结果
     */
    public AjaxResult insertSysHouse(SysHouse sysHouse);

    /**
     * 修改仓库
     * 
     * @param sysHouse 仓库
     * @return 结果
     */
    public AjaxResult updateSysHouse(SysHouse sysHouse);

    /**
     * 批量删除仓库
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysHouseByIds(String ids);

    /**
     * 删除仓库信息
     * 
     * @param businessId 仓库ID
     * @return 结果
     */
    public int deleteSysHouseById(Long businessId);
}
