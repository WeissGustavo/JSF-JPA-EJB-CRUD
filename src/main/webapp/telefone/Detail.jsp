<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Telefone Detail</title>
            <link rel="stylesheet" type="text/css" href="/ListaClientes/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Telefone Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{telefone.telefone.id}" title="Id" />
                    <h:outputText value="NrTelefone:"/>
                    <h:outputText value="#{telefone.telefone.nrTelefone}" title="NrTelefone" />
                    <h:outputText value="ClienteId:"/>
                    <h:panelGroup>
                        <h:outputText value="#{telefone.telefone.clienteId}"/>
                        <h:panelGroup rendered="#{telefone.telefone.clienteId != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{cliente.detailSetup}">
                                <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][telefone.telefone][telefone.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][telefone.telefone.clienteId][cliente.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="telefone"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.TelefoneController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{cliente.editSetup}">
                                <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][telefone.telefone][telefone.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][telefone.telefone.clienteId][cliente.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="telefone"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.TelefoneController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{cliente.destroy}">
                                <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][telefone.telefone][telefone.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCliente" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][telefone.telefone.clienteId][cliente.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="telefone"/>
                                <f:param name="jsfcrud.relatedControllerType" value="jsf.TelefoneController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{telefone.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][telefone.telefone][telefone.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{telefone.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentTelefone" value="#{jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][telefone.telefone][telefone.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{telefone.createSetup}" value="New Telefone" />
                <br />
                <h:commandLink action="#{telefone.listSetup}" value="Show All Telefone Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
