import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class project2 extends HttpServlet {
    public void service(HttpServletRequest req, HttpServletResponse res) {
        try{
            res.setContentType("text/html");
            PrintWriter out = res.getWriter();

            Cookie ck[] = req.getCookies();  
            out.print("Welcome back, "+ck[0].getValue());

            out.println("<a href=\"/project/dashboard.html\">Click here</a>");

            out.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
