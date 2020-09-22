package com.mobios.uploader;

import com.mobios.dbconnection.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "/ImageUploader", urlPatterns = {"/ImageUploader"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10,    // 10 MB
        maxFileSize = 1024 * 1024 * 50,        // 50 MB
        maxRequestSize = 1024 * 1024 * 100)    // 100 MB
public class ImageUploader extends HttpServlet {


    private static final long serialVersionUID = 205242440643911308L;


    /**
     * Directory where uploaded files will be saved, its relative to
     * the web application directory.
     */
    private static final String UPLOAD_DIR = "images";

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formatDate = simpleDateFormat.format(new Date());
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");

        String[] split = applicationPath.split("webapps/");

        String img_tag = request.getParameter("imgTag");

        // constructs path of the directory to save uploaded file
        String uploadFilePath = split[0]+ "webapps/viberastro/testdemo/news";

        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }


        //System.out.println("Upload File Directory=" + fileSaveDir.getAbsolutePath());
        String fileName = null;
        //Get all the parts from request and write it to the file on server
        for (Part part : request.getParts()) {
            if (part.getName().equals("imageFile")) {
                fileName = getFileName(part);
                part.write(uploadFilePath + File.separator +img_tag+formatDate+".jpg");
            }
        }


        String s = "https://viber.textware.lk/viberastro/testdemo/news" +File.separator+ img_tag + formatDate+".jpg";
        //String s ="sds";
        System.out.println(s+" sss");
        String sql = "INSERT INTO images (img_path,img_tag,img_type) values('"+s+"','"+img_tag+"','img')";

        try {
            int insert = DBConnection.getDbCon().insert(sql);
            System.out.println(sql+" SQLLL ");


        } catch (Exception ex) {
            System.out.println(ex + "sda");
            request.setAttribute("message", "FileError");
            getServletContext().getRequestDispatcher("/response.jsp").forward(
                    request, response);
            return;
        }

        request.setAttribute("message", fileName + " File uploaded successfully!");
        getServletContext().getRequestDispatcher("/index.jsp").forward(
                request, response);
        return;
    }

    /**
     * Utility method to get file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {

        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("imageFile")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}