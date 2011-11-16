package br.com.perfetto.entidades;


public class Banner {
    private int id;
    private String image_path;

    /**
     * @return the image_path
     */
    public String getImage_path() {
        return image_path;
    }

    /**
     * @param image_path the image_path to set
     */
    public void setImage_path(String image_path) {
        this.image_path = image_path;
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
