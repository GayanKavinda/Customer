package pojo;
// Generated Mar 31, 2020 7:16:01 PM by Hibernate Tools 4.3.1



/**
 * Menu generated by hbm2java
 */
public class Menu  implements java.io.Serializable {


     private Integer menuId;
     private String foodName;
     private double price;
     private int foodId;
     private String menuType;

    public Menu() {
    }

    public Menu(String foodName, double price, int foodId, String menuType) {
       this.foodName = foodName;
       this.price = price;
       this.foodId = foodId;
       this.menuType = menuType;
    }
   
    public Integer getMenuId() {
        return this.menuId;
    }
    
    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }
    public String getFoodName() {
        return this.foodName;
    }
    
    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }
    public double getPrice() {
        return this.price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    public int getFoodId() {
        return this.foodId;
    }
    
    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }
    public String getMenuType() {
        return this.menuType;
    }
    
    public void setMenuType(String menuType) {
        this.menuType = menuType;
    }




}


