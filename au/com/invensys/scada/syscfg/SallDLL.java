package au.com.invensys.scada.syscfg;

import java.io.File;
import java.io.IOException;

public class SallDLL {

native void sallMain(String paramString1, String paramString2, String paramString3, String paramString4);
  
  public void call(String dllPath, String firmware, String sallFilePath, String cFilePath, String errorFilePath)
  {
    System.load(dllPath);
    
    File cFile = new File(cFilePath);
    try
    {
      if (cFile.exists())
      {
        cFile.delete();
      }
      boolean temp = cFile.createNewFile();
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }
    sallMain(firmware, sallFilePath, cFilePath, errorFilePath);
  }


   public static void main(String[] args) {
      SallDLL s = new SallDLL();
      s.call(args[0], args[1], args[2], args[3], args[4]);
   }
}