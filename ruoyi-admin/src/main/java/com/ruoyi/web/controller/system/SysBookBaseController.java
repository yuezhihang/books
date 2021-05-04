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
import com.ruoyi.system.domain.SysBookBase;
import com.ruoyi.system.service.ISysBookBaseService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 图书基本信息Controller
 * 
 * @author ruoyi
 * @date 2021-04-01
 */
@Controller
@RequestMapping("/system/base")
public class SysBookBaseController extends BaseController
{
    private String prefix = "system/base";

    @Autowired
    private ISysBookBaseService sysBookBaseService;

    @RequiresPermissions("system:base:view")
    @GetMapping()
    public String base()
    {
        return prefix + "/base";
    }

    /**
     * 查询图书基本信息列表
     */
    @RequiresPermissions("system:base:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysBookBase sysBookBase)
    {
        startPage();
        List<SysBookBase> list = sysBookBaseService.selectSysBookBaseList(sysBookBase);
        return getDataTable(list);
    }

    @GetMapping("/lists")
    @ResponseBody
    public TableDataInfo lists(SysBookBase sysBookBase)
    {
        startPage();
        List<SysBookBase> list = sysBookBaseService.selectSysBookBaseList(sysBookBase);
        return getDataTable(list);
    }

    /**
     * 导出图书基本信息列表
     */
    @RequiresPermissions("system:base:export")
    @Log(title = "图书基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysBookBase sysBookBase)
    {
        List<SysBookBase> list = sysBookBaseService.selectSysBookBaseList(sysBookBase);
        ExcelUtil<SysBookBase> util = new ExcelUtil<SysBookBase>(SysBookBase.class);
        return util.exportExcel(list, "base");
    }

    /**
     * 新增图书基本信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存图书基本信息
     */
    @RequiresPermissions("system:base:add")
    @Log(title = "图书基本信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysBookBase sysBookBase)
    {
        return sysBookBaseService.insertSysBookBase(sysBookBase);
    }

    /**
     * 修改图书基本信息
     */
    @GetMapping("/edit/{businessId}")
    public String edit(@PathVariable("businessId") Long businessId, ModelMap mmap)
    {
        SysBookBase sysBookBase = sysBookBaseService.selectSysBookBaseById(businessId);
        mmap.put("sysBookBase", sysBookBase);
        return prefix + "/edit";
    }

    /**
     * 修改保存图书基本信息
     */
    @RequiresPermissions("system:base:edit")
    @Log(title = "图书基本信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysBookBase sysBookBase)
    {
        return toAjax(sysBookBaseService.updateSysBookBase(sysBookBase));
    }

    /**
     * 删除图书基本信息
     */
    @RequiresPermissions("system:base:remove")
    @Log(title = "图书基本信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysBookBaseService.deleteSysBookBaseByIds(ids));
    }
}
