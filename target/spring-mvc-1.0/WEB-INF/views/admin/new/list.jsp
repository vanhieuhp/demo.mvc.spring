<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewAPI" value="/api/new"/>
<c:url var="NewUrlList" value="/admin/new/list"/>
<c:url var="NewUrlEdit" value="admin/new/edit"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Edit News</title>
<%--    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>--%>

</head>

<body>
    <form action="<c:url value='/admin/new/list'/>" id="formSubmit" method="GET">
        <c:if test="${not empty message}">
            <div class="alert alert-${alert}" role="alert">
                    ${message}
            </div>
        </c:if>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th><input type="checkbox" id="checkbox"/></th>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Short Description</th>
                    <th>
                        <c:url var="addNewsUrlL" value="/admin/new/edit"></c:url>
                        <a data-toggle="tooltip" title="Add news" href="${addNewsUrlL}" class="btn btn-primary btn-user" >
                            <i class="fas fa-plus-circle"></i>
                        </a>
                    </th>
                    <th>
                        <button id="btnDelete" type="button" onclick="warningBeforeDelete()"
                        class="btn btn-google btn-user" data-toggle="tooltip" title="Delete News" >
                            <i class='fas fa-trash-alt' ></i>
                        </button>
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:set var = "count" value = "0"/>
                <c:forEach var="item" items="${model.getListResult()}">
                    <tr>
                        <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                        <c:set var = "count" value="${count+1}"/>
                        <td>${count}</td>
                        <td>${item.title}</td>
                        <td>${item.shortDescription}</td>
                        <td>
                            <c:url var="editNewsUrl" value="/admin/new/edit">
                                <c:param name="id"  value="${item.id}"/>
                            </c:url>
                            <a data-toggle="tooltip" title="Edit news" href = "${editNewsUrl}"
                               class="btn btn-primary btn-user">
                                <i class="fas fa-edit"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <ul class="pagination" id="pagination"></ul>
        <input  type="hidden" value="" name="page" id="page"/>
        <input  type="hidden" value="" name="limit" id="limit"/>
    </form>

    <script type="text/javascript">
        var currentPage = ${model.page};
        var totalPage = ${model.totalPage};
        $(function() {
            window.pagObj = $('#pagination').twbsPagination({
                totalPages: totalPage,
                visiblePages: 10,
                startPage: currentPage,
                onPageClick: function (event, page) {
                    if (page != currentPage) {
                        document.getElementById("page").setAttribute('value', page),
                            document.getElementById("limit").setAttribute('value', 5),
                        $("#formSubmit").submit();
                    }
                }
            });
        });

        function warningBeforeDelete() {
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    var ids = $('tbody input[type=checkbox]:checked').map(function () {
                        return $(this).val();
                    }).get();
                    deleteNews(ids);
                }
            })
        }

        function deleteNews(data) {
            $.ajax({
                url: '${NewAPI}',
                type: 'DELETE',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data),
                success: function (result) {
                    // Swal.fire(
                    //     'Deleted!',
                    //     'Your file has been deleted.',
                    //     'success'
                    // )
                    window.location.href = "${NewUrlList}?&message=delete_success&page=${model.page}&limit=5"
                },
                error: function (error) {
                    // Swal.fire(
                    //     'Error system!'
                    // )
                    window.location.href = "${NewUrlList}?message=error_system&page=${model.page}&limit=5"
                }
            });
        }
    </script>
</body>

</html>