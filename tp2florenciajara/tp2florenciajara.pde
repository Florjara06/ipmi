//Herrera Florencia jara - 1217771/2
//Trabajo Práctico n°2
//Comisión 4 prof. Leonardo Garay
String estado, titulo;
int esquinaX1 = 280;
int esquinaY1 = 340;
int botancho = 90;
int botalto = 90;
int borde = 50;
PImage imagen1, imagen2, imagen3, imagen4, inicio, fondo;
PFont fuente, fuente2, fuente3;
int tiempo;
int tam;
float x, y;  //declaro dos variables en la misma linea con ','
color relleno;
int alpha;
float x1= 680;
float y1= 480;
float x2= 0;

void setup () {
  size(640, 480);
  estado = "pantalla1";
  imagen1 =loadImage("imagenf1.jpg");
  imagen2 =loadImage("imagenf2.jpg");
  imagen3 =loadImage("imagenf3.jpg");
  imagen4 =loadImage("imagenf4.jpg");
  fondo =loadImage("fondo.png");
  inicio =loadImage("iniciof.png");
  titulo = "Sailor Moon";
  tam = 10;
  x = width / 2;
  y = height / 2;
  relleno = color(255, 13, 90);
  alpha = 255;
  fuente =createFont("Candara Italic", 30);
  fuente2 =createFont("Candara Italic", 25);
  fuente3 =createFont("Candara Italic", 20);
}

void draw() {
  if (estado == "pantalla1") {
    if ( tam < 100 ) {
      tam += 1;
      println(tam);
    } else {
      relleno = color(254, 255, 13);
    }
    if ( tam >= 100 ) {
      y = y - 1;
      y -= 1;
      y--;
      relleno = color(254, 255, 13, alpha);
      alpha = alpha - 2;
    }
    image(imagen1, 0, 0);
    textFont(fuente);
    fill( relleno );
    textSize( tam );
    textAlign( CENTER, CENTER );
    text( titulo, 320, 400 );
    if (frameCount /60 == 3) {
      estado = "pantalla2";
    }
    ///pantalla 3///
  } else if (estado == "pantalla2") {
    image(imagen3, 0, 0);
    image(fondo, 0, 0);
    textFont(fuente2);
    fill(255, 255, 255);
    text("Sailor Moon, es una serie de manga escrita e ilustrada\npor Naoko Takeuchi en diciembre de 1991.", x1, 240);
    x1 -= 2;
    if (x1 < 320) {
      x1 = 320;
    }
    if (frameCount /60 == 8) {
      estado = "pantalla3";
    }

    //pantalla 3///
  } else if (estado == "pantalla3") {
    image(imagen2, 0, 0);
    image(fondo, 0, 200);
    textFont(fuente3);
    fill(255, 255, 255);
    text("El manga se hizo particularmente famoso por volver a popularizar\ncon gran éxito el subgénero de las chicas mágicas, y sus elementos\nsentai consiguieron que la aceptación también fuese masiva\nentre el sector masculino, generalmente menos interesado\nen este tipo de historias.", 300, y1);
    y1 -= 1.0;
    if (y1 < 410) {
      y1 = 410;
    }
    if (frameCount /60 == 15) {
      estado = "pantalla4";
    }

    //pantalla 4//
  } else if (estado == "pantalla4") {
    image(imagen4, 0, 0);
    image(fondo, 0, -200);
    image(inicio, 0, 0);
    textFont(fuente3);
    fill(255, 255, 255);
    text("Sailor Moon está compuesto por un total de cinco partes o\ntemporadas, cuyos títulos son: Sailor Moon, Sailor Moon R,\nSailor Moon S, Sailor Moon SuperS y Sailor Moon Sailor Stars.\nCada una corresponde a la adaptación de uno de los cinco arcos\nargumentales del manga, siguiendo a grandes rasgos la misma historia.", x2, 70);
    x2 += 3;
    if (x2 > 320) {
      x2 = 320;
    }
  }
  println (frameCount /60);      //tiempo en consola
}

void mousePressed() {
  if (estado == "pantalla4" && mouseX > esquinaX1 && mouseX < esquinaX1+botancho && mouseY > esquinaY1 && mouseY < esquinaY1 + botalto) {    //boton reinicio
    estado = "pantalla1";   //reinicio pantalla
    frameCount = 0;    //tiempo reinicio
    alpha=255;
    relleno = color(255, 13, 90);
    tam=0;
    x1= 680;
    y1= 480;
    x2= 0;
  }
}
