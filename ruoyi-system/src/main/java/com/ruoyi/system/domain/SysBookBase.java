package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 图书基本信息对象 sys_book_base
 * 
 * @author ruoyi
 * @date 2021-04-01
 */
public class SysBookBase extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long businessId;

    /** 图书编号 */
    @Excel(name = "图书编号")
    private String bookId;

    /** 图书名称 */
    @Excel(name = "图书名称")
    private String bookName;

    /** 出版社 */
    @Excel(name = "出版社")
    private String bookPublish;

    /** 图书作者 */
    @Excel(name = "图书作者")
    private String bookAuthor;

    /** 图书价格 */
    @Excel(name = "图书价格")
    private Double bookPrice;

    /** 是否售出 */
    @Excel(name = "是否售出")
    private String flag;

    /** 出版日 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出版日", width = 30, dateFormat = "yyyy-MM-dd")
    private Date bookPublishDate;

    private String house;

    private String houseFlag;

    public String getHouseFlag() {
        return houseFlag;
    }

    public void setHouseFlag(String houseFlag) {
        this.houseFlag = houseFlag;
    }

    public String getHouse() {
        return house;
    }

    public void setHouse(String house) {
        this.house = house;
    }

    public void setBusinessId(Long businessId)
    {
        this.businessId = businessId;
    }

    public Long getBusinessId() 
    {
        return businessId;
    }
    public void setBookId(String bookId) 
    {
        this.bookId = bookId;
    }

    public String getBookId() 
    {
        return bookId;
    }
    public void setBookName(String bookName) 
    {
        this.bookName = bookName;
    }

    public String getBookName() 
    {
        return bookName;
    }
    public void setBookPublish(String bookPublish) 
    {
        this.bookPublish = bookPublish;
    }

    public String getBookPublish() 
    {
        return bookPublish;
    }
    public void setBookAuthor(String bookAuthor) 
    {
        this.bookAuthor = bookAuthor;
    }

    public String getBookAuthor() 
    {
        return bookAuthor;
    }
    public void setBookPrice(Double bookPrice)
    {
        this.bookPrice = bookPrice;
    }

    public Double getBookPrice()
    {
        return bookPrice;
    }
    public void setFlag(String flag) 
    {
        this.flag = flag;
    }

    public String getFlag() 
    {
        return flag;
    }
    public void setBookPublishDate(Date bookPublishDate) 
    {
        this.bookPublishDate = bookPublishDate;
    }

    public Date getBookPublishDate() 
    {
        return bookPublishDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("businessId", getBusinessId())
            .append("bookId", getBookId())
            .append("bookName", getBookName())
            .append("bookPublish", getBookPublish())
            .append("bookAuthor", getBookAuthor())
            .append("bookPrice", getBookPrice())
            .append("flag", getFlag())
            .append("bookPublishDate", getBookPublishDate())
            .toString();
    }
}
