
package DBConnection;

/**
 *
 * @author Ronaldo
 */

import java.util.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleTypes;



public class ConnectDB {
    
    public static void insertPerson(int pid, String pFirstName, String pLastName, String pbirthday, String pemail,
             int pidGender,int pidNationality,int pidTypePerson,int pidDistrict) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.insert_person(?,?,?,?,?,?,?,?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pFirstName);
        stmt.setString(3,pLastName);
        stmt.setString(4,pbirthday);
        stmt.setString(5,pemail);
        stmt.setInt(6, pidGender);
        stmt.setInt(7, pidNationality);
        stmt.setInt(8, pidTypePerson);
        stmt.setInt(9, pidDistrict);
        stmt.execute();
             
        
    }
     public static void insertUser(int pid, String pFirstName, String pLastName, String pbirthday,
             String pemail, String pusername, String ppassword, int pidGender,int pidNationality,int pidTypePerson,int pidDistrict) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.insert_user(?,?,?,?,?,?,?,?,?,?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pFirstName);
        stmt.setString(3,pLastName);
        stmt.setString(4, pbirthday);
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
      String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.remove_person(?)}");
        stmt.setInt(1, pid);
        stmt.execute();
     }
    
    public static void update_person_first_name(int pid, String pFirstName)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_first_name(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pFirstName);
        stmt.execute();
     }
     
    public static void update_person_Last_name(int pid, String pLastName)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_last_name(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pLastName);
        stmt.execute();
     }
     
    public static void update_person_birthday(int pid, Date pdate)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_birthday(?,?)}");
        stmt.setInt(1,pid);
        stmt.setDate(2, new java.sql.Date(pdate.getTime()));
        stmt.execute();
        }
     
    public static void update_person_email(int pid, String pemail)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_email(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pemail);
        stmt.execute();
          
          
      }
      
    public static void update_person_username(int pid, String pusername)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_username(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pusername);
        stmt.execute();
      }
      
    public static void update_person_password(int pid, String ppassword)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_password(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,ppassword);
        stmt.execute();
      }
      
    public static void update_person_id_gender(int pid, int pidGender)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_id_gender(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidGender);
        stmt.execute();
      
      }
    
    public static void update_person_id_nationality(int pid, int pidNationality)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_id_nationality(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidNationality);
        stmt.execute();
       
       }

    public static void update_person_type_person(int pid, int pidTypePerson)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_type_person(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidTypePerson);
        stmt.execute();
       
       }
    
    public static void update_person_district(int pid, int pidDistrict)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_district(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidDistrict);
        stmt.execute();
       
       }
    
    public static void update_person_photo(int pid, int pidPhoto)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person.update_person_photo(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pidPhoto);
        stmt.execute();
       
       }
    
    public static int getPersonIdentification(String pusername)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdentification(?)}");
    
        stmt.registerOutParameter(1, OracleTypes.NUMBER);
        stmt.setString(2, pusername);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    
    
    public static String getPersonFirstName(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonUsername(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }
    
    
    public static String getPersonEmail(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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

    public static int  getPersonIdGender(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person.getPersonIdGender(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }

    public static int  getPersonAge(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.insert_gender(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }


    public static void remove_gender(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.remove_gender(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
    
        public static void update_gender_description(int pid,String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_Gender.update_gender_description(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }
        
    public static String getGenderDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.insert_type_person(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }

public static void remove_type_person(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.remove_type_person(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
public static void update_type_person_description(int pid, String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_type_person.update_type_person(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }

    public static String getTypePersonDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_nationality.insert_nationality(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       } 

      public static void remove_nationality(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_nationality.remove_nationality(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_nationality_name(String pname, int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_nationality.update_nationality(?,?)}");
        stmt.setString(1, pname);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
      
    public static String getNationalityName(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_province.insert_Province(?,?)}");
        stmt.setString(1, p_name);
        stmt.setInt(2,p_country);

        stmt.execute();
    }
    
    
    public static void remove_Province(int p_id_province)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_province.remove_Province(?)}");  
        stmt.setInt(1, p_id_province);

        stmt.execute();
    }
    
    
    public static void update_Province(String p_name, int p_id_Province)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_province.update_Province(?,?)}");
        stmt.setString(1, p_name);
        stmt.setInt(2, p_id_Province);

        stmt.execute();
    }
    
    
    public static String getProvinceName(int pId) throws SQLException{
        
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
    String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.insert_district(?,?)}"); 
    stmt.setString(1, p_name);
    stmt.setInt(2, p_canton);
    
    stmt.execute();
    }
    
    public static void remove_district( int p_id_district) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.remove_district(?)}"); 
    stmt.setInt(1, p_id_district);
    
    stmt.execute();
    }
    
    public static void update_district(String p_name, int p_id_district) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
    String uName = "CL";
    String uPass = "CL";
     
    Connection con = DriverManager.getConnection(host, uName, uPass);
    CallableStatement stmt = con.prepareCall("{ call control_district.update_district(?,?)}"); 
    stmt.setString(1, p_name);
    stmt.setInt(2, p_id_district);
    
    stmt.execute();
    }
    
    public static String getDistrictName(int pId) throws SQLException{
    String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
    String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
    String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.insert_country(?)}");
        stmt.setString(1,p_name);
        stmt.execute();
       
       } 

      public static void remove_country(int p_id_country)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.remove_country(?)}");
        stmt.setInt(1,p_id_country);
        stmt.execute();
       
       } 


      
      public static void update_country(String pname,int p_id_country )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_country.update_country(?,?)}");
        stmt.setString(1, pname);
        stmt.setInt(2,p_id_country);
        stmt.execute();
       
       } 
      
      
      
    public static String getCountryName(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.insert_canton(?,?)}");
        stmt.setString(1,p_name);
        stmt.setInt(2,p_province_id);
        stmt.execute();
       
       } 

      public static void remove_canton(int p_id_canton)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.remove_canton(?)}");
        stmt.setInt(1,p_id_canton);
        stmt.execute();
       
       } 


      
      public static void update_canton(String p_name,int p_id_canton)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_canton.update_canton(?,?)}");
        stmt.setString(1, p_name);
        stmt.setInt(2,p_id_canton);
        stmt.execute();
       
       } 
      
      
    public static String getCantonName(int pId)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_paymethod.insert_pay_method(?)}");
        stmt.setString(1,p_name);
        stmt.execute();
       
       } 

      public static void remove_paymethod(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_paymethod.remove_pay_method(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_paymethod(String pname,int pid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_paymethod.update_pay_method(?,?)}");
        stmt.setString(1, pname);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
      
    public static String getpaymethodName(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_phone.insert_phone(?)}");
        stmt.setInt(1,pnumber);
        stmt.execute();
       
       } 

      public static void remove_phone(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_phone.remove_phone(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_phone(int pnumber,int pid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_phone.update_phone(?,?)}");
        stmt.setInt(1, pnumber);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
      
    public static String getPhoneNumber(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review.insert_review(?)}");
        stmt.setInt(1,pstars);
        stmt.execute();
       
       } 

      public static void remove_review(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review.remove_review(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_review(int pstars,int pid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review.update_review(?,?)}");
        stmt.setInt(1, pstars);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
      
    public static int getReview(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review_type.insert_review_type(?)}");
        stmt.setString(1,pname);
        stmt.execute();
       
       } 

      public static void remove_review_type(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review_type.remove_review_type(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_review_type(String pname,int pid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_review_type.update_review_type(?,?)}");
        stmt.setString(1, pname);
        stmt.setInt(2,pid);
        stmt.execute();
       
       } 
      
      
    public static String getReview_type(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
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
    
    //////////////////////////////////////////////////////personbuyclock//////////////////////////////////////////////
    
    
    public static void insert_person_buy_clock(int pid_person,int pid_clock,int pid_pay_method)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_buy_clock.insert_person_buy_clock(?,?,?)}");
        stmt.setInt(1,pid_person);
        stmt.setInt(2,pid_clock);
        stmt.setInt(3, pid_pay_method);
        stmt.execute();
       
       } 

      public static void remove_person_buy_clock(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_buy_clock.remove_person_buy_clock(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_person_buy_clock_id_person(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_buy_clock.update_pbc_id_person(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      public static void update_person_buy_clock_id_pay_method(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_buy_clock.update_pbc_id_pay_method(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      public static void update_person_buy_clock_id_clock(int pid_clock,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_person_buy_clock.update_pbc_id_clock(?,?)}");
        stmt.setInt(1, pid_clock);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      
    public static int getPBCIdPerson(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person_buy_clock.getpbcidperson(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
     public static int getPBCIdPay_Method(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person_buy_clock.getpbcidpay_method(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    
     public static int getPBCIdClock(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_person_buy_clock.getpbcidclock(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    //////////////////////////////////////////////////////personchatperson//////////////////////////////////////////////////////
    
    public static void insert_personchatperson(int pid_person1,int pid_person2,String pmessage)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personchatperson.insert_personchatperson(?,?,?)}");
        stmt.setInt(1,pid_person1);
        stmt.setInt(2,pid_person2);
        stmt.setString(3, pmessage);
        //stmt.setDate(4, new java.sql.Date(pmessage_date.getTime()));
        stmt.execute();
       
       } 

      public static void remove_personchatperson(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personchatperson.remove_personchatperson(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       } 


      
      public static void update_personchatperson_id_person_sender(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personchatperson.update_pcp_id_person_sender(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      public static void update_personchatperson_id_person_reader(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personchatperson.update_pcp_id_person_reader(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      public static void update_personchatperson_message(int pid_person,String pmessage )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personchatperson.update_pcp_message(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setString(2,pmessage);
        stmt.execute();
       
       } 
      
       
      
      public static int getPCPIdPersonSender(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personchatperson.getpcpidpersonsender(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
      
    public static int getPCPIdPersonReader(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personchatperson.getpcpidpersonreader(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    
    public static String getPCPmessage(int pid_person_sender)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personchatperson.getpcpmessage(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid_person_sender);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    
    public static Date getPCPmessageDate(int pid_person_sender)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personchatperson.getpcpmessage(?)}");


        stmt.registerOutParameter(1, OracleTypes.DATE);
        stmt.setInt(2, pid_person_sender);
        stmt.executeQuery();
        Date r =  stmt.getDate(1);
        
        System.out.println(r);
        return r;
    }
    
    ///////////////////////////////////////////////////////personsellclock//////////////////////////////////////////////////////
    
     public static void insert_personsellclock(int pid_person,int pid_clock)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personsellclock.insert_personsellclock(?,?)}");
        stmt.setInt(1,pid_person);
        stmt.setInt(2,pid_clock);
        stmt.execute();
       
       } 

      public static void remove_personsellclock(int pid_person)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personsellclock.remove_personsellclock(?)}");
        stmt.setInt(1,pid_person);
        stmt.execute();
       
       } 


      
      public static void update_psc_id_person(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personsellclock.update_psc_id_person(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      public static void update_psc_id_clock(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personsellclock.update_psc_id_clock(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      
      
    public static int getPSCIdPerson(int pid_clock)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personsellclock.getpersonsellclockIdPerson(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_clock);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
     public static int getPSCIdClock(int pid_person)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personsellclock.getpersonsellclockIdClock(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_person);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
     ///////////////////////////////////////Photo//////////////////////////////////////////
     
     public static void insert_photo(String pName,String pInfo)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_photo.insert_photo(?,?)}");
        stmt.setString(1,pName);
        stmt.setString(2,pInfo);
        stmt.execute();
       
       } 
     
     
     
     
     
     
     
     
     
     
     
    //////////////////////////////////////////////////personwishclock////////////////////////////////////////////////////////
    
    public static void insert_personwishclock(int pid_person,int pid_clock)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personwishclock.insert_personwishclock(?,?)}");
        stmt.setInt(1,pid_person);
        stmt.setInt(2,pid_clock);
        stmt.execute();
       
       } 

      public static void remove_personwishclock(int pid_person)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personwishclock.remove_personwishclock(?)}");
        stmt.setInt(1,pid_person);
        stmt.execute();
       
       } 

      public static void remove_personwishclock_clock(int pid_clock)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personwishclock.remove_personwishclock_clock(?)}");
        stmt.setInt(1,pid_clock);
        stmt.execute();
       
       } 
      
      public static void update_pwc_id_person(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personwishclock.update_pwc_id_person(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      public static void update_pwc_id_clock(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personwishclock.update_pwc_id_clock(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      
      
    public static int getPWCIdPerson(int pid_clock)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personwishclock.getpersonwishclockidperson(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_clock);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
     public static int getPWCIdClock(int pid_person)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personwishclock.getpersonwishclockidclock(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_person);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    ///////////////////////////////////////////////////////reviewxreview_type////////////////////////////////////////////////
    

    
    public static void insert_reviewxreview_type(int pid_review,int pid_review_type)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_reviewxreview_type.insert_reviewxreview_type(?,?)}");
        stmt.setInt(1,pid_review);
        stmt.setInt(2,pid_review_type);
        stmt.execute();
       
       } 

      public static void remove_reviewxreview_type(int pid_review)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_reviewxreview_type.remove_reviewxreview_type(?)}");
        stmt.setInt(1,pid_review);
        stmt.execute();
       
       } 


      
      public static void update_rxrt_id_review(int pid_review,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_reviewxreview_type.update_rxrt_id_review(?,?)}");
        stmt.setInt(1, pid_review);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
     public static void update_rxrt_id_review_type(int pid_review_type,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_reviewxreview_type.update_rxrt_id_review_type(?,?)}");
        stmt.setInt(1, pid_review_type);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
     
      public static int get_rxrt_id_review(int pid_review_type)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_reviewxreview_type.getrxrtidreview(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_review_type);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
      
    public static int get_rxrt_id_reviewtype(int pid_review)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_reviewxreview_type.getrxrtidreviewtype(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_review);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    
    //////////////////////////////////////////////////personxreview////////////////////////////////////////////////////
    
    
    public static void insert_personxreview(int pid_person,String puser_comment,int pid_review)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxreview.insert_personxreview(?,?,?)}");
        stmt.setInt(1,pid_person);
        stmt.setString(2,puser_comment);
        stmt.setInt(3,pid_review);
        stmt.execute();
       
       } 

      public static void remove_personxreview(int pid_person)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxreview.remove_personxreview(?)}");
        stmt.setInt(1,pid_person);
        stmt.execute();
       
       } 


      
      public static void update_pxr_id_person(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxreview.update_pxr_id_person(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
       public static void update_pxr_comment(int pid_person,String pcomment )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxreview.update_pxr_comment(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setString(2,pcomment);
        stmt.execute();
       
       } 
      
      
      public static void update_pxr_id_review(int pid_review,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxreview.update_pxr_id_review(?,?)}");
        stmt.setInt(1, pid_review);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      
      
    public static int getPXRIdPerson(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personxreview.getpersonxreviewIdPerson(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    public static int getPXRIdReview(int pid_person)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personxreview.getpersonxreviewIdReview(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_person);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
      public static String getPXRcomment(int pid_review)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personxreview.getpersonxreviewComment(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid_review);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    
    
    
    ///////////////////////////////////////////////////////////personxphone///////////////////////////////////////////////////////
    
    
    public static void insert_personxphone(int pid_person,int pid_phone)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxphone.insert_personxphone(?,?)}");
        stmt.setInt(1,pid_person);
        stmt.setInt(2,pid_phone);
        stmt.execute();
       
       } 

      public static void remove_personxphone(int pid_person)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxphone.remove_personxphone(?)}");
        stmt.setInt(1,pid_person);
        stmt.execute();
       
       } 


      
      public static void update_pxp_id_person(int pid_person,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxphone.update_pxp_id_person(?,?)}");
        stmt.setInt(1, pid_person);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      public static void update_pxp_id_phone(int pid_phone,int pnewid )throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_personxphone.update_pxp_id_phone(?,?)}");
        stmt.setInt(1, pid_phone);
        stmt.setInt(2,pnewid);
        stmt.execute();
       
       } 
      
      
      
    public static int getPXPIdPerson(int pid_phone)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personxphone.getpersonxphoneIdPerson(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_phone);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
     public static int getPXPIdPhone(int pid_person)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_personxphone.getpersonxphoneIdPhone(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid_person);
        stmt.executeQuery();
        int r =  stmt.getInt(1);

        System.out.println(r);
        return r;
    }
    
    ////////////////////////////////////////////////////////binnacle/////////////////////////////////////////////////////////////
    
    
    public static void insert_binnacle(String plast_price,String plast_owner)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_binnacle.insert_binnacle(?,?)}");
        stmt.setString(1,plast_price);
        stmt.setString(2,plast_owner);
        stmt.execute();
       
       }


    public static void remove_binnacle(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_binnacle.remove_binnacle(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
    
        public static void update_binnacle_price(int pid,String plast_price)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_binnacle.update_binnacle_price(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,plast_price);
        stmt.execute();
       
       }
        
        public static void update_binnacle_owner(int pid,String plast_owner)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_binnacle.update_binnacle_owner(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,plast_owner);
        stmt.execute();
       
       }
        
        
        
    public static String getbinnacleLastPrice(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_binnacle.getbinnaclelastprice(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
    
       public static String getbinnacleLastOwner(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_binnacle.getbinnaclelastowner(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
       
     public static int getbinnacleID(String pdescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_Gender.get_binnacle_id(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pdescription);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    
    ////////////////////////////////////////////////////brand////////////////////////////////////////////////////////
    
    
    
    public static void insert_brand(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_brand.insert_brand(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }


    public static void remove_brand(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_brand.remove_brand(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
    
        public static void update_brand_description(int pid,String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_brand.update_brand_description(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }
        
    public static String getbrandDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_brand.getbrandDescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     
     public static int getbrandID(String pdescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_brand.get_brand_id(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pdescription);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
     
   
    
    ////////////////////////////////////////////////////////////category//////////////////////////////////////////////////////
    
    
    public static void insert_category(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_category.insert_category(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }


    public static void remove_category(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_category.remove_category(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
    
        public static void update_category_description(int pid,String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_category.update_category_description(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }
        
    public static String getcategoryDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_category.getcategoryDescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     
     public static int getcategoryID(String pdescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_category.get_category_id(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pdescription);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    
    //////////////////////////////////////////////////////////////////status////////////////////////////////////////////////////////
    
    
    
    public static void insert_status(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_status.insert_status(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }


    public static void remove_status(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_status.remove_status(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
    
        public static void update_status_description(int pid,String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_status.update_status_description(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }
        
    public static String getstatusDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_status.getstatusDescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     
     public static int getstatusID(String pdescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_status.get_status_id(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pdescription);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    ////////////////////////////////////////////////////////////shipping_type//////////////////////////////////////////////////////////
    
    public static void insert_shipping_type(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_shipping_type.insert_shipping_type(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }


    public static void remove_shipping_type(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_shipping_type.remove_shipping_type(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
    
        public static void update_shipping_type_description(int pid,String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_shipping_type.update_sp_description(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }
        
    public static String getshipping_typeDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_shipping_type.get_sp_Description(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     
     public static int getshipping_typeID(String pdescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_shipping_type.get_sp_id(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pdescription);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
    
    //////////////////////////////////////////////////////////condition///////////////////////////////////////////////////////
     
     public static void insert_condition(String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_condition.insert_condition(?)}");
        stmt.setString(1,pdescription);
        stmt.execute();
       
       }


    public static void remove_condition(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_condition.remove_condition(?)}");
        stmt.setInt(1,pid);
        stmt.execute();
       
       }
    
        public static void update_condition_description(int pid,String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_condition.update_condition_description(?,?)}");
        stmt.setInt(1, pid);
        stmt.setString(2,pdescription);
        stmt.execute();
       
       }
        
    public static String getconditionDescription(int pid)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_condition.getconditionDescription(?)}");



        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);

        System.out.println(r);
        return r;
    }
     
     public static int getconditionID(String pdescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_condition.get_condition_id(?)}");



        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setString(2, pdescription);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
     
     //////////////////////////////////////////clock/////////////////////////////////////////////
     
     
     public static void insertClock(String pname,String pmodel ,String pdescription, 
             int pmanifacturing_date ,int pprice,int pid_binnacle,int pid_shipping_type , int pid_category,int pid_brand,int pid_status,int pid_condition, int pid_photo) throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.insert_clock(?,?,?,?,?,?,?,?,?,?,?,?)}");
        
        stmt.setString(1,pname);
        stmt.setString(2,pmodel);
        stmt.setString(3,pdescription);
        stmt.setInt(4, pmanifacturing_date);
        stmt.setInt(5,pprice);
        stmt.setInt(6, pid_binnacle);
        stmt.setInt(7, pid_shipping_type);
        stmt.setInt(8, pid_category);
        stmt.setInt(9, pid_brand);
        stmt.setInt(10, pid_status);
        stmt.setInt(11, pid_condition);
        stmt.setInt(12, pid_photo);
        stmt.execute();
             
        
    }
     
    public static void removeclock( int pid) throws SQLException{
      String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.remove_clock(?)}");
        stmt.setInt(1, pid);
        stmt.execute();
     }
    
    public static void update_clock_name(int pid, String pname)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_name(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pname);
        stmt.execute();
     }
    
     public static void update_clock_model(int pid, String pmodel)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_model(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pmodel);
        stmt.execute();
     }
   
     public static void update_clock_description(int pid, String pdescription)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_description(?,?)}");
        stmt.setInt(1,pid);
        stmt.setString(2,pdescription);
        stmt.execute();
     }
     
     
    public static void update_clock_manifacturing_date(int pid, Date pdate)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_date(?,?)}");
        stmt.setInt(1,pid);
        stmt.setDate(2, new java.sql.Date(pdate.getTime()));
        stmt.execute();
        }
     
     public static void update_clock_price(int pid, int pprice)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_price(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pprice);
        stmt.execute();
      
      }
      
    public static void update_clock_id_binnacle(int pid, int pid_binnacle)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_id_binnacle(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pid_binnacle);
        stmt.execute();
      
      }
    
    
     public static void update_clock_id_shipping(int pid, int pid_shipping)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_id_shipping(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pid_shipping);
        stmt.execute();
      
      }
     
     public static void update_clock_id_category(int pid, int pid_category)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_id_category(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pid_category);
        stmt.execute();
      
      }
    
     public static void update_clock_id_brand(int pid, int pid_brand)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_id_brand(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pid_brand);
        stmt.execute();
      
      }
     
     public static void update_clock_id_status(int pid, int pid_status)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_id_status(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pid_status);
        stmt.execute();
      
      }
     
     public static void update_clock_id_condition(int pid, int pid_condition)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_id_condition(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pid_condition);
        stmt.execute();
      
      }
    
     public static void update_clock_id_photo(int pid, int pid_photo)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ call control_clock.update_clock_id_photo(?,?)}");
        stmt.setInt(1,pid);
        stmt.setInt(2,pid_photo);
        stmt.execute();
      
      }
     
     
    public static String getClockName(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockname(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

     public static String getClockmodel(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockmodel(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }
     
     public static String getclockdescription(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockdescription(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.VARCHAR);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static Date getClockDate(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockdate(?)}");
    
        
        stmt.registerOutParameter(1, OracleTypes.DATE);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        Date r =  stmt.getDate(1);
        
        System.out.println(r);
        return r;
    }


    public static String getClockPrice(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockprice(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        String r =  stmt.getString(1);
        
        System.out.println(r);
        return r;
    }

    public static int  getClockIdBinnacle(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockidbinnacle(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
   public static int  getClockIdShippingType(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockidshipping(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }
   public static int  getClockIdCategory(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockidcategory(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }  
   
   
   public static int  getClockIdBrand(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockidbrand(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }  
   public static int  getClockIdStatus(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockidstatus(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }  
  public static int  getClockIdCondition(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockidcondition(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }   
   
  public static int  getClockIdPhoto(int pid)throws SQLException{
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";
        
        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ? = call control_clock.getclockidphoto(?)}");
    
        
        
        stmt.registerOutParameter(1, OracleTypes.INTEGER);
        stmt.setInt(2, pid);
        stmt.executeQuery();
        int r =  stmt.getInt(1);
        
        System.out.println(r);
        return r;
    }   
    
    /////////////////////////////////////////////////////////user queries//////////////////////////////////////////////////////////////
   

        
        
        public static ResultSet searchClock(String pname,int pidCategory,int pidBrand,int pidCondition,
                int pidShipping,String pmodel,int pid_clock, int pprice)throws SQLException{   
        
            
            
            
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call users_queries.searchClock(?,?,?,?,?,?,?,?)}");
        
        if(pname.isEmpty() == true){
            stmt.setNull(2,java.sql.Types.VARCHAR);
        }else{
         stmt.setString(2, pname);   
        }
            System.out.println("aquivoy1");
        
        
        if(pidCategory == -1){
            stmt.setNull(3,java.sql.Types.INTEGER);
        }else{
         stmt.setInt(3, pidCategory); 
        }
        
        System.out.println("aquivoy2");
        if(pidBrand == -1){
            stmt.setNull(4,java.sql.Types.INTEGER);
        }else{
         stmt.setInt(4, pidBrand); 
        }
        
        System.out.println("aquivoy3");
        
        
        if(pidCondition == -1){
            stmt.setNull(5,java.sql.Types.INTEGER);
        }else{
         stmt.setInt(5, pidCondition); 
        }
        System.out.println("aquivoy4");
        
        if(pidShipping == -1){
            stmt.setNull(6,java.sql.Types.INTEGER);
        }else{
         stmt.setInt(6, pidShipping); 
        }
        
        System.out.println("aquivoy5");
        
        if(pmodel.isEmpty() == true){
                stmt.setNull(7,java.sql.Types.VARCHAR);
        }else{
         stmt.setString(7, pmodel);   
        }
        System.out.println("aquivoy6");
        if(pid_clock == -1){
            stmt.setNull(8,java.sql.Types.INTEGER);
        }else{
         stmt.setInt(8, pid_clock); 
        }
        System.out.println("aquivoy7");
        if(pprice == -1){
            stmt.setNull(9,java.sql.Types.INTEGER);
        }else{
         stmt.setInt(9,pprice); 
        }
        
        System.out.println("aquivoy8");

        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        System.out.println("aquivoy9");
        return r;
        
       
        }
        
        
        public static java.sql.ResultSet userBuyHistory(int pidUser)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call users_queries.userbuyHistory(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pidUser);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
        
   public static java.sql.ResultSet userSellHistory(int pidUser,int pid_status)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call users_queries.usersellHistory(?,?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pidUser);
        stmt.setInt(3, pid_status);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
  
  
  public static java.sql.ResultSet expensivePurchaseCategory(int pidUser,int pid_category)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call users_queries.expensivePurchaseCategory(?,?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pidUser);
        stmt.setInt(3, pid_category);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
  
  
  
  ///////////////////////////////////////////////////////stat queries///////////////////////////////////////////////////////
  
  public static java.sql.ResultSet PercentPerCategory()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call stadistic_queries.PercentPerCategory}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
  
  public static java.sql.ResultSet SellersPerGender()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call stadistic_queries.SellersPerGender}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
  
  public static java.sql.ResultSet SellsPerGender()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call stadistic_queries.SellsPerGender}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
  
  public static java.sql.ResultSet SellersPerAgeRange()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call stadistic_queries.SellersPerAgeRange}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
        }
  
  
  /////////////////////////////////////////////////////////admin queries///////////////////////////////////////////////////////////////////////
  
  
    public static java.sql.ResultSet topsellers(int pNumber)throws SQLException{   
          String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
          String uName = "CL";
          String uPass = "CL";

          Connection con = DriverManager.getConnection(host, uName, uPass);
          CallableStatement stmt = con.prepareCall("{ ?= call admin_queries.topsellers(?)}");



          stmt.registerOutParameter(1, OracleTypes.CURSOR);
          stmt.setInt(2, pNumber);
          java.sql.ResultSet r =  stmt.executeQuery();
          System.out.println(r);
          return r;

   }
  
  
  public static java.sql.ResultSet topBuyers(int pNumber)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call admin_queries.topBuyers(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setInt(2, pNumber);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
  
  
  public static java.sql.ResultSet bestQualifiedSellers()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call admin_queries.bestQualifiedSellers}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
  
  
   public static java.sql.ResultSet bestQualifiedBuyers()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call admin_queries.bestQualifiedBuyers}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
  
   public static java.sql.ResultSet worstQualifiedBuyers()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call admin_queries.worstQualifiedBuyers}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
   
    public static java.sql.ResultSet MostExpensiveClocks(int pNumber, String pDescription)throws SQLException{   
          String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
          String uName = "CL";
          String uPass = "CL";

          Connection con = DriverManager.getConnection(host, uName, uPass);
          CallableStatement stmt = con.prepareCall("{ ?= call admin_queries.MostExpensiveClocks(?,?)}");



          stmt.registerOutParameter(1, OracleTypes.CURSOR);
          stmt.setInt(2, pNumber);
          stmt.setString(3, pDescription);
          java.sql.ResultSet r =  stmt.executeQuery();
          System.out.println(r);
          return r;

   }
  
   public static java.sql.ResultSet MaxMinPerCategory(String pDescription)throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call admin_queries.MaxMinPerCategory(?)}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        stmt.setString(2, pDescription);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
/////////////////////////////////////////////////////UI_queries//////////////////////////////////////////////////////////


public static java.sql.ResultSet giveBrandName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveBrandName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
   
  public static java.sql.ResultSet giveCountryName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveCountryName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
  
  public static java.sql.ResultSet giveProvinceName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveProvinceName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }

public static java.sql.ResultSet giveCantonName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveCantonName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
  
public static java.sql.ResultSet giveDistrictName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveDistrictName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }

public static java.sql.ResultSet giveCategoryName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveCategoryName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }

public static java.sql.ResultSet giveConditionName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveConditionName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }

public static java.sql.ResultSet giveStatusName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveStatusName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }


public static java.sql.ResultSet givePayMethodName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.givePayMethodName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }

public static java.sql.ResultSet givePhoneNumber()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.givePhoneNumber}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }

public static java.sql.ResultSet givePhotoName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.givePhotoName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }


public static java.sql.ResultSet giveReviewStars()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveReviewStars}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }


public static java.sql.ResultSet giveReviewTypeName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveReviewTypeName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }

public static java.sql.ResultSet giveShippingTypeName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveShippingTypeName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }

public static java.sql.ResultSet giveTypePersonName()throws SQLException{   
        String host = "jdbc:oracle:thin:@localhost:1521:DBRONALDO";
        String uName = "CL";
        String uPass = "CL";

        Connection con = DriverManager.getConnection(host, uName, uPass);
        CallableStatement stmt = con.prepareCall("{ ?= call UI_queries.giveTypePersonName}");



        stmt.registerOutParameter(1, OracleTypes.CURSOR);
        java.sql.ResultSet r =  stmt.executeQuery();
        System.out.println(r);
        return r;
        
 }
}
