package br.com.avicultura.chicken_tracker.Models;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import static javax.persistence.CascadeType.ALL;

/**
 *
 * @author Pedro
 */
@Entity
@Table(name = "estabelecimento")
public class Estabelecimento implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "sufixoCNPJ")
    private String sufixoCNPJ;

    @ManyToOne
    @JoinColumn(name = "negocio_id")
    private Negocio negocio;

    private String CNAE;

    private String CEP;
    private String rua;
    private String bairro;
    private String cidade;
    private String estado;

    private double saldo;

    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Produto> produtos;

    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Pagamento> pagamentos;

    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Fornecimento> fornecimentos;

    @OneToMany(fetch = FetchType.EAGER, cascade = ALL, mappedBy = "estabelecimento")
    private List<EstabelecimentoFuncionario> funcionarios;

    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<LocalAves> locais;
    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Vacina> vacinas;

    @OneToMany(cascade = ALL, mappedBy = "estabelecimento")
    private List<Producao> producoes;

    private Estabelecimento() {
    }

    @Transient
    private static Estabelecimento getInstance;

    public static Estabelecimento getInstance() {
        if (getInstance == null) {
            getInstance = new Estabelecimento();
        }
        return getInstance;
    }

    public String getCNAE() {
        return CNAE;
    }

    public void setCNAE(String CNAE) {
        this.CNAE = CNAE;
    }

    public String getCEP() {
        return CEP;
    }

    public void setCEP(String CEP) {
        this.CEP = CEP;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
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

    public List<EstabelecimentoFuncionario> getFuncionarios() {
        return funcionarios;
    }

    public void setFuncionarios(List<EstabelecimentoFuncionario> funcionarios) {
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

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public List<Pagamento> getPagamentos() {
        return pagamentos;
    }

    public void setPagamentos(List<Pagamento> pagamentos) {
        this.pagamentos = pagamentos;
    }

    public List<Producao> getProducoes() {
        return producoes;
    }

    public void setProducoes(List<Producao> producoes) {
        this.producoes = producoes;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSufixoCNPJ() {
        return sufixoCNPJ;
    }

    public void setSufixoCNPJ(String sufixoCNPJ) {
        this.sufixoCNPJ = sufixoCNPJ;
    }

    public Negocio getNegocio() {
        return negocio;
    }

    public void setNegocio(Negocio negocio) {
        this.negocio = negocio;
    }
}
