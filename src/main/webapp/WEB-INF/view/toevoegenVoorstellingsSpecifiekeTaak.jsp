<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<form:form action="${contextPath}/planner/voorstellingen/voorstelling/voorstellingsspecifieketaaktoevoegen/${voorstelling.voorstellingId}" modelAttribute="voorstellingsSpecifiekeTaak" method="post">
    <form:hidden path="voorstelling"></form:hidden>
    <table>
        <div>
            <tr>
                <td>Naam Taak:</td>
                <td>
                    <form:input class="form-control mb-2 mr-sm-2" path="taakNaam" required="required" />
                </td>
            </tr>
        </div>
        <tr>
            <td colspan="1">
                <input type="submit" class="btn btn-primary" value="Opslaan"/>
            </td>
        </tr>
    </table>
</form:form>