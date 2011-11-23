/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Ricardo
 */
public class Aplication {    

    public static String getBasePath() {
        return "C:\\Documents and Settings\\LÍDIA\\Desktop\\Sistema_Perfetto\\Perfetto\\web\\";
    }

    public static String upload(HttpServletRequest request, String image_path, int image_width, int image_thumb_width) throws InterruptedException {
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List items = null;

            try {
                items = upload.parseRequest(request);

                Iterator itr = items.iterator();

                FileItem item = (FileItem) itr.next();

                String itemName = (new File(item.getName()).getName());

                File savedFile = new File(Aplication.getBasePath() + image_path + itemName);
                try {
                    item.write(savedFile);  // upload realizado
                } catch (Exception ex) {
                    Logger.getLogger(Aplication.class.getName()).log(Level.SEVERE, null, ex);
                }               
                    
                try {
                    Image image = ImageLoader.fromFile(Aplication.getBasePath() + image_path + itemName);
                    image.getResizedToWidth(image_width).soften(0.08f).writeToJPG(new File(Aplication.getBasePath() + image_path + itemName), 0.8f);               
                    image.getResizedToWidth(image_thumb_width).soften(0.08f).writeToJPG(new File(Aplication.getBasePath() + image_path + "thumb_"+itemName), 0.8f);                                                           
                    image.dispose();                                                           
                                        
                } catch (IOException ex) {
                    Logger.getLogger(Aplication.class.getName()).log(Level.SEVERE, null, ex);
                }                             

                return itemName;

            } catch (FileUploadException e) {
            }
        }

        return "";

    }
    
    public static String getCropImageProperties(String path_image, int width, int height){        
        
        String imageToCrop = "<img src=\""+path_image+"\" alt=\"\" />";
        imageToCrop += "<input type=\"hidden\" class=\"cropWidth\" value=\""+width+"\" />";
        imageToCrop += "<input type=\"hidden\" class=\"cropHeight\" value=\""+height+"\" />";
        imageToCrop += "<input type=\"button\" id=\"cancelUpload\" class=\"btn-crop\" value=\"cancelar\" />";
        imageToCrop += "<input type=\"button\" id=\"crop\" class=\"btn-crop\" value=\"cortar imagem\" />";
        imageToCrop += "<input type=\"button\" id=\"useNormalImage\" class=\"btn-crop\" value=\"usar imagem original\" />";        
        
        return imageToCrop;
        
    }
    
    public static void copiarArquivo(File fonte, File destino) throws IOException{
        InputStream in = new FileInputStream(fonte);
        OutputStream out = new FileOutputStream(destino);
    
        byte[] buf = new byte[1024];
        int len;
        while((len = in.read(buf)) > 0){
            out.write(buf, 0, len);
        }
        in.close();
        out.close();
    }

}
