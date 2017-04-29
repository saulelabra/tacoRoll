
import com.leapmotion.leap.processing.*;
import com.leapmotion.leap.*;
import com.leapmotion.leap.processing.LeapMotion;

LeapMotion leapMotion;

int num_pantalla, pantalla_ant, flag1, flag2, flag3, flag4, flag5, flag6, flag7, flag8, flag9;
float x_s, y_s;
PImage splashS, cargando, menu, menu_sup_menu, menu_sup_ajustes, menu_sup_unJugador, menu_sup_multijugador, menu_sup_inst, ajustes, modojuego, pantsingle, pantmult, pantinst, check;

boolean pastorIn = false;
boolean tortillasIn = false;

boolean carnitasA = false;
boolean bistecA = false;
boolean pastorA = false;
boolean quesoA = false;
boolean tortillasA = false;
boolean verduraA = false;
boolean aguacateA = false;
boolean salsaA = false;

boolean jugando = false;

PImage carnePastor, tortillas, carnitas, carneBistec, queso;

void setup()
{
  size (800, 600);
  leapMotion = new LeapMotion(this);
  num_pantalla = 7;
  splashS = loadImage("splash.png");
  cargando = loadImage("cargando.png");
  menu = loadImage("menu.png");
  menu_sup_menu = loadImage("menu_sup_menu.png");
  menu_sup_ajustes = loadImage("menu_sup_ajustes.png");
  menu_sup_unJugador = loadImage("menu_sup_unJugador.png");
  menu_sup_multijugador = loadImage("menu_sup_multijugador.png");
  menu_sup_inst = loadImage("menu_sup_inst.png");
  ajustes = loadImage("ajustes.png");
  modojuego = loadImage("modojuego.png");
  pantsingle = loadImage("pantsingle.png");
  pantmult = loadImage("pantmult.png");
  pantinst = loadImage("pantinst.png");
  check = loadImage("check.png");

  carnePastor = loadImage("pastor.png");
  tortillas = loadImage("tortilla.png");
  carnitas = loadImage("carnitas.png");
  carneBistec = loadImage("bistec.png");
  queso = loadImage("queso.png");
}

