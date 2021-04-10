package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysHouse;

/**
 * 仓库Mapper接口
 * 
 * @author ruoyi
 * @date 2021-04-09
 */
public interface SysHouseMapper 
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

    /**
     * 新增仓库
     * 
     * @param sysHouse 仓库
     * @return 结果
     */
    public int insertSysHouse(SysHouse sysHouse);

    /**
     * 修改仓库
     * 
     * @param sysHouse 仓库
     * @return 结果
     */
    public int updateSysHouse(SysHouse sysHouse);

    /**
     * 删除仓库
     * 
     * @param businessId 仓库ID
     * @return 结果
     */
    public int deleteSysHouseById(Long businessId);

    /**
     * 批量删除仓库
     * 
     * @param businessIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysHouseByIds(String[] businessIds);
}
