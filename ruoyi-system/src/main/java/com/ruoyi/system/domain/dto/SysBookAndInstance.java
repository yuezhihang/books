package com.ruoyi.system.domain.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;

import java.util.Date;

public class SysBookAndInstance {

    /** $column.columnComment */
    private Long businessId;

    /** 图书编号 */
    private String bookId;

    /** 图书名称 */
    private String bookName;

    /** 出版社 */
    private String bookPublish;

    /** 图书作者 */
    private String bookAuthor;

    /** 图书价格 */
    private String bookPrice;

    /** 是否售出 */
    private String flag;

    /** 出版日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date bookPublishDate;

    /** 申请流程单子 */
    private Long instanceId;

    /** 流程名称 */
    @Excel(name = "流程名称")
    private String instanceName;

    /** 审批状态(0：审批中，1：已完成，2：被驳回) */
    private String instanceStatus;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createDate;



    private String insStatus;

    public Long getBusinessId() {
        return businessId;
    }

    public void setBusinessId(Long businessId) {
        this.businessId = businessId;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookPublish() {
        return bookPublish;
    }

    public void setBookPublish(String bookPublish) {
        this.bookPublish = bookPublish;
    }

    public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(String bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public Date getBookPublishDate() {
        return bookPublishDate;
    }

    public void setBookPublishDate(Date bookPublishDate) {
        this.bookPublishDate = bookPublishDate;
    }

    public Long getInstanceId() {
        return instanceId;
    }

    public void setInstanceId(Long instanceId) {
        this.instanceId = instanceId;
    }

    public String getInstanceName() {
        return instanceName;
    }

    public void setInstanceName(String instanceName) {
        this.instanceName = instanceName;
    }

    public String getInstanceStatus() {
        return instanceStatus;
    }

    public void setInstanceStatus(String instanceStatus) {
        this.instanceStatus = instanceStatus;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getInsStatus() {
        return insStatus;
    }

    public void setInsStatus(String insStatus) {
        this.insStatus = insStatus;
    }

    @Override
    public String toString() {
        return "SysBookAndInstance{" +
                "businessId=" + businessId +
                ", bookId='" + bookId + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookPublish='" + bookPublish + '\'' +
                ", bookAuthor='" + bookAuthor + '\'' +
                ", bookPrice='" + bookPrice + '\'' +
                ", flag='" + flag + '\'' +
                ", bookPublishDate=" + bookPublishDate +
                ", instanceId=" + instanceId +
                ", instanceName='" + instanceName + '\'' +
                ", instanceStatus='" + instanceStatus + '\'' +
                ", createDate=" + createDate +
                ", insStatus='" + insStatus + '\'' +
                '}';
    }
}
