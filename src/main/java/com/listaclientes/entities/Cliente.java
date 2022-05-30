/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.listaclientes.entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Gustavo Weiss
 */
@Entity(name = "cliente")
@NamedQueries({
    @NamedQuery(name = "Cliente.findAll", query = "SELECT c FROM cliente c"),
    @NamedQuery(name = "Cliente.findById", query = "SELECT c FROM cliente c WHERE c.id = :id"),
    @NamedQuery(name = "Cliente.findByNmCliente", query = "SELECT c FROM cliente c WHERE c.nmCliente = :nmCliente"),
    @NamedQuery(name = "Cliente.findByNmEmail", query = "SELECT c FROM cliente c WHERE c.nmEmail = :nmEmail"),
    @NamedQuery(name = "Cliente.findByNrCep", query = "SELECT c FROM cliente c WHERE c.nrCep = :nrCep"),
    @NamedQuery(name = "Cliente.findByNmEndereco", query = "SELECT c FROM cliente c WHERE c.nmEndereco = :nmEndereco"),
    @NamedQuery(name = "Cliente.findByNmBairro", query = "SELECT c FROM cliente c WHERE c.nmBairro = :nmBairro"),
    @NamedQuery(name = "Cliente.findByNmComplemento", query = "SELECT c FROM cliente c WHERE c.nmComplemento = :nmComplemento"),
    @NamedQuery(name = "Cliente.findByNmCidade", query = "SELECT c FROM cliente c WHERE c.nmCidade = :nmCidade")})
public class Cliente implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nm_cliente")
    private String nmCliente;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nm_email")
    private String nmEmail;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nr_cep")
    private String nrCep;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nm_endereco")
    private String nmEndereco;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nm_bairro")
    private String nmBairro;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nm_complemento")
    private String nmComplemento;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "nm_cidade")
    private String nmCidade;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "clienteId", fetch = FetchType.LAZY)
    private Collection<Telefone> telefoneCollection;

    public Cliente() {
    }

    public Cliente(Integer id) {
        this.id = id;
    }

    public Cliente(Integer id, String nmCliente, String nmEmail, String nrCep, String nmEndereco, String nmBairro, String nmComplemento, String nmCidade) {
        this.id = id;
        this.nmCliente = nmCliente;
        this.nmEmail = nmEmail;
        this.nrCep = nrCep;
        this.nmEndereco = nmEndereco;
        this.nmBairro = nmBairro;
        this.nmComplemento = nmComplemento;
        this.nmCidade = nmCidade;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNmCliente() {
        return nmCliente;
    }

    public void setNmCliente(String nmCliente) {
        this.nmCliente = nmCliente;
    }

    public String getNmEmail() {
        return nmEmail;
    }

    public void setNmEmail(String nmEmail) {
        this.nmEmail = nmEmail;
    }

    public String getNrCep() {
        return nrCep;
    }

    public void setNrCep(String nrCep) {
        this.nrCep = nrCep;
    }

    public String getNmEndereco() {
        return nmEndereco;
    }

    public void setNmEndereco(String nmEndereco) {
        this.nmEndereco = nmEndereco;
    }

    public String getNmBairro() {
        return nmBairro;
    }

    public void setNmBairro(String nmBairro) {
        this.nmBairro = nmBairro;
    }

    public String getNmComplemento() {
        return nmComplemento;
    }

    public void setNmComplemento(String nmComplemento) {
        this.nmComplemento = nmComplemento;
    }

    public String getNmCidade() {
        return nmCidade;
    }

    public void setNmCidade(String nmCidade) {
        this.nmCidade = nmCidade;
    }

    public Collection<Telefone> getTelefoneCollection() {
        return telefoneCollection;
    }

    public void setTelefoneCollection(Collection<Telefone> telefoneCollection) {
        this.telefoneCollection = telefoneCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Cliente)) {
            return false;
        }
        Cliente other = (Cliente) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.listaclientes.entities.Cliente[ id=" + id + " ]";
    }
    
}
