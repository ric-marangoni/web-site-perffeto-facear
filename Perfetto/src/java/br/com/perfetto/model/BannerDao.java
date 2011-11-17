package br.com.perfetto.model;

import br.com.perfetto.entidades.Banner;
import java.io.PrintWriter;
import java.util.ArrayList;


public class BannerDao extends DAO{
    public void insert(Banner banner){
        
        PrintWriter out = null; 
        
        try{
            openDataBase();
            String SQL = "INSERT INTO banner SET image_path = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, banner.getImage_path());            
            pstmt.execute();            
                        
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());            
        }finally{
            closeDataBase();
        }
    }
    
    public void edit(Banner banner){
        
        PrintWriter out = null; 
        
        try{
            openDataBase();
            String SQL = "UPDATE banner SET image_path = ? WHERE id_banner = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, banner.getImage_path());            
            pstmt.setInt(2, banner.getId());            
            pstmt.execute();            
                        
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());            
        }finally{
            closeDataBase();
        }
    }
    
    public void delete(Banner banner){
        PrintWriter out = null; 
        
        try{
            openDataBase();
            String SQL = "DELETE FROM banner WHERE id_banner = ?";
            pstmt = con.prepareStatement(SQL);            
            pstmt.setInt(1, banner.getId());            
            pstmt.execute();            
                        
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());            
        }finally{
            closeDataBase();
        }
    }

    public ArrayList<Banner> getAllBanners() {
        PrintWriter out = null; 
        ArrayList<Banner> listBanner = new ArrayList<Banner>();
        
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM banner";
            pstmt = con.prepareStatement(SQL);            
            rs = pstmt.executeQuery(SQL);            
            
            while(rs.next()){
                Banner banner = new Banner();
                banner.setId(rs.getInt("id_banner"));
                banner.setImage_path(rs.getString("image_path"));
                
                listBanner.add(banner);                        
            }            
            
        }catch(Exception e){
            out.print("Desculpe-nos o transtorno mais ocorreu o seguinte erro: "+e.getMessage());            
        }finally{
            closeDataBase();
        }
        
        return listBanner;
    }
}
