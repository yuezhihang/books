package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CChaBasesMapper;
import com.ruoyi.system.domain.CChaBases;
import com.ruoyi.system.service.ICChaBasesService;
import com.ruoyi.common.core.text.Convert;

/**
 * 茶叶基本信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
@Service
public class CChaBasesServiceImpl implements ICChaBasesService 
{
    @Autowired
    private CChaBasesMapper cChaBasesMapper;

    /**
     * 查询茶叶基本信息
     * 
     * @param businessId 茶叶基本信息ID
     * @return 茶叶基本信息
     */
    @Override
    public CChaBases selectCChaBasesById(Long businessId)
    {
        return cChaBasesMapper.selectCChaBasesById(businessId);
    }

    /**
     * 查询茶叶基本信息列表
     * 
     * @param cChaBases 茶叶基本信息
     * @return 茶叶基本信息
     */
    @Override
    public List<CChaBases> selectCChaBasesList(CChaBases cChaBases)
    {
        return cChaBasesMapper.selectCChaBasesList(cChaBases);
    }

    /**
     * 新增茶叶基本信息
     * 
     * @param cChaBases 茶叶基本信息
     * @return 结果
     */
    @Override
    public int insertCChaBases(CChaBases cChaBases)
    {
        return cChaBasesMapper.insertCChaBases(cChaBases);
    }

    /**
     * 修改茶叶基本信息
     * 
     * @param cChaBases 茶叶基本信息
     * @return 结果
     */
    @Override
    public int updateCChaBases(CChaBases cChaBases)
    {
        return cChaBasesMapper.updateCChaBases(cChaBases);
    }

    /**
     * 删除茶叶基本信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteCChaBasesByIds(String ids)
    {
        return cChaBasesMapper.deleteCChaBasesByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除茶叶基本信息信息
     * 
     * @param businessId 茶叶基本信息ID
     * @return 结果
     */
    @Override
    public int deleteCChaBasesById(Long businessId)
    {
        return cChaBasesMapper.deleteCChaBasesById(businessId);
    }
}
