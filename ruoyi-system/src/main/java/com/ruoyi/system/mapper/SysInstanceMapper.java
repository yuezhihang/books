package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysInstance;
import com.ruoyi.system.domain.dto.SysBookAndInstance;

/**
 * 入库申请Mapper接口
 * 
 * @author ruoyi
 * @date 2021-04-06
 */
public interface SysInstanceMapper 
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

    /**
     * 新增入库申请
     * 
     * @param sysInstance 入库申请
     * @return 结果
     */
    public int insertSysInstance(SysInstance sysInstance);

    /**
     * 修改入库申请
     * 
     * @param sysInstance 入库申请
     * @return 结果
     */
    public int updateSysInstance(SysInstance sysInstance);

    /**
     * 删除入库申请
     * 
     * @param instanceId 入库申请ID
     * @return 结果
     */
    public int deleteSysInstanceById(Long instanceId);

    /**
     * 批量删除入库申请
     * 
     * @param instanceIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSysInstanceByIds(String[] instanceIds);

    /**
     * 获取书籍的书编号
     * @param instanceIds
     * @return
     */
    public String[] getBookIdByIds(String[] instanceIds);
}
