package com.ruoyi.web.controller.system;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.SysHouse;
import com.ruoyi.system.service.ISysHouseService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 仓库Controller
 * 
 * @author ruoyi
 * @date 2021-04-09
 */
@Controller
@RequestMapping("/system/house")
public class SysHouseController extends BaseController
{
    private String prefix = "system/house";

    @Autowired
    private ISysHouseService sysHouseService;

    @RequiresPermissions("system:house:view")
    @GetMapping()
    public String house()
    {
        return prefix + "/house";
    }

    /**
     * 查询仓库列表
     */
    @RequiresPermissions("system:house:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysHouse sysHouse)
    {
        startPage();
        List<SysHouse> list = sysHouseService.selectSysHouseList(sysHouse);
        return getDataTable(list);
    }

    /**
     * 导出仓库列表
     */
    @RequiresPermissions("system:house:export")
    @Log(title = "仓库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysHouse sysHouse)
    {
        List<SysHouse> list = sysHouseService.selectSysHouseList(sysHouse);
        ExcelUtil<SysHouse> util = new ExcelUtil<SysHouse>(SysHouse.class);
        return util.exportExcel(list, "house");
    }

    /**
     * 新增仓库
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存仓库
     */
    @RequiresPermissions("system:house:add")
    @Log(title = "仓库", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysHouse sysHouse)
    {
        return sysHouseService.insertSysHouse(sysHouse);
    }

    /**
     * 修改仓库
     */
    @GetMapping("/edit/{businessId}")
    public String edit(@PathVariable("businessId") Long businessId, ModelMap mmap)
    {
        SysHouse sysHouse = sysHouseService.selectSysHouseById(businessId);
        mmap.put("sysHouse", sysHouse);
        return prefix + "/edit";
    }

    /**
     * 修改保存仓库
     */
    @RequiresPermissions("system:house:edit")
    @Log(title = "仓库", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysHouse sysHouse)
    {
        return sysHouseService.updateSysHouse(sysHouse);
    }

    /**
     * 删除仓库
     */
    @RequiresPermissions("system:house:remove")
    @Log(title = "仓库", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysHouseService.deleteSysHouseByIds(ids));
    }
}
