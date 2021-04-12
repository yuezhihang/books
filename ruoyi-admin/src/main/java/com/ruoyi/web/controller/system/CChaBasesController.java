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
import com.ruoyi.system.domain.CChaBases;
import com.ruoyi.system.service.ICChaBasesService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 茶叶基本信息Controller
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
@Controller
@RequestMapping("/system/bases")
public class CChaBasesController extends BaseController
{
    private String prefix = "system/bases";

    @Autowired
    private ICChaBasesService cChaBasesService;

    @RequiresPermissions("system:bases:view")
    @GetMapping()
    public String bases()
    {
        return prefix + "/bases";
    }

    /**
     * 查询茶叶基本信息列表
     */
    @RequiresPermissions("system:bases:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(CChaBases cChaBases)
    {
        startPage();
        List<CChaBases> list = cChaBasesService.selectCChaBasesList(cChaBases);
        return getDataTable(list);
    }

    /**
     * 导出茶叶基本信息列表
     */
    @RequiresPermissions("system:bases:export")
    @Log(title = "茶叶基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(CChaBases cChaBases)
    {
        List<CChaBases> list = cChaBasesService.selectCChaBasesList(cChaBases);
        ExcelUtil<CChaBases> util = new ExcelUtil<CChaBases>(CChaBases.class);
        return util.exportExcel(list, "bases");
    }

    /**
     * 新增茶叶基本信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存茶叶基本信息
     */
    @RequiresPermissions("system:bases:add")
    @Log(title = "茶叶基本信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(CChaBases cChaBases)
    {
        return toAjax(cChaBasesService.insertCChaBases(cChaBases));
    }

    /**
     * 修改茶叶基本信息
     */
    @GetMapping("/edit/{businessId}")
    public String edit(@PathVariable("businessId") Long businessId, ModelMap mmap)
    {
        CChaBases cChaBases = cChaBasesService.selectCChaBasesById(businessId);
        mmap.put("cChaBases", cChaBases);
        return prefix + "/edit";
    }

    /**
     * 修改保存茶叶基本信息
     */
    @RequiresPermissions("system:bases:edit")
    @Log(title = "茶叶基本信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(CChaBases cChaBases)
    {
        return toAjax(cChaBasesService.updateCChaBases(cChaBases));
    }

    /**
     * 删除茶叶基本信息
     */
    @RequiresPermissions("system:bases:remove")
    @Log(title = "茶叶基本信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(cChaBasesService.deleteCChaBasesByIds(ids));
    }
}
