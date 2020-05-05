package pojo;
// Generated Mar 31, 2020 7:16:01 PM by Hibernate Tools 4.3.1



/**
 * Employee generated by hbm2java
 */
public class Employee  implements java.io.Serializable {


     private Integer eid;
     private String name;
     private String address;
     private String email;
     private String position;
     private String password;
     private String phonenumber;

    public Employee() {
    }

    public Employee(String name, String address, String email, String position, String password, String phonenumber) {
       this.name = name;
       this.address = address;
       this.email = email;
       this.position = position;
       this.password = password;
       this.phonenumber = phonenumber;
    }
   
    public Integer getEid() {
        return this.eid;
    }
    
    public void setEid(Integer eid) {
        this.eid = eid;
    }
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    public String getAddress() {
        return this.address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPosition() {
        return this.position;
    }
    
    public void setPosition(String position) {
        this.position = position;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPhonenumber() {
        return this.phonenumber;
    }
    
    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }




}

