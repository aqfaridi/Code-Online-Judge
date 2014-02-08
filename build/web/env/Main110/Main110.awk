
import java.io.File;

public class FileDemo {
   public static void main(String[] args) {
      
      File f = null;
      boolean bool = false;
      
      try{      
         // returns pathnames for files and directory
         f = new File("C:/Texts/TutorialsPoint/Java");
         
         // create directories
         bool = f.mkdirs();
         
         // print
         System.out.print("Directory created? "+bool);
         
      }catch(Exception e){
         // if any error occurs
         e.printStackTrace();
      }
   }
}
