<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Telefone Items</title>
            <link rel="stylesheet" type="text/css" href="/ListaClientes/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Telefone Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Telefone Items Found)<br />" rendered="#{telefone.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{telefone.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{telefone.pagingInfo.firstItem + 1}..#{telefone.pagingInfo.lastItem} of #{telefone.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{telefone.prev}" value="Previous #{telefone.pagingInfo.batchSize}" rendered="#{telefone.pagingInfo.firstItem >= telefone.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{telefone.next}" value="Next #{telefone.pagingInfo.batchSize}" rendered="#{telefone.pagingInfo.lastItem + telefone.pagingInfo.batchSize <= telefone.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{telefone.next}" value="Remaining #{telefone.pagingInfo.itemCount - telefone.pagingInfo.lastItem}"
                                   rendered="#{telefone.pagingInfo.lastItem < telefone.pagingInfo.itemCount && telefone.pagingInfo.lastItem + telefone.pagingInfo.batchSize > telefone.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{telefone.telefoneItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Id"/>
                            </f:facet>
                            <h:outputText value="#{item.id}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="NrTelefone"/>
                            </f:facet>
                            <h:outputText value="#{item.nrTelefone}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="ClienteId"/>
                            </f:facet>
                            <h:outputText value="#{item.clienteId}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{telefone.detailSetup}">
                                <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][telefone.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{telefone.editSetup}">
                                <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][telefone.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{telefone.remove}">
                                <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][telefone.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{telefone.createSetup}" value="New Telefone"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
