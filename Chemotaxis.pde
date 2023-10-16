Particle[] c;
int x, y;
boolean start = false;

void setup(){
  size(512, 512);
  c = new Particle[20];
  
  for(int i = 0; i < c.length; i++){
    c[i] = new Particle();
  }
}

void draw(){ 
  background(0);
  x = mouseX;
  y = mouseY;
 
  if(start == true){ //only runs if the particles aren't visible
    for(int i = 0; i < c.length; i++){
      c[i].bMove();
      c[i].gMove();
      c[i].rMove();
      c[i].show();
    }
  }
}

void mousePressed(){ //the thing happens when you click
  start = true;
  for(int i = 0; i < c.length; i++){
    c[i].locate();
  }
}

class Particle{
  int bX, bY, gX, gY, rX, rY, red, grn, blu, opacity;
  
  Particle(){ //controls shade of color
    int o = (int)(Math.random()*136)+25; // 25-160
    int g = (int)Math.random()*126+25; // 25-150
    
    blu = color(o, o*1.5, 255);
    grn = color(g, g+130, g);
    red = color(255, o, o);
  }
  
  void locate(){ //makes particles visible and moves them to cursor
    if(opacity <= 0){
    bX = mouseX + (int)(Math.random()*41)-20;
    bY = mouseY;
    gX = mouseX;
    gY = bY;
    rX = gX;
    rY = bY;
    
    opacity = 255;
    }
  }
  
  void show(){ //draws the particles
    noStroke();
    
    fill(blu, opacity);
    ellipse(bX, bY, 5, 5);
    
    fill(grn, opacity);
    ellipse(gX, gY, 5, 5);
    
    fill(red, opacity);
    ellipse(rX, rY, 5, 5);
  }
  
  void bMove(){ //movement of blue particles. also responsible for lowering opacity
    bX += (int)(Math.random()*13)-6;
    bY += (int)(Math.random()*6)-1;
    opacity -= 2;
  }
  
  void gMove(){ //movement of green particles
    gX += (int)(Math.random()*7)-3;
    gY += (int)(Math.random()*7)-3;
  }
  
    void rMove(){ //movement of red particles
    rX -= (int)(Math.random()*13)-6;
    rY -= (int)(Math.random()*6)-1;
  }
}
