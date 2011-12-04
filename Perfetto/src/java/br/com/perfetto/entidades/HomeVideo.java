/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.entidades;

/**
 *
 * @author Ederon Bruno
 */
public class HomeVideo {
    private int id;
    private String titulo;
    private String descricao;
    private String url_video;
    private String url_thumb_video;

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    /**
     * @return the url_video
     */
    public String getUrl_video() {
        return url_video;
    }

    /**
     * @param url_video the url_video to set
     */
    public void setUrl_video(String url_video) {
        this.url_video = url_video;
    }

    /**
     * @return the url_thumb_video
     */
    public String getUrl_thumb_video() {
        return url_thumb_video;
    }

    /**
     * @param url_thumb_video the url_thumb_video to set
     */
    public void setUrl_thumb_video(String url_thumb_video) {
        this.url_thumb_video = url_thumb_video;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }
   
    
}
