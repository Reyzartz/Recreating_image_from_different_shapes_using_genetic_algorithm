PImage img;
DNA p1;
DNA p2;
DNA p3;
float mutationRate=1;
int prevFitness = 100000000;
int particles=300;
void settings(){
  size(400,400,P2D);
   System.setProperty("jogl.disable.openglcore", "false"); 
  
}
void setup(){
   img = loadImage("img2.jpg"); 
   p1 = new DNA(particles,1);
   p1.generateGenes();
   p2 = new DNA(particles,2);
   p2.generateGenes();
   p3 = new DNA(particles,3);
   p3.generateGenes();
   rectMode(CENTER);
   noStroke();
}
void draw(){
  background(0);
  
  checkfitness();
  reproducAndMutate();

  //noLoop();
}
void checkfitness(){
  showResult(p1.genes,particles);
  p1.checkFitness(img);
  background(0);
  showResult(p2.genes,particles);
  p2.checkFitness(img);
}
void reproducAndMutate(){
  if(p1.fitness<p2.fitness && p1.fitness<prevFitness){
      p2.copyGenes(p1.genes);
      p3.copyGenes(p1.genes);
      prevFitness = p1.fitness;
  }
  else if(p2.fitness<prevFitness){
    p1.copyGenes(p2.genes);
    p3.copyGenes(p2.genes);
    prevFitness = p1.fitness;
  }
  else{
    p1.copyGenes(p3.genes);
    p2.copyGenes(p3.genes);
  }
  prevFitness = min(prevFitness,p1.fitness,p2.fitness);
  println(prevFitness,mutationRate,frameRate);
  p1.mutation();
  p2.mutation();
}
void showResult(int genes[][],int len){
  for(int i=0;i<len;i++){
    fill(genes[i][3],genes[i][4],genes[i][5],genes[i][6]);
    //rect(genes[i][0],genes[i][1],genes[i][2],genes[i][2]);
    circle(genes[i][0],genes[i][1],genes[i][2]);

  }
}
