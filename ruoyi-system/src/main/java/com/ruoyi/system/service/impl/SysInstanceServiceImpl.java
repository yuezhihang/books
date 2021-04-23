package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.system.domain.SysBookBase;
import com.ruoyi.system.domain.SysHouse;
import com.ruoyi.system.domain.SysHouseBook;
import com.ruoyi.system.domain.dto.SysBookAndInstance;
import com.ruoyi.system.mapper.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.domain.SysInstance;
import com.ruoyi.system.service.ISysInstanceService;
import com.ruoyi.common.core.text.Convert;

/**
 * 入库申请Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-04-06
 */
@Service
public class SysInstanceServiceImpl implements ISysInstanceService 
{
    @Autowired
    private SysInstanceMapper sysInstanceMapper;
    @Autowired
    private SysBookBaseMapper sysBookBaseMapper;
    @Autowired
    private SysDictDataMapper sysDictDataMapper;
    @Autowired
    private SysHouseBookMapper sysHouseBookMapper;
    @Autowired
    private SysHouseMapper sysHouseMapper;
    /**
     * 查询入库申请
     * 
     * @param instanceId 入库申请ID
     * @return 入库申请
     */
    @Override
    public SysInstance selectSysInstanceById(Long instanceId)
    {
        return sysInstanceMapper.selectSysInstanceById(instanceId);
    }

    @Override
    public SysBookAndInstance selectInstanceById(Long instanceId) {
        return sysInstanceMapper.selectInstanceById(instanceId);
    }

    /**
     * 查询入库申请列表
     * 
     * @param sysInstance 入库申请
     * @return 入库申请
     */
    @Override
    public List<SysInstance> selectSysInstanceList(SysInstance sysInstance)
    {
        List<SysDictData> sysDictData=sysDictDataMapper.selectDictDataByType("instance_status");
        List<SysInstance> sysInstances=sysInstanceMapper.selectSysInstanceList(sysInstance);
        for (SysInstance s :sysInstances) {
            for (SysDictData ss:sysDictData) {
                if (s.getInstanceStatus().equals(ss.getDictValue())){
                    s.setInstanceName(ss.getDictLabel());
                    break;
                }
            }
        }
        return sysInstances;
    }

    /**
     * 查询入库申请列表
     *
     * @param sysInstance 入库申请
     * @return 入库申请
     */
    @Override
    public List<SysInstance> selectSysInstanceDealList(SysInstance sysInstance)
    {
        List<SysDictData> sysDictData=sysDictDataMapper.selectDictDataByType("instance_status");
        List<SysInstance> sysInstances=sysInstanceMapper.selectSysInstanceList(sysInstance);
        for (SysInstance s :sysInstances) {
            for (SysDictData ss:sysDictData) {
                if (s.getInstanceStatus().equals(ss.getDictValue())){
                    s.setInstanceName(ss.getDictLabel());
                    break;
                }
            }
        }
        return sysInstances;
    }

    /**
     * 新增入库申请
     * 
     * @param sysInstance 入库申请
     * @return 结果
     */
    @Override
    public int insertSysInstance(SysInstance sysInstance)
    {
        return sysInstanceMapper.insertSysInstance(sysInstance);
    }

    @Override
    public AjaxResult insertInstance(SysBookBase sysBookBase){
        SysBookBase sysBookBase1=new SysBookBase();
        sysBookBase1.setBookId(sysBookBase.getBookId());
        if (null==sysBookBase.getHouse() ||"".equals(sysBookBase.getHouse())){
            return AjaxResult.error("书库不能为空");
        }
        if (sysBookBaseMapper.selectSysBookBaseList(sysBookBase1).size()>0){
           return AjaxResult.error("图书编号已存在");
        }
        sysBookBaseMapper.insertSysBookBase(sysBookBase);
        List<SysBookBase>  sysBookBases= sysBookBaseMapper.selectSysBookBaseList(sysBookBase);
        //放入流程
        SysInstance sysInstance=new SysInstance();
        sysInstance.setCreateDate(new Date());
        sysInstance.setInstanceStatus("0");
        sysInstance.setBookId(sysBookBases.get(0).getBusinessId());
        SysHouseBook sysHouseBook=new SysHouseBook();
        sysHouseBook.setFlag(sysBookBase.getHouseFlag());
        sysHouseBook.setBookId(sysBookBases.get(0).getBusinessId());
        sysHouseBook.setHouseId(Long.valueOf(sysBookBase.getHouse()));
        sysHouseBookMapper.insertSysHouseBook(sysHouseBook);
        return AjaxResult.success(sysInstanceMapper.insertSysInstance(sysInstance));
    }

