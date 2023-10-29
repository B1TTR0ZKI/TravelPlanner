import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class project extends HttpServlet{
    public void service(HttpServletRequest req, HttpServletResponse res) {
        try{
            res.setContentType("text/html");
            PrintWriter out = res.getWriter();

            String email = req.getParameter("userEmail");
            String pass = req.getParameter("userPass");

            out.print("Hello " + email);

            Cookie ck = new Cookie("uemail", email);
            res.addCookie(ck);
            
            out.println("<form action=\"Project2\">");
            out.println("<input type=\"Submit\" />");
            out.println("</form>");

            out.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}