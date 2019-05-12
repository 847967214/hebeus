package com.sen.hebeu.pojo;

import java.util.Date;

public class TbContentDesc {
    private Long contentId;

    private Date created;

    private Date updated;

    private String contentDesc;

    public Long getContentId() {
        return contentId;
    }

    public void setContentId(Long contentId) {
        this.contentId = contentId;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getContentDesc() {
        return contentDesc;
    }

    public void setContentDesc(String contentDesc) {
        this.contentDesc = contentDesc == null ? null : contentDesc.trim();
    }
}