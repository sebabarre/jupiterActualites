<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="css" resources="jupiterNews.css" />
<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

<div class="articleNewsVertical">
  <c:if test="${not empty currentNode.properties['Image_d_illustration']}">
    <c:set var="pic" value="${currentNode.properties['Image_d_illustration'].node.url}" />
  </c:if>
  <c:if test="${empty currentNode.properties['Image_d_illustration']}">
    <c:set var="pic" value="/modules/jupiteractualites/images/logoimagetype.png" />
  </c:if>
  <c:url value="${pic}" var="imgUrl"></c:url>
  <img src="${imgUrl}" class="img-responsive"/>
  <p class="jupiterNewsDate">
    <fmt:formatDate pattern="dd/MM/yyyy"
                    value="${currentNode.properties['Date_de_l_article'].time}"/></p>
  <h3 class="titleJupiterNews">${currentNode.properties['Titre_de_l_article'].string}</h3>
  <p>${currentNode.properties['Introduction_de_l_article'].string}</p>
  <c:url value="${currentNode.url}" var="readMoreUrl"/>
  <p class="text-center"><a href="${readMoreUrl}" class="readMoreLink">LIRE PLUS</a></p>
</div>
