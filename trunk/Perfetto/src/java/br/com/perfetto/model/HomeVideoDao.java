/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.model;

import br.com.perfetto.entidades.HomeVideo;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author Ederon Bruno
 */
public class HomeVideoDao extends DAO {
 
    public void insert(HomeVideo video){
        
        PrintWriter out = null;
        
        try{
            openDataBase();
            String SQL = "INSERT INTO home_videos SET titulo = ?, descricao = ?,";
            SQL += "url_video = ?, url_thumb_image = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, video.getTitulo());
            pstmt.setString(2, video.getDescricao());
            pstmt.setString(3, video.getUrl_video());
            pstmt.setString(4, video.getUrl_thumb_video());
            pstmt.execute();
        }catch(Exception ex){
            out.print(ex.getMessage());
        }finally{
            closeDataBase();
            out.close();
        }        
    }
    
    public void edit(HomeVideo video){
        PrintWriter out = null;
        
        try{
            openDataBase();
            String SQL = "UPDATE home_videos SET titulo = ?, descricao = ?,";
            SQL += "url_video = ?, url_thumb_image = ? WHERE id_home_video = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, video.getTitulo());
            pstmt.setString(2, video.getDescricao());
            pstmt.setString(3, video.getUrl_video());
            pstmt.setString(4, video.getUrl_thumb_video());
            pstmt.setInt(5, video.getId());
            pstmt.execute();
        }catch(Exception ex){
            out.print(ex.getMessage());
        }finally{
            closeDataBase();
            out.close();
        }     
    }
        
    public void delete(HomeVideo video){
        PrintWriter out = null;
        
        try{
            openDataBase();
            String SQL = "DELETE FROM home_videos WHERE id_home_video = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, video.getId());
            pstmt.execute();                    
        }catch(Exception ex){
            out.print(ex.getMessage());
        }finally{
            closeDataBase();
            out.close();
        }
    }
    
    public ArrayList<HomeVideo> getVideos(){
        PrintWriter out = null;
        ArrayList<HomeVideo> listaVideo = new ArrayList<HomeVideo>();
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM home_videos";
            pstmt = con.prepareStatement(SQL);            
            rs = pstmt.executeQuery(SQL);
            
            while(rs.next()){
                HomeVideo video = new HomeVideo();
                video.setId(rs.getInt("id_home_video"));
                video.setTitulo(rs.getString("titulo"));
                video.setUrl_video(rs.getString("url_video"));
                video.setUrl_thumb_video(rs.getString("url_thumb_image"));
                video.setDescricao(rs.getString("descricao"));
                listaVideo.add(video);
            }
            
        }catch(Exception ex){
            out.print(ex.getMessage());
        }finally{
            closeDataBase();            
        }    
        
        return listaVideo;
    }
    
    public HomeVideo getVideoById(int id){
        HomeVideo video = new HomeVideo();
        
        try{
            openDataBase();
            String SQL = "SELECT * FROM home_videos WHERE id_home_video = ?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.first()){                                
                video.setTitulo(rs.getString("titulo"));
                video.setUrl_video(rs.getString("url_video"));
                video.setDescricao(rs.getString("descricao"));                
            }
        }catch(Exception ex){
        
        }finally{
            closeDataBase();
        }
        
        return video;           
    }
    
}
