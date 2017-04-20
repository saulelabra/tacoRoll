
import com.leapmotion.leap.processing.*;
import com.leapmotion.leap.*;
import com.leapmotion.leap.processing.LeapMotion;

LeapMotion leapMotion;

int num_pantalla, flag1, flag2, flag3, flag4, flag5, flag6, flag7, flag8, flag9;
float x_s,y_s;
PImage splashS, cargando, menu, menu2, ajustes, modojuego, pantsingle, pantmult, pantinst, check;

void setup()
{
  size (800,600);
  leapMotion = new LeapMotion(this);
  num_pantalla = 1;
  splashS = loadImage("splash.png");
  cargando = loadImage("cargando.png");
  menu = loadImage("menu.png");
  menu2 = loadImage("menu2.png");
  ajustes = loadImage("ajustes.png");
  modojuego = loadImage("modojuego.png");
  pantsingle = loadImage("pantsingle.png");
  pantmult = loadImage("pantmult.png");
  pantinst = loadImage("pantinst.png");
  check = loadImage("check.png");
  
  
}

void draw()
{
  Controller controller = leapMotion.controller();
  controller.enableGesture(Gesture.Type.TYPE_SCREEN_TAP);
  
   if (controller.isConnected())
  {
    Frame frame = controller.frame();

      
      for(Hand hand : frame.hands())
      {
        
        //Para traerse solo el dedo índice de esta mano:
        Vector pos = hand.palmPosition();
           
           float x=pos.getX();
           float y=pos.getY();
           x_s = leapMotion.leapToSketchX(x);
           y_s = leapMotion.leapToSketchY(y);
           if(hand.grabStrength() > 0.7)
           {
                         if(x_s>250 && x_s<305 && y_s>35 && y_s<95)
                           exit();//sale del juego
                         
                         if(x_s>705 && x_s<770 && y_s>35 && y_s<95)
                           num_pantalla = 5;//Carga ¿Como jugar?
                         
                         if(x_s>600 && x_s<665 && y_s>35 && y_s<95)
                           num_pantalla = 3;//Carga el menu
                         
                         if(x_s>30 && x_s<95 && y_s>35 && y_s<95)
                           num_pantalla = 4;//Carga ajustes               

                         if(x_s>140 && x_s<205 && y_s>35 && y_s<95)//botón de regreso
                          num_pantalla = 3;
                         
                         if(x_s>490 && x_s<555 && y_s>35 && y_s<95)//botón multijugador
                           num_pantalla = 8;
                           
                         if(x_s>375 && x_s<440 && y_s>35 && y_s<95) //botón un jugador
                           num_pantalla = 7;
                       
                   break;
               }
             
      }
    }
 
  
  
  switch(num_pantalla)
    {
      case 1:
              pantalla_splashscreen();
              break;
      case 2:
              pantalla_cargando();
              break;
      case 3:
              pantalla_menu();
              break;
      case 4:
              pantalla_ajustes();
              break;
      case 5:
              pantalla_instrucciones();
              break;
      case 6:
              pantalla_menu_jugar();
              break;
      case 7:
              pantalla_partida_rapida();
              break;
      case 8:
              pantalla_multijugador();
              break;       
    }
     strokeWeight(10);
     stroke(255,0,0);
     point(x_s,y_s);
     strokeWeight(1);
     stroke(255,0,0);
     fill(255,0,0,25);
     rect(705,35,65,60);
     


}

void pantalla_splashscreen()//1
{
  image(splashS, 0, 0);
  if((millis())>2000)
  {
    num_pantalla = 2;
  }
}

void pantalla_cargando()//2
{
  image(cargando, 0, 0);
  
  if(millis()>4000)
  {
    num_pantalla = 3;
  }
}

