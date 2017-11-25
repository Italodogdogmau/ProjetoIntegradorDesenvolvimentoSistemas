/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

/**
 *
 * @author PC
 */
public class Projeto extends Orientador {
    
    private String titulo_projeto;
    private int carga_horaria;

    public Projeto() {
    }

    public Projeto(String titulo_projeto, int carga_horaria, long cpf, String titulaçao, String nome, String email, int telefone, String campus) {
        super(cpf, titulaçao, nome, email, telefone, campus);
        this.titulo_projeto = titulo_projeto;
        this.carga_horaria = carga_horaria;
    }

    

    public String getTitulo_projeto() {
        return titulo_projeto;
    }

    public void setTitulo_projeto(String titulo_projeto) {
        this.titulo_projeto = titulo_projeto;
    }

    public int getCarga_horaria() {
        return carga_horaria;
    }

    public void setCarga_horaria(int carga_horaria) {
        this.carga_horaria = carga_horaria;
    }
    
    
    
}
