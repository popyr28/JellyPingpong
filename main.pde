PVector ball, bet1, bet2, location;
int skor1 = 0, skor2 = 0;
boolean begin = false;

void setup(){
  size(800,500);
  smooth();
  ball = new PVector(400, 250);
  bet1 = new PVector(10, 200);
  bet2 = new PVector(770, 200);
  location = new PVector(4, 6);
}

void draw(){
  if (begin == false){
    background(57, 177, 255);
    noFill();
    stroke(1, 55, 90);
    strokeWeight(50);
    rect(0, 0, 800, 500);
    textAlign(CENTER);
    textSize(70);
    fill(0);
    text("Jelly PINGPONG", 400, 200);
    fill(#EBF018);
    text("Jelly PINGPONG", 403, 201);
    textSize(40);
    fill(0);
    text("Press ENTER to Start!", 400, 300);
    fill(0, 137, 162);
    text("Press ENTER to Start!", 403, 301);
  }else{  
    background(0);
    strokeWeight(5);
    stroke(173, 246, 255); //lightcyan
    fill(80, 87, 255);//biru
    rect(bet1.x, bet1.y, 20, 80, 7);
    fill(255, 80, 121);//magenta
    rect(bet2.x, bet2.y, 20, 80, 7);
    noStroke();
    fill(240, 235, 218); //coklat
    circle(ball.x, ball.y, 40);
    ball.add(location);
    moved();
    ballLose();
    skor();
  }
  keypress();
}

void keypress(){
  if(keyPressed){
    if(keyCode == UP){
      if(bet2.y > 0){
        bet2.y = bet2.y - 5;
      }
    }
    if(keyCode == DOWN){
      if(bet2.y < 415){
        bet2.y = bet2.y + 5;
      }
    }
    if(key == ENTER){
      begin = true;
    }
    if(key == 'W' || key == 'w'){
      if(bet1.y > 0){
        bet1.y = bet1.y - 5;
      }
    }
    if(key == 'S' || key == 's'){
      if(bet1.y < 415){
        bet1.y = bet1.y + 5;
      }
    }
  }
}

void moved(){
  if(ball.y > height - 20 || ball.y < 20){
    location.y = location.y * -1;
  }
  
  if(ball.x < 50){
    if(ball.y < bet1.y + 80 && ball.y > bet1.y){
      location.x = location.x * -1;
      skor1 = skor1 + 1;
      if(ball.x < 46){
        ball.x = 50;
      }
      println(ball.x, location.x);
    }
  }else if(ball.x > 750){
    if(ball.y < bet2.y + 80 && ball.y > bet2.y){
      location.x = location.x * -1;
      skor2 = skor2 + 1;
      if(ball.x > 754){
        ball.x = 750;
      }
      println(ball.x, location.y);
    }
  }
}

void ballLose(){
   if(ball.x > width + 30){
    delay(500);
    ball.x = 400;
    ball.y = 250;
    location.x = -4;
    location.y = -6;
  } else if ( ball.x < -30){
    ball.x = 400;
    ball.y = 250;
    location.x = 4;
    location.y = 6;
  }
}

void skor(){
  if (skor1 == 20 || skor2 == 20){
    stop();
    textSize(50);
    if (skor1 > skor2){
      fill(95, 81, 9);
      rect(160, 185, 475, 100);
      fill(255);
      text("Player A Menang!!", 400, 250); 
    } else {
      fill(95, 81, 9);
      rect(160, 185, 475, 100);
      fill(255);
      text("Player B Menang!!", 400, 250);
    }
  }
  textSize(30);
  text("Skor A : "+skor1, 200, 450);
  text("Skor B : "+skor2, 600, 450);
}