    /**
     * 修改入库申请
     * 
     * @param sysInstance 入库申请
     * @return 结果
     */
    @Override
    public AjaxResult updateSysInstance(SysBookAndInstance sysInstance)
    {
        SysBookBase sysBookBase1=new SysBookBase();
        sysBookBase1.setBookId(sysInstance.getBookId());
        if (sysBookBaseMapper.selectSysBookBaseList(sysBookBase1).size()>1){
            return AjaxResult.error("图书编号已存在");
        }
        SysBookBase sysBookBase=new SysBookBase();
        BeanUtils.copyProperties(sysInstance,sysBookBase);
        sysBookBase.setBusinessId(Long.valueOf(sysInstance.getBookId()));
        if ("1".equals(sysInstance.getInstanceStatus())){
            sysBookBase.setFlag("0");
        }
        sysBookBaseMapper.updateSysBookBase(sysBookBase);
        SysInstance sysInstance1=new SysInstance();
        sysInstance1.setInstanceId(sysInstance.getInstanceId());
        sysInstance1.setInstanceStatus(sysInstance.getInstanceStatus());
        return AjaxResult.success(sysInstanceMapper.updateSysInstance(sysInstance1));
    }

    /**
     * 修改入库申请
     *
     * @param sysInstance 入库申请
     * @return 结果
     */
    @Override
    public AjaxResult updateSysInstances(SysBookAndInstance sysInstance)
    {
        SysBookBase sysBookBase1=new SysBookBase();
        sysBookBase1.setBookId(sysInstance.getBookId());
        if (sysBookBaseMapper.selectSysBookBaseList(sysBookBase1).size()>1){
            return AjaxResult.error("图书编号已存在");
        }
        SysBookBase sysBookBase=new SysBookBase();
        SysHouseBook sysHouseBook=new SysHouseBook();
        BeanUtils.copyProperties(sysInstance,sysBookBase);
//        sysBookBase.setBusinessId(Long.valueOf(sysInstance.getBookId()));
        if ("1".equals(sysInstance.getInstanceStatus())){
            sysBookBase.setFlag("0");
        }
        sysHouseBook.setBookId(Long.valueOf(sysInstance.getBusinessId()));
        sysBookBaseMapper.updateSysBookBase(sysBookBase);
        SysInstance sysInstance1=new SysInstance();
        sysInstance1.setInstanceId(sysInstance.getInstanceId());
        sysInstance1.setInstanceStatus(sysInstance.getInstanceStatus());
        List<SysHouseBook> sysHouseBooks=sysHouseBookMapper.selectSysHouseBookList(sysHouseBook);
        if ("1".equals(sysInstance.getInstanceStatus())){
            sysHouseBook.setFlag("0");
        }
        if (null!=sysHouseBooks && sysHouseBooks.size()>0 && "0".equals(sysHouseBook.getFlag())){
            sysHouseBook.setBusinessId(sysHouseBooks.get(0).getBusinessId());
            sysHouseBookMapper.updateSysHouseBook(sysHouseBook);
            SysHouse sysHouse=new SysHouse();
            SysHouseBook  house=new SysHouseBook();
            house.setFlag("0");
            house.setHouseId(sysHouseBooks.get(0).getHouseId());
            sysHouse.setBusinessId(sysHouseBooks.get(0).getHouseId());
            sysHouse.setHouseBooks(Long.valueOf(sysHouseBookMapper.selectSysHouseBookList(house).size()));
            sysHouseMapper.updateSysHouse(sysHouse);
        }

        return AjaxResult.success(sysInstanceMapper.updateSysInstance(sysInstance1));
    }

    /**
     * 删除入库申请对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysInstanceByIds(String ids)
    {
        String[] strings=sysInstanceMapper.getBookIdByIds(Convert.toStrArray(ids));
        sysBookBaseMapper.deleteSysBookBaseByIds(strings);
        //删除流程数据
        return sysInstanceMapper.deleteSysInstanceByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除入库申请信息
     * 
     * @param instanceId 入库申请ID
     * @return 结果
     */
    @Override
    public int deleteSysInstanceById(Long instanceId)
    {
        return sysInstanceMapper.deleteSysInstanceById(instanceId);
    }
}
