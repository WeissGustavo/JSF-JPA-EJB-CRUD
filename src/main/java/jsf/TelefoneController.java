/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jsf;

import com.jpa.session.TelefoneFacade;
import com.listaclientes.entities.Telefone;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.transaction.UserTransaction;
import jsf.util.JsfUtil;
import jsf.util.PagingInfo;

/**
 *
 * @author Gustavo Weiss
 */
public class TelefoneController {

    public TelefoneController() {
        pagingInfo = new PagingInfo();
        converter = new TelefoneConverter();
    }
    private Telefone telefone = null;
    private List<Telefone> telefoneItems = null;
    private TelefoneFacade jpaController = null;
    private TelefoneConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "my_persistence_unit")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public TelefoneFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (TelefoneFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "telefoneJpa");
        }
        return jpaController;
    }

    public SelectItem[] getTelefoneItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getTelefoneItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Telefone getTelefone() {
        if (telefone == null) {
            telefone = (Telefone) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTelefone", converter, null);
        }
        if (telefone == null) {
            telefone = new Telefone();
        }
        return telefone;
    }

    public String listSetup() {
        reset(true);
        return "telefone_list";
    }

    public String createSetup() {
        reset(false);
        telefone = new Telefone();
        return "telefone_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(telefone);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Telefone was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("telefone_detail");
    }

    public String editSetup() {
        return scalarSetup("telefone_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        telefone = (Telefone) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentTelefone", converter, null);
        if (telefone == null) {
            String requestTelefoneString = JsfUtil.getRequestParameter("jsfcrud.currentTelefone");
            JsfUtil.addErrorMessage("The telefone with id " + requestTelefoneString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String telefoneString = converter.getAsString(FacesContext.getCurrentInstance(), null, telefone);
        String currentTelefoneString = JsfUtil.getRequestParameter("jsfcrud.currentTelefone");
        if (telefoneString == null || telefoneString.length() == 0 || !telefoneString.equals(currentTelefoneString)) {
            String outcome = editSetup();
            if ("telefone_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit telefone. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(telefone);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Telefone was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentTelefone");
        Integer id = new Integer(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Telefone was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Telefone> getTelefoneItems() {
        if (telefoneItems == null) {
            getPagingInfo();
            telefoneItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return telefoneItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "telefone_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "telefone_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        telefone = null;
        telefoneItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Telefone newTelefone = new Telefone();
        String newTelefoneString = converter.getAsString(FacesContext.getCurrentInstance(), null, newTelefone);
        String telefoneString = converter.getAsString(FacesContext.getCurrentInstance(), null, telefone);
        if (!newTelefoneString.equals(telefoneString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
