package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.CChaBases;

/**
 * 茶叶基本信息Service接口
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
public interface ICChaBasesService 
{
    /**
     * 查询茶叶基本信息
     * 
     * @param businessId 茶叶基本信息ID
     * @return 茶叶基本信息
     */
    public CChaBases selectCChaBasesById(Long businessId);

    /**
     * 查询茶叶基本信息列表
     * 
     * @param cChaBases 茶叶基本信息
     * @return 茶叶基本信息集合
     */
    public List<CChaBases> selectCChaBasesList(CChaBases cChaBases);

    /**
     * 新增茶叶基本信息
     * 
     * @param cChaBases 茶叶基本信息
     * @return 结果
     */
    public int insertCChaBases(CChaBases cChaBases);

    /**
     * 修改茶叶基本信息
     * 
     * @param cChaBases 茶叶基本信息
     * @return 结果
     */
    public int updateCChaBases(CChaBases cChaBases);

    /**
     * 批量删除茶叶基本信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteCChaBasesByIds(String ids);

    /**
     * 删除茶叶基本信息信息
     * 
     * @param businessId 茶叶基本信息ID
     * @return 结果
     */
    public int deleteCChaBasesById(Long businessId);
}
