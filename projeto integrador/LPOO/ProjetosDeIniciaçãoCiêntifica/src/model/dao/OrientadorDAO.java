/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.bean.Orientador;

/**
 *
 * @author adilson
 */
public class OrientadorDAO {
    
    public void create(Orientador o){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
        
        try {
            stmt = con.prepareStatement("INSERT INTO orientador (cpf,titulaçao,nome,email,telefone,campus)VALUES(?,?,?,?,?,?)");
            stmt.setLong(1,o.getCpf());
            stmt.setString(2,o.getTitulaçao());
            stmt.setString(3,o.getNome());
            stmt.setString(4,o.getEmail());
            stmt.setInt(5,o.getTelefone());
            stmt.setString(6,o.getCampus());
          
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo com sucesso");
                    } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "erro ao salvar orientador"+ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
        
    }
    
}
