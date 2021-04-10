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
import com.ruoyi.system.domain.SysHouseBook;
import com.ruoyi.system.service.ISysHouseBookService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
@Controller
@RequestMapping("/system/book")
public class SysHouseBookController extends BaseController
{
    private String prefix = "system/book";

    @Autowired
    private ISysHouseBookService sysHouseBookService;

    @RequiresPermissions("system:book:view")
    @GetMapping()
    public String book()
    {
        return prefix + "/book";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:book:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysHouseBook sysHouseBook)
    {
        startPage();
        List<SysHouseBook> list = sysHouseBookService.selectSysHouseBookList(sysHouseBook);
        return getDataTable(list);
    }

    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:book:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysHouseBook sysHouseBook)
    {
        List<SysHouseBook> list = sysHouseBookService.selectSysHouseBookList(sysHouseBook);
        ExcelUtil<SysHouseBook> util = new ExcelUtil<SysHouseBook>(SysHouseBook.class);
        return util.exportExcel(list, "book");
    }

    /**
     * 新增【请填写功能名称】
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存【请填写功能名称】
     */
    @RequiresPermissions("system:book:add")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SysHouseBook sysHouseBook)
    {
        return toAjax(sysHouseBookService.insertSysHouseBook(sysHouseBook));
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{houseId}")
    public String edit(@PathVariable("houseId") Long houseId, ModelMap mmap)
    {
        SysHouseBook sysHouseBook = sysHouseBookService.selectSysHouseBookById(houseId);
        mmap.put("sysHouseBook", sysHouseBook);
        return prefix + "/edit";
    }

    /**
     * 修改保存【请填写功能名称】
     */
    @RequiresPermissions("system:book:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SysHouseBook sysHouseBook)
    {
        return toAjax(sysHouseBookService.updateSysHouseBook(sysHouseBook));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:book:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(sysHouseBookService.deleteSysHouseBookByIds(ids));
    }
}
