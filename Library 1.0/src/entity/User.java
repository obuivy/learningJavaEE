package entity;

/**
 * @author admin
 */
public class User {
    /**
     * 账号唯一
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     *真实姓名
     */
    private String user;

    private String rearName;
    private String sex;
    private String tel;
    private String email;
    /**
     * 借的书的个数
     */
    private int maxBooksNumber;
    public User() {
        maxBooksNumber = 5;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getRearName() {
        return rearName;
    }

    public void setRearName(String rearName) {
        this.rearName = rearName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getMaxBooksNumber() {
        return maxBooksNumber;
    }
}
