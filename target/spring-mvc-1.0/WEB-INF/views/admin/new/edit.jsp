<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="NewAPI" value="/api/new"/>
<c:url var="NewEditURl" value="/admin/new/list"/>
<c:url var="NewListURl" value="/admin/new/list"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit News</title>
    <script type="text/javascript"  src="<c:url value='https://cdn.ckeditor.com/4.7.0/standard/ckeditor.js'/>"></script>
</head>
<body>
<form:form id="formSubmit" modelAttribute="model">
    <div class="row">
        <c:if test="${not empty message}">
            <div class="alert alert-${alert}" role="alert">
                    ${message}
            </div>
        </c:if>
    </div>
    <div class="row">
        <div class="col-lg-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Thumbnail</h6>
                </div>
                <div class="card-body">
                    <form:input path="thumbnail" id = "thumbnail" cssClass="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Title</h6>
                </div>
                <div class="card-body">
                    <form:input path="title" id = "title" cssClass="form-control"/>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Kind of category</h6>
                </div>
                <div class="card-body">
                    <form:select path="categoryCode" id = "categoryCode" cssClass="form-control">
                        <form:option value="" label="Select category"/>
                        <form:options items = "${categories}"/>
                    </form:select>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Short Description</h6>
                </div>
                <div class="card-body">
                    <div class="form-group purple-border">
                        <form:textarea path="shortDescription" id = "shortDescription" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class=col-lg-12>
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Content</h6>
                </div>
                <div class="card-body">
                    <div class="form-group purple-border">
                        <form:textarea path="content" id = "content" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form:hidden path="id" id = "id"/>
    <div class="row">
        <c:if test="${not empty model.id}">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <input class="btn btn-primary btn-user" type="button" value="Update News" id="btnAddOrUpdateNews"/>
            </div>
        </c:if>
        <c:if test="${empty model.id}">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <input class="btn btn-primary btn-user" type="button" value="Add news" id="btnAddOrUpdateNews"/>
            </div>
        </c:if>
    </div>
</form:form>
<script type="text/javascript">
    var editor = CKEDITOR.replace('content');

    $("#btnAddOrUpdateNews").click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $("#formSubmit").serializeArray();

        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        })
        data['content'] = editor.getData();
        var id = $("#id").val();
        if (id == "") {
            addNews(data);
        } else {
            updateNews(data);
        }
    });


    function addNews(data) {
        $.ajax({
            url: '${NewAPI}',
            type: 'POST',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${NewListURl}?page=${model.page}&limit=5&message=insert_success"
            },
            error: function (error) {
                window.location.href = "${NewEditURl}?message=error_system"
            }
        });
    }

    function updateNews(data) {
        $.ajax({
            url: '${NewAPI}',
            type: 'PUT',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${NewListURl}?page=${model.page}&limit=5&message=update_success"
            },
            error: function (error) {
                window.location.href = "${NewEditURl}?message=error_system"
            }
        });
    }
</script>
</body>
</html>