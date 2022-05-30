<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Cliente</title>
            <link rel="stylesheet" type="text/css" href="/ListaClientes/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Cliente</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{cliente.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="NmCliente:"/>
                    <h:inputText id="nmCliente" value="#{cliente.cliente.nmCliente}" title="NmCliente" required="true" requiredMessage="The nmCliente field is required." />
                    <h:outputText value="NmEmail:"/>
                    <h:inputText id="nmEmail" value="#{cliente.cliente.nmEmail}" title="NmEmail" required="true" requiredMessage="The nmEmail field is required." />
                    <h:outputText value="NrCep:"/>
                    <h:inputText id="nrCep" value="#{cliente.cliente.nrCep}" title="NrCep" required="true" requiredMessage="The nrCep field is required." />
                    <h:outputText value="NmEndereco:"/>
                    <h:inputText id="nmEndereco" value="#{cliente.cliente.nmEndereco}" title="NmEndereco" required="true" requiredMessage="The nmEndereco field is required." />
                    <h:outputText value="NmBairro:"/>
                    <h:inputText id="nmBairro" value="#{cliente.cliente.nmBairro}" title="NmBairro" required="true" requiredMessage="The nmBairro field is required." />
                    <h:outputText value="NmComplemento:"/>
                    <h:inputText id="nmComplemento" value="#{cliente.cliente.nmComplemento}" title="NmComplemento" required="true" requiredMessage="The nmComplemento field is required." />
                    <h:outputText value="NmCidade:"/>
                    <h:inputText id="nmCidade" value="#{cliente.cliente.nmCidade}" title="NmCidade" required="true" requiredMessage="The nmCidade field is required." />
                    <h:outputText value="TelefoneCollection:"/>
                    <h:selectManyListbox id="telefoneCollection" value="#{cliente.cliente.jsfcrud_transform[jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['jsf.util.JsfUtil'].jsfcrud_method.arrayToList].telefoneCollection}" title="TelefoneCollection" size="6" converter="#{telefone.converter}" >
                        <f:selectItems value="#{telefone.telefoneItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{cliente.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{cliente.listSetup}" value="Show All Cliente Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
