<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Register-JSP</title>
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
    </head>
    <body>
        <!--JSP-->
        
        <%
            try{
                String strFirstName = request.getParameter("txtFirstName");
                String strLassName = request.getParameter("txtLassName");
                String strEmail = request.getParameter("txtEmail");
                String strPassword = request.getParameter("txtPassword");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://35.198.216.128/web?user=james&password=bond");
                
                Statement st = conn.createStatement();
                String sql ="insert into member(first_name,lass_name,e_mail,p_assword)"+
                                        "values('"+strFirstName+"','"+strLassName+"',+'"+strEmail+"','"+strPassword+"')";
                
                int i = st.executeUpdate(sql);
                out.println("Record Inserted Successfull Please! <a href='login.jsp'>LOGIN</a> to contiue");
                st.close(); conn.close(); 
                
            }catch(Exception e){
                // TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
            
            }

        %>
        
        
        <!--HTML-->
       
        <div class="container">
            <form action="register.jsp" method="post">
                <div class="card">
                <div class="card-body">
                <h2 class="text-center py-4 font-bold font-up danger-text">REGISTER</h2>
                <!--Body-->
                <div class="md-form">
                    <div class="md-form">
                        <i class="fa fa-pencil prefix grey-text"></i>
                        <input type="text" name="txtFirstName" placeholder="First Name" class="form-control">
                    </div>
                    <div class="md-form">
                        <i class="fa fa-pencil prefix grey-text"></i>
                        <input type="text" name="txtLassName" placeholder="Lass Name" class="form-control">
                    </div>
                    <div class="md-form">
                        <i class="fa fa-pencil prefix grey-text"></i>
                        <input type="email" name="txtEmail" placeholder="E-mail" class="form-control">
                    </div>
                    <div class="md-form">
                        <i class="fa fa-pencil prefix grey-text"></i>
                        <input type="password" name="txtPassword" placeholder="Password" class="form-control">
                    </div>
                  <!--Button-->
                <div class="text-center">
                    <button class=" btn btn-default waves-effect waves-effect">Save</button>
                </div>
                </div>
                </div>
            </form>
        </div>       
    </body>
</html>

