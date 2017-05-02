class Taco
{
 boolean carnitas, bistec, pastor, queso, verdura, aguacate, salsas, tortilla;
 
 PImage display;
 
 Taco()
 {
   pastor=bistec=queso=carnitas=verdura=aguacate=salsas=false;
   tortilla = true;
 }
 
 boolean equalsTaco(Taco x)
 {
   boolean resultado = false;
   
   if(carnitas == x.carnitas)
   {
     if(bistec == x.bistec)
     {
       if(pastor == x.pastor)
       {
         if(queso == x.queso)
         {
           if(verdura == x.verdura)
           {
             if(aguacate == x.aguacate)
             {
               if(salsas == x.salsas)
               {
                 if(tortilla == x.tortilla)
                 {
                   resultado = true;
                 }
               }
             }
           }
         }
       }
     }
   }
   
   return resultado;
 }
}