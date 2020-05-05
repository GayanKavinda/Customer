package pojo;
// Generated Mar 31, 2020 7:16:01 PM by Hibernate Tools 4.3.1



/**
 * Item generated by hbm2java
 */
public class Item  implements java.io.Serializable {


     private Integer itemId;
     private String name;
     private double unitprice;
     private String category;
     private int reorder;

    public Item() {
    }

    public Item(String name, double unitprice, String category, int reorder) {
       this.name = name;
       this.unitprice = unitprice;
       this.category = category;
       this.reorder = reorder;
    }
   
    public Integer getItemId() {
        return this.itemId;
    }
    
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public double getUnitprice() {
        return this.unitprice;
    }
    
    public void setUnitprice(double unitprice) {
        this.unitprice = unitprice;
    }
    public String getCategory() {
        return this.category;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    public int getReorder() {
        return this.reorder;
    }
    
    public void setReorder(int reorder) {
        this.reorder = reorder;
    }




}


