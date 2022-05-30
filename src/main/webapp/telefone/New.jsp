<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Telefone</title>
            <link rel="stylesheet" type="text/css" href="/ListaClientes/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Telefone</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{telefone.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="NrTelefone:"/>
                    <h:inputText id="nrTelefone" value="#{telefone.telefone.nrTelefone}" title="NrTelefone" required="true" requiredMessage="The nrTelefone field is required." />
                    <h:outputText value="ClienteId:"/>
                    <h:selectOneMenu id="clienteId" value="#{telefone.telefone.clienteId}" title="ClienteId" required="true" requiredMessage="The clienteId field is required." >
                        <f:selectItems value="#{cliente.clienteItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{telefone.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{telefone.listSetup}" value="Show All Telefone Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
