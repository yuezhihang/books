package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 sys_house_book
 * 
 * @author ruoyi
 * @date 2021-04-10
 */
public class SysHouseBook extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 仓库businessId */
    @Excel(name = "仓库businessId")
    private Long houseId;

    /** 书的businessId */
    @Excel(name = "书的businessId")
    private Long bookId;

    /** 0已通过 1 未通过 */
    @Excel(name = "0已通过 1 未通过")
    private String flag;

    /** $column.columnComment */
    private Long businessId;

    /** 图书名称 */
    private String bookName;

    /** 出版社 */
    private String bookPublish;

    /** 图书作者 */
    private String bookAuthor;

    /** 图书价格 */
    private Long bookPrice;

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

    public Long getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Long bookPrice) {
        this.bookPrice = bookPrice;
    }

    public void setHouseId(Long houseId)
    {
        this.houseId = houseId;
    }

    public Long getHouseId() 
    {
        return houseId;
    }
    public void setBookId(Long bookId) 
    {
        this.bookId = bookId;
    }

    public Long getBookId() 
    {
        return bookId;
    }
    public void setFlag(String flag) 
    {
        this.flag = flag;
    }

    public String getFlag() 
    {
        return flag;
    }
    public void setBusinessId(Long businessId) 
    {
        this.businessId = businessId;
    }

    public Long getBusinessId() 
    {
        return businessId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("houseId", getHouseId())
            .append("bookId", getBookId())
            .append("flag", getFlag())
            .append("businessId", getBusinessId())
            .toString();
    }
}
