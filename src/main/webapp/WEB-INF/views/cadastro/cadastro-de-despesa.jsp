<%@page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spring" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Cadastro de Despesa</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/css/style.css"/>
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top"></nav>


<spring:form class="form-horizontal" method="post" action="/cadastrodespesa" modelAttribute="despesa">
    <c:if test="${!empty mensagem}">
        <div class="alert alert-success">
            <span>${mensagem}</span>
        </div>
    </c:if>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h1 class="panel-title">Nova Despesa</h1>
        </div>
    </div>
    <div class="form-group">
        <label for="descricao" class="col-sm-2 control-label">Descrição</label>
        <div class="col-sm-4">
           <spring:input type="text" class="form-control" id="descricao" name="descricao" placeholder="digite uma descrição...." path="descricao"/>
           <spring:errors path="descricao" cssClass="error"/>
        </div>
    </div>
    <div class="form-group">
        <label for="categoria" class="col-sm-2 control-label">Categoria</label>
        <div class="col-sm-2">
            <spring:select class="form-control" name="categoria" path="categoria">
                <option hidden>Selecione...</option>
                <%-- opção não selecionavel--%>
                <c:forEach items="${todasCategoria}" var="categoria">
                    <c:set var = "qualquerNome" value = "${f:toUpperCase(categoria.name)}" />
                    <option value="${categoria.codigo}">${qualquerNome}</option>
                </c:forEach>
            </spring:select>
             <spring:errors path="categoria" cssClass="error"/>
        </div>
    </div>

    <div class="form-group">
        <label for="data" class="col-sm-2 control-label">Data</label>
        <div class="col-sm-2">
            <spring:input type="text" class="form-control" id="data" name="data" path="data"/>
            <spring:errors path="data" cssClass="error"/>
        </div>
    </div>

    <div class="form-group">
        <label for="valor" class="col-sm-2 control-label">Valor</label>
        <div class="col-sm-2">
            <spring:input type="text" class="form-control" id="valor" name="valor" path="valor"/>
            <spring:errors path="valor" cssClass="error"/>
        </div>
    </div>

    <div class="form-group">
        <label for="observacoes" class="col-sm-2 control-label">Observações</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="observacoes" name="observacoes">
        </div>
    </div>
    <div></div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <input type="submit" class="btn btn-danger">
        </div>
    </div>
    <script src="/js/bootstrap.js"></script>

</spring:form>
</body>
</html>
