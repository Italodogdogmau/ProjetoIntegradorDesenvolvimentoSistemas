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
import model.bean.Estudante;


/**
 *
 * @author adilson
 */
public class EstudanteDAO {
    
    public void create(Estudante p){
        
        Connection con = ConnectionFactory.getConnection();
        PreparedStatement stmt = null;
       
        
        
        try {
            stmt = con.prepareStatement("INSERT INTO estudante (cpf,nome,semestre,telefone,email,matricula)VALUES(?,?,?,?,?,?)");
            
            stmt.setLong(1,p.getCpf());
            stmt.setString(2,p.getNome());
            stmt.setInt(3,p.getSemestre());
            stmt.setInt(4,p.getTelefone());
            stmt.setString(5,p.getEmail());
            stmt.setInt(6,p.getMatricula());
           ;
            
            stmt.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Salvo com sucesso");
                    } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "erro ao salvar"+ex);
        }finally{
            ConnectionFactory.closeConnection(con, stmt);
        }
        
    }
  
    public List<Estudante> read(){
   
    Connection con = ConnectionFactory.getConnection();
    PreparedStatement stmt = null;
    PreparedStatement stmt2 = null;
    ResultSet rs = null;
     
       List<Estudante> estudantes = new ArrayList<>();
        
       try {
           stmt = con.prepareStatement("SELECT distinct es.idestudante, es.cpf, es.nome,es.semestre,es.telefone,es.email,es.matricula,c.nome_curso,c.carga,c.idcurso\n" +
"FROM estudante as es\n" +
"INNER JOIN estudante_cursos as e\n" +
"ON e.id_aluno=es.idestudante\n" +
"inner join cursos as c\n" +
"on c.idcurso =  e.fk_idcurso\n" +
"order by idestudante;");
           rs = stmt.executeQuery();
           
           while(rs.next()){
                
               Estudante estudante = new Estudante();
                
                estudante.setIdestudante(rs.getInt("idestudante"));
                estudante.setCpf(rs.getLong("cpf"));
                estudante.setEmail(rs.getString("email"));
                estudante.setMatricula(rs.getInt("matricula"));
                estudante.setNome(rs.getString("nome"));
                estudante.setSemestre(rs.getInt("semestre"));
                estudante.setTelefone(rs.getInt("telefone"));
                estudante.setNome_curso(rs.getString("nome_curso"));
                estudante.setCarga(rs.getInt("carga"));
                estudante.setIdcurso(rs.getInt("idcurso"));
                estudantes.add(estudante);
            }
           
       } catch (SQLException ex) {
           Logger.getLogger(EstudanteDAO.class.getName()).log(Level.SEVERE, null, ex);
       }finally{
            ConnectionFactory.closeConnection(con, stmt, rs);
        }
       
     return estudantes;
       
   }
    
    public void update (Estudante e) throws SQLException{
   
    Connection con = ConnectionFactory.getConnection();
    PreparedStatement stmt = null;
    PreparedStatement stmt2 = null;
   
    
            try {
            stmt = con.prepareStatement("UPDATE estudante SET cpf =?, nome=? , semestre=? , telefone=? , email=? , matricula=?  WHERE idestudante = ?");
            stmt2 = con.prepareStatement("UPDATE cursos SET nome_curso =?, carga=?   WHERE idcurso = ?");
            
            stmt.setLong(1,e.getCpf());
            stmt.setString(2,e.getNome());
            stmt.setInt(3,e.getSemestre());
            stmt.setInt(4,e.getTelefone());
            stmt.setString(5,e.getEmail());
            stmt.setInt(6,e.getMatricula());
            stmt.setInt(7,e.getIdestudante());
            stmt2.setString(1,e.getNome_curso());
            stmt2.setInt(2,e.getCarga());
            stmt2.setInt(3,e.getIdcurso());
            
            
            stmt.executeUpdate();
            stmt2.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Alterado com Sucesso ");
                    
            }catch (SQLException ex) {
             JOptionPane.showMessageDialog(null, "Erro ao Alterar"+ ex);
        }finally{
          ConnectionFactory.closeConnection(con, stmt);
        } 
    
   }
    
    public void delete (Estudante e) throws SQLException{
    
    Connection con = ConnectionFactory.getConnection();
    PreparedStatement stmt = null;
    PreparedStatement stmt2 = null;
        
        try{
            stmt = con.prepareStatement("DELETE FROM estudante WHERE idestudante = ?");
            stmt2 = con.prepareStatement("DELETE FROM cursos WHERE idcurso = ?");
            

            stmt.setInt(1,e.getIdestudante());
            stmt.setInt(1,e.getIdcurso());
            
            stmt.executeUpdate();
            stmt2.executeUpdate();
            
            JOptionPane.showMessageDialog(null, "Removido com Sucesso ");
                    
            } catch (SQLException ex) {
             JOptionPane.showMessageDialog(null, "Erro ao Remover"+ ex);
            }finally{
             ConnectionFactory.closeConnection(con, stmt);
            }
  
    }
    
   
    
    
    
}
