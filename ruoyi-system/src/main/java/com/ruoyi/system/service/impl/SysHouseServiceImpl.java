package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysHouseMapper;
import com.ruoyi.system.domain.SysHouse;
import com.ruoyi.system.service.ISysHouseService;
import com.ruoyi.common.core.text.Convert;

/**
 * 仓库Service业务层处理
 *
 * @author ruoyi
 * @date 2021-04-09
 */
@Service("house")
public class SysHouseServiceImpl implements ISysHouseService {
    @Autowired
    private SysHouseMapper sysHouseMapper;

    /**
     * 查询仓库
     *
     * @param businessId 仓库ID
     * @return 仓库
     */
    @Override
    public SysHouse selectSysHouseById(Long businessId) {
        return sysHouseMapper.selectSysHouseById(businessId);
    }

    /**
     * 查询仓库列表
     *
     * @param sysHouse 仓库
     * @return 仓库
     */
    @Override
    public List<SysHouse> selectSysHouseList(SysHouse sysHouse) {
        return sysHouseMapper.selectSysHouseList(sysHouse);
    }

    @Override
    public List<SysHouse> selectSysHouseLists() {
        return sysHouseMapper.selectSysHouseList(new SysHouse());
    }

    /**
     * 新增仓库
     *
     * @param sysHouse 仓库
     * @return 结果
     */
    @Override
    public AjaxResult insertSysHouse(SysHouse sysHouse) {
        if (this.selectSysHouseList(sysHouse).size() > 0) {
            return AjaxResult.error("仓库名称已存在，请更换！！！！！！！！");
        }
        return AjaxResult.success(sysHouseMapper.insertSysHouse(sysHouse));
    }

    /**
     * 修改仓库
     *
     * @param sysHouse 仓库
     * @return 结果
     */
    @Override
    public AjaxResult updateSysHouse(SysHouse sysHouse) {
        if (this.selectSysHouseList(sysHouse).size() > 1) {
            return AjaxResult.error("仓库名称已存在，请更换！！！！！！！！");
        }
        return  AjaxResult.success(sysHouseMapper.updateSysHouse(sysHouse));
    }

    /**
     * 删除仓库对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSysHouseByIds(String ids) {
        return sysHouseMapper.deleteSysHouseByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除仓库信息
     *
     * @param businessId 仓库ID
     * @return 结果
     */
    @Override
    public int deleteSysHouseById(Long businessId) {
        return sysHouseMapper.deleteSysHouseById(businessId);
    }
}
