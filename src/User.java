public class User  {
   public String Fname,Lname;
   public String username;
   public String password;
    
   
    public User(String Fname, String Lname, String username, String password) {
        this.Fname = Fname;
        this.Lname = Lname;
        this.username = username;
        this.password = password;
    }

    public String getFname() {
        return Fname;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    public String getLname() {
        return Lname;
    }

    public void setLname(String Lname) {
        this.Lname = Lname;
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
}

