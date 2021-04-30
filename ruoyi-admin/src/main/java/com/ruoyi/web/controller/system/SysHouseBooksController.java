package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.SysBookBase;
import com.ruoyi.system.domain.SysHouseBook;
import com.ruoyi.system.service.ISysBookBaseService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 【请填写功能名称】Controller
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
@Controller
@RequestMapping("/system/housebase")
public class SysHouseBooksController extends BaseController
{
    private String prefix = "system/house";

    @Autowired
    private ISysBookBaseService iSysBookBaseService;

//    @RequiresPermissions("system:house:views")
    @GetMapping()
    public String book()
    {
        return prefix + "/housebase";
    }


    /**
     * 查询【请填写功能名称】列表
     */
//    @RequiresPermissions("system:house:lists")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SysHouseBook sysHouseBook)
    {
        startPage();
        List<SysBookBase> list = iSysBookBaseService.getAllBooksById(sysHouseBook);
        return getDataTable(list);
    }


    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:housebase:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SysHouseBook sysHouseBook)
    {
        List<SysBookBase> list = iSysBookBaseService.getAllBooksById(sysHouseBook);
        ExcelUtil<SysBookBase> util = new ExcelUtil<SysBookBase>(SysBookBase.class);
        return util.exportExcel(list, "book");
    }

}
