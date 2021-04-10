package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.SysBookBase;
import com.ruoyi.system.domain.SysInstance;
import com.ruoyi.system.domain.dto.SysBookAndInstance;

/**
 * 入库申请Service接口
 * 
 * @author ruoyi
 * @date 2021-04-06
 */
public interface ISysInstanceService 
{
    /**
     * 查询入库申请
     * 
     * @param instanceId 入库申请ID
     * @return 入库申请
     */
    public SysInstance selectSysInstanceById(Long instanceId);

    public SysBookAndInstance selectInstanceById(Long instanceId);

    /**
     * 查询入库申请列表
     * 
     * @param sysInstance 入库申请
     * @return 入库申请集合
     */
    public List<SysInstance> selectSysInstanceList(SysInstance sysInstance);

    public List<SysInstance> selectSysInstanceDealList(SysInstance sysInstance);

    /**
     * 新增入库申请
     * 
     * @param sysInstance 入库申请
     * @return 结果
     */
    public int insertSysInstance(SysInstance sysInstance);

    public AjaxResult insertInstance(SysBookBase sysBookBase) throws Exception;

    /**
     * 修改入库申请
     * 
     * @param sysInstance 入库申请
     * @return 结果
     */
    public AjaxResult updateSysInstance(SysBookAndInstance sysInstance);
    public AjaxResult updateSysInstances(SysBookAndInstance sysInstance);

    /**
     * 批量删除入库申请
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysInstanceByIds(String ids);

    /**
     * 删除入库申请信息
     * 
     * @param instanceId 入库申请ID
     * @return 结果
     */
    public int deleteSysInstanceById(Long instanceId);
}
