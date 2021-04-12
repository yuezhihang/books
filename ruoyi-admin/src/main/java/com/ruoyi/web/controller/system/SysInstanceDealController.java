package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysBookBase;
import com.ruoyi.system.domain.SysInstance;
import com.ruoyi.system.domain.dto.SysBookAndInstance;
import com.ruoyi.system.service.ISysInstanceService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 入库申请Controller
 * 
 * @author ruoyi
 * @date 2021-04-06
 */
@Controller
@RequestMapping("/system/instancedeal")
public class SysInstanceDealController extends BaseController
{
    private String prefix = "system/instancedeal";

    @Autowired
    private ISysInstanceService sysInstanceService;

    @RequiresPermissions("system:instancedeal:view")
    @GetMapping()
    public String instance()
    {
        return prefix + "/instance";
    }

    /**
     * 查询入库申请列表
     */
    @RequiresPermissions("system:instancedeal:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysInstance sysInstance)
    {
        startPage();
        List<SysInstance> list = sysInstanceService.selectSysInstanceDealList(sysInstance);
        return getDataTable(list);
    }

    /**
     * 导出入库申请列表
     */
    @RequiresPermissions("system:instancedeal:export")
    @Log(title = "入库申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysInstance sysInstance)
    {
        List<SysInstance> list = sysInstanceService.selectSysInstanceList(sysInstance);
        ExcelUtil<SysInstance> util = new ExcelUtil<SysInstance>(SysInstance.class);
        return util.exportExcel(list, "instance");
    }

    /**
     * 新增入库申请
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存入库申请
     */
    @RequiresPermissions("system:instancedeal:add")
    @Log(title = "入库申请", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysBookBase sysBookBase) throws Exception {
        return sysInstanceService.insertInstance(sysBookBase);
    }

    /**
     * 修改入库申请
     */
    @GetMapping("/edit/{instanceId}")
    public String edit(@PathVariable("instanceId") Long instanceId, ModelMap mmap)
    {
        SysBookAndInstance sysInstance = sysInstanceService.selectInstanceById(instanceId);
        mmap.put("sysInstance", sysInstance);
        return prefix + "/edit";
    }

    /**
     * 修改保存入库申请
     */
    @RequiresPermissions("system:instancedeal:edit")
    @Log(title = "入库申请", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysBookAndInstance sysInstance)
    {
        return sysInstanceService.updateSysInstances(sysInstance);
    }

    /**
     * 删除入库申请
     */
    @RequiresPermissions("system:instancedeal:remove")
    @Log(title = "入库申请", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysInstanceService.deleteSysInstanceByIds(ids));
    }
}
