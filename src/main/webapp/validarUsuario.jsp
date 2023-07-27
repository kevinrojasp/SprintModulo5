<%
    session = request.getSession();
    if((session.getAttribute("username")!=null)){
%>

<%
    }
    else{
        response.sendRedirect("index.jsp");
    }
%>
