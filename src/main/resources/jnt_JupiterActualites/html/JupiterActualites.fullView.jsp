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

<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
<template:addResources type="javascript" resources="zbox.min.js" />

<div class="bodywrapper detailActu">
  <div class="container">
    <div class="row articleNews">
      <div class="col-md-7">
        <h3 class="titleJupiterNews">${currentNode.properties['Titre_de_l_article'].string}</h3>
        <p class="jupiterNewsDate">
          Publié le <fmt:formatDate pattern="dd/MM/yyyy" value="${currentNode.properties['Date_de_l_article'].time}"/>
        </p> 
        ${currentNode.properties['Article'].string}
        <c:if test="${not empty currentNode.properties['Document_telechargeable']}">
          <hr/>
          <p class="Jupiterblue">
            <c:set var="doc" value="${currentNode.properties['Document_telechargeable']}"/>
            <c:url value="${doc.node.url}" var="docUrl"/>
            Téléchargez le document: <a href="${docUrl}" class="Jupiterblue"> Document.pdf</a>
          </p>
          <hr/>
        </c:if>
		${currentNode.properties['Article_Seconde_Partie'].string}  
        <p class="Jupiterblue">
          Partagez sur les réseaux sociaux
        </p>
        <a href="javascript:void();" onclick="linkedinLink();">
          <div class="shareJupiter shareLinkedin">
          </div>
        </a>
        <a  href="javascript:void();" onclick="facebookShare();">
          <div class="shareJupiter shareFacebook">
          </div>
        </a>
        <a  href="javascript:void();" onclick="twitterShare();">
          <div class="shareJupiter shareTwitter">
          </div>
        </a>
        <a href="javascript:void();" onclick="viadeoShare();">
        <div class="shareJupiter shareViadeo">
          
        </div>
        </a>
      </div>
      
      <div class="col-md-5 articleNewsColImg">
        <div class="row">
          <c:if test="${not empty currentNode.properties['Image_d_illustration']}">
              <c:set var="mainPic" value="${currentNode.properties['Image_d_illustration'].node.url}" />
          </c:if>
          
          <c:if test="${empty currentNode.properties['Image_d_illustration']}">
            <c:set var="mainPic" value="/modules/jupiteractualites/images/logoimagetype.png" />
          </c:if>
          <c:url value="${mainPic}" var="imgUrl"></c:url>
          <div>
            <img src="${imgUrl}" class="modalZBox"/>
          </div>
        </div>
        <div class="row">
          <c:if test="${not empty currentNode.properties['Image_d_illustration2']}">
            <c:set var="Image_d_illustration2" value="${currentNode.properties['Image_d_illustration2'].node.url}" />
            <c:url value="${Image_d_illustration2}" var="imgUrl"></c:url>
            <img src="${Image_d_illustration2}" class="imgActu modalZBox"/>
          </c:if>
          <c:if test="${not empty currentNode.properties['Image_d_illustration3']}">
            <c:set var="Image_d_illustration3" value="${currentNode.properties['Image_d_illustration3'].node.url}" />
            <c:url value="${Image_d_illustration3}" var="imgUrl"></c:url>
            <img src="${Image_d_illustration3}" class="imgActu modalZBox"/>
          </c:if>
          <c:if test="${not empty currentNode.properties['Image_d_illustration4']}">
            <c:set var="Image_d_illustration4" value="${currentNode.properties['Image_d_illustration4'].node.url}" />
            <c:url value="${Image_d_illustration4}" var="imgUrl"></c:url>
            <img src="${Image_d_illustration4}" class="imgActu modalZBox"/>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  
  // Script Twitter maison
  function twitterShare() {
  	var sTop = window.screen.height/2-(218); 
	var sLeft = window.screen.width/2-(313);
	window.open(
      'http://www.twitter.com/share?url='+window.location.href+'&text=' + encodeURIComponent("${currentNode.properties['Texte_Pour_Partage'].string}"),
	'sharer','toolbar=0,status=0,width=626,height=456,top='+sTop+',left='+sLeft);
	return false;
    
  }
  
  // Script Linkedin maison
  function linkedinLink() {
  	var sTop = window.screen.height/2-(218); 
	var sLeft = window.screen.width/2-(313);
	window.open(
      'https://www.linkedin.com/shareArticle?url='+window.location.href+'&summary=' + encodeURIComponent("${currentNode.properties['Texte_Pour_Partage'].string}"),
	'sharer','toolbar=0,status=0,width=626,height=456,top='+sTop+',left='+sLeft);
	return false;
  }
  
  // Script Viadeo maison
  function viadeoShare() {
    var sTop = window.screen.height/2-(218); 
	var sLeft = window.screen.width/2-(313);
	window.open(
      'http://www.viadeo.com/shareit/share/?url='+window.location.href+'&title=' + encodeURIComponent("${currentNode.properties['Texte_Pour_Partage'].string}"),
	'sharer','toolbar=0,status=0,width=626,height=456,top='+sTop+',left='+sLeft);
	return false;
  }
  
  // Script Facebook maison
  function facebookShare() {
   	 var sTop = window.screen.height/2-(218); 
	var sLeft = window.screen.width/2-(313);
	window.open(
      'http://www.facebook.com/sharer.php?u='+window.location.href+'&t=' + encodeURIComponent("${currentNode.properties['Texte_Pour_Partage'].string}"),
	'sharer','toolbar=0,status=0,width=626,height=456,top='+sTop+',left='+sLeft);
	return false;
  }
  // Script pour l'overlay des images
 	var a;

	document.addEventListener("DOMContentLoaded", function(event) {

      a = new Zbox({
    
      /* Init zbox when constructor is called. */
      autoInit    : true, 
      
      /* overlay click close the modal. */
      overlayClick  : true, 
      
      /* Time in ms for fade effect. */
      fadeTime    : 120, 
      
      loading     : "Chargement de l'image",
      
      /* Elements to apply zbox. */
      querySelector   : ".modalZBox", 
  
    });
  
});
  
  // Script Twitter
  window.twttr = (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0],
      t = window.twttr || {};
    if (d.getElementById(id)) return t;
    js = d.createElement(s);
    js.id = id;
    js.src = "https://platform.twitter.com/widgets.js";
    fjs.parentNode.insertBefore(js, fjs);
   
    t._e = [];
    t.ready = function(f) {
      t._e.push(f);
    };
   
    return t;
  }(document, "script", "twitter-wjs"));
  
</script>
