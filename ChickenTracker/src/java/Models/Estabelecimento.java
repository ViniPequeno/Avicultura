package Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import Interfaces.Singleton;
import static javax.persistence.CascadeType.ALL;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "estabelecimento")
public class Estabelecimento implements Serializable, Singleton {

    @Id
    private String sufixoCNPJ;
    private String CNAE;
    private String endereco;

    @ManyToOne
    @JoinColumn(name = "perfil_id")
    private Perfil perfil;
    @ManyToOne
    @JoinColumn(name = "negocio_id")
    private Negocio negocio;

    @OneToMany(cascade = ALL, mappedBy = "produto")
    private List<Produto> produtos;

    @ManyToMany
    private List<Fornecimento> fornecimentos;
    @ManyToMany
    private List<Funcionario> funcionarios;
    @OneToMany(cascade = ALL, mappedBy = "LocalAves")
    private List<LocalAves> locais;
    @OneToMany(cascade = ALL, mappedBy = "Vacina")
    private List<Vacina> vacinas;

    private Estabelecimento() {
    }

    @Transient
    private Estabelecimento getInstance;

    @Override
    public Estabelecimento getInstance() {
        if (getInstance == null) {
            getInstance = new Estabelecimento();
        }
        return getInstance;
    }

    public String getSufixoCNPJ() {
        return sufixoCNPJ;
    }

    public void setSufixoCNPJ(String sufixoCNPJ) {
        this.sufixoCNPJ = sufixoCNPJ;
    }

    public String getCNAE() {
        return CNAE;
    }

    public void setCNAE(String CNAE) {
        this.CNAE = CNAE;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public Negocio getNegocio() {
        return negocio;
    }

    public void setNegocio(Negocio negocio) {
        this.negocio = negocio;
    }

    public List<Produto> getProdutos() {
        return produtos;
    }

    public void setProdutos(List<Produto> produtos) {
        this.produtos = produtos;
    }

    public List<Fornecimento> getFornecimentos() {
        return fornecimentos;
    }

    public void setFornecimentos(List<Fornecimento> fornecimentos) {
        this.fornecimentos = fornecimentos;
    }

    public List<Funcionario> getFuncionarios() {
        return funcionarios;
    }

    public void setFuncionarios(List<Funcionario> funcionarios) {
        this.funcionarios = funcionarios;
    }

    public List<LocalAves> getLocais() {
        return locais;
    }

    public void setLocais(List<LocalAves> locais) {
        this.locais = locais;
    }

    public List<Vacina> getVacinas() {
        return vacinas;
    }

    public void setVacinas(List<Vacina> vacinas) {
        this.vacinas = vacinas;
    }

}