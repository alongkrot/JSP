<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login-JSP</title>
        <link rel="stylesheet"
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <style>
        @import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);
        @import url(https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.3/css/mdb.min.css);
        /*LOGIN color:*/
        .text-center{
            color: #2BBBAD;          
        }
    </style>
    
    <body>
        <!--JSP-->
        
        <%
            try{
                String strEmail = request.getParameter("txtEmail");
                String strPassword = request.getParameter("txtPassword");
                
                if (strEmail != null && strPassword != null) {
  
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://35.198.216.128/web?user=james&password=bond");
                
                Statement st = conn.createStatement();
                String sql ="select * from member where "+
                            "e_mail = '"+strEmail+"' and " +
                            "p_assword = '"+strPassword+"' ";
                ResultSet rec = st.executeQuery(sql);
                
                if (!rec.next()) {
                        out.print("<font color> E-mail and Password Incorrecton</font>");   
                        }else{
                        rec.first();
                        session.setAttribute("ID",rec.getInt("id"));
                        response.sendRedirect("profile.jsp");
                        conn.close(); st.close(); rec.close();
                    }
                }
  
            }catch(Exception e){
                // TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
            }
        
        %>
        
       <!--HTML-->
       
        <div class="container">
            <form action="login.jsp" method="post">
                <div class="card">
                <div class="card-body">
                <h2 class="text-center default-text py-3">LOGIN</h2>
                <!--Body-->
                <div class="md-form">
                    <i class="fa fa-envelope prefix grey-text"></i>
                    <input type="email" name="txtEmail" placeholder="E-mail" class="form-control">
                </div>
                <div class="md-form">
                    <i class="fa fa-lock prefix grey-text"></i>
                    <input type="password" name="txtPassword" placeholder="Password" class="form-control">
                </div>
                <!--Button-->
                <div class="text-center">
                    <button class=" btn btn-default waves-effect waves-effect">Login</button>
                </div>
                <a href="register.jsp">Signup</a>. <br>
                </div>
                </div>
            </form>
        </div>
    </body>
</html>

