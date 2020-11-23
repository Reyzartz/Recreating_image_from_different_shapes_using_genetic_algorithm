class DNA{
  int genes[][];
  int len;
  int fitness=0;
  int maxside = 50;
  DNA(int l){
    genes=new int[l][9];
    len = l;
  }
  void generateGenes(){
    for(int i=0;i<0;i++){
      genes[i][0]= int(random(0,width));
      genes[i][1]= int(random(0,height));
      genes[i][2]= int(random(0,width));
      genes[i][3]= int(random(0,height));
      genes[i][4]= int(random(0,width));
      genes[i][5]= int(random(0,height));
      genes[i][6]= int(random(255));
      genes[i][7]= int(random(255));
      genes[i][8]= int(random(255));
    }
  }
  void checkFitness(PImage pic){
    int d = pic.width*pic.height;
    int score =0;
    loadPixels();
    for(int i=0;i<d;i++){
      score += abs((pixels[i] & 0xFF )-(pic.pixels[i] & 0xFF));
      score += abs((pixels[i]>>8 & 0xFF )-(pic.pixels[i]>>8 & 0xFF));
      score += abs((pixels[i]>>16 & 0xFF )-(pic.pixels[i]>>16 & 0xFF));

    }
    updatePixels();
    fitness=score;
    //println(fitness);
  }
  void copyGenes(int geneB[][]){
    for(int i=0;i<len;i++){
      genes[i]= geneB[i].clone();
    }
  }
  void mutation(){
      int j=gen;
      //triangle
        //genes[j][0]= int(random(0,width));
        //genes[j][1]= int(random(0,height));
        //genes[j][2]= int(random(-maxside,maxside));
        //genes[j][3]= int(random(-maxside,maxside));
        //genes[j][4]= int(random(-maxside,maxside));
        //genes[j][5]= int(random(-maxside,maxside));
        //genes[j][6]= int(random(255));
        //genes[j][7]= int(random(255));
        //genes[j][8]= int(random(255));
        //rectangle
        genes[j][0]= int(random(0,width));
        genes[j][1]= int(random(0,height));
        genes[j][2]= int(random(5,maxside));
        genes[j][6]= int(random(255));
        genes[j][7]= int(random(255));
        genes[j][8]= int(random(255));
  }
}
