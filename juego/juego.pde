int num_pantalla;

PImage splashS, cargando, menu, ajustes, modojuego, pantsingle, pantmult, pantinst;

void setup()
{
  size (800,600);
  num_pantalla = 4;
  splashS = loadImage("splash.png");
  cargando = loadImage("cargando.png");
  menu = loadImage("menu.png");
  ajustes = loadImage("ajustes.png");
  modojuego = loadImage("modojuego.png");
  pantsingle = loadImage("pantsingle.png");
  pantmult = loadImage("pantmult.png");
  pantinst = loadImage("pantinst.png");
}

void draw()
{
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
  
  //fill(255,0,0,50);
  //rect(20, 20, 40, 50);
  
  if (mousePressed && (mouseButton == LEFT) )//Define área de botón de ajustes
  { 
    if(mouseX>20 && mouseX<60 && mouseY>20 && mouseY<70)
      num_pantalla = 4;
  }
}

void pantalla_ajustes()//4
{
  image(ajustes, 0, 0);
  fill(255,0,0,50);
  rect(30, 30, 45, 50);
  
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
}

void pantalla_menu_jugar()//6
{
  image(modojuego,0,0);
}

void pantalla_partida_rapida()//7
{
  image(pantsingle,0,0);
}

void pantalla_multijugador()//8
{
  image(pantmult,0,0);
}