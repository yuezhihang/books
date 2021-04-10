package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysBookBaseMapper;
import com.ruoyi.system.domain.SysBookBase;
import com.ruoyi.system.service.ISysBookBaseService;
import com.ruoyi.common.core.text.Convert;

/**
 * 图书基本信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-04-01
 */
@Service
public class SysBookBaseServiceImpl implements ISysBookBaseService 
{
    @Autowired
    private SysBookBaseMapper sysBookBaseMapper;

    /**
     * 查询图书基本信息
     * 
     * @param businessId 图书基本信息ID
     * @return 图书基本信息
     */
    @Override
    public SysBookBase selectSysBookBaseById(Long businessId)
    {
        return sysBookBaseMapper.selectSysBookBaseById(businessId);
    }

    /**
     * 查询图书基本信息列表
     * 
     * @param sysBookBase 图书基本信息
     * @return 图书基本信息
     */
    @Override
    public List<SysBookBase> selectSysBookBaseList(SysBookBase sysBookBase)
    {
        List<SysBookBase> sysBookBases=sysBookBaseMapper.selectSysBookBaseList(sysBookBase);
        for (SysBookBase s:sysBookBases) {
            if ("0".equals(s.getFlag())) {
                s.setFlag("未出售");
            }else if ("1".equals(s.getFlag())){
                s.setFlag("已出售");
            }
        }
        sysBookBases.removeIf(sysBookBase1 -> sysBookBase1.getFlag()==null);
        return sysBookBases;
    }

    /**
     * 新增图书基本信息
     * 
     * @param sysBookBase 图书基本信息
     * @return 结果
     */
    @Override
    public int insertSysBookBase(SysBookBase sysBookBase)
    {
        sysBookBase.setFlag("0");
        return sysBookBaseMapper.insertSysBookBase(sysBookBase);
    }

    /**
     * 修改图书基本信息
     * 
     * @param sysBookBase 图书基本信息
     * @return 结果
     */
    @Override
    public int updateSysBookBase(SysBookBase sysBookBase)
    {
        return sysBookBaseMapper.updateSysBookBase(sysBookBase);
    }

    /**
     * 删除图书基本信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysBookBaseByIds(String ids)
    {
        return sysBookBaseMapper.deleteSysBookBaseByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除图书基本信息信息
     * 
     * @param businessId 图书基本信息ID
     * @return 结果
     */
    @Override
    public int deleteSysBookBaseById(Long businessId)
    {
        return sysBookBaseMapper.deleteSysBookBaseById(businessId);
    }
}
