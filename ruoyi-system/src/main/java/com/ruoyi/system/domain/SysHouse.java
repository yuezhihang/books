package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 仓库对象 sys_house
 * 
 * @author ruoyi
 * @date 2021-04-09
 */
public class SysHouse extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long businessId;

    /** 仓库名称 */
    @Excel(name = "仓库名称")
    private String houseName;

    /** 仓库容量 */
    @Excel(name = "仓库容量")
    private Long houseNumber;

    /** 仓库中存书量 */
    @Excel(name = "仓库中存书量")
    private Long houseBooks;

    public void setBusinessId(Long businessId) 
    {
        this.businessId = businessId;
    }

    public Long getBusinessId() 
    {
        return businessId;
    }
    public void setHouseName(String houseName) 
    {
        this.houseName = houseName;
    }

    public String getHouseName() 
    {
        return houseName;
    }
    public void setHouseNumber(Long houseNumber) 
    {
        this.houseNumber = houseNumber;
    }

    public Long getHouseNumber() 
    {
        return houseNumber;
    }
    public void setHouseBooks(Long houseBooks)
    {
        this.houseBooks = houseBooks;
    }

    public Long getHouseBooks()
    {
        return houseBooks;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("businessId", getBusinessId())
            .append("houseName", getHouseName())
            .append("houseNumber", getHouseNumber())
            .append("houseBooks", getHouseBooks())
            .toString();
    }
}
