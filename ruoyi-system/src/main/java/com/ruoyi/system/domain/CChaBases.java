package com.ruoyi.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 茶叶基本信息对象 c_cha_bases
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
public class CChaBases extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long businessId;

    /** 茶叶名称 */
    @Excel(name = "茶叶名称")
    private String chaName;

    /** 产地 */
    @Excel(name = "产地")
    private String chaPlace;

    /** 年份 */
    @Excel(name = "年份")
    private String chaAge;

    /** 茶叶的单价 */
//    @Excel(name = "茶叶的单价")
    private Double chaPrice;

    /** 茶叶简介 */
    @Excel(name = "茶叶简介")
    private String chaIntroduce;

    public void setBusinessId(Long businessId) 
    {
        this.businessId = businessId;
    }

    public Long getBusinessId() 
    {
        return businessId;
    }
    public void setChaName(String chaName) 
    {
        this.chaName = chaName;
    }

    public String getChaName() 
    {
        return chaName;
    }
    public void setChaPlace(String chaPlace) 
    {
        this.chaPlace = chaPlace;
    }

    public String getChaPlace() 
    {
        return chaPlace;
    }
    public void setChaAge(String chaAge) 
    {
        this.chaAge = chaAge;
    }

    public String getChaAge() 
    {
        return chaAge;
    }
    public void setChaPrice(Double chaPrice)
    {
        this.chaPrice = chaPrice;
    }

    public Double getChaPrice()
    {
        return chaPrice;
    }
    public void setChaIntroduce(String chaIntroduce) 
    {
        this.chaIntroduce = chaIntroduce;
    }

    public String getChaIntroduce() 
    {
        return chaIntroduce;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("businessId", getBusinessId())
            .append("chaName", getChaName())
            .append("chaPlace", getChaPlace())
            .append("chaAge", getChaAge())
            .append("chaPrice", getChaPrice())
            .append("chaIntroduce", getChaIntroduce())
            .toString();
    }
}
