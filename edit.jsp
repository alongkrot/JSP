<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Edit-JSP</title>
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
        
        <!--JSP-->
        
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://35.198.216.128/web?user=james&password=bond");
                
                Statement st = conn.createStatement();
                String strId = request.getParameter("CusID");
                
                String sql = "select * from member where id='"+strId+"'";
                
                ResultSet rec = st.executeQuery(sql);
                
                if (rec != null ) { rec.next();
        
        %>
        
                <!--HTML--> 
                
        <div class="container">
            <form action="save.jsp?CusID=<%=rec.getString("id")%>" method="post">
                <div class="card">
                    <div class="card-body">
                        <h2 class="text-center py-4 font-bold font-up danger-text">EDIT</h2>
                    <div class="row">
                    <!-- Body-->
                        <div class="col-sm-4 col-md-5 text-center">
                        <img src="http://www.placehold.it/250x250" class="img-responsive" id="site-logo">
                        </div>
                        
                        <div class="col-ms-8 col-md-6 text-right">
                            <table class="table table-user-information text-center">
                                <tbody>
                                    <p>
                                  <tr>
                                    <td>ID :</td>
                                    <td><%=rec.getString("id")%></td>
                                  </tr>
                                  <tr>
                                    <td>First Name :</td>
                                    <td><input type="text" name="txtfirstName" value="<%=rec.getString("first_name")%>"></td>
                                  </tr>
                                  <tr>
                                    <td>Lass Name :</td>
                                    <td><input type="text" name="txtLassName" value="<%=rec.getString("lass_name")%>"></td>
                                  </tr>
                                  <tr>
                                    <td>E-mail :</td>
                                    <td><input type="text" name="txtEmail" value="<%=rec.getString("e_mail")%>"></td>
                                  </tr>
                                  <tr>
                                    <td>Password :</td>
                                    <td><input type="text" name="txtPassword" value="<%=rec.getString("p_assword")%>"></td>
                                  </tr>
                                    <p>
                                </tbody>
                            </table>
                        </div>
                        </div>
                        <div class="text-center">
                            <button class=" btn btn-default waves-effect waves-effect">save</button>
                        </div>    
                    </div>
                </div>
            </form>
        </div>

                        
        <%                         
                    }
                
            }catch(Exception e){
                // TODO Auto-generated catch block
			out.println(e.getMessage());
			e.printStackTrace();
                }
        
        %>

    </body>
</html>

