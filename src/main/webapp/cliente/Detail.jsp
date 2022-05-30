<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Cliente Detail</title>
            <link rel="stylesheet" type="text/css" href="/ListaClientes/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Cliente Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{cliente.cliente.id}" title="Id" />
                    <h:outputText value="NmCliente:"/>
                    <h:outputText value="#{cliente.cliente.nmCliente}" title="NmCliente" />
                    <h:outputText value="NmEmail:"/>
                    <h:outputText value="#{cliente.cliente.nmEmail}" title="NmEmail" />
                    <h:outputText value="NrCep:"/>
                    <h:outputText value="#{cliente.cliente.nrCep}" title="NrCep" />
                    <h:outputText value="NmEndereco:"/>
                    <h:outputText value="#{cliente.cliente.nmEndereco}" title="NmEndereco" />
                    <h:outputText value="NmBairro:"/>
                    <h:outputText value="#{cliente.cliente.nmBairro}" title="NmBairro" />
                    <h:outputText value="NmComplemento:"/>
                    <h:outputText value="#{cliente.cliente.nmComplemento}" title="NmComplemento" />
                    <h:outputText value="NmCidade:"/>
                    <h:outputText value="#{cliente.cliente.nmCidade}" title="NmCidade" />

                    <h:outputText value="TelefoneCollection:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty cliente.cliente.telefoneCollection}" value="(No Items)"/>
                        <h:dataTable value="#{cliente.cliente.telefoneCollection}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty cliente.cliente.telefoneCollection}">
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
                                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][telefone.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="cliente" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.ClienteController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{telefone.editSetup}">
                                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][telefone.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="cliente" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.ClienteController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{telefone.destroy}">
                                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][telefone.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="cliente" />
                                    <f:param name="jsfcrud.relatedControllerType" value="jsf.ClienteController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{cliente.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{cliente.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cliente.cliente][cliente.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{cliente.createSetup}" value="New Cliente" />
                <br />
                <h:commandLink action="#{cliente.listSetup}" value="Show All Cliente Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
