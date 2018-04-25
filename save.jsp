<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Save-JSP</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <style>
        @import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);
        @import url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css);
        /*LOGIN color:*/
        .font-bold{
            color: #2BBBAD;    
        }
        </style>
    </head>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://35.198.216.128/web?user=james&password=bond");
                
                Statement st = conn.createStatement();
                
                String strId = request.getParameter("CusID");
                String stFirstName = request.getParameter("txtfirstName");
                String strLassName = request.getParameter("txtLassName");
                String strEmail = request.getParameter("txtEmail");
                String strPassword = request.getParameter("txtPassword");
                
                
                String sql = "update member " +
                             "set first_name = '"+stFirstName+"' "+
                             ", lass_name = '"+ strLassName + "' " +
                             ", e_mail = '"+ strEmail + "' " +
                             ", p_assword = '"+ strPassword + "' " +
                             " WHERE id = '" + strId + "' ";
                
                st.executeUpdate(sql);
                
                out.println("Record Update Successfully ");
                response.sendRedirect("profile.jsp");               
                conn.close(); st.close();
 
            }catch(Exception e){
                // TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
            }
        %>

    </body>
</html>

