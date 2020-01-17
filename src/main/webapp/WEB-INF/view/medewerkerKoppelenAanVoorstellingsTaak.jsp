<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

            <h2>Taak: ${taak}</h2>
            <h2>Voorstelling: ${voorstelling}</h2>

            <form:form action="${contextPath}/planner/voorstellingsTaak/medewerkerKoppelen/${voorstellingId}/${voorstellingsTaakId}/${medewerker.medewerkerId}" modelAttribute="voorstellingsTaak" method="post">
                <form:hidden path="voorstellingsTaakId"/>
                <table>
                    <c:forEach items="${beschikbareMedewerkers}" var="medewerkerInschrijvingVoorstelling">
                        <tr>
                            <td><c:out value="${medewerkerInschrijvingVoorstelling.medewerker.gebruikersnaam}"/></td>
                            <td></td>
                            <td>
                                <a class="btn btn-primary" href="${contextPath}/planner/voorstellingsTaak/medewerkerKoppelen/${voorstellingId}/${voorstellingsTaakId}/${medewerkerInschrijvingVoorstelling.medewerker.medewerkerId}">Selecteer</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form:form>

