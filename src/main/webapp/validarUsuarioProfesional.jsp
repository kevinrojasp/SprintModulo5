<%
    session = request.getSession();
    if((session.getAttribute("username")!=null) && session.getAttribute("tipo").equals("Profesional")){
%>

<%
    }
    else{
        response.sendRedirect("dashboard.jsp");
    }
%>
