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
public class Estudante extends Curso {
    private int idestudante;
    private long cpf;
    private String nome;
    private int semestre;
    private int telefone;
    private String email;
    private int matricula;

    public Estudante() {
    }

    public Estudante(int idestudante, long cpf, String nome, int semestre, int telefone, String email, int matricula, int idcurso, String nome_curso, int carga) {
        super(idcurso, nome_curso, carga);
        this.idestudante = idestudante;
        this.cpf = cpf;
        this.nome = nome;
        this.semestre = semestre;
        this.telefone = telefone;
        this.email = email;
        this.matricula = matricula;
    }

    

    
    

    
    
    
    
    public int getIdestudante() {
        return idestudante;
    }

    public void setIdestudante(int idestudante) {
        this.idestudante = idestudante;
    }
    
    

    public long getCpf() {
        return cpf;
    }

    public void setCpf(long cpf) {
        this.cpf = cpf;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getSemestre() {
        return semestre;
    }

    public void setSemestre(int semestre) {
        this.semestre = semestre;
    }

    public int getTelefone() {
        return telefone;
    }

    public void setTelefone(int telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    
}
