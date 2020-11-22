/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;
import java.util.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;
/**
 *
 * @author Diego
 * 
 * 
 */
public class connectDB {
    
    
    
    ///////////////////////////////////person/////////////////////////////////////
     public static void insertPerson(int pid, String pFirstName, String pLastName, Date pbirthday, String pemail,
             int pidGender,int pidNationality,int pidTypePerson,int pidDistrict) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_.insert_person(?,?,?,?,?,?,?,?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pFirstName);
        stmt.setString(3,pLastName);
        stmt.setDate(4, new java.sql.Date(pbirthday.getTime()));
        stmt.setString(5,pemail);
        stmt.setInt(6, pidGender);
        stmt.setInt(7, pidNationality);
        stmt.setInt(8, pidTypePerson);
        stmt.setInt(9, pidDistrict);
        stmt.execute();
             
        
    }
     public static void insertUser(int pid, String pFirstName, String pLastName, Date pbirthday,
             String pemail, String pusername, String ppassword, int pidGender,int pidNationality,int pidTypePerson,int pidDistrict) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_.insert_user(?,?,?,?,?,?,?,?,?,?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pFirstName);
        stmt.setString(3,pLastName);
        stmt.setDate(4, new java.sql.Date(pbirthday.getTime()));
        stmt.setString(5,pemail);
        stmt.setString(6, pusername);
        stmt.setString(7, ppassword);
        stmt.setInt(8, pidGender);
        stmt.setInt(9, pidNationality);
        stmt.setInt(10, pidTypePerson);
        stmt.setInt(11, pidDistrict);
        stmt.execute();
             
        
    }
    
    public static void removePerson( int pid) throws SQLException{
      String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.remove_person(?)}");
        stmt.setInt(1, pid);
        stmt.execute();
     }
    
    public static void update_person_first_name(int pid, String pFirstName)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_first_name(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pFirstName);
        stmt.execute();
     }
     
    public static void update_person_Last_name(int pid, String pLastName)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_last_name(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pLastName);
        stmt.execute();
     }
     
    public static void update_person_birthday(int pid, Date pdate)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_birthday(?,?)}");
        stmt.setInt(1,pid);
        stmt.setDate(2, new java.sql.Date(pdate.getTime()));
        stmt.execute();
        }
     
    public static void update_person_email(int pid, String pemail)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_email(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pemail);
        stmt.execute();
          
          
      }
      
    public static void update_person_username(int pid, String pusername)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_username(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pusername);
        stmt.execute();
      }
      
    public static void update_person_password(int pid, String ppassword)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_password(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,ppassword);
        stmt.execute();
      }
      
    public static void update_person_id_gender(int pid, int pidGender)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_id_gender(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidGender);
        stmt.execute();
      
      }
    
    public static void update_person_id_nationality(int pid, int pidNationality)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_id_nationality(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidNationality);
        stmt.execute();
       
       }

    public static void update_person_type_person(int pid, int pidTypePerson)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_type_person(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidTypePerson);
        stmt.execute();
       
       }
    
    public static void update_person_district(int pid, int pidDistrict)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_district(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidDistrict);
        stmt.execute();
       
       }
    
    public static void update_person_photo(int pid, int pidPhoto)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_photo(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidPhoto);
        stmt.execute();
       
       }
    
    public static String getPersonFirstName(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonFirstName(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonLastName(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonLastName(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static Date getPersonBirthDay(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonBirthDay(?)}");
    
        
        stmt.registerOutParameter(1, OracleTypes.DATE);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        Date r =  stmt.getDate(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonUsername(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDProyecto";
        String uName = "PE";
        String uPass = "PE";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonUsername(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }
    
    
    public static String  getPersonEmail(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonEmail(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonPassword(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonPassword(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static String  getPersonIdGender(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdGender(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static int  getPersonAge(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonAge(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    public static int  getPersonIdTypePerson(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdTypePerson(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    public static int  getPersonIdNationality(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdNationality(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
     public static int  getPersonIdPhoto(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdPhoto(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
     public static int  getPersonIdDistrict(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdDistrict(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    /////////////////////////////////////////////gender/////////////////////////////////////////////
     
     public static void insert_gender(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.insert_gender(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }


    public static void remove_gender(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.remove_gender(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
    
        public static void update_gender_description(int pid,String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.update_gender_description(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }
        
    public static String getGenderDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_Gender.getGenderDescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     
     public static int getGenderID(String pdescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_Gender.get_gender_id(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pdescription);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
     
     ////////////////////////////////////////type person////////////////////////////////////////////
     
     
     public static void insert_type_person(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.insert_type_person(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }

public static void remove_type_person(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.remove_type_person(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
public static void update_type_person_description(int pid, String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.update_type_person(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }

    public static String getTypePersonDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_type_person.gettype_person(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     
     public static int getTypePersonID(String pdescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_type_person.getIDtype_person(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pdescription);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
     
     ///////////////////////////////////////////nationality////////////////////////////////////////////
     
     
     public static void insert_nationality(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_nationality.insert_nationality(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       } 

      public static void remove_nationality(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_nationality.remove_nationality(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_nationality_name(int pid, String pname)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_nationality.update_nationality(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2, pname);
        stmt.execute();
       
       } 
      
      
      
    public static String getNationalityName(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_nationality.getNationalityName(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    
    public static int getIDNationality(String pnationality)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_nationality.getIDNationality(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pnationality);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
     /////////////////////////////////////////////////province////////////////////////////////////////////////////
     
    
     public static void insert_Province(String p_name, int p_country)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_province.insert_Province(?,?)}");
        stmt.setString(1, p_name);
        stmt.setInt(2,p_country);

        stmt.execute();
    }
    
    
    public static void remove_Province(int p_id_province)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_province.remove_Province(?)}");  
        stmt.setInt(1, p_id_province);

        stmt.execute();
    }
    
    
    public static void update_Province(String p_name, int p_id_Province)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_province.update_Province(?,?)}");
        stmt.setString(1, p_name);
        stmt.setInt(2, p_id_Province);

        stmt.execute();
    }
    
    
    public static String getProvinceName(int pId) throws SQLException{
        
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?=call control_province.getProvinceName(?)}");


        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r; 
    }
    
    public static int getProvinceCountry(int pId) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?=call control_province.getProvinceCountry(?)}");


        stmt.registerOutParameter(1, OracleTypes.NUMBER);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;

    }
    
    public static int getIDProvince(String pprovince) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?=call control_province.getIDProvince(?)}");

        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pprovince);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r; 
    }
     
     ///////////////////////////////////////district/////////////////////////////////////////////
     
    public static void insert_district(String p_name, int p_canton) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDP";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.insert_district(?,?)}"); 
    stmt.setString(1, p_name);
    stmt.setInt(2, p_canton);
    
    stmt.execute();
    }
    
    public static void remove_district( int p_id_district) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDP";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.remove_district(?)}"); 
    stmt.setInt(1, p_id_district);
    
    stmt.execute();
    }
    
    public static void update_district(String p_name, int p_id_district) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDP";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.update_district(?,?)}"); 
    stmt.setString(1, p_name);
    stmt.setInt(2, p_id_district);
    
    stmt.execute();
    }
    
    public static String getDistrictName(int pId) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDP";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_district.getDistrictName(?)}"); 
    stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r; 
    }
    
    public static int getDistrictCanton(int pId) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDP";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_district.getDistrictCanton(?)}"); 
    stmt.registerOutParameter(1, OracleTypes.NUMBER);
    stmt.setInt(2, pId);
    stmt.executeQuery();
    int r =  stmt.getInt(1);

    System.out.println(r);
    return r;
    }
    
    public static int getIDdistrict(String pDistrict) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:BDP";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ ?=call control_district.getIDdistrict(?)}"); 
    stmt.registerOutParameter(1, OracleTypes.INTEGER);
    stmt.setString(2, pDistrict);
    stmt.executeQuery();
    int r =  stmt.getInt(1);

    System.out.println(r);
    return r;
    }
    
    
     /*-----------------------------------------COUNTRY-----------------------------------*/
  public static void insert_country(String p_name)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.insert_country(?)}");
        stmt.setString(1,p_name);
        stmt.execute();
       
       } 

      public static void remove_country(int p_id_country)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.remove_country(?)}");
        stmt.setInt(1,p_id_country);
        stmt.execute();
       
       } 


      
      public static void update_country(String pname,int p_id_country )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.update_country(?,?)}");
        stmt.setString(1, pname);
        stmt.setInt(2,p_id_country);
        stmt.execute();
       
       } 
      
      
      
    public static String getCountryName(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_country.getCountryName(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    public static int getIDCountry(String pcountry)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_country.getIDCountry(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pcountry);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    //////////////////////////////////////////////////canton///////////////////////////////////////////////////
    
    
    public static void insert_canton(String p_name, int p_province_id)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.insert_canton(?,?)}");
        stmt.setString(1,p_name);
        stmt.setInt(2,p_province_id);
        stmt.execute();
       
       } 

      public static void remove_canton(int p_id_canton)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.remove_canton(?)}");
        stmt.setInt(1,p_id_canton);
        stmt.execute();
       
       } 


      
      public static void update_canton(String p_name,int p_id_canton)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.update_canton(?,?)}");
        stmt.setString(1, p_name);
        stmt.setInt(2,p_id_canton);
        stmt.execute();
       
       } 
      
      
    public static String getCantonName(int pId)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_canton.getCantonName(?)}");

        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    public static int getCantonProvince(int pId)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_canton.getCantonProvince(?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pId);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    public static int getIDCanton(String pcanton)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_canton.getIDCanton(?)}");
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pcanton);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    ////////////////////////////////////////////////////pay method/////////////////////////////////////////////////////////////
    
    public static void insert_paymethod(String p_name)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_paymethod.insert_pay_method(?)}");
        stmt.setString(1,p_name);
        stmt.execute();
       
       } 

      public static void remove_paymethod(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_paymethod.remove_pay_method(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_paymethod(String pname,int pid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_paymethod.update_pay_method(?,?)}");
        stmt.setString(1, pname);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
      
    public static String getpaymethodName(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_paymethod.getPayMethodName(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    public static int getIDpaymethod(String ppay_method)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_paymethod.getIDPayMethod(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, ppay_method);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    ///////////////////////////////////////////////////////////phone////////////////////////////////////////////////////////////
    
    
    public static void insert_phone(int pnumber)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_phone.insert_phone(?)}");
        stmt.setInt(1,pnumber);
        stmt.execute();
       
       } 

      public static void remove_phone(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_phone.remove_phone(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_phone(int pnumber,int pid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_phone.update_phone(?,?)}");
        stmt.setInt(1, pnumber);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
      
    public static String getPhoneNumber(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_phone.getPhoneNumber(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    public static int getIDphone(int pnumber)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_phone.getIDphone(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pnumber);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    
    //////////////////////////////////////////////////////review/////////////////////////////////////////////////////////
    
    
    public static void insert_review(int pstars)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review.insert_review(?)}");
        stmt.setInt(1,pstars);
        stmt.execute();
       
       } 

      public static void remove_review(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review.remove_review(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_review(int pstars,int pid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review.update_review(?,?)}");
        stmt.setInt(1, pstars);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
      
    public static int getReview(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_review.getReview(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    public static int getIDreview(int pstars)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_review.getIDreview(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pstars);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
     //////////////////////////////////////////////////////review type/////////////////////////////////////////////////////////
    
    public static void insert_review_type(String pname)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review_type.insert_review_type(?)}");
        stmt.setString(1,pname);
        stmt.execute();
       
       } 

      public static void remove_review_type(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review_type.remove_review_type(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_review_type(String pname,int pid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review_type.update_review_type(?,?)}");
        stmt.setString(1, pname);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
    public static String getReview_type(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_review_type.getReview_type(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    
    public static int getIDreview_type(String previewtype)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:BDP";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_review_type.getIDreview_type(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, previewtype);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
