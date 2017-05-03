
import com.leapmotion.leap.processing.*;
import com.leapmotion.leap.*;
import com.leapmotion.leap.processing.LeapMotion;

LeapMotion leapMotion;

int num_pantalla, pantalla_ant, flag1, flag2, flag3, flag4, flag5, flag6, flag7, flag8, flag9;
int numOrdenes = 6;
int ordenActual = 0;
int puntos = 0;
float x_s, y_s;
PImage splashS, cargando, menu, menu_sup_menu, menu_sup_ajustes, menu_sup_unJugador, menu_sup_multijugador, menu_sup_inst, ajustes, modojuego, pantsingle, pantmult, pantinst, check;

boolean centrado = false;
boolean centradoOrden = false;

boolean carne = false;

boolean carnitasIn = false;
boolean bistecIn = false;
boolean pastorIn = false;
boolean quesoIn = false;
boolean tortillasIn = false;
boolean verdurasIn = false;
boolean aguacateIn = false;
boolean salsaIn = false;
boolean tacoIn = false;

boolean carnitasA = false;
boolean bistecA = false;
boolean pastorA = false;
boolean quesoA = false;
boolean tortillasA = false;
boolean verduraA = false;
boolean aguacateA = false;
boolean salsaA = false;
boolean tacoA = false;

boolean jugando = false;

PImage carnePastor, tortillas, carnitas, carneBistec, queso, verdura, aguacate, salsa, orden_1, orden_2, orden_3, orden_4, orden_5, orden_6;

