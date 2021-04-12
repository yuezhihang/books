package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.SysBookBase;
import com.ruoyi.system.domain.SysHouseBook;
import com.ruoyi.system.service.ISysBookBaseService;
import org.apache.ibatis.annotations.Param;
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

}
