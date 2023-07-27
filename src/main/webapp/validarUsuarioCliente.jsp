<%
  session = request.getSession();
  if((session.getAttribute("username")!=null) && session.getAttribute("tipo").equals("Cliente")){
%>

<%
  }
  else{
    response.sendRedirect("dashboard.jsp");
  }
%>
