<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<tiles:insertDefinition name="main" >

    <tiles:putAttribute name="body">

        <div class="content-wrapper"><!-- Content Wrapper. Contains page content -->
            <section class="content-header"><!-- Content Header (Page header) -->
                <h1><spring:message code="default.button.list.label" text="List"/> Lookup</h1>
                <ul class="top-links">
                    <sec:access url="/zxLookup/create">
                        <li>
                            <a href="${pageContext.request.contextPath}/zxLookup/create" class="btn btn-block btn-primary btn-xs"><i class="fa fa-plus-circle"></i> <spring:message code="default.button.create.label" text="New"/></a>
                        </li>
                    </sec:access>
                </ul>
            </section><!-- /.content-header -->

            <section class="content-messages">
                <%--<jsp:include page="../layouts/_flashMessage.jsp"/>--%>
            </section><!-- /.flesh-message -->

            <section class="content"><!-- Main content -->
                <div class="box box-primary">   
                    <div class="box-body" style="overflow-x: auto">
                        <table class="dt-default table table-bordered table-striped table-hover table-condensed">

                            <!--<table class="table table-bordered table-striped table-hover table-condensed dt-responsive display nowrap th-center">-->
                            <thead>
                            <th><spring:message code="code" text="Code"/></th>
                            <th><spring:message code="isActive" text="Is Active"/></th>
                            <th><spring:message code="slNo" text="Sl No"/></th>
                            <th><spring:message code="title" text="Title"/></th>
                            <th><spring:message code="titleBng" text="Title Bng"/></th>
                            <th><spring:message code="remarks" text="Remarks"/></th>
                            <th><spring:message code="zxLookupKeyword" text="Zx Lookup Keyword"/></th>
                            <th><spring:message code="default.button.action.label" text="Action"/></th>                            
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${zxLookups.size()!=0}">
                                        <c:forEach items="${zxLookups}" var="zxLookup"  varStatus="loopStatus">
                                            <tr class="${loopStatus.index % 2 == 0 ? 'odd' : 'even'}">
                                                <td><c:out value="${zxLookup.code}"/></td>
                                                <td><c:if test="${zxLookup.isActive}"><spring:message code="default.boolean.true" text="YES"/></c:if><c:if test="${!zxLookup.isActive}"><spring:message code="default.boolean.false" text="NO"/></c:if></td>
                                                <td><c:out value="${zxLookup.slNo}"/></td>
                                                <td><c:out value="${zxLookup.title}"/></td>
                                                <td><c:out value="${zxLookup.titleBng}"/></td>
                                                <td><c:out value="${zxLookup.remarks}"/></td>
                                                <td><c:out value="${zxLookup.zxLookupKeyword}"/></td>
                                                <td class="center action">
                                                    <ul class="top-links">
                                                        <sec:access url="/zxLookup/show">
                                                            <li>
                                                                <a class="btn btn-block btn-info btn-xs" href="${pageContext.request.contextPath}/zxLookup/show/${zxLookup.id}">
                                                                    <i class="fa fa-info-circle"></i> <spring:message code="show.link.label"/>
                                                                </a>
                                                            </li>
                                                        </sec:access>
                                                        <sec:access url="/zxLookup/edit">
                                                            <li>
                                                                <a class="btn btn-block btn-primary btn-xs" href="${pageContext.request.contextPath}/zxLookup/edit/${zxLookup.id}">
                                                                    <i class="fa fa-edit"></i> <spring:message code="edit.link.label"/>
                                                                </a>
                                                            </li>
                                                        </sec:access>
                                                        <sec:access url="/zxLookup/copy">
                                                            <li>
                                                                <a class="btn btn-block btn-warning btn-xs" href="${pageContext.request.contextPath}/zxLookup/copy/${zxLookup.id}">
                                                                    <i class="fa fa-clone" aria-hidden="true"></i> <spring:message code="copy.link.label"/>
                                                                </a>
                                                            </li>
                                                        </sec:access>
                                                        <sec:access url="/zxLookup/delete">
                                                            <li>
                                                                <a class="btn btn-block btn-danger btn-xs" href="${pageContext.request.contextPath}/zxLookup/delete/${zxLookup.id}" onclick="return confirm('Are you sure to delete?');">
                                                                    <i class="fa fa-remove"></i> <spring:message code="delete.link.label"/>
                                                                </a>
                                                            </li>
                                                        </sec:access>
                                                    </ul>
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
            </section><!-- /.content -->
        </div><!-- /.content-wrapper -->
    </tiles:putAttribute>

</tiles:insertDefinition>