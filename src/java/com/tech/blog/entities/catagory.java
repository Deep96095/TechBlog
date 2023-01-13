
package com.tech.blog.entities;
public class catagory 
{
    private int cid;
    private String name;
    private String description;

    public catagory(int cid, String name, String description) 
    {
        this.cid = cid;
        this.name = name;
        this.description = description;
    }

    public catagory() 
    {
    }

    public catagory(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
