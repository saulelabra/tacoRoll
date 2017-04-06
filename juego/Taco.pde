class Taco
{
  boolean tortilla;
  boolean pastor;
  boolean queso;
  boolean bistec;
  boolean suadero;
  boolean verdura;
  boolean salsaV;
  boolean salsaR;
  
  public Taco()//constructor inicializa todos los valores en falso
  {
    tortilla = false;
    pastor = false;
    queso = false;
    bistec = false;
    suadero = false;
    verdura = false;
  }
  
  void setTortilla(boolean valor)
  {
    tortilla = valor;
  }

  void setPastor(boolean valor)
  {
    pastor = valor;
  }
  
  void setQueso(boolean valor)
  {
    queso = valor;
  }
  
  void setBistec(boolean valor)
  {
    bistec = valor;
  }
  
  void setSuadero(boolean valor)
  {
    suadero = valor;
  }
  
  void setVerdura(boolean valor)
  {
    verdura = valor;
  }
  
  void setSalsaV(boolean valor)
  {
    salsaV = valor;
  }
  
  void setSalsaR(boolean valor)
  {
    salsaR = valor;
  }
  
  boolean comprobacion(Taco comparado)//función que devuelve un booleano en función de si los tacos son iguales o no
  {
    if(comparado.tortilla == tortilla)
    {
      if(comparado.pastor == pastor)
      {
        if(comparado.queso == queso)
        {
          if(comparado.bistec == bistec)
          {
            if(comparado.suadero == suadero)
            {
              if(comparado.verdura == verdura)
              {
                if(comparado.salsaV == salsaV)
                {
                  if(comparado.salsaR == salsaR)
                  {
                    return true;
                  }else{
                    return false;
                }
              }
            }
          }
        }
      }
    }
  }
};