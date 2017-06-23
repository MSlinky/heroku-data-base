package launch;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.net.ServerSocket;
import java.net.Socket;
import org.apache.catalina.startup.Tomcat;

public class Main {

    public static void main(String[] args) throws Exception { 
        
        String webappDirLocation = "src/main/webapp/";
        Tomcat tomcat = new Tomcat();
        
        String webPort = System.getenv("PORT");
        if (webPort == null || webPort.isEmpty()) {
            webPort = "8080";
        }

        tomcat.setPort(Integer.valueOf(webPort));

        tomcat.addWebapp("/", new File(webappDirLocation).getAbsolutePath());
        System.out.println("configuring app with basedir: "
                + new File("./" + webappDirLocation).getAbsolutePath());
        
        CalculatorView vista = new CalculatorView();
        vista.setVisible(true);  
        
        tomcat.start();
        tomcat.getServer().await();
        
           
        
        /*ServerSocket servidor = new ServerSocket(9090);      
        Socket cli;
        while(true){
            cli = servidor.accept();
            DataInputStream flujo = new DataInputStream(cli.getInputStream());
            String msg = flujo.readUTF();
            System.out.println(msg);
            cli.close();
            if(msg == "FIN"){
                servidor.close();
                break;
            }
        }*/
    }
}