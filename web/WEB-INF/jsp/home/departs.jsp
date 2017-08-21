
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <base href="${pageContext.servletContext.contextPath}/">
    </head>
    <body>
        <DIV style="margin-top: 50pxpx;padding: 10px;font-size: 20px;font-family: inherit">
            <CENTER>

                <h1>Phòng Ban</h1>
                ${message}
                <form:form action="${pageContext.servletContext.contextPath}/home.html" modelAttribute="pb">

                    <div>ID</div>
                    <form:input path="id" readonly="true"/>

                    <div>Name</div>
                    <form:input path="name" /><br>
                    <form:errors path="name" style="color:red"/>
                    <div>Email</div>
                    <form:input path="email" /><br>
                    <form:errors path="email" style="color:red"/>
                    <div>Phone Number</div>
                    <form:input path="sdt" /><br>
                    <form:errors path="sdt" style="color:red"/>
                    <div>Gender</div>
                    <form:radiobuttons path="gioitinh" items="${GioiTinh}" />

                    <div>

                        <button name="btnIn">Insert</button>            
                        <button name="btnUp">Update</button>
                        <button name="bresset">Reset</button>
                    </div>

                </form:form>

                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>email</th>
                        <th>Phone Number</th>
                        <th>Gender</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>

                    <c:forEach var="rows" items="${departs}">
                        <form:form action="${pageContext.servletContext.contextPath}/home/del.html" >
                            <tr>
                                <td>${rows.id}</td>
                                <td>${rows.name}</td>
                                <td>${rows.email}</td>
                                <td>${rows.sdt}</td>
                                <c:set var="kt" value="${rows.gioitinh}"/>
                                <c:if test="${kt == true}">
                                    <td>Nam</td>

                                </c:if>
                                <c:if test="${kt == false}">
                                    <td>Nữ</td>
                                </c:if>
                                <c:url var="del" value="home/edit.html">
                                    <c:param name="txtID" value="${rows.id}"/>
                                    <c:param name="txtName" value="${rows.name}"/>
                                    <c:param name="txtemail" value="${rows.email}"/>
                                    <c:param name="txtsdt" value="${rows.sdt}"/>
                                    <c:param name="txtgt" value="${rows.gioitinh}"/>

                                </c:url>
                                <td><a href="${del}">Edit</a></td>
                                <td>
                                    <input type="hidden" name="txtID" value="${rows.id}"/>
                                    <input type="submit" name="action" value="Delete"/>
                                </td>

                            </tr>
                        </form:form>
                    </c:forEach>  

                </table>
            </CENTER>
        </div>
    </body>
</html>
