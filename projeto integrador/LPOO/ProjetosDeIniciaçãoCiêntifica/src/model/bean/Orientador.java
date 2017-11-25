/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

/**
 *
 * @author adilson
 */
public class Orientador {
    
    private long cpf;
    private String titulaçao;
    private String nome;
    private String email;
    private int telefone;
    private String campus;

    public Orientador() {
    }

    public Orientador(long cpf, String titulaçao, String nome, String email, int telefone, String campus) {
        this.cpf = cpf;
        this.titulaçao = titulaçao;
        this.nome = nome;
        this.email = email;
        this.telefone = telefone;
        this.campus = campus;
    }
    
    

    public long getCpf() {
        return cpf;
    }

    public void setCpf(long cpf) {
        this.cpf = cpf;
    }

    public String getTitulaçao() {
        return titulaçao;
    }

    public void setTitulaçao(String titulaçao) {
        this.titulaçao = titulaçao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTelefone() {
        return telefone;
    }

    public void setTelefone(int telefone) {
        this.telefone = telefone;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }
    
    
}