void pantalla_menu()//3
{
  background(0,255,0);
  image(menu, 0, 0);
  image(menu2, 0, 0);
  
  /*fill(255,0,0,50);
  rect(280, 400, 245, 110);//jugar
  
  fill(255,0,0,50);
  rect(590, 380, 180, 160);//¿Cómo jugar?
  
  fill(255,0,0,50);
  rect(80, 435, 100, 75);//Salir*/
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón salir
  { 
    if(mouseX>80 && mouseX<180 && mouseY>435 && mouseY<510)
      exit();//sale del juego
  }
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón ¿cómo jugar?
  { 
    if(mouseX>590 && mouseX<770 && mouseY>380 && mouseY<540)
      num_pantalla = 5;//carga pantalla de ¿Cómo jugar?
  }
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón jugar
  { 
    if(mouseX>280 && mouseX<525 && mouseY>400 && mouseY<510)
      num_pantalla = 6;//carga menú de modo de juego
  }
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón de ajustes
  { 
    if(mouseX>20 && mouseX<60 && mouseY>20 && mouseY<70)
      num_pantalla = 4;//carga ajustes
  }
   /*fill(255,0,0,50);
   rect(20,20,40,50);//botón ajustes*/
}



void pantalla_ajustes()//4
{
  image(ajustes, 0, 0);
  image(menu2, 0, 0);
  /*fill(255,0,0,50);
  rect(30, 30, 45, 50);*/
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón regresar a menú
  { 
    if(mouseX>30 && mouseX<75 && mouseY>30 && mouseY<80)
    {
      num_pantalla = 3;
    }
  }
}




void pantalla_instrucciones()//5
{
  image(pantinst,0,0);
  image(menu2, 0, 0);
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón regresar a menú
  { 
    if(mouseX>30 && mouseX<75 && mouseY>30 && mouseY<80)
    {
      num_pantalla = 3;
    }
  }
}




void pantalla_menu_jugar()//6
{
  image(modojuego,0,0);
  image(menu2, 0, 0);
  
  /*fill(255,0,0,50);
  rect(70, 210, 325, 340);//singleplayer
  
  fill(255,0,0,50);
  rect(435, 40, 330, 340);//multileplayer*/
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón multijugador
  { 
    if(mouseX>435 && mouseX<765 && mouseY>40 && mouseY<380)
    {
      num_pantalla = 8;//cargamultijugador
    }
  }
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón partida rápida
  { 
    if(mouseX>70 && mouseX<395 && mouseY>210 && mouseY<550)
    {
      num_pantalla = 7;//carga partida rápida
    }
  }
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón regresar a menú
  { 
    if(mouseX>30 && mouseX<75 && mouseY>30 && mouseY<80)
    {
      num_pantalla = 3;
    }
  }
}

void pantalla_partida_rapida()//7
{
  image(pantsingle,0,0);
  image(menu2, 0, 0);
}

void pantalla_multijugador()//8
{
  image(pantmult,0,0);
  if(flag1==1)
  image(check,735,195);
  if(flag2==1)
  image(check, 735, 232);
  if(flag3==1)
  image(check,735,268);
  if(flag4==1)
  image(check,735,306);
  if(flag5==1)
  image(check,735,353);
  if(flag6==1)
  image(check,735,390);
  if(flag7==1)
  image(check,735,432);
  if(flag8==1)
  image(check,735,470);
  if(flag9==1)
  image(pantmult,0,0);
  image(menu2, 0, 0);
  
}

void keyPressed() {
  if (num_pantalla==8)
  {
    if (key == '1')
    {
      flag1 = 1;
    }
    if (key == '2')
    {
       flag2 = 1;
    }
    if (key == '3')
    {
       flag3 = 1;
    }
    if (key == '4')
    {
       flag4 = 1;
    }
    if (key == '5')
    {
       flag5 = 1;
    }
    if (key == '6')
    {
       flag6 = 1;
    }
    if (key == '7')
    {
       flag7 = 1;
    }
    if (key == '8')
    {
       flag8 = 1;
    }
    if (key == '9')
       flag9 = 1;
  }
}