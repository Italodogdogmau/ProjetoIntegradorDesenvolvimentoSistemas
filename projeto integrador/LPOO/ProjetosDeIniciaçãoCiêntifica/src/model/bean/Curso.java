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
public class Curso {
    private int idcurso;
    private String nome_curso;
    private int carga;

    public Curso() {
    }

    public Curso(int idcurso, String nome_curso, int carga) {
        this.idcurso = idcurso;
        this.nome_curso = nome_curso;
        this.carga = carga;
    }

    
    
    

    public String getNome_curso() {
        return nome_curso;
    }

    public void setNome_curso(String nome_curso) {
        this.nome_curso = nome_curso;
    }

    public int getCarga() {
        return carga;
    }

    public void setCarga(int carga) {
        this.carga = carga;
    }

    public int getIdcurso() {
        return idcurso;
    }

    public void setIdcurso(int idcurso) {
        this.idcurso = idcurso;
    }
    

    @Override
    public String toString() {
        return getNome_curso(); //To change body of generated methods, choose Tools | Templates.
    }

    

    
}