Taco [] ordenes = new Taco[numOrdenes];//creamos las ordenes de tacos
Taco entrega = new Taco();
  
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
  verdura = loadImage("verdura.png");
  aguacate = loadImage("aguacate_picado.png");
  salsa = loadImage("salsa.png");
  
  orden_1 = loadImage("Orden1.png");
  orden_2 = loadImage("Orden2.png");
  orden_3 = loadImage("Orden3.png");
  orden_4 = loadImage("Orden4.png");
  orden_5 = loadImage("Orden5.png");
  orden_6 = loadImage("Orden6.png");
  
  for (int i=0; i<numOrdenes; i++)
  {
    ordenes[i] = new Taco();
  }
  
  ordenes[0].pastor = true;
  ordenes[0].verdura = true;
  ordenes[0].salsas = true;
  ordenes[0].display = orden_1;
  
  ordenes[1].pastor = true;
  ordenes[1].verdura = true;
  ordenes[1].aguacate = true;
  ordenes[1].salsas = true;
  ordenes[1].display = orden_2;
  
  ordenes[2].queso = true;
  ordenes[2].salsas = true;
  ordenes[2].display = orden_3;
  
  ordenes[3].bistec = true;
  ordenes[3].aguacate = true;
  ordenes[3].verdura = true;
  ordenes[3].salsas = true;
  ordenes[3].display = orden_4;
  
  ordenes[4].carnitas = true;
  ordenes[4].aguacate = true;
  ordenes[4].salsas = true;
  ordenes[4].display = orden_5;
  
  ordenes[5].carnitas = true;
  ordenes[5].verdura = true;
  ordenes[5].display = orden_6;
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
            if (tortillasIn == true)
            {
              carne = false;
              carnitasIn = false;
              bistecIn = false;
              pastorIn = false;
              quesoIn = false;
              verdurasIn = false;
              aguacateIn = false;
              salsaIn = false;
            }
            
            jugando = true;
            tortillasA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            if (centrado == false)
            {  
              imageMode(CENTER);
              image(tortillas, x_s, y_s, 100, 100);
              imageMode(CORNER);
            }
            
            if (x_s > 185 && x_s < 625 && y_s > 300 && y_s < 470)// entra al comal
            {
              centrado = true;
              tortillasIn = true;
              imageMode(CENTER);
              image(tortillas, 410, 365, 100, 100);
              imageMode(CORNER);
            } else {
              tortillasIn = false;
              centrado = false;
            }
          }
          
          if (x_s > 5 && x_s < 100 && y_s > 170 && y_s < 255 || carnitasA == true)//area carnitas
          {
            if(carne == true)
            {
              carnitasIn = false;
              bistecIn = false;
              pastorIn = false;
              quesoIn = false;
              verdurasIn = false;
              aguacateIn = false;
              salsaIn = false;
            }
            
            jugando = true;
            carnitasA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            if(tortillasIn == true)//tortilla base
            {
              imageMode(CENTER);
              image(tortillas, 410, 365, 100, 100);
              imageMode(CORNER);
            }
            
            if(centrado == false)
            {
              imageMode(CENTER);
              image(carnitas, x_s, y_s, 80, 80);
              imageMode(CORNER);
            }
            
            if (x_s > 185 && x_s < 625 && y_s > 300 && y_s < 470)// entra al comal
            {
              centrado = true;
              carnitasIn = true;
              carne = true;
              imageMode(CENTER);
              image(carnitas, 410, 365, 80, 80);
              imageMode(CORNER);
              if(tortillasIn == false)
              {
                carnitasIn = false;
                carne = false;
              }
            } else {
              carnitasIn = false;
              centrado = false;
              carne = false;
            }
          }
          
          if (x_s > 5 && x_s < 100 && y_s > 255 && y_s < 340 || bistecA == true)//area bistec
          {
            if(carne == true)
            {
              carnitasIn = false;
              bistecIn = false;
              pastorIn = false;
              quesoIn = false;
              verdurasIn = false;
              aguacateIn = false;
              salsaIn = false;
            }
            
            jugando = true;
            bistecA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            if(tortillasIn == true)//tortilla base
            {
              imageMode(CENTER);
              image(tortillas, 410, 365, 100, 100);
              imageMode(CORNER);
            }
            
            if(centrado == false)
            {
              imageMode(CENTER);
              image(carneBistec, x_s, y_s, 80, 80);
              imageMode(CORNER);
            }
            
            if (x_s > 185 && x_s < 625 && y_s > 300 && y_s < 470)// entra al comal
            {
              centrado = true;
              bistecIn = true;
              carne = true;
              imageMode(CENTER);
              image(carneBistec, 410, 365, 80, 80);
              imageMode(CORNER);
              if(tortillasIn == false)
              {
                bistecIn = false;
                carne = false;
              }
            } else {
              bistecIn = false;
              centrado = false;
              carne = false;
            }
          }
          
          if (x_s > 5 && x_s < 100 && y_s > 350 && y_s < 440 || pastorA == true)//area de pastor
          {
            if(carne == true)
            {
              carnitasIn = false;
              bistecIn = false;
              pastorIn = false;
              quesoIn = false;
              verdurasIn = false;
              aguacateIn = false;
              salsaIn = false;
            }
            
            jugando = true;
            pastorA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            if(tortillasIn == true)
            {
              imageMode(CENTER);
              image(tortillas, 410, 365, 100, 100);
              imageMode(CORNER);
            }
            
            if(centrado == false)
            {
              imageMode(CENTER);
              image(carnePastor, x_s, y_s, 80, 80);
              imageMode(CORNER);
            }
            
            if (x_s > 185 && x_s < 625 && y_s > 300 && y_s < 470)// entra al comal
            {
              centrado = true;
              pastorIn = true;
              carne = true;
              imageMode(CENTER);
              image(carnePastor, 410, 365, 80, 80);
              imageMode(CORNER);
              if(tortillasIn == false)
              {
                pastorIn = false;
                carne = false;
              }
            } else {
              pastorIn = false;
              centrado = false;
              carne = false;
            }
          }
          
          if (x_s > 5 && x_s < 100 && y_s > 445 && y_s < 535 || quesoA == true)//area de queso
          {
            if(carne == true)
            {
              carnitasIn = false;
              bistecIn = false;
              pastorIn = false;
              quesoIn = false;
              verdurasIn = false;
              aguacateIn = false;
              salsaIn = false;
            }
            
            jugando = true;
            quesoA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            if(tortillasIn == true)
            {
              imageMode(CENTER);
              image(tortillas, 410, 365, 100, 100);
              imageMode(CORNER);
            }
            
            if(centrado == false)
            {
              imageMode(CENTER);
              image(queso, x_s, y_s, 80, 80);
              imageMode(CORNER);
            }
            
            if (x_s > 185 && x_s < 625 && y_s > 300 && y_s < 470)// entra al comal
            {
              centrado = true;
              quesoIn = true;
              carne = true;
              imageMode(CENTER);
              image(queso, 410, 365, 80, 80);
              imageMode(CORNER);
              
              if(tortillasIn == false)
              {
                quesoIn = false;
                carne = false;
              }
            } else {
              quesoIn = false;
              centrado = false;
              carne = false;
            }
          }
          
          if (x_s > 690 && x_s < 790 && y_s > 270 && y_s < 355 || verduraA == true)//area de verdura
          {
            jugando = true;
            verduraA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            if(tortillasIn == true)
            {
              imageMode(CENTER);
              image(tortillas, 410, 365, 100, 100);
              imageMode(CORNER);
            }
            
            if(carne == true)
            {
              if(carnitasIn == true)
              {
                imageMode(CENTER);
                image(carnitas, 410, 365, 80, 80);
                imageMode(CORNER);
              }else{
                if(bistecIn == true)
                {
                  imageMode(CENTER);
                  image(carneBistec, 410, 365, 80, 80);
                  imageMode(CORNER);
                }else{
                  if(pastorIn == true)
                  {
                    imageMode(CENTER);
                    image(carnePastor, 410, 365, 80, 80);
                    imageMode(CORNER);
                  }else{
                    if(quesoIn == true)
                    {
                      imageMode(CENTER);
                      image(queso, 410, 365, 80, 80);
                      imageMode(CORNER);
                    }
                  }
                }
              }
            }
            
            if(aguacateIn == true)
            {
              imageMode(CENTER);
              image(aguacate, 410, 365, 60, 60);
              imageMode(CORNER);
            }
            
            if(salsaIn == true)
            {
              imageMode(CENTER);
              image(salsa, 410, 365, 60, 60);
              imageMode(CORNER);
            }
            
            if(centrado == false)
            {
              imageMode(CENTER);
              image(verdura, x_s, y_s, 60, 60);
              imageMode(CORNER);
            }
            
            if (x_s > 185 && x_s < 625 && y_s > 300 && y_s < 470)// entra al comal
            {
              centrado = true;
              verdurasIn = true;
              imageMode(CENTER);
              image(verdura, 410, 365, 60, 60);
              imageMode(CORNER);
            } else {
              verdurasIn = false;
              centrado = false;
            }
          }
          
          if (x_s > 710 && x_s < 780 && y_s > 366 && y_s < 446 || aguacateA == true)//area de aguacate
          {
            jugando = true;
            aguacateA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            if(tortillasIn == true)
            {
              imageMode(CENTER);
              image(tortillas, 410, 365, 100, 100);
              imageMode(CORNER);
            }
            
            if(carne == true)
            {
              if(carnitasIn == true)
              {
                imageMode(CENTER);
                image(carnitas, 410, 365, 80, 80);
                imageMode(CORNER);
              }else{
                if(bistecIn == true)
                {
                  imageMode(CENTER);
                  image(carneBistec, 410, 365, 80, 80);
                  imageMode(CORNER);
                }else{
                  if(pastorIn == true)
                  {
                    imageMode(CENTER);
                    image(carnePastor, 410, 365, 80, 80);
                    imageMode(CORNER);
                  }else{
                    if(quesoIn == true)
                    {
                      imageMode(CENTER);
                      image(queso, 410, 365, 80, 80);
                      imageMode(CORNER);
                    }
                  }
                }
              }
            }
            
            if(verdurasIn == true)
            {
              imageMode(CENTER);
              image(verdura, 410, 365, 60, 60);
              imageMode(CORNER);
            }
            
            if(salsaIn == true)
            {
              imageMode(CENTER);
              image(salsa, 410, 365, 60, 60);
              imageMode(CORNER);
            }
            
            if(centrado == false)
            {
              imageMode(CENTER);
              image(aguacate, x_s, y_s, 60, 60);
              imageMode(CORNER);
            }
            
            if (x_s > 185 && x_s < 625 && y_s > 300 && y_s < 470)// entra al comal
            {
              centrado = true;
              aguacateIn = true;
              imageMode(CENTER);
              image(aguacate, 410, 365, 60, 60);
              imageMode(CORNER);
            } else {
              aguacateIn = false;
              centrado = false;
            }
          }
          
          if (x_s > 695 && x_s < 795 && y_s > 460 && y_s < 535 || salsaA == true)//area de salsas
          {
            jugando = true;
            salsaA = true;
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            if(tortillasIn == true)
            {
              imageMode(CENTER);
              image(tortillas, 410, 365, 100, 100);
              imageMode(CORNER);
            }
            
            if(carne == true)
            {
              if(carnitasIn == true)
              {
                imageMode(CENTER);
                image(carnitas, 410, 365, 80, 80);
                imageMode(CORNER);
              }else{
                if(bistecIn == true)
                {
                  imageMode(CENTER);
                  image(carneBistec, 410, 365, 80, 80);
                  imageMode(CORNER);
                }else{
                  if(pastorIn == true)
                  {
                    imageMode(CENTER);
                    image(carnePastor, 410, 365, 80, 80);
                    imageMode(CORNER);
                  }else{
                    if(quesoIn == true)
                    {
                      imageMode(CENTER);
                      image(queso, 410, 365, 80, 80);
                      imageMode(CORNER);
                    }
                  }
                }
              }
            }
            
            if(aguacateIn == true)
            {
              imageMode(CENTER);
              image(aguacate, 410, 365, 60, 60);
              imageMode(CORNER);
            }
            
            if(verdurasIn == true)
            {
              imageMode(CENTER);
              image(verdura, 410, 365, 60, 60);
              imageMode(CORNER);
            }
            
            if(centrado == false)
            {
              imageMode(CENTER);
              image(salsa, x_s, y_s, 60, 60);
              imageMode(CORNER);
            }
            
            if (x_s > 185 && x_s < 625 && y_s > 300 && y_s < 470)// entra al comal
            {
              centrado = true;
              salsaIn = true;
              imageMode(CENTER);
              image(salsa, 410, 365, 60, 60);
              imageMode(CORNER);
            } else {
              salsaIn = false;
              centrado = false;
            }
          }
          
          if((tortillasIn == true && x_s > 360 && x_s < 460 && y_s > 320 && y_s < 420) || tacoA == true)//area del taco
          {
            tacoA = true;
            jugando = true;
            
            background (255);
            image(pantsingle, 0, 170, 800, 370);
            image(menu_sup_unJugador, 0, 0);
            if(ordenActual < numOrdenes)
            {
              image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
            }
            
            imageMode(CENTER);
            
            if(centradoOrden == false)
            {
              image(tortillas, x_s, y_s, 100, 100);
            
              if(carnitasIn == true)
              {
                image(carnitas, x_s, y_s, 80, 80);
              }else{
                if(bistecIn == true)
                {
                  image(carneBistec, x_s, y_s, 80, 80);
                }else{
                  if(pastorIn == true)
                  {
                    image(carnePastor, x_s, y_s, 80, 80);
                  }else{
                    if(quesoIn == true)
                    {
                      image(queso, x_s, y_s, 80, 80);
                    }
                  }
                }
              }
              
              if(aguacateIn == true)
              {
                image(aguacate, x_s, y_s, 60, 60);
              }
              
              if(verdurasIn == true)
              {
                image(verdura, x_s, y_s, 60, 60);
              }
              
              if(salsaIn == true)
              {
                image(salsa, x_s, y_s, 60, 60);
              }
            }
            
            if(x_s > 320 && x_s < 510 && y_s > 490 && y_s < 580)// area de orden
            {
              centradoOrden = true;
              tacoIn = true;
              
              image(tortillas, 410, 540, 100, 100);
            
              if(carnitasIn == true)
              {
                image(carnitas, 410, 540, 80, 80);
              }else{
                if(bistecIn == true)
                {
                  image(carneBistec, 410, 540, 80, 80);
                }else{
                  if(pastorIn == true)
                  {
                    image(carnePastor, 410, 540, 80, 80);
                  }else{
                    if(quesoIn == true)
                    {
                      image(queso, 410, 540, 80, 80);
                    }
                  }
                }
              }
              
              if(verdurasIn == true)
              {
                image(verdura, 410, 540, 60, 60);
              }
              
              if(aguacateIn == true)
              {
                image(aguacate, 410, 540, 60, 60);
              }
              
              if(salsaIn == true)
              {
                image(salsa, 410, 540, 60, 60);
              }
            }else{
              centradoOrden = false;
              tacoIn = false;
            }
            
            imageMode(CORNER);
          }
          
        }

        break;
      }
      
      jugando = false;
      carnitasA = false;
      bistecA = false;
      pastorA = false;
      quesoA = false;
      tortillasA = false;
      verduraA = false;
      aguacateA = false;
      salsaA = false;
      tacoA = false;
      
      centrado = false;
      
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
    if(ordenActual < numOrdenes)
    {
      image(ordenes[ordenActual].display, 320, 490, 190, 90);//se imprimen ordenes
    }
    
    if(tacoIn == false)
    {
      if(tortillasIn == true)
      {
        imageMode(CENTER);
        image(tortillas, 410, 365, 100, 100);
        imageMode(CORNER);
      }
      
      if(carnitasIn == true)
      {
        imageMode(CENTER);
        image(carnitas, 410, 365, 80, 80);
        imageMode(CORNER);
      }
      
      if(bistecIn == true)
      {
        imageMode(CENTER);
        image(carneBistec, 410, 365, 80, 80);
        imageMode(CORNER);
      }
      
      if(pastorIn == true)
      {
        imageMode(CENTER);
        image(carnePastor, 410, 365, 80, 80);
        imageMode(CORNER);
      }
      
      if(quesoIn == true)
      {
        imageMode(CENTER);
        image(queso, 410, 365, 80, 80);
        imageMode(CORNER);
      }
      
      if(verdurasIn == true)
      {
        if(carne == true)
        {
          if(aguacateIn == true)
          {
            imageMode(CENTER);
            image(aguacate, 410, 365, 60, 60);
            imageMode(CORNER);
          }
          
          imageMode(CENTER);
          image(verdura, 410, 365, 60, 60);
          imageMode(CORNER);
        }else{
          verdurasIn = false;
        }
      }
      
      if(aguacateIn == true && verdurasIn == false)
      {
        if(carne == true)
        {
          imageMode(CENTER);
          image(aguacate, 410, 365, 60, 60);
          imageMode(CORNER);
        }else{
          aguacateIn = false;
        }
      }
      
      if(salsaIn == true)
      {
        if(carne == true)
        {
          imageMode(CENTER);
          image(salsa, 410, 365, 60, 60);
          imageMode(CORNER);
        }else{
          salsaIn = false;
        }
      }
    }
  }
  
  //Aquí se transfieren los datos de los booleandos del main a los atributos del objeto
  
  entrega.carnitas = carnitasIn;
  entrega.bistec = bistecIn;
  entrega.pastor = pastorIn;
  entrega.queso = quesoIn;
  entrega.verdura = verdurasIn;
  entrega.aguacate = aguacateIn;
  entrega.salsas = salsaIn;
  
  if(tacoIn == true && tacoA == false)
  {
    /*println("Entró");
    println("Entrega, tortilla " + entrega.tortilla);
    println("Entrega, carnitas " + entrega.carnitas);
    println("Entrega, bistec " + entrega.bistec);
    println("Entrega, pastor " + entrega.pastor);
    println("Entrega, queso " + entrega.queso);
    println("Entrega, verdura " + entrega.verdura);
    println("Entrega, aguacate " + entrega.aguacate);
    println("Entrega, salsas " + entrega.salsas);
    
    println("Orden actual, tortilla " + ordenes[ordenActual].tortilla);
    println("Orden actual, carnitas " + ordenes[ordenActual].carnitas);
    println("Orden actual, bistec " + ordenes[ordenActual].bistec);
    println("Orden actual, pastor " + ordenes[ordenActual].pastor);
    println("Orden actual, queso " + ordenes[ordenActual].queso);
    println("Orden actual, verdura " + ordenes[ordenActual].verdura);
    println("Orden actual, aguacate " + ordenes[ordenActual].aguacate);
    println("Orden actual, salsas " + ordenes[ordenActual].salsas);*/
    
    if(ordenes[ordenActual].equalsTaco(entrega) && ordenActual < 6)
    {
      puntos++;
      ordenActual++;
      
      println("La orden y la entrega son iguales");
    }
    
    carnitasIn = false;
    bistecIn = false;
    pastorIn = false;
    quesoIn = false;
    tortillasIn = false;
    verdurasIn = false;
    aguacateIn = false;
    salsaIn = false;
    tacoIn = false;
  }
  
  /*stroke(255,0,0);
  
  rect(5, 170, 95, 85);//puerco/carnitas
  
  rect(5, 255, 95, 85);//res/Bistec
  
  rect(5, 350, 95, 90);//pastor
  
  rect(5, 445, 95, 90);//queso
  
  rect(690, 190, 100, 65);//tortilla
  
  rect(690, 270, 100, 85);//verdura
  
  rect(710, 366, 70, 80);//aguacate
  
  rect(695, 460, 100, 75);//salsas*/

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