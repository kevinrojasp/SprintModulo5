<%
  session = request.getSession();
  if((session.getAttribute("username")!=null) && session.getAttribute("tipo").equals("Administrativo")){
%>

<%
  }
  else{
    response.sendRedirect("dashboard.jsp");
  }
%>