void draw()
{
  Controller controller = leapMotion.controller();
  controller.enableGesture(Gesture.Type.TYPE_SCREEN_TAP);

  if (controller.isConnected())
  {
    Frame frame = controller.frame();


    for (Hand hand : frame.hands())
    {

      //Para traerse solo el dedo índice de esta mano:
      Vector pos = hand.palmPosition();

      float x=pos.getX();
      float y=pos.getY();
      x_s = leapMotion.leapToSketchX(x);
      y_s = leapMotion.leapToSketchY(y);
      if (hand.grabStrength() > 0.7)
      {
        if (x_s>250 && x_s<305 && y_s>35 && y_s<95)
          num_pantalla = 7;//partida rápida

        if (x_s>705 && x_s<770 && y_s>35 && y_s<95)
          exit();

        if (x_s>600 && x_s<665 && y_s>35 && y_s<95)
          num_pantalla = 4;//Carga ajustes

        if (x_s>30 && x_s<95 && y_s>35 && y_s<95)
          /*num_pantalla = 4;*/          //Carga pausa            

          if (x_s>140 && x_s<205 && y_s>35 && y_s<95)//botón de regreso
            num_pantalla = pantalla_ant;

        if (x_s>490 && x_s<555 && y_s>35 && y_s<95)//botón instrucciones
          num_pantalla = 5;

        if (x_s>375 && x_s<440 && y_s>35 && y_s<95) //botón multijugador
          num_pantalla = 8;
          
          
        if(num_pantalla == 7)
        { 
          if (x_s > 690 && x_s < 790 && y_s > 190 && y_s < 255 || tortillasA == true)//area de tortilla
          {
            jugando = true;
            tortillasA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            imageMode(CENTER);
            image(tortillas, x_s, y_s, 100, 100);
            imageMode(CORNER);
            
            if (x_s > 180 && x_s < 620 && y_s > 130 && y_s < 455)// area del comal
            {
              tortillasIn = true;
            } else {
              tortillasIn = false;
            }
          }
          
          if (x_s > 5 && x_s < 100 && y_s > 350 && y_s < 440 || pastorA == true)//area de pastor
          {
            jugando = true;
            pastorA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            imageMode(CENTER);
            image(carnePastor, x_s, y_s, 100, 100);
            imageMode(CORNER);
            
            if (x_s > 180 && x_s < 620 && y_s > 130 && y_s < 455)// area del comal
            {
              pastorIn = true;
            } else {
              pastorIn = false;
            }
          }
        }

        break;
      }
      
      jugando = false;
      boolean carnitasA = false;
      boolean bistecA = false;
      boolean pastorA = false;
      boolean quesoA = false;
      boolean tortillasA = false;
      boolean verduraA = false;
      boolean aguacateA = false;
      boolean salsaA = false;
    }
  }

  if (mousePressed && (mouseButton == LEFT) )//Define área de botón un jugador
  { 
    if (mouseX>250 && mouseX<305 && mouseY>35 && mouseY<95)
      num_pantalla = 7;//partida rápida
  }

  if (mousePressed && (mouseButton == LEFT) )//Define área de botón salir
  { 
    if (mouseX>705 && mouseX<770 && mouseY>35 && mouseY<95)
    {
      exit();//sale del juego
    }
  }

  if (mousePressed && (mouseButton == LEFT))//ajustes
  {
    if (mouseX>600 && mouseX<665 && mouseY>35 && mouseY<95)
    {
      num_pantalla = 4;//carga ajustes
    }
  }

  if (mousePressed && (mouseButton == LEFT) )//multijugador
  { 
    if (mouseX>375 && mouseX<440 && mouseY>35 && mouseY<95)
    {
      num_pantalla = 8;//multijugador
    }
  }

  if (mousePressed && (mouseButton == LEFT) )//instrucciones
  { 
    if (mouseX>490 && mouseX<555 && mouseY>35 && mouseY<95)
    {
      num_pantalla = 5;//instrucciones
    }
  }

  if (mousePressed && (mouseButton == LEFT) )//Define área de botón pausa
  { 
    if (mouseX>30 && mouseX<95 && mouseY>35 && mouseY<95)
    {
      /*num_pantalla = 4;//carga pausa*/
    }
  }

  if (mousePressed && (mouseButton == LEFT) )//Define área de botón de regreso
  { 
    if (mouseX>140 && mouseX<205 && mouseY>35 && mouseY<95)
    {
      num_pantalla = pantalla_ant;//carga pantalla anterior
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
    /*case 6:
     pantalla_menu_jugar();
     break;*/
  case 7:
    pantalla_partida_rapida();
    break;
  case 8:
    pantalla_multijugador();
    break;
  }
  strokeWeight(10);
  stroke(255, 0, 0);
  point(x_s, y_s);
  strokeWeight(1);
  stroke(255, 0, 0);
  fill(255, 0, 0, 25);
  //rect(705, 35, 65, 60);
}

void pantalla_splashscreen()//1
{
  image(splashS, 0, 0);
  if ((millis())>2000)
  {
    num_pantalla = 2;
  }
}

void pantalla_cargando()//2
{
  image(cargando, 0, 0);

  if (millis()>4000)
  {
    num_pantalla = 3;
  }
}

void pantalla_menu()//3
{
  pantalla_ant = 3;
  background(#FFE203);
  image(menu, 0, 0, 800, 600);
  image(menu_sup_menu, 0, 0);

  /*fill(255,0,0,50);
   rect(140, 35, 65, 60);//atrás
   
   fill(255,0,0,50);
   rect(590, 380, 180, 160);//¿Cómo jugar?
   
   fill(255,0,0,50);
   rect(80, 435, 100, 75);//Salir*/
}



void pantalla_ajustes()//4
{
  image(ajustes, 0, 0);
  image(menu_sup_ajustes, 0, 0);
  /*fill(255,0,0,50);
   rect(140, 35, 65, 65);*/
}




void pantalla_instrucciones()//5
{
  image(pantinst, 0, 0);
  image(menu_sup_inst, 0, 0);
}

void pantalla_partida_rapida()//7
{
  pantalla_ant = 7;

  if(jugando == false)
  {
    background(255, 255, 255);
    image(pantsingle, 0, 170, 800, 370);
    image(menu_sup_unJugador, 0, 0);
  }
  
  stroke(255,0,0);
  
  rect(5, 170, 95, 85);//puerco/carnitas
  
  rect(5, 255, 95, 85);//res/Bistec
  
  rect(5, 350, 95, 90);//pastor
  
  rect(5, 445, 95, 90);//queso
  
  rect(690, 190, 100, 65);//tortilla
  
  rect(690, 270, 100, 85);//verdura
  
  rect(710, 366, 70, 80);//aguacate
  
  rect(695, 460, 100, 75);//salsas

  Taco [] ordenes = new Taco[5];//creamos las ordenes de tacos

  for (int i=0; i<5; i++)
  {
    ordenes[i] = new Taco();
  }

  ordenes[0].pastor = true;
  ordenes[0].carnitas = true;

  ordenes[1].carnitas = true;

  ordenes[2].queso = true;

  Taco entrega = new Taco();
  
  if(pastorIn == true)
  {
    entrega.pastor = true;
  }
}

void pantalla_multijugador()//8
{
  pantalla_ant = 8;

  image(pantmult, 0, 0);
  if (flag1==1)
    image(check, 735, 195);
  if (flag2==1)
    image(check, 735, 232);
  if (flag3==1)
    image(check, 735, 268);
  if (flag4==1)
    image(check, 735, 306);
  if (flag5==1)
    image(check, 735, 353);
  if (flag6==1)
    image(check, 735, 390);
  if (flag7==1)
    image(check, 735, 432);
  if (flag8==1)
    image(check, 735, 470);
  if (flag9==1)
    image(pantmult, 0, 0);
  image(menu_sup_multijugador, 0, 0);
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