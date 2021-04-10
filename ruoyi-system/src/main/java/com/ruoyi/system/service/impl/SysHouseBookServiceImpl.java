package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysHouseBookMapper;
import com.ruoyi.system.domain.SysHouseBook;
import com.ruoyi.system.service.ISysHouseBookService;
import com.ruoyi.common.core.text.Convert;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
@Service
public class SysHouseBookServiceImpl implements ISysHouseBookService 
{
    @Autowired
    private SysHouseBookMapper sysHouseBookMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param businessId 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public SysHouseBook selectSysHouseBookById(Long businessId)
    {
        return sysHouseBookMapper.selectSysHouseBookById(businessId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param sysHouseBook 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<SysHouseBook> selectSysHouseBookList(SysHouseBook sysHouseBook)
    {
        return sysHouseBookMapper.selectSysHouseBookList(sysHouseBook);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param sysHouseBook 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertSysHouseBook(SysHouseBook sysHouseBook)
    {
        return sysHouseBookMapper.insertSysHouseBook(sysHouseBook);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param sysHouseBook 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateSysHouseBook(SysHouseBook sysHouseBook)
    {
        return sysHouseBookMapper.updateSysHouseBook(sysHouseBook);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysHouseBookByIds(String ids)
    {
        return sysHouseBookMapper.deleteSysHouseBookByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param businessId 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteSysHouseBookById(Long businessId)
    {
        return sysHouseBookMapper.deleteSysHouseBookById(businessId);
    }
}
