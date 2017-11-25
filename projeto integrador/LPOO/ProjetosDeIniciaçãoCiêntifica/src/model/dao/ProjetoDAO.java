/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import model.bean.Orientador;
import model.bean.Projeto;


public class ProjetoDAO {
    
    
    public void create(Projeto p){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        
        try {
            stmt = con.prepareStatement("INSERT INTO projetos (titulo_projeto,carga_horaria)VALUES(?,?)");
            stmt.setString(1,p.getTitulo_projeto());
            stmt.setInt(2,p.getCarga_horaria());
          
            
            stmt.executeUpdate();
            
                    } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "erro ao salvar projeto"+ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
        
    }
    
    public List<Projeto> read(){
   
    Connection con = ConnectionFactory.getConnection();
    PreparedStatement stmt = null;
    PreparedStatement stmt2 = null;
    ResultSet rs = null;
     
       List<Projeto> projetos = new ArrayList<>();
        
       try {
           stmt = con.prepareStatement("SELECT * FROM projetos");
           stmt2 = con.prepareStatement("SELECT * FROM orientador");
           rs = stmt.executeQuery();
           rs = stmt2.executeQuery();
           
           while(rs.next()){
                
               Projeto projeto = new Projeto();
               
                
                projeto.setTitulo_projeto(rs.getString("titulo_projeto"));
                projeto.setCarga_horaria(rs.getInt("carga_horaria"));
                projeto.setCpf(rs.getLong("cpf"));
                projeto.setTitulaçao(rs.getString("titulacao"));
                projeto.setNome(rs.getString("nome"));
                projeto.setEmail(rs.getString("email"));
                projeto.setTelefone(rs.getInt("telefone"));
                projeto.setCampus(rs.getString("campus"));
                projetos.add(projeto);
                
            }
           
       } catch (SQLException ex) {
           Logger.getLogger(ProjetoDAO.class.getName()).log(Level.SEVERE, null, ex);
       }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
       
     return projetos;
       
   }
    
}

