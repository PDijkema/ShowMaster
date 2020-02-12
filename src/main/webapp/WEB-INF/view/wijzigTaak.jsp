<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

        <form:form action="${contextPath}/planner/taak/wijzigen" modelAttribute="taak" method="post">
            <form:hidden path="taakId"></form:hidden>
            <table>
                <div>
                    <tr>
                        <td>Taaknaam:</td>
                        <td>
                            <form:input type="text" id="taakNaam" class="form-control mb-2 mr-sm-2" path="naam" required="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>Standaardbezetting: </td>
                        <td>
                            <form:input id="bezetting" class="form-control mb-2 mr-sm-2" path="standaardBezetting" required="required" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" class="btn btn-danger" data-dismiss="modal" data-toggle="modal" data-target="#waarschuwingsModal"
                            data-target="#waarschuwingsModal"
                            <c:if test=
                            onclick="vullenModal(
                            'Taak wijzigen',
                            '<strong>Let op!</strong> Deze wijziging wordt doorgevoerd bij alle nog niet gepubliceerde voorstellingen! Weet je zeker dat je dit wilt?',
                            'Wijzigingen opslaan',
                            '/planner/taak/wijzigen/<c:out value= '${taak.taakId}'/>','btn btn-danger')">
                            Wijzigingen opslaan
                            </button>
                        </td>
                    </tr>
                </div>
            </table>
            <jsp:include page="waarschuwingsPopups.jsp" />
            <script type="text/javascript" src="${contextPath}\resources\js\modal.functies.js"></script>
        </form:form>
