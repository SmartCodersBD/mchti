<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tiles:insertDefinition name="defaultTemplate"/>

<tiles:putAttribute name="header">
    <jsp:include page="../layouts/header.jsp"/>
</tiles:putAttribute>

<tiles:putAttribute name="menu">
    <jsp:include page="../layouts/menu.jsp"/>
</tiles:putAttribute>

<tiles:putAttribute name="body">

    <title><spring:message code="project.title.index" text="Index"/></title>

    <div class="content-wrapper">

        <section class="content-header"><!-- Content Header (Page header) -->

            <h1><spring:message code="list.page.title"  text="Index"/></h1>

            <ul class="top-links">
                <sec:access url="/anyObject/create">
                    <li>
                        <a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/anyObject/create">
                            <i class="fa fa-plus-circle "></i> New
                        </a>
                    </li>
                </sec:access>
            </ul>
        </section><!-- /.content-header -->

        <section>
            <%--<jsp:include page="../layouts/_flashMessage.jsp"/>--%>
        </section><!--Flash Message-->

        <section class="content"><!-- Main content -->
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-bordered table-striped table-hover table-condensed dt-responsive display nowrap th-center">

                                <thead>
                                    <tr>
                <td></td>
                        <td><spring:message code="code" text="Code"/></td>
                    <td><spring:message code="title" text="Title"/></td>
                    <td><spring:message code="remarks" text="Remarks"/></td>
                    <td><spring:message code="startDate" text="Start Date"/></td>
                    <td><spring:message code="isActive" text="Is Active"/></td>
                    <td><spring:message code="slNo" text="Sl No"/></td>

            </tr>
            </thead>
            <tbody>
                <c:choose>
                        <c:when test="${anyObjects.size()!=0}">
            <c:forEach items="${anyObjects}" var="anyObject"  varStatus="loopStatus">

                <tr class="${loopStatus.index % 2 == 0 ? 'odd' : 'even'}">
                <td class="center">
                    <a class="btn btn-block btn-info btn-xs" href="${pageContext.request.contextPath}/anyObject/show/${anyObject.id}">
                        <i class="fa fa-envelope"></i> <spring:message code="show.link.label"/>
                    </a>
                </td>
                            <td><c:out value="${anyObject.code}"/></td>
                        <td><c:out value="${anyObject.title}"/></td>
                        <td><c:out value="${anyObject.remarks}"/></td>
                        <td><fmt:formatDate value="${anyObject.startDate}" type="date" pattern="dd/MM/yyyy"/></td>
                        <td><c:if test="${anyObject.isActive}"><spring:message code="default.boolean.true" text="YES"/></c:if><c:if test="${!anyObject.isActive}"><spring:message code="default.boolean.false" text="NO"/></c:if></td>
                        <td><c:out value="${anyObject.slNo}"/></td>

                <td class="center">
                    <div class="btn-group">
                        <a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/anyObject/edit/${anyObject.id}">
                        <i class="fa fa-edit"></i> <spring:message code="edit.link.label"/>
                        </a>
                        <a class="btn btn-block btn-warning btn-xs" href="${pageContext.request.contextPath}/anyObject/copy/${anyObject.id}">
                        <i class="fa fa-copy"></i> <spring:message code="copy.link.label"/>
                        </a>
                        <a class="btn btn-block btn-danger btn-xs" href="${pageContext.request.contextPath}/anyObject/delete/${anyObject.id}" onclick="return confirm('Are you sure to delete?');">
                        <i class="fa fa-remove"></i> <spring:message code="delete.link.label"/>
                        </a>
                    </div>
                </td>
                
                 </tr>
                   </c:forEach>
                   </c:when>
                   <c:otherwise>
                   <tr>
                       <td colspan="9" class="bold center">
                       <spring:message code="default.noRecordFound.label" text="No Record Found...!"/>
                       </td>
                   </tr>
                   </c:otherwise> 
                               </c:choose>
               </tbody>
               </table>
               <div class="pagination">
               <!--<g:paginate total="{testInstanceCount ?: 0}"/>-->
               </div>
           </div><!-- /.box-body table-responsive no-padding -->
           </div><!-- /.box box-primary -->
       </div><!-- /.col-xs-12 -->
       </div><!-- /.row -->
   </section><!-- /.content -->
</div><!-- /.content-wrapper -->

</tiles:putAttribute>  

<div class="box-footer">
<tiles:putAttribute name="footer">
   <jsp:include page="../layouts/footer.jsp"/>
</tiles:putAttribute>  
</div>
