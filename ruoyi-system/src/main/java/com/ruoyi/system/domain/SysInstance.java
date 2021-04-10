package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 入库申请对象 sys_instance
 * 
 * @author ruoyi
 * @date 2021-04-06
 */
public class SysInstance extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 申请流程单子 */
    private Long instanceId;

    /** 流程名称 */
    @Excel(name = "流程名称")
    private String instanceName;

    /** 审批状态(0：审批中，1：已完成，2：被驳回) */
    @Excel(name = "审批状态(0：审批中，1：已完成，2：被驳回)")
    private String instanceStatus;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    /** 书的关联business_id */
    @Excel(name = "书的编号")
    private Long bookId;

    private String house;

    private String bookName;

    private String insStatus;

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public String getInsStatus() {
        return insStatus;
    }

    public void setInsStatus(String insStatus) {
        this.insStatus = insStatus;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setInstanceId(Long instanceId)
    {
        this.instanceId = instanceId;
    }

    public Long getInstanceId() 
    {
        return instanceId;
    }
    public void setInstanceName(String instanceName) 
    {
        this.instanceName = instanceName;
    }

    public String getInstanceName() 
    {
        return instanceName;
    }
    public void setInstanceStatus(String instanceStatus) 
    {
        this.instanceStatus = instanceStatus;
    }

    public String getInstanceStatus() 
    {
        return instanceStatus;
    }
    public void setCreateDate(Date createDate) 
    {
        this.createDate = createDate;
    }

    public Date getCreateDate() 
    {
        return createDate;
    }
    public void setBookId(Long bookId) 
    {
        this.bookId = bookId;
    }

    public Long getBookId() 
    {
        return bookId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("instanceId", getInstanceId())
            .append("instanceName", getInstanceName())
            .append("instanceStatus", getInstanceStatus())
            .append("createDate", getCreateDate())
            .append("bookId", getBookId())
            .toString();
    }
}
