/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.perfetto.util;

import java.io.File;
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
        return "C:\\Documents and Settings\\Ricardo\\Desktop\\Projeto Perfetto\\Perfetto\\web\\";
    }

    public static String upload(HttpServletRequest request) {
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

                File savedFile = new File(Aplication.getBasePath() + "images/banner/" + itemName);
                try {
                    item.write(savedFile);  // upload realizado
                } catch (Exception ex) {
                    Logger.getLogger(Aplication.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                return itemName;

            } catch (FileUploadException e) {
                
            }
        }
        
        return "";

    }
}
